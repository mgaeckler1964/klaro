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
#include <sysutils.hpp>

#include <gak/vcl_tools.h>

#pragma hdrstop

#include "LehrerKursFrm.h"
#include "DafMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TLehrerKursForm *LehrerKursForm;
//---------------------------------------------------------------------------
void TLehrerKursForm::refreshDB( void )
{
	int	id = lastCreatedId ? lastCreatedId : teacherCourseQueryID->AsInteger;

	if( !MainForm->theDatabase->IsSQLBased )
	{
		teacherCourseQuery->FlushBuffers();
		teacherCourseQuery->Refresh();
	}

	teacherCourseQuery->Close();
	teacherCourseQuery->UnPrepare();
	teacherCourseQuery->Prepare();
	teacherCourseQuery->ParamByName("theTeacher")->AsInteger = theTeacher;
	teacherCourseQuery->Open();

	teacherCourseQuery->DisableControls();
	while( teacherCourseQueryID->AsInteger != id && !teacherCourseQuery->Eof )
		teacherCourseQuery->Next();
	teacherCourseQuery->EnableControls();

	if( !MainForm->theDatabase->IsSQLBased )
	{
		teacherCourseQuery->FlushBuffers();
		teacherCourseQuery->Refresh();
	}
}
//---------------------------------------------------------------------------
void TLehrerKursForm::setYearFilter( short theYear=0 )
{
	char	buffer[64];

	if( theYear )
	{
		sprintf( buffer, "%d", (int)theYear );
		yearLabel->Caption = buffer;

		sprintf( buffer, "JAHR=%d", (int)theYear );
	}

	bool teacherWasOpen = teacherCourseQuery->Active;
	bool courseWasOpen = QueryCourse->Active;

	teacherCourseQuery->Close();
	QueryCourse->Close();

	if( theYear )
	{
		QueryCourse->Filter = buffer;
		teacherCourseQuery->Filter = buffer;
	}

	QueryCourse->Filtered = !CheckBoxFilter->Checked;
	teacherCourseQuery->Filtered = !CheckBoxFilter->Checked;

	if( courseWasOpen )
		QueryCourse->Open();
	if( teacherWasOpen )
		teacherCourseQuery->Open();
}

//---------------------------------------------------------------------------
__fastcall TLehrerKursForm::TLehrerKursForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void TLehrerKursForm::showTeacher( int id )
{
	unsigned short	year, dummy;
	TDateTime now = TDateTime::CurrentDate();
	now.DecodeDate( &year, &dummy, &dummy );

	YearSelectUpDown->Position = year;

	QueryCourse->Open();

	teacherQuery->ParamByName("theTeacher")->AsInteger = id;
	teacherQuery->Open();

	teacherCourseQuery->ParamByName("theTeacher")->AsInteger = id;
	teacherCourseQuery->Open();

	theTeacher = id;
	lastCreatedId = 0;

	restoreColumSettings( DBGridTeacherCourse, registryKey );
	ShowModal();
	saveColumSettings( DBGridTeacherCourse, registryKey );

	MainForm->ApplyChanges( teacherCourseQuery );

	teacherCourseQuery->Close();
	teacherQuery->Close();

	QueryCourse->Close();
}
//---------------------------------------------------------------------------


void __fastcall TLehrerKursForm::teacherCourseQueryAfterInsert(
	  TDataSet *)
{
	teacherCourseQueryID->AsInteger = 0;
	teacherCourseQueryLEHRER_ID->AsInteger = theTeacher;
}
//---------------------------------------------------------------------------


