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
//----------------------------------------------------------------------------
#include <stdio.h>
#include <math.h>

#include <vcl.h>

#include <gak/vcl_tools.h>

#pragma hdrstop

#include "KursFrm.h"
#include "KursBooksFrm.h"
#include "KursInfoFrm.h"
#include "AnwesenheitsFrm.h"
#include "LehrzeitenFrm.h"
#include "EinladungenFrm.h"
#include "DafMain.h"

//----------------------------------------------------------------------------
#pragma resource "*.dfm"
TKursForm *KursForm;
//---------------------------------------------------------------------------
void TKursForm::refreshDB( void )
{
	int	id = TableCourseID->AsInteger;

	TableCourse->Close();
	MainForm->updateOsbizData();
	TableCourse->Open();

	TableCourse->DisableControls();
	while( TableCourseID->AsInteger != id && !TableCourse->Eof )
		TableCourse->Next();
	TableCourse->EnableControls();
}
//----------------------------------------------------------------------------
__fastcall TKursForm::TKursForm(TComponent *Owner)
	: TForm(Owner)
{
}
//----------------------------------------------------------------------------
void __fastcall TKursForm::FormCreate(TObject *)
{
	// init the time pickers matrix
	timePickers[0][0] = DateTimePickerMO_ANF;
	timePickers[1][0] = DateTimePickerMO_END;
	timePickers[2][0] = DateTimePickerMO_PAUS_ANF;
	timePickers[3][0] = DateTimePickerMO_PAUS_END;

	timePickers[0][1] = DateTimePickerDI_ANF;
	timePickers[1][1] = DateTimePickerDI_END;
	timePickers[2][1] = DateTimePickerDI_PAUS_ANF;
	timePickers[3][1] = DateTimePickerDI_PAUS_END;

	timePickers[0][2] = DateTimePickerMI_ANF;
	timePickers[1][2] = DateTimePickerMI_END;
	timePickers[2][2] = DateTimePickerMI_PAUS_ANF;
	timePickers[3][2] = DateTimePickerMI_PAUS_END;

	timePickers[0][3] = DateTimePickerDO_ANF;
	timePickers[1][3] = DateTimePickerDO_END;
	timePickers[2][3] = DateTimePickerDO_PAUS_ANF;
	timePickers[3][3] = DateTimePickerDO_PAUS_END;

	timePickers[0][4] = DateTimePickerFR_ANF;
	timePickers[1][4] = DateTimePickerFR_END;
	timePickers[2][4] = DateTimePickerFR_PAUS_ANF;
	timePickers[3][4] = DateTimePickerFR_PAUS_END;

	timePickers[0][5] = DateTimePickerSA_ANF;
	timePickers[1][5] = DateTimePickerSA_END;
	timePickers[2][5] = DateTimePickerSA_PAUS_ANF;
	timePickers[3][5] = DateTimePickerSA_PAUS_END;

	timePickers[0][6] = DateTimePickerSO_ANF;
	timePickers[1][6] = DateTimePickerSO_END;
	timePickers[2][6] = DateTimePickerSO_PAUS_ANF;
	timePickers[3][6] = DateTimePickerSO_PAUS_END;

	unsigned short	year, dummy;
	TDateTime now = TDateTime::CurrentDate();
	now.DecodeDate( &year, &dummy, &dummy );

	ComboBoxSemester->ItemIndex = 0;
	YearSelectUpDown->Position = year;
}
//----------------------------------------------------------------------------
void TKursForm::setYearField( void )
{
	unsigned short	year, month, day;
	char			buffer[32];

	TDateTime	startDate = TableCourseANFANGS_DATUM->AsDateTime;

	startDate.DecodeDate( &year, &month, &day );
	sprintf( buffer, "%d", (int)year );
	TableCourseJAHR->AsString = year;

	if( month >= 3 && month < 9 )
		TableCourseHALBJAHR->AsString = "S";
	else
		TableCourseHALBJAHR->AsString = "W";
}
//----------------------------------------------------------------------------
void TKursForm::setYearFilter( short theYear, int semester  )
{
	char		buffer[64];
	AnsiString	filter;

	sprintf( buffer, "%d", (int)theYear );
	LabelYear->Caption = buffer;

	TableCourse->Close();
	sprintf( buffer, "JAHR=%d", (int)theYear );
	filter = buffer;
	if( semester > 0 )
	{
		sprintf(
			buffer, " and HALBJAHR='%s'",
			semester == 1 ? "S" : "W"
		);
		filter += buffer;
	}
	TableCourse->Filter = filter;
	OpenTable( TableCourse );
}

