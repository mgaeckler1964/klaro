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
#include <dbtables.hpp>

#pragma hdrstop

#include "DafMain.h"
#include "OverlappedFrm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TOverlappedForm *OverlappedForm;
//---------------------------------------------------------------------------
__fastcall TOverlappedForm::TOverlappedForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
static bool isOverlaped( double start1, double end1, double start2, double end2 )
{
	start1 = GetTime( start1 );
	start2 = GetTime( start2 );
	end1 = GetTime( end1 );
	end2 = GetTime( end2 );

	if( start2 >= start1 && start2 < end1 )
		return true;

	if( end2 > start1 && end2 <= end1 )
		return true;

	return false;
}
//---------------------------------------------------------------------------
void __fastcall TOverlappedForm::FormShow(TObject *)
{
	int	id1, id2;

	int			i;
	AnsiString	nummer;
	AnsiString	badDay;
	TQuery		*selCourses = new TQuery( this );
	TQuery		*selDuplicateCourses = new TQuery( this );

	selCourses->DatabaseName = "KlaroDB";
	selDuplicateCourses->DatabaseName = "KlaroDB";

	selCourses->SQL->Add(
		"select * "
		"from kurse "
		"where ende_datum > :heute "
		"and raum is not null"
	);
	selDuplicateCourses->SQL->Add(
		"select * "
		"from kurse "
		"where id > :firstId "
		"and ((anfangs_datum >= :theStart1 and anfangs_datum <= :theEnd1) or (ende_datum >= :theStart2 and ende_datum <= :theEnd2) or (anfangs_datum <= :theStart3 and ende_datum >= :theEnd3)) "
		"and raum = :theRaum"
	);
	selCourses->Params->Items[0]->AsDate = TDateTime::CurrentDate();

	StringGridResult->ColCount = 4;
	StringGridResult->ColWidths[0] = 128;
	StringGridResult->ColWidths[1] = 128;
	StringGridResult->ColWidths[2] = 64;
	StringGridResult->ColWidths[3] = 356;

	StringGridResult->RowCount = 2;
	StringGridResult->Cells[0][0] = "Kurs 1";
	StringGridResult->Cells[1][0] = "Kurs 2";
	StringGridResult->Cells[2][0] = "Raum";
	StringGridResult->Cells[3][0] = "Tage";
	StringGridResult->Cells[0][1] = "";
	StringGridResult->Cells[1][1] = "";
	StringGridResult->Cells[2][1] = "";
	StringGridResult->Cells[3][1] = "";

	for( selCourses->Open(), i=1; !selCourses->Eof; selCourses->Next() )
	{
		id1 = selCourses->FieldByName( "ID" )->AsInteger;
		selDuplicateCourses->Params->Items[0]->AsInteger = selCourses->FieldByName( "ID" )->AsInteger;
		selDuplicateCourses->Params->Items[1]->AsDate = selCourses->FieldByName( "ANFANGS_DATUM" )->AsDateTime;
		selDuplicateCourses->Params->Items[2]->AsDate = selCourses->FieldByName( "ENDE_DATUM" )->AsDateTime;
		selDuplicateCourses->Params->Items[3]->AsDate = selCourses->FieldByName( "ANFANGS_DATUM" )->AsDateTime;
		selDuplicateCourses->Params->Items[4]->AsDate = selCourses->FieldByName( "ENDE_DATUM" )->AsDateTime;
		selDuplicateCourses->Params->Items[5]->AsDate = selCourses->FieldByName( "ANFANGS_DATUM" )->AsDateTime;
		selDuplicateCourses->Params->Items[6]->AsDate = selCourses->FieldByName( "ENDE_DATUM" )->AsDateTime;
		selDuplicateCourses->Params->Items[7]->AsString = selCourses->FieldByName( "RAUM" )->AsString;
		selDuplicateCourses->Open();
		while( !selDuplicateCourses->Eof )
		{
			badDay = "";

			id2 = selDuplicateCourses->FieldByName( "ID" )->AsInteger;
			if( id1 == id2 )
				badDay = "Stupid";

			if(
				isOverlaped(
					selCourses->FieldByName( "MO_ANF" )->AsDateTime,
					selCourses->FieldByName( "MO_END" )->AsDateTime,
					selDuplicateCourses->FieldByName( "MO_ANF" )->AsDateTime,
					selDuplicateCourses->FieldByName( "MO_END" )->AsDateTime
				)
			)
			{
				badDay += " Montag ";
			}
			if(
				isOverlaped(
					selCourses->FieldByName( "DI_ANF" )->AsDateTime,
					selCourses->FieldByName( "DI_END" )->AsDateTime,
					selDuplicateCourses->FieldByName( "DI_ANF" )->AsDateTime,
					selDuplicateCourses->FieldByName( "DI_END" )->AsDateTime
				)
			)
			{
				badDay += " Dienstag ";
			}
			if(
				isOverlaped(
					selCourses->FieldByName( "MI_ANF" )->AsDateTime,
					selCourses->FieldByName( "MI_END" )->AsDateTime,
					selDuplicateCourses->FieldByName( "MI_ANF" )->AsDateTime,
					selDuplicateCourses->FieldByName( "MI_END" )->AsDateTime
				)
			)
			{
				badDay += " Mittwoch ";
			}
			if(
				isOverlaped(
					selCourses->FieldByName( "DO_ANF" )->AsDateTime,
					selCourses->FieldByName( "DO_END" )->AsDateTime,
					selDuplicateCourses->FieldByName( "DO_ANF" )->AsDateTime,
					selDuplicateCourses->FieldByName( "DO_END" )->AsDateTime
				)
			)
			{
				badDay += " Donnerstag ";
			}
			if(
				isOverlaped(
					selCourses->FieldByName( "FR_ANF" )->AsDateTime,
					selCourses->FieldByName( "FR_END" )->AsDateTime,
					selDuplicateCourses->FieldByName( "FR_ANF" )->AsDateTime,
					selDuplicateCourses->FieldByName( "FR_END" )->AsDateTime
				)
			)
			{
				badDay += " Freitag ";
			}
			if(
				isOverlaped(
					selCourses->FieldByName( "SA_ANF" )->AsDateTime,
					selCourses->FieldByName( "SA_END" )->AsDateTime,
					selDuplicateCourses->FieldByName( "SA_ANF" )->AsDateTime,
					selDuplicateCourses->FieldByName( "SA_END" )->AsDateTime
				)
			)
			{
				badDay += " Samstag ";
			}
			if(
				isOverlaped(
					selCourses->FieldByName( "SO_ANF" )->AsDateTime,
					selCourses->FieldByName( "SO_END" )->AsDateTime,
					selDuplicateCourses->FieldByName( "SO_ANF" )->AsDateTime,
					selDuplicateCourses->FieldByName( "SO_END" )->AsDateTime
				)
			)
			{
				badDay += " Sonntag ";
			}

			if( badDay > "" )
			{
				nummer = selCourses->FieldByName( "NUMMER" )->AsString;
				nummer += '-';
				nummer += selCourses->FieldByName( "HALBJAHR" )->AsString;
				nummer += '-';
				nummer += selCourses->FieldByName( "JAHR" )->AsString;
				StringGridResult->Cells[0][i] = nummer;

				nummer = selDuplicateCourses->FieldByName( "NUMMER" )->AsString;
				nummer += '-';
				nummer += selDuplicateCourses->FieldByName( "HALBJAHR" )->AsString;
				nummer += '-';
				nummer += selDuplicateCourses->FieldByName( "JAHR" )->AsString;
				StringGridResult->Cells[1][i] = nummer;

				StringGridResult->Cells[2][i] = selCourses->FieldByName( "RAUM" )->AsString;
				StringGridResult->Cells[3][i] = badDay;

				StringGridResult->RowCount++;
				i++;
			}

			selDuplicateCourses->Next();
		}
		selDuplicateCourses->Close();
	}
	selCourses->Close();

	if( StringGridResult->RowCount > 2 )
		StringGridResult->RowCount--;

	delete selDuplicateCourses;
	delete selCourses;
}
//---------------------------------------------------------------------------

