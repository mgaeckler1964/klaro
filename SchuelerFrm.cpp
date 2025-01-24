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

#include "SchuelerFrm.h"
#include "SchuelerKursFrm.h"
#include "SearchFrm.h"
#include "xmlExp.h"

#include "DafMain.h"

//----------------------------------------------------------------------------
#pragma resource "*.dfm"
TSchuelerForm *SchuelerForm;
//---------------------------------------------------------------------------
void TSchuelerForm::refreshDB( void )
{
	int	id = TablePupilID->AsInteger;

	TablePupil->Close();
	MainForm->updateOsbizData();
	TablePupil->Open();

	TablePupil->DisableControls();
	while( TablePupilID->AsInteger != id && !TablePupil->Eof )
		TablePupil->Next();
	TablePupil->EnableControls();

}
//----------------------------------------------------------------------------
__fastcall TSchuelerForm::TSchuelerForm(TComponent *Owner)
	: TForm(Owner)
{
	selectedXSL = "<Ohne>";
}
//----------------------------------------------------------------------------
void __fastcall TSchuelerForm::ButtonCourseClick(TObject *)
{
	AnsiString behoerde, berechtigungsScheinNr;

	MainForm->checkLicence();
	if( TablePupilID->AsInteger > 0 )
	{
		if( !TablePupilBAMF_NUMMER->IsNull )
		{
			behoerde = "BAMF";
			berechtigungsScheinNr = TablePupilBAMF_NUMMER->AsString.c_str();
		}
		else if( !TablePupilABH_NUMMER->IsNull )
		{
			behoerde = "ABH";
			berechtigungsScheinNr = TablePupilABH_NUMMER->AsString.c_str();
		}
		else if( !TablePupilBVA_NUMMER->IsNull )
		{
			behoerde = "BVA";
			berechtigungsScheinNr = TablePupilBVA_NUMMER->AsString.c_str();
		}
		else if( !TablePupilAZ_GRUNDSICHERUNG->IsNull )
		{
			behoerde = "Grundsicherung";
			berechtigungsScheinNr = TablePupilAZ_GRUNDSICHERUNG->AsString.c_str();
		}
		else
		{
			behoerde = "";
			berechtigungsScheinNr = "";
		}
		SchuelerKursForm->showPupil(
			TablePupilID->AsInteger, behoerde, berechtigungsScheinNr
		);
	}
	else
		Application->MessageBox(
			"Bitte zuerst speichern!", "Fehler", MB_ICONEXCLAMATION
		);
}
//---------------------------------------------------------------------------

void __fastcall TSchuelerForm::SpeedButtonEmailClick(TObject *Sender)
{
	AnsiString	mailToCommand = "mailto:";

	if( Sender == SpeedButtonEmail && TablePupilE_MAIL->AsString > "" )
		mailToCommand += TablePupilE_MAIL->AsString;
	else if( Sender == SpeedButtonApEmail && TablePupilAP_EMAIL->AsString > "" )
		mailToCommand += TablePupilAP_EMAIL->AsString;
	else
		mailToCommand = "";

	if( mailToCommand > "" )
		ShellExecute( NULL, "open", mailToCommand.c_str(), "", "", SW_SHOW );
}
//---------------------------------------------------------------------------

void __fastcall TSchuelerForm::SearchEditChange(TObject *)
{
	if( TablePupil->IndexName == "" )
		TablePupil->IndexFieldNames = "Nachname";

	TablePupil->SetKey();
	TablePupil->FieldByName( "Nachname" )->AsString = SearchEdit->Text;
	TablePupil->GotoNearest();
}
//---------------------------------------------------------------------------
void __fastcall TSchuelerForm::DBRadioGroupSexExit(TObject *)
{
	if( TablePupil->State == dsEdit || TablePupil->State == dsInsert )
	{
		if( TablePupilANREDE->IsNull
		||  TablePupilANREDE->AsString == "Herr"
		||  TablePupilANREDE->AsString == "Frau" )
		{
			if( TablePupilGESCHLECHT->AsString == "m" )
				TablePupilANREDE->AsString = "Herr";
			else if( TablePupilGESCHLECHT->AsString == "w" )
				TablePupilANREDE->AsString = "Frau";
			else
				TablePupilANREDE->AsString = TablePupilGESCHLECHT->AsString;
		}
	}
}
//---------------------------------------------------------------------------