//----------------------------------------------------------------------------
void __fastcall TKursForm::ButtonCourseInfoClick(TObject *)
{
	MainForm->checkLicence();
	if( TableCourseID->AsInteger > 0 )
		KursInfoForm->showKursInfo(
			TableCourseID->AsInteger,
			TableCourseKURSNUMMER->AsString.c_str(),
			TableCourseKURSGEBUEHR->AsFloat
		);
	else
		Application->MessageBox(
			"Bitte zuerst speichern!", "Fehler", MB_ICONEXCLAMATION
		);
}
//---------------------------------------------------------------------------


void __fastcall TKursForm::DBEditANFANGS_DATUMChange(TObject *)
{
	if( TableCourse->State == dsEdit || TableCourse->State == dsInsert )
		setYearField();
}
//---------------------------------------------------------------------------


void __fastcall TKursForm::YearSelectUpDownChangingEx(TObject *,
	  bool &AllowChange, short NewValue, TUpDownDirection )
{
	if( YearSelectUpDown->Position != NewValue )
	{
		AllowChange = true;
		setYearFilter( NewValue, ComboBoxSemester->ItemIndex );
	}
	else
		AllowChange = false;
}
//---------------------------------------------------------------------------


void __fastcall TKursForm::SearchEditChange(TObject *)
{
/*
	this will crash the SQL Driver in OSBIZ Mode 8-(

	if( TableCourse->IndexName == "" )
		TableCourse->IndexFieldNames = "NUMMER";

	TableCourse->SetKey();
	TableCourse->FieldByName( "NUMMER" )->AsString = SearchEdit->Text;
	TableCourse->GotoNearest();
*/
	try
	{
		TableCourse->SetKey();
		TableCourse->FieldByName( "NUMMER" )->AsString = SearchEdit->Text;
		TableCourse->GotoNearest();
	}
	catch( ... )
	{
		TableCourse->DisableControls();
		TableCourse->First();
		while( !TableCourse->Eof )
		{
			if( TableCourseNUMMER->AsString.SubString( 1, SearchEdit->Text.Length() ).LowerCase() >= SearchEdit->Text.LowerCase() )
				break;
			TableCourse->Next();
		}
		TableCourse->EnableControls();
	}
}
//---------------------------------------------------------------------------
void __fastcall TKursForm::ButtonAttendanceClick(TObject *)
{
	double lessonTime[7];

	lessonTime[0] = (double)(TableCourseMO_END->AsDateTime - TableCourseMO_ANF->AsDateTime - TableCourseMO_PAUS_END->AsDateTime + TableCourseMO_PAUS_ANF->AsDateTime) *32;
	lessonTime[1] = (double)(TableCourseDI_END->AsDateTime - TableCourseDI_ANF->AsDateTime - TableCourseDI_PAUS_END->AsDateTime + TableCourseDI_PAUS_ANF->AsDateTime) *32;
	lessonTime[2] = (double)(TableCourseMI_END->AsDateTime - TableCourseMI_ANF->AsDateTime - TableCourseMI_PAUS_END->AsDateTime + TableCourseMI_PAUS_ANF->AsDateTime) *32;
	lessonTime[3] = (double)(TableCourseDO_END->AsDateTime - TableCourseDO_ANF->AsDateTime - TableCourseDO_PAUS_END->AsDateTime + TableCourseDO_PAUS_ANF->AsDateTime) *32;
	lessonTime[4] = (double)(TableCourseFR_END->AsDateTime - TableCourseFR_ANF->AsDateTime - TableCourseFR_PAUS_END->AsDateTime + TableCourseFR_PAUS_ANF->AsDateTime) *32;
	lessonTime[5] = (double)(TableCourseSA_END->AsDateTime - TableCourseSA_ANF->AsDateTime - TableCourseSA_PAUS_END->AsDateTime + TableCourseSA_PAUS_ANF->AsDateTime) *32;
	lessonTime[6] = (double)(TableCourseSO_END->AsDateTime - TableCourseSO_ANF->AsDateTime - TableCourseSO_PAUS_END->AsDateTime + TableCourseSO_PAUS_ANF->AsDateTime) *32;

	MainForm->checkLicence();
	if( TableCourseID->AsInteger > 0 )
		AnwesenheitsForm->showAttendance(
			TableCourseID->AsInteger,
			TableCourseANFANGS_DATUM->AsDateTime, TableCourseENDE_DATUM->AsDateTime,
			lessonTime,
			TableCourseKURSNUMMER->AsString.c_str()
		);
	else
		Application->MessageBox(
			"Bitte zuerst speichern!", "Fehler", MB_ICONEXCLAMATION
		);
}
//---------------------------------------------------------------------------



