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
#include <dbtables.hpp>
#include <vcl/registry.hpp>

#include <gak/vcl_tools.h>

#pragma hdrstop

#include "DafMain.h"
#include "csvExImportFrm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TcsvExImportForm *csvExImportForm;
//---------------------------------------------------------------------------
__fastcall TcsvExImportForm::TcsvExImportForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TcsvExImportForm::ButtonBrowseClick(TObject *)
{
	if( OpenDialog->Execute() )
	{
		EditFile->Text = OpenDialog->FileName;
		if( ComboBoxTable->ItemIndex >= 0 && EditFile->Text > "" )
			ButtonOK->Enabled = true;
		else
			ButtonOK->Enabled = false;
	}
}
//---------------------------------------------------------------------------
void __fastcall TcsvExImportForm::ExImportChange(TObject *)
{
	if( ComboBoxTable->ItemIndex >= 0 && EditFile->Text > "" )
		ButtonOK->Enabled = true;
	else
		ButtonOK->Enabled = false;
}

//---------------------------------------------------------------------------
void __fastcall TcsvExImportForm::ButtonOKClick(TObject *)
{
	const char *tables[] = {
		"LEHRER",
		"SCHUELER",
		"KURSE",
		"LEHRBUECHER",
		"FERIEN",
		"PRUEFUNGEN"
	};
	TTable	*theTable = new TTable( this );
	theTable->DatabaseName = "KlaroDB";
	theTable->TableName = tables[ComboBoxTable->ItemIndex];

	theTable->Open();
	if( RadioButtonExport->Checked )
	{
		exportTable2CSV( theTable, EditFile->Text.c_str() );
		ShellExecute( NULL, "open", EditFile->Text.c_str(), "", "", SW_SHOW );
	}
	else
	{
		int numRecords = importTableFromCSV( EditFile->Text.c_str(), theTable, "ID", tables[ComboBoxTable->ItemIndex] );
		char	buffer[1024];
		sprintf(
			buffer,
			"%d %s importiert",
			numRecords,
			numRecords == 1 ? "Datensatz" : "Datensätze"
		);
		Application->MessageBox( buffer, "Klaro Import", MB_ICONINFORMATION );
	}
	theTable->Close();

	delete theTable;

	TRegistry	*reg = new TRegistry;

	if( reg->OpenKey( registryKey, true ) )
	{
		reg->WriteString( "ImExportFile", EditFile->Text );
		reg->WriteInteger( "ImExportTable", ComboBoxTable->ItemIndex );
		reg->WriteBool( "ExportFlag", RadioButtonExport->Checked );
	}

	reg->CloseKey();

	delete reg;

	Close();
}
//---------------------------------------------------------------------------
void __fastcall TcsvExImportForm::FormShow(TObject *Sender)
{
	TRegistry	*reg = new TRegistry;

	if( reg->OpenKey( registryKey, false ) )
	{
		if( reg->ValueExists( "ImExportFile" ) )
			EditFile->Text = reg->ReadString( "ImExportFile" );
		if( reg->ValueExists( "ImExportTable" ) )
			ComboBoxTable->ItemIndex = reg->ReadInteger( "ImExportTable" );
		if( reg->ValueExists( "ExportFlag" ) )
		{
			bool exportFlag = reg->ReadBool( "ExportFlag" );
			if( exportFlag )
			{
				RadioButtonExport->Checked = true;
				RadioButtonImport->Checked = false;
			}
			else
			{
				RadioButtonExport->Checked = false;
				RadioButtonImport->Checked = true;
			}
		}

		ExImportChange( Sender );
	}

	reg->CloseKey();

	delete reg;
}
//---------------------------------------------------------------------------

