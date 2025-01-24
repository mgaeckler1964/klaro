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
#include <stdio.h>

#include <vcl.h>

#include <gak/vcl_tools.h>

#pragma hdrstop

#include "SchuelerKursFrm.h"
#include "ZahlungFrm.h"
#include "DafMain.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TSchuelerKursForm *SchuelerKursForm;
//---------------------------------------------------------------------------
void TSchuelerKursForm::refreshDBCourse( void )
{
	int	id = pupilCourseQueryID->AsInteger;

	if( !MainForm->theDatabase->IsSQLBased )
	{
		pupilCourseQuery->FlushBuffers();
		pupilCourseQuery->Refresh();
	}

	pupilCourseQuery->Close();
	pupilCourseQuery->UnPrepare();
	pupilCourseQuery->Prepare();
	pupilCourseQuery->ParamByName("thePupil")->AsInteger = thePupil;
	pupilCourseQuery->Open();

	/*
		Do not enable / disable controls
		otherwise we will get an index error
	*/
//	pupilCourseQuery->DisableControls();
	while( pupilCourseQueryID->AsInteger != id && !pupilCourseQuery->Eof )
		pupilCourseQuery->Next();
//	pupilCourseQuery->EnableControls();

	if( !MainForm->theDatabase->IsSQLBased )
	{
		pupilCourseQuery->FlushBuffers();
		pupilCourseQuery->Refresh();
	}
}
//---------------------------------------------------------------------------
void TSchuelerKursForm::setYearFilterCourse( short theYear = 0 )
{
	char	buffer[64];

	if( theYear )
	{
		sprintf( buffer, "%d", (int)theYear );
		yearLabelCourse->Caption = buffer;

		sprintf( buffer, "JAHR=%d", (int)theYear );
	}

	bool pupilWasOpen = pupilCourseQuery->Active;
	bool courseWasOpen = courseQuery->Active;

	pupilCourseQuery->Close();
	courseQuery->Close();

	if( theYear )
	{
		courseQuery->Filter = buffer;
		pupilCourseQuery->Filter = buffer;
	}

	courseQuery->Filtered = !CheckBoxFilterCourse->Checked;
	pupilCourseQuery->Filtered = !CheckBoxFilterCourse->Checked;

	if( courseWasOpen )
		courseQuery->Open();
	if( pupilWasOpen )
		pupilCourseQuery->Open();
}
//---------------------------------------------------------------------------

void TSchuelerKursForm::refreshDBTest()
{
	int	id = pupilTestQueryID->AsInteger;

	if( !MainForm->theDatabase->IsSQLBased )
	{
		pupilTestQuery->FlushBuffers();
		pupilTestQuery->Refresh();
	}

	pupilTestQuery->Close();
	pupilTestQuery->UnPrepare();
	pupilTestQuery->Prepare();
	pupilTestQuery->ParamByName("thePupil")->AsInteger = thePupil;
	pupilTestQuery->Open();

	/*
		Do not enable / disable controls
		otherwise we will get an index error
	*/
//	pupilTestQuery->DisableControls();
	while( pupilTestQueryID->AsInteger != id && !pupilTestQuery->Eof )
		pupilTestQuery->Next();
//	pupilTestQuery->EnableControls();

	if( !MainForm->theDatabase->IsSQLBased )
	{
		pupilTestQuery->FlushBuffers();
		pupilTestQuery->Refresh();
	}
}
//---------------------------------------------------------------------------
void TSchuelerKursForm::setYearFilterTest( short theYear=0 )
{
	char	buffer[64];

	if( theYear )
	{
		sprintf( buffer, "%d", (int)theYear );
		yearLabelTest->Caption = buffer;

		sprintf( buffer, "JAHR=%d", (int)theYear );
	}

	bool pupilWasOpen = pupilTestQuery->Active;
	bool testWasOpen = testQuery->Active;

	pupilTestQuery->Close();
	testQuery->Close();

	if( theYear )
	{
		testQuery->Filter = buffer;
		pupilTestQuery->Filter = buffer;
	}

	testQuery->Filtered = !CheckBoxFilterTest->Checked;
	pupilTestQuery->Filtered = !CheckBoxFilterTest->Checked;

	if( testWasOpen )
		testQuery->Open();
	if( pupilWasOpen )
		pupilTestQuery->Open();
}

