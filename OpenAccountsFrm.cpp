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

#include "OpenAccountsFrm.h"
#include "DafMain.h"
#include "SchuelerFrm.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TOpenAccountsForm *OpenAccountsForm;
//---------------------------------------------------------------------------
__fastcall TOpenAccountsForm::TOpenAccountsForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TOpenAccountsForm::FormShow(TObject *)
{
	DateTimePickerStart->Date = MainForm->getRegistryStartDate();
	DateTimePickerEnd->Date = MainForm->getRegistryEndDate();
	restoreColumSettings( DBGridOpenAccounts, registryKey );
}
//---------------------------------------------------------------------------
void __fastcall TOpenAccountsForm::FormHide(TObject *)
{
	saveColumSettings( DBGridOpenAccounts, registryKey );
	QueryOpenAccount->Close();
	MainForm->setRegistryStartDate( DateTimePickerStart->Date );
	MainForm->setRegistryEndDate( DateTimePickerEnd->Date );
}
//---------------------------------------------------------------------------
void __fastcall TOpenAccountsForm::QueryOpenAccountCalcFields(TDataSet *)
{
	AnsiString	result;

	result = QueryOpenAccountNUMMER->AsString;
	result += '-';
	result += QueryOpenAccountHALBJAHR->AsString;
	result += '-';
	result += QueryOpenAccountJAHR->AsString;

	QueryOpenAccountKURS->AsString = result;
	QueryOpenAccountREST->AsFloat = QueryOpenAccountKURSGEBUEHR->AsFloat - QueryOpenAccountBEZAHLT->AsFloat;
}
//---------------------------------------------------------------------------
void __fastcall TOpenAccountsForm::DBGridOpenAccountsDblClick(TObject *)
{
	MainForm->checkLicence();
	SchuelerForm->gotoPupil( QueryOpenAccount->FieldByName( "ID" )->AsInteger );
	Close();
}
//---------------------------------------------------------------------------
void __fastcall TOpenAccountsForm::QueryOpenAccountFilterRecord(
	  TDataSet *, bool &Accept)
{
	if( QueryOpenAccountKURSGEBUEHR->AsFloat == QueryOpenAccountBEZAHLT->AsFloat )
		Accept = false;
}
//---------------------------------------------------------------------------
void __fastcall TOpenAccountsForm::ButtonStartClick(TObject *)
{
	MainForm->checkLicence();

	if( !QueryOpenAccount->Active
	|| startDate != DateTimePickerStart->Date
	|| endDate != DateTimePickerEnd->Date )
	{

		QueryOpenAccount->Close();
		startDate = DateTimePickerStart->Date;
		endDate = DateTimePickerEnd->Date;

		int	i=0;
		QueryOpenAccount->Params->Items[i++]->AsDateTime = startDate;
		QueryOpenAccount->Params->Items[i++]->AsDateTime = endDate;
		QueryOpenAccount->Params->Items[i++]->AsDateTime = startDate;
		QueryOpenAccount->Params->Items[i++]->AsDateTime = endDate;

		try
		{
			QueryOpenAccount->Open();
		}
		catch( ... )
		{
			// Interbase requires a little change of the SQL Command 8-(
			QueryOpenAccount->SQL->Clear();
			QueryOpenAccount->SQL->Add(
				"SELECT  schueler.ID, "
						"schueler.NACHNAME, schueler.VORNAME, "
						"kurse.NUMMER, kurse.HALBJAHR, kurse.JAHR, "
						"kurse.KURSGEBUEHR, "
						"sum(bezahlung.betrag) as BEZAHLT "
				"FROM	Kursschueler, schueler, bezahlung, kurse "
				"WHERE	Kursschueler.schueler_ID = schueler.ID "
				"and	kursschueler.id = bezahlung.kurs_schueler_id "
				"and	bezahlung.beschreibung = 'Kursgebühr' "
				"and	Kursschueler.kurs_id = kurse.id "
				"and	kurse.anfangs_datum >= :startDate1 "
				"and	kurse.anfangs_datum <= :endDate1 "
				"group by schueler.ID, "
						"schueler.NACHNAME, schueler.VORNAME, "
						"kurse.NUMMER, kurse.HALBJAHR, kurse.JAHR, "
						"kurse.KURSGEBUEHR "
				"having  kurse.KURSGEBUEHR <> sum(bezahlung.betrag) "
				"union "
				"SELECT  schueler.ID, "
						"schueler.NACHNAME, schueler.VORNAME, "
						"kurse.NUMMER, kurse.HALBJAHR, kurse.JAHR, "
						"kurse.KURSGEBUEHR, "
						"0.0 as BEZAHLT "
				"FROM	Kursschueler, schueler, kurse "
				"WHERE	Kursschueler.schueler_ID = schueler.ID "
				"and	Kursschueler.kurs_id = kurse.id "
				"and	kurse.kursgebuehr <> 0 "
				"and	kurse.anfangs_datum >= :startDate2 "
				"and	kurse.anfangs_datum <= :endDate2 "
				"and	not exists ( "
							"select	* "
							"from	bezahlung "
							"where	kursschueler.id = bezahlung.kurs_schueler_id "
							"and		bezahlung.beschreibung = 'Kursgebühr' "
						") "
				"order by 2, 3, 6, 5, 4 "
			);
			int	i=0;
			QueryOpenAccount->Params->Items[i++]->AsDateTime = startDate;
			QueryOpenAccount->Params->Items[i++]->AsDateTime = endDate;
			QueryOpenAccount->Params->Items[i++]->AsDateTime = startDate;
			QueryOpenAccount->Params->Items[i++]->AsDateTime = endDate;
			QueryOpenAccount->Open();
		}
	}
}
//---------------------------------------------------------------------------

