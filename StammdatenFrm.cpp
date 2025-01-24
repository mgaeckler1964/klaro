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
#pragma hdrstop

#include "config.h"

#include "StammdatenFrm.h"
#include "DafMain.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TStammdatenForm *StammdatenForm;
//---------------------------------------------------------------------------
__fastcall TStammdatenForm::TStammdatenForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TStammdatenForm::ButtonCancelClick(TObject *)
{
	Close();
}
//---------------------------------------------------------------------------
void __fastcall TStammdatenForm::FormShow(TObject *)
{
	EditTraegerName->Text = (const char*)ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_name", "" );
	EditTraegerStrasse->Text = (const char*)ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_strasse", "" );
	EditTraegerPlz->Text = (const char*)ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_plz", "" );
	EditTraegerOrt->Text = (const char*)ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_ort", "" );
	EditTraegerTelefon->Text = (const char*)ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_telefon", "" );
	EditTraegerBundesland->Text = (const char*)ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_bundesland", "" );
	EditTraegerBamfNr->Text = (const char*)ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_bamf_nr", "" );
	EditBAMFregionalstelle->Text = (const char*)ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_bamf_regionalstelle", "" );
	EditTraegerKonto->Text = (const char*)ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_konto", "" );
	EditTraegerBlz->Text = (const char*)ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_blz", "" );
	EditTraegerBank->Text = (const char*)ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_bank", "" );
}
//---------------------------------------------------------------------------
void __fastcall TStammdatenForm::ButtonSaveClick(TObject *)
{
	ConfigDataModule->SetValue( MainForm->theDatabase, "traeger_name", EditTraegerName->Text.c_str() );
	ConfigDataModule->SetValue( MainForm->theDatabase, "traeger_strasse", EditTraegerStrasse->Text.c_str() );
	ConfigDataModule->SetValue( MainForm->theDatabase, "traeger_plz", EditTraegerPlz->Text.c_str() );
	ConfigDataModule->SetValue( MainForm->theDatabase, "traeger_ort", EditTraegerOrt->Text.c_str() );
	ConfigDataModule->SetValue( MainForm->theDatabase, "traeger_telefon", EditTraegerTelefon->Text.c_str() );
	ConfigDataModule->SetValue( MainForm->theDatabase, "traeger_bundesland", EditTraegerBundesland->Text.c_str() );
	ConfigDataModule->SetValue( MainForm->theDatabase, "traeger_bamf_nr", EditTraegerBamfNr->Text.c_str() );
	ConfigDataModule->SetValue( MainForm->theDatabase, "traeger_bamf_regionalstelle", EditBAMFregionalstelle->Text.c_str() );
	ConfigDataModule->SetValue( MainForm->theDatabase, "traeger_konto", EditTraegerKonto->Text.c_str() );
	ConfigDataModule->SetValue( MainForm->theDatabase, "traeger_blz", EditTraegerBlz->Text.c_str() );
	ConfigDataModule->SetValue( MainForm->theDatabase, "traeger_bank", EditTraegerBank->Text.c_str() );

	Close();
}
//---------------------------------------------------------------------------
