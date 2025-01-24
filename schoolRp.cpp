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
#include <vcl\vcl.h>
#pragma hdrstop

#include "schoolRp.h"
//----------------------------------------------------------------------------
#pragma resource "*.dfm"
TSchoolReport *SchoolReport;
//----------------------------------------------------------------------------
__fastcall TSchoolReport::TSchoolReport(TComponent* Owner)
    : TQuickRep(Owner)
{
}
//----------------------------------------------------------------------------
void TSchoolReport::showReport( int kurs_id, const char *title )
{
	pupilQuery->Close();
	pupilQuery->ParamByName( "theCourse" )->AsInteger = kurs_id;
	pupilQuery->Open();

	courseQuery->Close();
	courseQuery->ParamByName( "theCourse" )->AsInteger = kurs_id;
	courseQuery->Open();

	teacherQuery->Close();
	teacherQuery->ParamByName( "theCourse" )->AsInteger = kurs_id;
	teacherQuery->Open();

	ttQuery->Close();
	ttQuery->ParamByName( "theCourse" )->AsInteger = kurs_id;
	ttQuery->Open();

	spQuery->Close();
	spQuery->ParamByName( "theCourse" )->AsInteger = kurs_id;
	spQuery->Open();

	ReportTitle = title;

	Preview();
}
//----------------------------------------------------------------------------

void __fastcall TSchoolReport::pupilQueryCalcFields(TDataSet *)
{
	TDateTime	now = TDateTime::CurrentDate();
	TDateTime	birthday = pupilQueryGEBURTSDATUM->AsDateTime;
	int			age = now - birthday;
	int			id;
	float		money;
	AnsiString	fullName;

	fullName = pupilQueryNACHNAME->AsString;
	if( fullName != "" && !pupilQueryVORNAME->IsNull )
		fullName += ", ";
	fullName += pupilQueryVORNAME->AsString;
	pupilQueryFULL_NAME->AsString = fullName;

	if( !pupilQueryGEBURTSDATUM->IsNull )
		pupilQueryAGE->AsInteger = age/365.25;
	else
		pupilQueryAGE->Clear();

	if( !pupilQueryWOHNUNG->IsNull )
		pupilQueryCO_APRTM->AsString = "c/o " + pupilQueryWOHNUNG->AsString;
	else
		pupilQueryCO_APRTM->Clear();

	id = pupilQueryID->AsInteger;
	moneyQuery->Params->Items[0]->AsInteger = id;
	moneyQuery->Open();
	money = moneyQueryBETRAG->AsFloat;
	pupilQueryBETRAG->AsFloat = money;
	moneyQuery->Close();
}
//---------------------------------------------------------------------------



