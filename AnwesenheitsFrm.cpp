/*
		Project:		Klaro
		Module:			
		Description:	
		Author:			Martin Gäckler
		Address:		Hofmannsthalweg 14, A-4030 Linz
		Web:			https://www.gaeckler.at/

		Copyright:		(c) 1988-2025 Martin Gäckler

		This program is free software: you can redistribute it and/or modify  
		it under the terms of the GNU General Public License as published by  
		the Free Software Foundation, version 3.

		You should have received a copy of the GNU General Public License 
		along with this program. If not, see <http://www.gnu.org/licenses/>.

		THIS SOFTWARE IS PROVIDED BY Martin Gäckler, Austria, Linz ``AS IS''
		AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
		TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
		PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR
		CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
		SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
		LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
		USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
		ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
		OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
		OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
		SUCH DAMAGE.
*/
//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "AnwesenheitsFrm.h"
#include "DafMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TAnwesenheitsForm *AnwesenheitsForm;
//---------------------------------------------------------------------------
class CheckBoxInfo
{
	public:
	int				pupilId;
	TCheckBoxState	prevValue;
	int				dateOffset;
};
//---------------------------------------------------------------------------
void TAnwesenheitsForm::SaveValues( void )
{
	size_t			i;
	CheckBoxInfo	*info;
	TCheckBox		*tmpCheck;
	TQuery			*action;

	for( i=0; i<pupilCheckboxes.getNumElements(); i++ )
	{
		tmpCheck = pupilCheckboxes[i];
		info = (CheckBoxInfo *)tmpCheck->Tag;
		if( info->prevValue != tmpCheck->State )
		{
			if( tmpCheck->State == cbUnchecked )
			{
				action = deleteQuery;
				action->Params->Items[0]->AsInteger = info->pupilId;
				action->Params->Items[1]->AsInteger = kurs_id;
				action->Params->Items[2]->AsDate = currentDate + info->dateOffset;
			}
			else
			{
				if( info->prevValue == cbUnchecked )
					action = insertQuery;
				else
					action = updateQuery;

				action->Params->Items[0]->AsString = tmpCheck->State == cbGrayed ? "J" : "";
				action->Params->Items[1]->AsInteger = info->pupilId;
				action->Params->Items[2]->AsInteger = kurs_id;
				action->Params->Items[3]->AsDate = currentDate + info->dateOffset;
			}
			action->ExecSQL();

			info->prevValue = tmpCheck->State;
		}
	}
}

bool TAnwesenheitsForm::IsHolliday( TDateTime theDay )
{
	if( ferienQuery->Fields->Fields[0]->AsDateTime <= theDay
	&& ferienQuery->Fields->Fields[1]->AsDateTime >= theDay )
		return true;

	ferienQuery->First();
	while( !ferienQuery->Eof
	&& ferienQuery->Fields->Fields[1]->AsDateTime < theDay )
		ferienQuery->Next();

	if( ferienQuery->Fields->Fields[0]->AsDateTime <= theDay
	&& ferienQuery->Fields->Fields[1]->AsDateTime >= theDay )
		return true;

	return false;
}