void __fastcall TLehrerKursForm::teacherCourseQueryAfterPost(
	  TDataSet *)
{
	MainForm->ApplyChanges( teacherCourseQuery );
	refreshDB();

	TDateTime today, StartDate, EndDate, CurDate, startTime, endTime, startBreak, endBreak;

	today = TDateTime::CurrentDate();

	if( teacherCourseQueryANFANG->IsNull )
		StartDate = teacherCourseQueryANFANGS_DATUM->AsDateTime;
	else
		StartDate = teacherCourseQueryANFANG->AsDateTime;

	StartDate = GetDate( StartDate );
	if( StartDate < today )
		StartDate = today;

	if( teacherCourseQueryENDE->IsNull )
		EndDate = teacherCourseQueryENDE_DATUM->AsDateTime;
	else
		EndDate = teacherCourseQueryENDE->AsDateTime;

	if( StartDate <= EndDate )
	{
		TQuery	*insertSql = new TQuery( this );
		TQuery	*deleteSql = new TQuery( this );

		insertSql->DatabaseName = "KlaroDB";
		deleteSql->DatabaseName = "KlaroDB";
		insertSql->SQL->Add(
			"insert into LEHRZEITEN "
			"("
				"ID, LEHRER_KURS_ID, DATUM, "
				"START_ZEIT, ENDE_ZEIT, PAUSE_ANFANG, PAUSE_ENDE "
			")"
			"values"
			"("
				":ID, :LEHRER_KURS_ID, :DATUM, "
				":START_ZEIT, :ENDE_ZEIT, :PAUSE_ANFANG, :PAUSE_ENDE "
			")"
		);
		deleteSql->SQL->Add(
			"delete from LEHRZEITEN where LEHRER_KURS_ID = :theId and DATUM >= :today"
		);

		deleteSql->Params->Items[0]->AsInteger = teacherCourseQueryID->AsInteger;
		deleteSql->Params->Items[1]->AsDate = today;
		deleteSql->ExecSQL();

		QueryFerien->ParamByName( "START1" )->AsDate = StartDate;
		QueryFerien->ParamByName( "START2" )->AsDate = StartDate;
		QueryFerien->ParamByName( "START3" )->AsDate = StartDate;
		QueryFerien->ParamByName( "ENDE1" )->AsDate = EndDate;
		QueryFerien->ParamByName( "ENDE2" )->AsDate = EndDate;
		QueryFerien->ParamByName( "ENDE3" )->AsDate = EndDate;

		QueryFerien->Open();

		for( CurDate = StartDate; CurDate <= EndDate; CurDate++ )
		{
			while( QueryFerien->FieldByName( "ENDE" )->AsDateTime < CurDate
			&& !QueryFerien->Eof )
				QueryFerien->Next();

			if( CurDate < QueryFerien->FieldByName( "ANFANG" )->AsDateTime
			||  CurDate > QueryFerien->FieldByName( "ENDE" )->AsDateTime )
			{
				insertSql->Params->Items[0]->AsInteger = getNewMaxValue( "KlaroDB", "LEHRZEITEN", "ID" );
				insertSql->Params->Items[1]->AsInteger = teacherCourseQueryID->AsInteger;
				insertSql->Params->Items[2]->AsDate = CurDate;
				switch( CurDate.DayOfWeek() )
				{
					case 1:		// Sunday
						startTime = teacherCourseQuerySO_ANF->AsDateTime;
						endTime = teacherCourseQuerySO_END->AsDateTime;
						startBreak = teacherCourseQuerySO_PAUS_ANF->AsDateTime;
						endBreak = teacherCourseQuerySO_PAUS_END->AsDateTime;
						break;
					case 2:		// Monday
						startTime = teacherCourseQueryMO_ANF->AsDateTime;
						endTime = teacherCourseQueryMO_END->AsDateTime;
						startBreak = teacherCourseQueryMO_PAUS_ANF->AsDateTime;
						endBreak = teacherCourseQueryMO_PAUS_END->AsDateTime;
						break;
					case 3:		// Tuesday
						startTime = teacherCourseQueryDI_ANF->AsDateTime;
						endTime = teacherCourseQueryDI_END->AsDateTime;
						startBreak = teacherCourseQueryDI_PAUS_ANF->AsDateTime;
						endBreak = teacherCourseQueryDI_PAUS_END->AsDateTime;
						break;
					case 4:		// Wensday
						startTime = teacherCourseQueryMI_ANF->AsDateTime;
						endTime = teacherCourseQueryMI_END->AsDateTime;
						startBreak = teacherCourseQueryMI_PAUS_ANF->AsDateTime;
						endBreak = teacherCourseQueryMI_PAUS_END->AsDateTime;
						break;
					case 5:		// Thursday
						startTime = teacherCourseQueryDO_ANF->AsDateTime;
						endTime = teacherCourseQueryDO_END->AsDateTime;
						startBreak = teacherCourseQueryDO_PAUS_ANF->AsDateTime;
						endBreak = teacherCourseQueryDO_PAUS_END->AsDateTime;
						break;
					case 6:		// Friday
						startTime = teacherCourseQueryFR_ANF->AsDateTime;
						endTime = teacherCourseQueryFR_END->AsDateTime;
						startBreak = teacherCourseQueryFR_PAUS_ANF->AsDateTime;
						endBreak = teacherCourseQueryFR_PAUS_END->AsDateTime;
						break;
					case 7:		// Saturday
						startTime = teacherCourseQuerySA_ANF->AsDateTime;
						endTime = teacherCourseQuerySA_END->AsDateTime;
						startBreak = teacherCourseQuerySA_PAUS_ANF->AsDateTime;
						endBreak = teacherCourseQuerySA_PAUS_END->AsDateTime;
						break;
				}

				startTime = GetTime( startTime );
				endTime = GetTime( endTime );
				startBreak = GetTime( startBreak );
				endBreak = GetTime( endBreak );

				if( startTime != endTime )
				{
					insertSql->Params->Items[3]->AsTime = startTime;
					insertSql->Params->Items[4]->AsTime = endTime;
					insertSql->Params->Items[5]->AsTime = startBreak;
					insertSql->Params->Items[6]->AsTime = endBreak;

					insertSql->ExecSQL();
				}
			}
		}
		QueryFerien->Close();

		delete insertSql;
		delete deleteSql;
	}
}
//---------------------------------------------------------------------------