void __fastcall TKursForm::TableCourseAfterInsert(TDataSet *)
{
	TableCourseID->AsInteger = 0;
}
//---------------------------------------------------------------------------
void __fastcall TKursForm::TableCourseBeforePost(TDataSet *)
{
	MainForm->checkLicence();
	if( TableCourseANFANGS_DATUM->AsDateTime > TableCourseENDE_DATUM->AsDateTime )
	{
		Sheet->ActivePage = TabSheetKurs;
		DBEditANFANGS_DATUM->SetFocus();
		throw( Exception( "Anfang muß vor dem Ende liegen!" ) );
	}

	if( DateTimePickerMO_ANF->Time > DateTimePickerMO_END->Time
	||  DateTimePickerDI_ANF->Time > DateTimePickerDI_END->Time
	||  DateTimePickerMI_ANF->Time > DateTimePickerMI_END->Time
	||  DateTimePickerDO_ANF->Time > DateTimePickerDO_END->Time
	||  DateTimePickerFR_ANF->Time > DateTimePickerFR_END->Time
	||  DateTimePickerSA_ANF->Time > DateTimePickerSA_END->Time
	||  DateTimePickerSO_ANF->Time > DateTimePickerSO_END->Time
	||  DateTimePickerMO_PAUS_ANF->Time > DateTimePickerMO_PAUS_END->Time
	||  DateTimePickerDI_PAUS_ANF->Time > DateTimePickerDI_PAUS_END->Time
	||  DateTimePickerMI_PAUS_ANF->Time > DateTimePickerMI_PAUS_END->Time
	||  DateTimePickerDO_PAUS_ANF->Time > DateTimePickerDO_PAUS_END->Time
	||  DateTimePickerFR_PAUS_ANF->Time > DateTimePickerFR_PAUS_END->Time
	||  DateTimePickerSA_PAUS_ANF->Time > DateTimePickerSA_PAUS_END->Time
	||  DateTimePickerSO_PAUS_ANF->Time > DateTimePickerSO_PAUS_END->Time )
	{
		Sheet->ActivePage = TabSheetUnterrichtszeiten;
		throw( Exception( "Uhrzeit Anfang muß vor dem Ende liegen!" ) );
	}

	if( DateTimePickerMO_PAUS_ANF->Time != DateTimePickerMO_PAUS_END->Time
	&&( DateTimePickerMO_ANF->Time > DateTimePickerMO_PAUS_ANF->Time
	||  DateTimePickerMO_END->Time < DateTimePickerMO_PAUS_END->Time ) )
	{
		Sheet->ActivePage = TabSheetUnterrichtszeiten;
		DateTimePickerMO_PAUS_ANF->SetFocus();
		throw( Exception( "Pause am Montag muß innerhalb des Unterrichts liegen!" ) );
	}

	if( DateTimePickerDI_PAUS_ANF->Time != DateTimePickerDI_PAUS_END->Time
	&&( DateTimePickerDI_ANF->Time > DateTimePickerDI_PAUS_ANF->Time
	||  DateTimePickerDI_END->Time < DateTimePickerDI_PAUS_END->Time ) )
	{
		Sheet->ActivePage = TabSheetUnterrichtszeiten;
		DateTimePickerDI_PAUS_ANF->SetFocus();
		throw( Exception( "Pause am Dienstag muß innerhalb des Unterrichts liegen!" ) );
	}

	if( DateTimePickerMI_PAUS_ANF->Time != DateTimePickerMI_PAUS_END->Time
	&&( DateTimePickerMI_ANF->Time > DateTimePickerMI_PAUS_ANF->Time
	||  DateTimePickerMI_END->Time < DateTimePickerMI_PAUS_END->Time ) )
	{
		Sheet->ActivePage = TabSheetUnterrichtszeiten;
		DateTimePickerMI_PAUS_ANF->SetFocus();
		throw( Exception( "Pause am Mittwoch muß innerhalb des Unterrichts liegen!" ) );
	}

	if( DateTimePickerDO_PAUS_ANF->Time != DateTimePickerDO_PAUS_END->Time
	&&( DateTimePickerDO_ANF->Time > DateTimePickerDO_PAUS_ANF->Time
	||  DateTimePickerDO_END->Time < DateTimePickerDO_PAUS_END->Time ) )
	{
		Sheet->ActivePage = TabSheetUnterrichtszeiten;
		DateTimePickerDO_PAUS_ANF->SetFocus();
		throw( Exception( "Pause am Donnerstag muß innerhalb des Unterrichts liegen!" ) );
	}

	if( DateTimePickerFR_PAUS_ANF->Time != DateTimePickerFR_PAUS_END->Time
	&&( DateTimePickerFR_ANF->Time > DateTimePickerFR_PAUS_ANF->Time
	||  DateTimePickerFR_END->Time < DateTimePickerFR_PAUS_END->Time ) )
	{
		Sheet->ActivePage = TabSheetUnterrichtszeiten;
		DateTimePickerFR_PAUS_ANF->SetFocus();
		throw( Exception( "Pause am Freitag muß innerhalb des Unterrichts liegen!" ) );
	}

	if( DateTimePickerSA_PAUS_ANF->Time != DateTimePickerSA_PAUS_END->Time
	&&( DateTimePickerSA_ANF->Time > DateTimePickerSA_PAUS_ANF->Time
	||  DateTimePickerSA_END->Time < DateTimePickerSA_PAUS_END->Time ) )
	{
		Sheet->ActivePage = TabSheetUnterrichtszeiten;
		DateTimePickerSA_PAUS_ANF->SetFocus();
		throw( Exception( "Pause am Samstag muß innerhalb des Unterrichts liegen!" ) );
	}

	if( DateTimePickerSO_PAUS_ANF->Time != DateTimePickerSO_PAUS_END->Time
	&&( DateTimePickerSO_ANF->Time > DateTimePickerSO_PAUS_ANF->Time
	||  DateTimePickerSO_END->Time < DateTimePickerSO_PAUS_END->Time ) )
	{
		Sheet->ActivePage = TabSheetUnterrichtszeiten;
		DateTimePickerSO_PAUS_ANF->SetFocus();
		throw( Exception( "Pause am Sonntag muß innerhalb des Unterrichts liegen!" ) );
	}

	setYearField();

	TableCourseMO_ANF->AsDateTime = GetTime( DateTimePickerMO_ANF->Time );
	TableCourseMO_END->AsDateTime = GetTime( DateTimePickerMO_END->Time );
	TableCourseMO_PAUS_ANF->AsDateTime = GetTime( DateTimePickerMO_PAUS_ANF->Time );
	TableCourseMO_PAUS_END->AsDateTime = GetTime( DateTimePickerMO_PAUS_END->Time );

	TableCourseDI_ANF->AsDateTime = GetTime( DateTimePickerDI_ANF->Time );
	TableCourseDI_END->AsDateTime = GetTime( DateTimePickerDI_END->Time );
	TableCourseDI_PAUS_ANF->AsDateTime = GetTime( DateTimePickerDI_PAUS_ANF->Time );
	TableCourseDI_PAUS_END->AsDateTime = GetTime( DateTimePickerDI_PAUS_END->Time );

	TableCourseMI_ANF->AsDateTime = GetTime( DateTimePickerMI_ANF->Time );
	TableCourseMI_END->AsDateTime = GetTime( DateTimePickerMI_END->Time );
	TableCourseMI_PAUS_ANF->AsDateTime = GetTime( DateTimePickerMI_PAUS_ANF->Time );
	TableCourseMI_PAUS_END->AsDateTime = GetTime( DateTimePickerMI_PAUS_END->Time );

	TableCourseDO_ANF->AsDateTime = GetTime( DateTimePickerDO_ANF->Time );
	TableCourseDO_END->AsDateTime = GetTime( DateTimePickerDO_END->Time );
	TableCourseDO_PAUS_ANF->AsDateTime = GetTime( DateTimePickerDO_PAUS_ANF->Time );
	TableCourseDO_PAUS_END->AsDateTime = GetTime( DateTimePickerDO_PAUS_END->Time );

	TableCourseFR_ANF->AsDateTime = GetTime( DateTimePickerFR_ANF->Time );
	TableCourseFR_END->AsDateTime = GetTime( DateTimePickerFR_END->Time );
	TableCourseFR_PAUS_ANF->AsDateTime = GetTime( DateTimePickerFR_PAUS_ANF->Time );
	TableCourseFR_PAUS_END->AsDateTime = GetTime( DateTimePickerFR_PAUS_END->Time );

	TableCourseSA_ANF->AsDateTime = GetTime( DateTimePickerSA_ANF->Time );
	TableCourseSA_END->AsDateTime = GetTime( DateTimePickerSA_END->Time );
	TableCourseSA_PAUS_ANF->AsDateTime = GetTime( DateTimePickerSA_PAUS_ANF->Time );
	TableCourseSA_PAUS_END->AsDateTime = GetTime( DateTimePickerSA_PAUS_END->Time );

	TableCourseSO_ANF->AsDateTime = GetTime( DateTimePickerSO_ANF->Time );
	TableCourseSO_END->AsDateTime = GetTime( DateTimePickerSO_END->Time );
	TableCourseSO_PAUS_ANF->AsDateTime = GetTime( DateTimePickerSO_PAUS_ANF->Time );
	TableCourseSO_PAUS_END->AsDateTime = GetTime( DateTimePickerSO_PAUS_END->Time );

	if( !TableCourseID->AsInteger )
		TableCourseID->AsInteger = getNewMaxValue( "KlaroDB", "KURSE", "ID" );

	TableCourseAENDERUNGSDATUM->AsDateTime = TDateTime::CurrentDate();
	TableCourseAENDERUNG_VON->AsString = MainForm->getOsUserName();
}
//---------------------------------------------------------------------------
void __fastcall TKursForm::TableCourseRefreshTimes(TDataSet *)
{
	double	theTime;

	DateTimePickerMO_ANF->Time = TableCourseMO_ANF->AsDateTime;
	DateTimePickerMO_END->Time = TableCourseMO_END->AsDateTime;
	DateTimePickerMO_PAUS_ANF->Time = TableCourseMO_PAUS_ANF->AsDateTime;
	DateTimePickerMO_PAUS_END->Time = TableCourseMO_PAUS_END->AsDateTime;

	DateTimePickerDI_ANF->Time = TableCourseDI_ANF->AsDateTime;
	DateTimePickerDI_END->Time = TableCourseDI_END->AsDateTime;
	DateTimePickerDI_PAUS_ANF->Time = TableCourseDI_PAUS_ANF->AsDateTime;
	DateTimePickerDI_PAUS_END->Time = TableCourseDI_PAUS_END->AsDateTime;

	DateTimePickerMI_ANF->Time = TableCourseMI_ANF->AsDateTime;
	DateTimePickerMI_END->Time = TableCourseMI_END->AsDateTime;
	DateTimePickerMI_PAUS_ANF->Time = TableCourseMI_PAUS_ANF->AsDateTime;
	DateTimePickerMI_PAUS_END->Time = TableCourseMI_PAUS_END->AsDateTime;

	DateTimePickerDO_ANF->Time = TableCourseDO_ANF->AsDateTime;
	DateTimePickerDO_END->Time = TableCourseDO_END->AsDateTime;
	DateTimePickerDO_PAUS_ANF->Time = TableCourseDO_PAUS_ANF->AsDateTime;
	DateTimePickerDO_PAUS_END->Time = TableCourseDO_PAUS_END->AsDateTime;

	DateTimePickerFR_ANF->Time = TableCourseFR_ANF->AsDateTime;
	DateTimePickerFR_END->Time = TableCourseFR_END->AsDateTime;
	DateTimePickerFR_PAUS_ANF->Time = TableCourseFR_PAUS_ANF->AsDateTime;
	DateTimePickerFR_PAUS_END->Time = TableCourseFR_PAUS_END->AsDateTime;

	DateTimePickerSA_ANF->Time = TableCourseSA_ANF->AsDateTime;
	DateTimePickerSA_END->Time = TableCourseSA_END->AsDateTime;
	DateTimePickerSA_PAUS_ANF->Time = TableCourseSA_PAUS_ANF->AsDateTime;
	DateTimePickerSA_PAUS_END->Time = TableCourseSA_PAUS_END->AsDateTime;

	DateTimePickerSO_ANF->Time = TableCourseSO_ANF->AsDateTime;
	DateTimePickerSO_END->Time = TableCourseSO_END->AsDateTime;
	DateTimePickerSO_PAUS_ANF->Time = TableCourseSO_PAUS_ANF->AsDateTime;
	DateTimePickerSO_PAUS_END->Time = TableCourseSO_PAUS_END->AsDateTime;

	for( int i=0; i<4; i++ )
		for( int j=0; j<7; j++ )
		{
			theTime = GetTime(timePickers[i][j]->Time);
			if( theTime == 0.0 )
				timePickers[i][j]->Tag = 0;
			else
				timePickers[i][j]->Tag = 1;
		}
}
//---------------------------------------------------------------------------

