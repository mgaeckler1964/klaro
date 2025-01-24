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
#include <windows.h>
#include <shellapi.h>

#include <vcl.h>

#include <gak/vcl_tools.h>

#pragma hdrstop

#include "LehrerFrm.h"
#include "DafMain.h"
#include "LehrerKursFrm.h"

//----------------------------------------------------------------------------
#pragma resource "*.dfm"
TLehrerForm *LehrerForm;
//---------------------------------------------------------------------------
void TLehrerForm::refreshDB( void )
{
	int	id = TableTeacherID->AsInteger;

	TableTeacher->Close();
	MainForm->updateOsbizData();
	TableTeacher->Open();

	TableTeacher->DisableControls();
	while( TableTeacherID->AsInteger != id && !TableTeacher->Eof )
		TableTeacher->Next();
	TableTeacher->EnableControls();

}
//----------------------------------------------------------------------------
__fastcall TLehrerForm::TLehrerForm(TComponent *Owner)
	: TForm(Owner)
{
}
//----------------------------------------------------------------------------
void __fastcall TLehrerForm::FormCreate(TObject *)
{
	OpenTable( TableTeacher );
}
//----------------------------------------------------------------------------
void __fastcall TLehrerForm::ButtonCoursesClick(TObject *)
{
	MainForm->checkLicence();
	if( TableTeacherID->AsInteger > 0 )
		LehrerKursForm->showTeacher(TableTeacherID->AsInteger);
	else
		Application->MessageBox(
			"Bitte zuerst speichern!", "Fehler", MB_ICONEXCLAMATION
		);
}
//---------------------------------------------------------------------------
void __fastcall TLehrerForm::SpeedButtonEmailClick(TObject *)
{
	if( TableTeacherE_MAIL->AsString > "" )
	{
		AnsiString	mailToCommand = "mailto:";
		mailToCommand += TableTeacherE_MAIL->AsString;
		ShellExecute( NULL, "open", mailToCommand.c_str(), "", "", SW_SHOW );
	}
}
//---------------------------------------------------------------------------

void __fastcall TLehrerForm::TableTeacherBeforePost(TDataSet *)
{
	MainForm->checkLicence();
	if( !TableTeacherID->AsInteger )
		TableTeacherID->AsInteger = getNewMaxValue( "KlaroDB", "LEHRER", "ID" );
}
//---------------------------------------------------------------------------

void __fastcall TLehrerForm::SearchEditChange(TObject *)
{
	if( TableTeacher->IndexName == "" )
		TableTeacher->IndexFieldNames = "Nachname";

	TableTeacher->SetKey();
	TableTeacher->FieldByName( "Nachname" )->AsString = SearchEdit->Text;
	TableTeacher->GotoNearest();
}
//---------------------------------------------------------------------------

void __fastcall TLehrerForm::DBRadioGroupSexExit(TObject *)
{
	if( TableTeacher->State == dsEdit || TableTeacher->State == dsInsert )
	{
		if( TableTeacherANREDE->IsNull
		||  TableTeacherANREDE->AsString == "Herr"
		||  TableTeacherANREDE->AsString == "Frau" )
		{
			if( TableTeacherGESCHLECHT->AsString == "m" )
				TableTeacherANREDE->AsString = "Herr";
			else if( TableTeacherGESCHLECHT->AsString == "w" )
				TableTeacherANREDE->AsString = "Frau";
			else
				TableTeacherANREDE->AsString = TableTeacherGESCHLECHT->AsString;
		}
	}
}
//---------------------------------------------------------------------------

void __fastcall TLehrerForm::TableTeacherAfterInsert(TDataSet *)
{
	TableTeacherID->AsInteger = 0;
}
//---------------------------------------------------------------------------

void __fastcall TLehrerForm::SpeedButtonRefreshClick(TObject *)
{
	refreshDB();
}
//---------------------------------------------------------------------------

void __fastcall TLehrerForm::FormShow(TObject *)
{
	if( !MainForm->isBamfEnabled() )
	{
		LabelDAFErfahrungseit->Visible = false;
		DBEditDAF_ERFAHRUNG->Visible = false;

		LabelSprachverbandsabschluss->Visible = false;
		DBEditSV_ABSCHLUSS->Visible = false;

		LabelBAMFZulassungsnummer->Visible = false;
		DBEditBAMF_NUMMER->Visible = false;
	}
}
//---------------------------------------------------------------------------

