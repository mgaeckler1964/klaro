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
#include <vcl/registry.hpp>

#include <gak/vcl_tools.h>
#pragma hdrstop

#include "DafMain.h"
#include "SchuelerFrm.h"
#include "KursInfoFrm.h"
#include "xmlExp.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TKursInfoForm *KursInfoForm;
//---------------------------------------------------------------------------
__fastcall TKursInfoForm::TKursInfoForm(TComponent* Owner)
	: TForm(Owner)
{

}
//---------------------------------------------------------------------------
void TKursInfoForm::showKursInfo( int kurs_id, const char *kursNummer, double gebuehr )
{
	char	caption[256];

	this->kurs_id = kurs_id;
	this->reportTitle = kursNummer;

	strcpy( caption, "Kursinfo " );
	strcat( caption, kursNummer );
	this->Caption = caption;

	this->gebuehr = gebuehr;

	teacherQuery->ParamByName( "theCourse" )->AsInteger = kurs_id;
	pupilQuery->ParamByName( "theCourse" )->AsInteger = kurs_id;

	teacherQuery->Open();
	try
	{
		pupilQuery->Open();
	}
	catch( ... )
	{
		// Interbase requires a little change of the SQL Command 8-(
		pupilQuery->SQL->Clear();
		pupilQuery->SQL->Add(
			"SELECT  schueler.ID, "
					"schueler.NACHNAME, schueler.VORNAME, "
					"Kursschueler.ANFANG, Kursschueler.ENDE, sum(bezahlung.betrag) as BETRAG "
			"FROM	Kursschueler, schueler, bezahlung "
			"WHERE	Kursschueler.KURS_ID = :theCourse and "
					"Kursschueler.schueler_ID = schueler.ID and "
					"kursschueler.id = bezahlung.kurs_schueler_id and "
					"bezahlung.beschreibung = 'Kursgebühr' "
			"group by schueler.ID, "
					"schueler.NACHNAME, schueler.VORNAME, "
					"Kursschueler.ANFANG, Kursschueler.ENDE "
			"union "
			"SELECT  schueler.ID, "
					"schueler.NACHNAME, schueler.VORNAME, "
					"Kursschueler.ANFANG, Kursschueler.ENDE, 0.0 as BETRAG "
			"FROM	Kursschueler, schueler "
			"WHERE	Kursschueler.KURS_ID = :theCourse and "
					"Kursschueler.schueler_ID = schueler.ID and "
					"not exists ( select * from bezahlung where kursschueler.id = bezahlung.kurs_schueler_id and "
					"bezahlung.beschreibung = 'Kursgebühr' ) "
			"order by 2,3,4,5 "
		);
		pupilQuery->ParamByName( "theCourse" )->AsInteger = kurs_id;
		pupilQuery->Open();
	}

	restoreColumSettings( pupilGrid, registryKey );
	ShowModal();
	saveColumSettings( pupilGrid, registryKey );

	teacherQuery->Close();
	pupilQuery->Close();
}
//---------------------------------------------------------------------------
void __fastcall TKursInfoForm::pupilGridDrawColumnCell(TObject *,
	  const TRect &Rect, int DataCol, TColumn *Column,
	  TGridDrawState State)
{
	TGridDrawState	empty;

	if( State == empty )
	{
		if( pupilQueryBETRAG->AsFloat <= gebuehr-0.01 )
			pupilGrid->Canvas->Brush->Color = creditColor;
		else if( pupilQueryBETRAG->AsFloat >= gebuehr+0.01 )
			pupilGrid->Canvas->Brush->Color = debitColor;
	}
	pupilGrid->DefaultDrawColumnCell( Rect, DataCol, Column, State);
}
//---------------------------------------------------------------------------

void __fastcall TKursInfoForm::pupilQueryCalcFields(TDataSet *)
{
	pupilQueryREST->AsFloat = gebuehr - pupilQueryBETRAG->AsFloat;
}
//---------------------------------------------------------------------------
void __fastcall TKursInfoForm::BitBtnXmlExportClick(TObject *)
{
	AnsiString	ReportPath = ReportBasePath;
	ReportPath += "\\kurs_reports";

	MainForm->checkLicence();
	xmlDataModule->exportCourseXML(kurs_id, ReportPath.c_str(), selectedXSL.c_str());
}
//---------------------------------------------------------------------------

void __fastcall TKursInfoForm::FormCreate(TObject *)
{
	TMenuItem	*newMenu;
	TSearchRec	fileData;

	AnsiString	searchPattern = ReportBasePath;
	searchPattern += "\\kurs_reports\\*.xsl";

	selectedXSL = "<Ohne>";

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
}
//---------------------------------------------------------------------------
void __fastcall TKursInfoForm::xslMenuClick(TObject *Sender)
{
	AnsiString	ReportPath = ReportBasePath;
	ReportPath += "\\kurs_reports";

	((TMenuItem*)Sender)->Checked = true;
	selectedXSL = ((TMenuItem*)Sender)->Caption;
	if( selectedXSL != "<Ohne>" )
		BitBtnXmlExport->Caption = selectedXSL;
	else
		BitBtnXmlExport->Caption = "XML Export";
	xmlDataModule->exportCourseXML(kurs_id, ReportPath.c_str(), selectedXSL.c_str());
}
//---------------------------------------------------------------------------
void __fastcall TKursInfoForm::BitBtnCSVexportClick(TObject *)
{
	MainForm->checkLicence();
	xmlDataModule->exportCourseCSV( kurs_id );
}
//---------------------------------------------------------------------------
void __fastcall TKursInfoForm::pupilGridDblClick(TObject *)
{
	MainForm->checkLicence();
	SchuelerForm->gotoPupil( pupilQuery->FieldByName( "ID" )->AsInteger );
	Close();
}
//---------------------------------------------------------------------------

void __fastcall TKursInfoForm::FormShow(TObject *)
{
	TRegistry	*reg = new TRegistry;

	if( reg->OpenKey( registryKey, false ) )
	{
		if( reg->ValueExists( "CourseInfoColor1" ) )
			creditColor = (TColor)reg->ReadInteger( "CourseInfoColor1" );
		else
			creditColor = clRed;

		if( reg->ValueExists( "CourseInfoColor2" ) )
			debitColor = (TColor)reg->ReadInteger( "CourseInfoColor2" );
		else
			debitColor = clYellow;

		reg->CloseKey();
	}

	delete reg;

	if( !MainForm->isBamfEnabled() )
	{
		teacherQueryTEAM_TEACHER->Visible = false;
		teacherQuerySOZ_PAED->Visible = false;
	}
}
//---------------------------------------------------------------------------