void __fastcall TKursForm::DateTimePickerChange(TObject *Sender)
{
	bool	found = false;
	int		row, day;

	if( TableCourse->State == dsBrowse )
		TableCourse->Edit();

	TDateTimePicker *picker = dynamic_cast<TDateTimePicker *>(Sender);
	if( picker && picker->Tag >= 0 )
	{
		for( row=0; !found && row<4; row++ )
		{
			for( day=0; !found && day<7; day++ )
			{
				if( timePickers[row][day] == picker )
				{
					found = true;
					for( day++; day<7; day++ )
					{
						if( timePickers[row][day]->Tag == 0 )
						{
							timePickers[row][day]->Tag = -1;
							timePickers[row][day]->Time = picker->Time;
							timePickers[row][day]->Tag = 0;
						}
					}
				}
			}
		}
		picker->Tag = 1;
	}
}
//---------------------------------------------------------------------------


void __fastcall TKursForm::ButtonBuecherClick(TObject *)
{
	MainForm->checkLicence();
	if( TableCourseID->AsInteger > 0 )
		KursbooksForm->showKursBooks(
			TableCourseID->AsInteger,
			TableCourseKURSNUMMER->AsString.c_str()
		);
	else
		Application->MessageBox(
			"Bitte zuerst speichern!", "Fehler", MB_ICONEXCLAMATION
		);
}
//---------------------------------------------------------------------------