void __fastcall TSchuelerForm::TablePupilAfterScroll(TDataSet *)
{
	if( TablePupilABGESCHLOSSEN->IsNull )
	{
		TablePupil->Edit();
		TablePupilABGESCHLOSSEN->AsString = 'N';
	}

	if( TablePupilSCHREIBFAEHIGKEIT->IsNull )
		ComboBoxSCHREIBFAEHIGKEIT->ItemIndex = -1;
	else
		ComboBoxSCHREIBFAEHIGKEIT->ItemIndex = TablePupilSCHREIBFAEHIGKEIT->AsInteger;
}

//---------------------------------------------------------------------------

void __fastcall TSchuelerForm::TablePupilBeforePost(TDataSet *)
{
	MainForm->checkLicence();

	if( !TablePupilID->AsInteger )
		TablePupilID->AsInteger = getNewMaxValue( "KlaroDB", "SCHUELER", "ID" );

	TablePupilAENDERUNGSDATUM->AsDateTime = TDateTime::CurrentDate();
	TablePupilAENDERUNG_VON->AsString = MainForm->getOsUserName();
	TablePupilSCHREIBFAEHIGKEIT->AsInteger = ComboBoxSCHREIBFAEHIGKEIT->ItemIndex;
}

//---------------------------------------------------------------------------

void __fastcall TSchuelerForm::ComboBoxSCHREIBFAEHIGKEITChange(TObject *)
{
	TablePupil->Edit();
	TablePupilSCHREIBFAEHIGKEIT->AsInteger = ComboBoxSCHREIBFAEHIGKEIT->ItemIndex;
}
//---------------------------------------------------------------------------
void __fastcall TSchuelerForm::TablePupilAfterInsert(TDataSet *)
{
	TablePupilID->AsInteger = 0;
	TablePupilABGESCHLOSSEN->AsString = 'N';
}
//---------------------------------------------------------------------------
void __fastcall TSchuelerForm::ButtonFilterClick(TObject *)
{
	if( TablePupil->Filtered )
	{
		TablePupil->Close();
		ButtonFilter->Caption = "Filtern";
		TablePupil->Filtered = false;
		TablePupil->Open();
	}
	else
	{
		TablePupil->Close();
		ButtonFilter->Caption = "Alle anzeigen";
		TablePupil->Filtered = true;
		TablePupil->Open();
	}
}
//---------------------------------------------------------------------------

void __fastcall TSchuelerForm::ButtonSearchClick(TObject *)
{
	SearchForm->Show();
}
//---------------------------------------------------------------------------
bool TSchuelerForm::checkDuplicateValue( const char *fieldName, const char *value )
{
	bool	recFound;

	AnsiString	select = "select count(*) from schueler where id<>:curId and ";
	select += fieldName;
	select += " = '";
	select += value;
	select += "'";

	TQuery *selCount = new TQuery( this );
	selCount->DatabaseName = "KlaroDB";
	selCount->SQL->Add( select  );

	selCount->Params->Items[0]->AsInteger = TablePupilID->AsInteger;

	selCount->Open();
	recFound = selCount->Fields->Fields[0]->AsInteger ? true : false;
	selCount->Close();

	delete selCount;

	if( recFound )
	{
		AnsiString	text = fieldName;
		text += " schon woanders gefunden!";
		Application->MessageBox( text.c_str(), "Warnung", MB_OK|MB_ICONWARNING );
	}
	return recFound;
}
//---------------------------------------------------------------------------
void __fastcall TSchuelerForm::TablePupilAfterPost(TDataSet *)
{
	if( !TablePupilABH_NUMMER->IsNull )
		checkDuplicateValue(
			"TEILNEHMER_NUMMER",
			TablePupilABH_NUMMER->AsString.c_str()
		);
	if( !TablePupilAUSWEIS_NUMMER->IsNull )
		checkDuplicateValue(
			"AUSWEIS_NUMMER",
			TablePupilAUSWEIS_NUMMER->AsString.c_str()
		);
	if( !TablePupilBAMF_NUMMER->IsNull )
		checkDuplicateValue(
			"BAMF_NUMMER",
			TablePupilBAMF_NUMMER->AsString.c_str()
		);
	if( !TablePupilBVA_NUMMER->IsNull )
		checkDuplicateValue(
			"BVA_NUMMER",
			TablePupilBVA_NUMMER->AsString.c_str()
		);
	if( !TablePupilAZ_GRUNDSICHERUNG->IsNull )
		checkDuplicateValue(
			"AZ_GRUNDSICHERUNG",
			TablePupilAZ_GRUNDSICHERUNG->AsString.c_str()
		);
}
//---------------------------------------------------------------------------
void TSchuelerForm::gotoPupil( int id )
{
	Show();
	TablePupil->DisableControls();
	for( TablePupil->First(); !TablePupil->Eof; TablePupil->Next() )
		if( TablePupilID->AsInteger == id )
			break;
	TablePupil->EnableControls();
	BringToFront();
	if( WindowState == wsMinimized )
		WindowState = wsNormal;
	SetFocus();
}
//---------------------------------------------------------------------------