//---------------------------------------------------------------------------
__fastcall TSchuelerKursForm::TSchuelerKursForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void TSchuelerKursForm::showPupil(
	int id, const AnsiString &behoerde, const AnsiString &berechtigungsScheinNr
)
{
	unsigned short	year, dummy;
	TDateTime now = TDateTime::CurrentDate();
	now.DecodeDate( &year, &dummy, &dummy );

	YearSelectUpDownCourse->Tag = 1;
	YearSelectUpDownTest->Tag = 1;
	YearSelectUpDownCourse->Position = year;
	YearSelectUpDownTest->Position = year;
	YearSelectUpDownCourse->Tag = 0;
	YearSelectUpDownTest->Tag = 0;

	this->behoerde = behoerde;
	this->berechtigungsScheinNr = berechtigungsScheinNr;

	courseQuery->Open();
	testQuery->Open();

	pupilQuery->ParamByName("thePupil")->AsInteger = id;
	pupilQuery->Open();

	pupilCourseQuery->ParamByName("thePupil")->AsInteger = id;
	pupilCourseQuery->Open();

	pupilTestQuery->ParamByName("thePupil")->AsInteger = id;
	pupilTestQuery->Open();

	thePupil = id;

	ShowModal();

	MainForm->ApplyChanges( pupilCourseQuery );
	MainForm->ApplyChanges( pupilTestQuery );

	pupilTestQuery->Close();
	pupilCourseQuery->Close();

	pupilQuery->Close();

	testQuery->Close();
	courseQuery->Close();
}
//---------------------------------------------------------------------------


void __fastcall TSchuelerKursForm::pupilCourseQueryAfterInsert(
	  TDataSet *)
{
	pupilCourseQueryID->AsInteger = 0;
	pupilCourseQuerySCHUELER_ID->AsInteger = thePupil;
}
//---------------------------------------------------------------------------


void __fastcall TSchuelerKursForm::pupilCourseQueryAfterPost(
	  TDataSet *)
{
	MainForm->ApplyChanges( pupilCourseQuery );
	refreshDBCourse();
}

//---------------------------------------------------------------------------

void __fastcall TSchuelerKursForm::pupilCourseQueryAfterDelete(
	  TDataSet *)
{
	MainForm->ApplyChanges( pupilCourseQuery );
	refreshDBCourse();
}
//---------------------------------------------------------------------------

void __fastcall TSchuelerKursForm::pupilCourseQueryBeforeClose(
	  TDataSet *)
{
	MainForm->ApplyChanges( pupilCourseQuery );
}
//---------------------------------------------------------------------------

void __fastcall TSchuelerKursForm::ButtonPaymentClick(TObject *)
{
	if( pupilCourseQueryID->AsInteger )
		ZahlungForm->showPayment(pupilCourseQueryID->AsInteger);
	else
		Application->MessageBox(
			"Bitte zuerst speichern!", "Fehler", MB_ICONEXCLAMATION
		);
}
//---------------------------------------------------------------------------




void __fastcall TSchuelerKursForm::FormCloseQuery(TObject *,
	  bool &CanClose)
{
	bool courseChanged =
		pupilCourseQuery->State == dsInsert ||
		pupilCourseQuery->State == dsEdit;
	bool testChanged =
		pupilTestQuery->State == dsInsert ||
		pupilTestQuery->State == dsEdit;
	int	button;

	if( testChanged || courseChanged )
	{
		button = Application->MessageBox(
			"Änderungen sind nicht gespeichert! Jetzt speichern?",
			"Speichern?",
			MB_YESNOCANCEL|MB_ICONQUESTION	);
		if( button == IDYES )
		{
			if( testChanged )
				pupilTestQuery->Post();
			if( courseChanged )
				pupilCourseQuery->Post();
			CanClose = true;
		}
		else if( button == IDNO )
		{
			if( testChanged )
				pupilTestQuery->Cancel();
			if( courseChanged )
				pupilCourseQuery->Cancel();
			CanClose = true;
		}
		else if( button == IDCANCEL )
		{
			CanClose = false;
		}
	}
	else
		CanClose = true;

	saveColumSettings( DBGridCourse, registryKey );
	saveColumSettings( DBGridTest, registryKey );
}
//---------------------------------------------------------------------------


void __fastcall TSchuelerKursForm::FormShow(TObject *)
{
	MainForm->checkLicence();
	restoreColumSettings( DBGridCourse, registryKey );
	restoreColumSettings( DBGridTest, registryKey );

	if( !MainForm->isBamfEnabled() )
	{
		DBGridCourse->Columns->Items[1]->Visible = false;
	}
}
//---------------------------------------------------------------------------

void __fastcall TSchuelerKursForm::YearSelectUpDownCourseChangingEx(
	  TObject *, bool &AllowChange, short NewValue,
	  TUpDownDirection )
{
	if( YearSelectUpDownCourse->Position != NewValue )
	{
		AllowChange = true;
		setYearFilterCourse( NewValue );
		if( !YearSelectUpDownCourse->Tag )
		{
			YearSelectUpDownTest->Tag = 1;
			YearSelectUpDownTest->Position = NewValue;
			YearSelectUpDownTest->Tag = 0;
		}
	}
	else
		AllowChange = false;
}
//---------------------------------------------------------------------------