void __fastcall TLehrerKursForm::teacherCourseQueryAfterDelete(
	  TDataSet *)
{
	MainForm->ApplyChanges( teacherCourseQuery );
	refreshDB();
}
//---------------------------------------------------------------------------

void __fastcall TLehrerKursForm::teacherCourseQueryBeforeClose(
	  TDataSet *)
{
	MainForm->ApplyChanges( teacherCourseQuery );
}
//---------------------------------------------------------------------------


void __fastcall TLehrerKursForm::FormCloseQuery(TObject *,
	  bool &CanClose)
{
	int	button;

	if( teacherCourseQuery->State == dsInsert || teacherCourseQuery->State == dsEdit )
	{
		button = Application->MessageBox(
			"Änderungen sind nicht gespeichert! Jetzt speichern?",
			"Speichern?",
			MB_YESNOCANCEL|MB_ICONQUESTION	);
		if( button == IDYES )
		{
			teacherCourseQuery->Post();
			CanClose = true;
		}
		else if( button == IDNO )
		{
			teacherCourseQuery->Cancel();
			CanClose = true;
		}
		else if( button == IDCANCEL )
		{
			CanClose = false;
		}
	}
	else
		CanClose = true;
}
//---------------------------------------------------------------------------


void __fastcall TLehrerKursForm::FormShow(TObject *)
{
	MainForm->checkLicence();
	if( !MainForm->isBamfEnabled() )
	{
		DBGridTeacherCourse->Columns->Items[6]->Visible = false;
		DBGridTeacherCourse->Columns->Items[7]->Visible = false;
	}
}
//---------------------------------------------------------------------------

void __fastcall TLehrerKursForm::YearSelectUpDownChangingEx(
	  TObject *, bool &AllowChange, short NewValue,
	  TUpDownDirection )
{
	if( YearSelectUpDown->Position != NewValue )
	{
		AllowChange = true;
		setYearFilter( NewValue );
	}
	else
		AllowChange = false;
}
//---------------------------------------------------------------------------

void __fastcall TLehrerKursForm::teacherCourseQueryBeforePost(TDataSet *)
{
	if( !teacherCourseQueryID->AsInteger )
	{
		lastCreatedId = getNewMaxValue( "KlaroDB", "KURSLEHRER", "ID" );
		teacherCourseQueryID->AsInteger = lastCreatedId;
	}
	else
		lastCreatedId = 0;
}
//---------------------------------------------------------------------------

void __fastcall TLehrerKursForm::SpeedButtonRefreshClick(TObject *)
{
	MainForm->ApplyChanges( teacherCourseQuery );
	refreshDB();
}
//---------------------------------------------------------------------------

void __fastcall TLehrerKursForm::CheckBoxFilterClick(TObject *)
{
	setYearFilter();
}
//---------------------------------------------------------------------------

void __fastcall TLehrerKursForm::teacherCourseQueryBeforeDelete(
	  TDataSet *)
{
	TDateTime today, StartDate, EndDate;

	today = TDateTime::CurrentDate();

	if( teacherCourseQueryANFANG->IsNull )
		StartDate = teacherCourseQueryANFANGS_DATUM->AsDateTime;
	else
		StartDate = teacherCourseQueryANFANG->AsDateTime;

	StartDate = GetDate( StartDate );
	if( StartDate < today )
		StartDate = today;

	if( teacherCourseQueryENDE->IsNull )
		EndDate = teacherCourseQueryENDE_DATUM->AsDateTime;
	else
		EndDate = teacherCourseQueryENDE->AsDateTime;

	if( StartDate <= EndDate )
	{
		TQuery	*deleteSql = new TQuery( this );

		deleteSql->DatabaseName = "KlaroDB";
		deleteSql->SQL->Add(
			"delete from LEHRZEITEN where LEHRER_KURS_ID = :theId and DATUM >= :today"
		);

		deleteSql->Params->Items[0]->AsInteger = teacherCourseQueryID->AsInteger;
		deleteSql->Params->Items[1]->AsDate = today;
		deleteSql->ExecSQL();

		delete deleteSql;
	}
}
//---------------------------------------------------------------------------