void __fastcall TSchuelerForm::SpeedButtonRefreshClick(TObject *)
{
	refreshDB();
}
//---------------------------------------------------------------------------
void __fastcall TSchuelerForm::xslMenuClick(TObject *Sender)
{
	AnsiString	ReportPath = ReportBasePath;
	ReportPath += "\\schueler_reports";

	((TMenuItem*)Sender)->Checked = true;
	selectedXSL = ((TMenuItem*)Sender)->Caption;
	if( selectedXSL != "<Ohne>" )
		BitBtnXmlExport->Caption = selectedXSL;
	else
		BitBtnXmlExport->Caption = "XML Export";

	xmlDataModule->exportPupilXML(
		TablePupilID->AsInteger,
		ReportPath.c_str(), selectedXSL.c_str()
	);
}
//---------------------------------------------------------------------------


void __fastcall TSchuelerForm::FormShow(TObject *)
{
	TMenuItem	*newMenu;
	TSearchRec	fileData;

	AnsiString	searchPattern = ReportBasePath;
	searchPattern += "\\schueler_reports\\*.xsl";

	if( !FindFirst( searchPattern, 0, fileData ) ) do
	{
		newMenu = new TMenuItem( this );
		newMenu->AutoHotkeys = maManual;
		newMenu->Caption = fileData.Name;
		newMenu->RadioItem = true;
		newMenu->OnClick = xslMenuClick;

		xmlPopupMenu->Items->Add( newMenu );
	} while( !FindNext( fileData ) );

	FindClose( fileData );

	if( !MainForm->isBamfEnabled() )
	{
		LabelISCEDLevel->Visible = false;
		DBComboBoxISCED->Visible = false;

		LabelSchuljahre->Visible = false;
		DBEditSCHULJAHRE->Visible = false;

		LabelSchreibfaehigkeit->Visible = false;
		ComboBoxSCHREIBFAEHIGKEIT->Visible = false;

		LabelAuslaenderstatus->Visible = false;
		DBComboBoxAUSLAENDER_STATUS->Visible = false;

		LabelPersonenkennzifferdesBAMF->Visible = false;
		DBEditBAMF_NUMMER->Visible = false;

		LabelABHKennziffer->Visible = false;
		DBEditABH_NUMMER->Visible = false;

		LabelBVAKennziffer->Visible = false;
		DBEditBVA_NUMMER->Visible = false;

		LabelAZ_GRUNDSICHERUNG->Visible = false;
		DBEditAZ_GRUNDSICHERUNG->Visible = false;

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
	}

	OpenTable( TablePupil );
}
//---------------------------------------------------------------------------


void __fastcall TSchuelerForm::BitBtnXmlExportClick(TObject *)
{
	AnsiString	ReportPath = ReportBasePath;
	ReportPath += "\\schueler_reports";

	MainForm->checkLicence();
	xmlDataModule->exportPupilXML(
		TablePupilID->AsInteger,
		ReportPath.c_str(), selectedXSL.c_str()
	);
}
//---------------------------------------------------------------------------


