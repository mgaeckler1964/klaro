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

#include <fstream.h>

#include <vcl.h>

#include <gak/string.h>
#include <gak/vcl_tools.h>
#pragma hdrstop

#include "KurswechslerFrm.h"
#include "DafMain.h"
#include "SchuelerFrm.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TKurswechslerForm *KurswechslerForm;
//---------------------------------------------------------------------------
__fastcall TKurswechslerForm::TKurswechslerForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TKurswechslerForm::FormShow(TObject *)
{
	KurswechslerQuery->Open();
	restoreColumSettings( DBGridKurswechsler, registryKey );
}
//---------------------------------------------------------------------------
void __fastcall TKurswechslerForm::FormHide(TObject *)
{
	saveColumSettings( DBGridKurswechsler, registryKey );
	KurswechslerQuery->Close();
}
//---------------------------------------------------------------------------
void __fastcall TKurswechslerForm::DBGridKurswechslerDblClick(TObject *)
{
	MainForm->checkLicence();
	SchuelerForm->gotoPupil( KurswechslerQuery->FieldByName( "ID" )->AsInteger );
	Close();
}
//---------------------------------------------------------------------------
void __fastcall TKurswechslerForm::ButtonExportClick(TObject *)
{
	STRING	csvDest = Session->PrivateDir.c_str();

	csvDest += "\\Kurswechser.csv";

	ofstream	fStream( csvDest );
	if( fStream.is_open() )
	{
		fStream << "Id,Nachname,Vorname,Kurse\n";
		for( KurswechslerQuery->First(); !KurswechslerQuery->Eof; KurswechslerQuery->Next() )
		{
			fStream
				<< KurswechslerQuery->FieldByName( "ID" )->AsInteger << ",\""
				<< KurswechslerQuery->FieldByName( "NACHNAME" )->AsString.c_str() << "\",\""
				<< KurswechslerQuery->FieldByName( "VORNAME" )->AsString.c_str() << "\","
				<< KurswechslerQuery->FieldByName( "KURSE" )->AsInteger << '\n';
		}
		fStream.close();

		ShellExecute( NULL, "open", csvDest, "", "", SW_SHOW );
	}
}
//---------------------------------------------------------------------------