void TAnwesenheitsForm::LoadValues( void )
{
	size_t			i, firstPupilCheckBox, offset;
	int				lastPupil = -1, currentPupil;
	int				minOffset, maxOffset;
	CheckBoxInfo	*info;
	TCheckBox		*tmpCheck;
	AnsiString		timeLabel;
	TDateTime		endDate = currentDate + 6;

	for( i=0; i<pupilCheckboxes.getNumElements(); i++ )
	{
		tmpCheck = pupilCheckboxes[i];
		info = (CheckBoxInfo *)tmpCheck->Tag;
		info->prevValue = cbUnchecked;
		tmpCheck->State = cbUnchecked;
	}
	attendanceQuery->Params->Items[0]->AsDateTime = currentDate;
	attendanceQuery->Params->Items[1]->AsDateTime = endDate;
	attendanceQuery->Open();
	while( !attendanceQuery->Eof )
	{
		currentPupil = attendanceQuery->Fields->Fields[1]->AsInteger;
		if( currentPupil != lastPupil )
		{
			firstPupilCheckBox = (size_t)-1;
			for( i=0; i<pupilCheckboxes.getNumElements(); i++ )
			{
				tmpCheck = pupilCheckboxes[i];
				info = (CheckBoxInfo *)tmpCheck->Tag;
				if( info->pupilId == currentPupil )
				{
					firstPupilCheckBox = i;
					lastPupil = currentPupil;
					break;
				}
			}
		}

		if( firstPupilCheckBox != (size_t)-1 )
		{
			offset = (int)attendanceQuery->Fields->Fields[0]->AsDateTime - (int)currentDate;
			tmpCheck = pupilCheckboxes[firstPupilCheckBox+offset];
			info = (CheckBoxInfo *)tmpCheck->Tag;
			info->prevValue = attendanceQuery->Fields->Fields[2]->AsString == "J" ? cbGrayed : cbChecked;
			tmpCheck->State = info->prevValue;
		}
		attendanceQuery->Next();
	}
	attendanceQuery->Close();

	minOffset = anfangs_datum - currentDate;
	maxOffset = ende_datum - currentDate;
	for( i=0; i<pupilCheckboxes.getNumElements(); i++ )
	{
		tmpCheck = pupilCheckboxes[i];
		info = (CheckBoxInfo *)tmpCheck->Tag;
		if( info->dateOffset < minOffset
		|| info->dateOffset > maxOffset
		|| stunden[info->dateOffset] < 0.5
		|| IsHolliday( currentDate + info->dateOffset ) )
		{
			tmpCheck->Checked = false;
			tmpCheck->Enabled = false;
		}
		else
			tmpCheck->Enabled = true;
	}

	timeLabel = "Woche vom ";
	timeLabel += currentDate.DateString();
	timeLabel += " bis ";
	timeLabel += endDate.DateString();

	CurrentWeekLabel->Caption = timeLabel;

	if( currentDate > anfangs_datum )
		BackButton->Enabled = true;
	else
		BackButton->Enabled = false;

	if( currentDate+7 <= ende_datum )
		NextButton->Enabled = true;
	else
		NextButton->Enabled = false;
}

