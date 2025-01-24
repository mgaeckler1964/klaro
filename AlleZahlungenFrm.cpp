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

#include "AlleZahlungenFrm.h"
#include "DafMain.h"
#include "SchuelerFrm.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TAlleZahlungenForm *AlleZahlungenForm;
//---------------------------------------------------------------------------
__fastcall TAlleZahlungenForm::TAlleZahlungenForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAlleZahlungenForm::ButtonStartClick(TObject *)
{
	MainForm->checkLicence();

	if( !QueryZahlungen->Active
	|| startDate != DateTimePickerStart->Date
	|| endDate != DateTimePickerEnd->Date )
	{
		QueryZahlungen->Close();
		startDate = DateTimePickerStart->Date;
		endDate = DateTimePickerEnd->Date;

		QueryZahlungen->Params->Items[0]->AsDateTime = startDate;
		QueryZahlungen->Params->Items[1]->AsDateTime = endDate;

		QueryZahlungen->Open();
	}
}
//---------------------------------------------------------------------------
void __fastcall TAlleZahlungenForm::FormHide(TObject *)
{
	saveColumSettings( DBGridZahlungen, registryKey );
	QueryZahlungen->Close();
	MainForm->setRegistryStartDate( DateTimePickerStart->Date );
	MainForm->setRegistryEndDate( DateTimePickerEnd->Date );
}
//---------------------------------------------------------------------------
void __fastcall TAlleZahlungenForm::ButtonExportClick(TObject *Sender)
{
	ButtonStartClick( Sender );

	STRING	csvDest = Session->PrivateDir.c_str();

	csvDest += "\\Zahlungen.csv";

	ofstream	fStream( csvDest );
	if( fStream.is_open() )
	{
		fStream << "Datum,Nachname,Vorname,Kursnummer,Verwendungszweck,Zahlungsart,Betrag\n";
		for( QueryZahlungen->First(); !QueryZahlungen->Eof; QueryZahlungen->Next() )
		{
			fStream
				<< QueryZahlungenDATUM->AsString.c_str() << ",\""
				<< QueryZahlungenNACHNAME->AsString.c_str() << "\",\""
				<< QueryZahlungenVORNAME->AsString.c_str() << "\",\""
				<< QueryZahlungenKURS->AsString.c_str() << "\",\""
				<< QueryZahlungenBESCHREIBUNG->AsString.c_str() << "\","
				<< QueryZahlungenZAHLUNGSART->AsString.c_str() << ','
				<< QueryZahlungenBETRAG->AsFloat << '\n';
		}
		fStream.close();

		ShellExecute( NULL, "open", csvDest, "", "", SW_SHOW );
	}
}
//---------------------------------------------------------------------------
void __fastcall TAlleZahlungenForm::FormShow(TObject *)
{
	DateTimePickerStart->Date = MainForm->getRegistryStartDate();
	DateTimePickerEnd->Date = MainForm->getRegistryEndDate();
	restoreColumSettings( DBGridZahlungen, registryKey );
}
//---------------------------------------------------------------------------

void __fastcall TAlleZahlungenForm::DBGridZahlungenDblClick(TObject *)
{
	MainForm->checkLicence();
	SchuelerForm->gotoPupil( QueryZahlungenID->AsInteger );
	Close();
}
//---------------------------------------------------------------------------