void __fastcall TKursForm::TableCourseCalcFields(TDataSet *)
{
	AnsiString	nummer = TableCourseNUMMER->AsString;
	nummer += '-';
	nummer += TableCourseHALBJAHR->AsString;
	nummer += '-';
	nummer += TableCourseJAHR->AsString;
	TableCourseKURSNUMMER->AsString = nummer;
}
//---------------------------------------------------------------------------

void __fastcall TKursForm::ButtonLehrzeitenClick(TObject *)
{
	MainForm->checkLicence();
	LehrzeitenForm->showTeacherTimes(
		TableCourseID->AsInteger,
		TableCourseKURSNUMMER->AsString.c_str()
	);
}
//---------------------------------------------------------------------------

void __fastcall TKursForm::SpeedButtonRefreshClick(TObject *)
{
	refreshDB();
}
//---------------------------------------------------------------------------
void __fastcall TKursForm::ComboBoxSemesterChange(TObject *)
{
	setYearFilter( YearSelectUpDown->Position, ComboBoxSemester->ItemIndex );
}
//---------------------------------------------------------------------------
void __fastcall TKursForm::FormShow(TObject *)
{
	if( !MainForm->isBamfEnabled() )
	{
		LabelBAMFNummer->Visible = false;
		DBEditBAMF_NUMMER->Visible = false;

		LabelStaatlFoerderung->Visible = false;
		DBEditFOERDERUNG->Visible = false;

		LabelTeamteacherst->Visible = false;
		DBEditTT_STUNDEN->Visible = false;

		LabelSozpaedSt->Visible = false;
		DBEditSOZ_PAED_STUNDEN->Visible = false;

		DBComboBoxKURSART->Items->Clear();
		for(
			QueryKursart->Open();
			!QueryKursart->Eof;
			QueryKursart->Next()
		)
		{
			DBComboBoxKURSART->Items->Add( QueryKursartKURSART->AsString );
		}
		QueryKursart->Close();

		DBComboBoxKURSTYP->Items->Clear();
		for(
			QueryKurstyp->Open();
			!QueryKurstyp->Eof;
			QueryKurstyp->Next()
		)
		{
			DBComboBoxKURSTYP->Items->Add( QueryKurstypKURSTYP->AsString );
		}
		QueryKurstyp->Close();
	}
}
//---------------------------------------------------------------------------



void __fastcall TKursForm::ButtonInvitationsClick(TObject *)
{
	EinladungenForm->ShowForm(
		TableCourseKURSART->AsString,
		TableCourseKURSTYP->AsString,
		TableCourseKURSABSCHNITT->AsString
	);
}
//---------------------------------------------------------------------------

