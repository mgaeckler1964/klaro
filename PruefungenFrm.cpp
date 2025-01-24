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

#include "PruefungenFrm.h"
#include "PruefungsTeilnehmerFrm.h"
#include "xmlExp.h"
#include "DafMain.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TPruefungenForm *PruefungenForm;
//---------------------------------------------------------------------------
__fastcall TPruefungenForm::TPruefungenForm(TComponent* Owner)
	: TForm(Owner)
{
	selectedXSL = "<Ohne>";
}
//---------------------------------------------------------------------------
void __fastcall TPruefungenForm::FormShow(TObject *)
{
	TMenuItem	*newMenu;
	TSearchRec	fileData;

	AnsiString	searchPattern = ReportBasePath;
	searchPattern += "\\test_reports\\*.xsl";

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
		TStrings *PickList = DBGridPruefungen->Columns->Items[1]->PickList;
		PickList->Clear();
		for(
			QueryPruefungen->Open();
			!QueryPruefungen->Eof;
			QueryPruefungen->Next()
		)
		{
			PickList->Add( QueryPruefungenPRUEFUNG->AsString );
		}
		QueryPruefungen->Close();
	}

	OpenTable( PruefungenTable );
	restoreColumSettings( DBGridPruefungen, registryKey );
}
//----------------------------------------------------------------------------
void TPruefungenForm::setYearField( void )
{
	unsigned short	year, dummy;

	TDateTime	startDate = PruefungenTableDATUM->AsDateTime;

	startDate.DecodeDate( &year, &dummy, &dummy );
	PruefungenTableJAHR->AsString = year;
	PruefungenTableDATUM_STRING->AsString = PruefungenTableDATUM->AsString;
}
//---------------------------------------------------------------------------
void __fastcall TPruefungenForm::PruefungenTableAfterInsert(
	  TDataSet *)
{
	PruefungenTableID->AsInteger = 0;
	PruefungenTableJAHR->AsString = "0";
	PruefungenTableDATUM_STRING->AsString = "0";
}
//---------------------------------------------------------------------------
void __fastcall TPruefungenForm::PruefungenTableBeforePost(
	  TDataSet *)
{
	if( !PruefungenTableID->AsInteger )
		PruefungenTableID->AsInteger = getNewMaxValue( "KlaroDB", "PRUEFUNGEN", "ID" );
	MainForm->checkLicence();
	setYearField();
}
//---------------------------------------------------------------------------

void __fastcall TPruefungenForm::DBGridPruefungenDblClick(TObject *)
{
	PruefungsTeilnehmerForm->showPruefungsTeilnehmer(PruefungenTableID->AsInteger);
}
//---------------------------------------------------------------------------

void __fastcall TPruefungenForm::BitBtnXmlExportClick(TObject *)
{
	AnsiString	ReportPath = ReportBasePath;
	ReportPath += "\\test_reports";

	MainForm->checkLicence();
	xmlDataModule->exportTestXML(
		PruefungenTableID->AsInteger, ReportPath.c_str(), selectedXSL.c_str()
	);
}
//---------------------------------------------------------------------------

void __fastcall TPruefungenForm::xslMenuClick(TObject *Sender)
{
	AnsiString	ReportPath = ReportBasePath;
	ReportPath += "\\test_reports";

	((TMenuItem*)Sender)->Checked = true;
	selectedXSL = ((TMenuItem*)Sender)->Caption;
	if( selectedXSL != "<Ohne>" )
		BitBtnXmlExport->Caption = selectedXSL;
	else
		BitBtnXmlExport->Caption = "XML Export";

	xmlDataModule->exportTestXML(
		PruefungenTableID->AsInteger,
		ReportPath.c_str(), selectedXSL.c_str()
	);
}
//---------------------------------------------------------------------------
void __fastcall TPruefungenForm::FormCloseQuery(TObject *, bool & )
{
	saveColumSettings( DBGridPruefungen, registryKey );
}
//---------------------------------------------------------------------------

void __fastcall TPruefungenForm::SpeedButtonRefreshClick(TObject *)
{
	int	id = PruefungenTableID->AsInteger;

	PruefungenTable->Close();
	MainForm->updateOsbizData();
	PruefungenTable->Open();

	PruefungenTable->DisableControls();
	while( PruefungenTableID->AsInteger != id && !PruefungenTable->Eof )
		PruefungenTable->Next();
	PruefungenTable->EnableControls();
}
//---------------------------------------------------------------------------