void __fastcall TSchuelerKursForm::pupilCourseQueryBeforePost(TDataSet *)
{
	if( !pupilCourseQueryID->AsInteger )
		pupilCourseQueryID->AsInteger = getNewMaxValue( "KlaroDB", "KURSSCHUELER", "ID" );

	if( pupilCourseQueryBEHOERDE->IsNull
	&&  pupilCourseQueryBERECHTIGUNGS_NR->IsNull
	&& !behoerde.IsEmpty()
	&& !berechtigungsScheinNr.IsEmpty() )
	{
		pupilCourseQueryBEHOERDE->AsString = behoerde;
		pupilCourseQueryBERECHTIGUNGS_NR->AsString = berechtigungsScheinNr;
	}
}
//---------------------------------------------------------------------------


void __fastcall TSchuelerKursForm::SpeedButtonRefreshCourseClick(TObject *)
{
	MainForm->ApplyChanges( pupilCourseQuery );
	refreshDBCourse();
}
//---------------------------------------------------------------------------

void __fastcall TSchuelerKursForm::CheckBoxFilterCourseClick(TObject *)
{
	if( !CheckBoxFilterCourse->Tag )
	{
		CheckBoxFilterTest->Tag = 1;
		CheckBoxFilterTest->Checked = CheckBoxFilterCourse->Checked;
		CheckBoxFilterTest->Tag = 0;
	}
	setYearFilterCourse();
}
//---------------------------------------------------------------------------


void __fastcall TSchuelerKursForm::pupilTestQueryBeforePost(
	  TDataSet *)
{
	if( !pupilTestQueryID->AsInteger )
		pupilTestQueryID->AsInteger = getNewMaxValue( "KlaroDB", "PRUEFSCHUELER", "ID" );

	if( pupilTestQueryBEHOERDE->IsNull
	&&  pupilTestQueryBERECHTIGUNGS_NR->IsNull
	&& !behoerde.IsEmpty()
	&& !berechtigungsScheinNr.IsEmpty() )
	{
		pupilTestQueryBEHOERDE->AsString = behoerde;
		pupilTestQueryBERECHTIGUNGS_NR->AsString = berechtigungsScheinNr;
	}
}
//---------------------------------------------------------------------------

void __fastcall TSchuelerKursForm::YearSelectUpDownTestChangingEx(
	  TObject *, bool &AllowChange, short NewValue,
	  TUpDownDirection )
{
	if( YearSelectUpDownTest->Position != NewValue )
	{
		AllowChange = true;
		setYearFilterTest( NewValue );
		if( !YearSelectUpDownTest->Tag )
		{
			YearSelectUpDownCourse->Tag = 1;
			YearSelectUpDownCourse->Position = NewValue;
			YearSelectUpDownCourse->Tag = 0;
		}
	}
	else
		AllowChange = false;
}
//---------------------------------------------------------------------------

void __fastcall TSchuelerKursForm::DBNavigatorTestClick(TObject *,
      TNavigateBtn Button)
{
	if( Button == nbRefresh )
	{
		MainForm->ApplyChanges( pupilTestQuery );
		refreshDBTest();
	}
}
//---------------------------------------------------------------------------

void __fastcall TSchuelerKursForm::pupilTestQueryBeforeClose(
	  TDataSet *)
{
	MainForm->ApplyChanges( pupilTestQuery );
}
//---------------------------------------------------------------------------


void __fastcall TSchuelerKursForm::pupilTestQueryAfterPost(
	  TDataSet *)
{
	MainForm->ApplyChanges( pupilTestQuery );
	refreshDBTest();
}
//---------------------------------------------------------------------------

void __fastcall TSchuelerKursForm::pupilTestQueryAfterInsert(
	  TDataSet *)
{
	pupilTestQueryID->AsInteger = 0;
	pupilTestQuerySCHUELER_ID->AsInteger = thePupil;
}
//---------------------------------------------------------------------------
void __fastcall TSchuelerKursForm::CheckBoxFilterTestClick(TObject *)
{
	if( !CheckBoxFilterTest->Tag )
	{
		CheckBoxFilterCourse->Tag = 1;
		CheckBoxFilterCourse->Checked = CheckBoxFilterTest->Checked;
		CheckBoxFilterCourse->Tag = 0;
	}
	setYearFilterTest();
}
//---------------------------------------------------------------------------

void __fastcall TSchuelerKursForm::SpeedButtonRefreshTestsClick(
      TObject *)
{
	MainForm->ApplyChanges( pupilTestQuery );
	refreshDBTest();
}
//---------------------------------------------------------------------------

