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
#include <gak/vcl_tools.h>
#pragma hdrstop

#include "LehrzeitenFrm.h"
#include "DafMain.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TLehrzeitenForm *LehrzeitenForm;
//---------------------------------------------------------------------------
__fastcall TLehrzeitenForm::TLehrzeitenForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void TLehrzeitenForm::refreshDB( void )
{
	int	id = QueryLehrzeitenID->AsInteger;

	if( !MainForm->theDatabase->IsSQLBased )
	{
		QueryLehrzeiten->FlushBuffers();
		QueryLehrzeiten->Refresh();
	}

	QueryLehrzeiten->Close();
	QueryLehrzeiten->UnPrepare();
	QueryLehrzeiten->Prepare();
	QueryLehrzeiten->Params->Items[0]->AsInteger = course_id;
	QueryLehrzeiten->Open();

//	QueryLehrzeiten->DisableControls();
	while( QueryLehrzeitenID->AsInteger != id && !QueryLehrzeiten->Eof )
		QueryLehrzeiten->Next();
//	QueryLehrzeiten->EnableControls();

	if( !MainForm->theDatabase->IsSQLBased )
	{
		QueryLehrzeiten->FlushBuffers();
		QueryLehrzeiten->Refresh();
	}
}
//---------------------------------------------------------------------------
void TLehrzeitenForm::showTeacherTimes( int course_id, const char *course_number )
{
	char	caption[256];

	strcpy( caption, "Lehrzeiten " );
	strcat( caption, course_number );
	this->Caption = caption;

	this->course_id = course_id;

	QueryTeacher->Params->Items[0]->AsInteger = course_id;
	QueryTeacher->Open();

	QueryLehrzeiten->Params->Items[0]->AsInteger = course_id;
	QueryLehrzeiten->Open();

	ShowModal();

	QueryLehrzeiten->Close();
	QueryTeacher->Close();
}
//---------------------------------------------------------------------------
void __fastcall TLehrzeitenForm::QueryLehrzeitenAfterDelete(
	  TDataSet *)
{
	MainForm->ApplyChanges( QueryLehrzeiten );
	refreshDB();
}
//---------------------------------------------------------------------------

void __fastcall TLehrzeitenForm::QueryLehrzeitenAfterPost(
	  TDataSet *)
{
	MainForm->ApplyChanges( QueryLehrzeiten );
	refreshDB();
}
//---------------------------------------------------------------------------

void __fastcall TLehrzeitenForm::QueryLehrzeitenBeforeClose(
	  TDataSet *)
{
	MainForm->ApplyChanges( QueryLehrzeiten );
}
//---------------------------------------------------------------------------

void __fastcall TLehrzeitenForm::QueryLehrzeitenBeforePost(
	  TDataSet *)
{
	if( !QueryLehrzeitenID->AsInteger )
		QueryLehrzeitenID->AsInteger = getNewMaxValue( "KlaroDB", "LEHRZEITEN", "ID" );
}
//---------------------------------------------------------------------------

void __fastcall TLehrzeitenForm::QueryLehrzeitenAfterInsert(
	  TDataSet *)
{
	QueryLehrzeitenID->AsInteger = 0;
}
//---------------------------------------------------------------------------