//---------------------------------------------------------------------------
__fastcall TAnwesenheitsForm::TAnwesenheitsForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAnwesenheitsForm::FormShow(TObject *)
{
	static	char *days[7] =
	{
		"Mo", "Di", "Mi", "Do", "Fr", "Sa", "So"
	};

	AnsiString		fullName, timeLabel;
	TDateTime		tmpDate;
	TLabel			*tmpLabel;
	TCheckBox		*tmpCheck;
	CheckBoxInfo	*info;
	size_t			schueler_id, i, j;
	int				dayOfWeek;

	for( j=0; j<7; j++ )
	{
		dayLabels[j] = new TLabel( theScrollBox );
		dayLabels[j]->Parent = theScrollBox;
		dayLabels[j]->Top = 8;
		dayLabels[j]->Left = 200 + j*30;
		dayLabels[j]->Width = 25;
		dayLabels[j]->Caption = days[j];
	}

	pupilQuery->Params->Items[0]->AsInteger = kurs_id;
	pupilQuery->Open();
	i=0;
	while( !pupilQuery->Eof )
	{
		i++;
		tmpLabel = new TLabel( theScrollBox );
		tmpLabel->Parent = theScrollBox;

		schueler_id = pupilQuery->Fields->Fields[0]->AsInteger;
		fullName = pupilQuery->Fields->Fields[1]->AsString;
		fullName += ' ';
		fullName += pupilQuery->Fields->Fields[2]->AsString;
		tmpLabel->Caption = fullName;
		tmpLabel->Top = 8 + i*20;
		tmpLabel->Left = 8;
		tmpLabel->Width = 190;
		tmpLabel->Height = 13;

		for( j=0; j<7; j++ )
		{
			tmpCheck = new TCheckBox( theScrollBox );
			tmpCheck->Parent = theScrollBox;
			tmpCheck->Top = 8 + i*20;
			tmpCheck->Left = 200 + j*30;
			tmpCheck->Width = 25;
            tmpCheck->AllowGrayed = true;

			info = new CheckBoxInfo;
			info->pupilId = schueler_id;
			info->dateOffset = j;
			tmpCheck->Tag = (int)info;

			pupilCheckboxes.addElement( tmpCheck );
		}

		pupilLabels.addElement( tmpLabel );
		pupilQuery->Next();
	}

	pupilQuery->Close();

	currentDate = TDateTime::CurrentDate();
	if( currentDate > ende_datum )
		currentDate = ende_datum;
	else if( currentDate < anfangs_datum )
		currentDate = anfangs_datum;

	dayOfWeek = currentDate.DayOfWeek();
	if( dayOfWeek >= 2 )
		currentDate -= dayOfWeek - 2;
	else
		currentDate -= 6;

	timeLabel = "Kursdauer vom ";
	timeLabel += anfangs_datum.DateString();
	timeLabel += " bis ";
	timeLabel += ende_datum.DateString();

	CourseTimeLabel->Caption = timeLabel;

	ferienQuery->Params->Items[0]->AsDateTime = anfangs_datum;
	ferienQuery->Params->Items[1]->AsDateTime = ende_datum;
	ferienQuery->Params->Items[2]->AsDateTime = anfangs_datum;
	ferienQuery->Params->Items[3]->AsDateTime = ende_datum;
	ferienQuery->Open();

	LoadValues();
}
//---------------------------------------------------------------------------
void TAnwesenheitsForm::showAttendance(
	int kurs_id,
	TDateTime anfangs_datum, TDateTime ende_datum,
	double stunden[7], const char *kursNummer
)
{
	char	caption[256];

	this->kurs_id = kurs_id;

	strcpy( caption, "Anwesenheitsliste " );
	strcat( caption, kursNummer );
	this->Caption = caption;

	this->anfangs_datum = anfangs_datum;
	this->ende_datum = ende_datum;
	this->stunden = stunden;

	ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TAnwesenheitsForm::FormHide(TObject *)
{
	size_t	i;

	for( i=0; i<7; i++ )
	{
		theScrollBox->RemoveControl( dayLabels[i] );
		delete dayLabels[i];
	}

	for( i=0; i<pupilLabels.getNumElements(); i++ )
	{
		theScrollBox->RemoveControl( pupilLabels[i] );
		delete pupilLabels[i];
	}
	pupilLabels.clear();

	for( i=0; i<pupilCheckboxes.getNumElements(); i++ )
	{
		theScrollBox->RemoveControl( pupilCheckboxes[i] );
		delete pupilCheckboxes[i];
	}
	pupilCheckboxes.clear();
	ferienQuery->Close();
}
//---------------------------------------------------------------------------

void __fastcall TAnwesenheitsForm::CloseButtonClick(TObject *)
{
	MainForm->checkLicence();
	Close();
}
//---------------------------------------------------------------------------

void __fastcall TAnwesenheitsForm::BackButtonClick(TObject *)
{
	MainForm->checkLicence();
	if( currentDate > anfangs_datum )
	{
		SaveValues();
		currentDate -= 7;
		LoadValues();
	}
}
//---------------------------------------------------------------------------

void __fastcall TAnwesenheitsForm::NextButtonClick(TObject *)
{
	MainForm->checkLicence();
	if( currentDate+7 <= ende_datum )
	{
		SaveValues();
		currentDate += 7;
		LoadValues();
	}
}
//---------------------------------------------------------------------------

void __fastcall TAnwesenheitsForm::FormClose(TObject *, TCloseAction &)
{
	SaveValues();
}
//---------------------------------------------------------------------------

