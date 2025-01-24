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

#include "ZahlungFrm.h"
#include "QuittungRp.h"
#include "DafMain.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TZahlungForm *ZahlungForm;
//---------------------------------------------------------------------------
__fastcall TZahlungForm::TZahlungForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void TZahlungForm::showPayment( int theId )
{
	this->theId = theId;

	pupilCourseQuery->ParamByName( "theId" )->AsInteger = theId;
	pupilCourseQuery->Open();

	PaymentQuery->ParamByName( "theId" )->AsInteger = theId;
	PaymentQuery->Open();

	restoreColumSettings( DBGridZahlungen, registryKey );
	ShowModal();
	saveColumSettings( DBGridZahlungen, registryKey );

	PaymentQuery->Close();
	pupilCourseQuery->Close();
}

void __fastcall TZahlungForm::PaymentQueryBeforePost(TDataSet *)
{
	if( !PaymentQueryID->AsInteger )
		PaymentQueryID->AsInteger = getNewMaxValue( "KlaroDB", "BEZAHLUNG", "ID" );
}
//---------------------------------------------------------------------------

void __fastcall TZahlungForm::Button1Click(TObject *)
{
	if( PaymentQueryID->AsInteger > 0 )
		QuittungReport->ShowReport(PaymentQueryID->AsInteger);
	else
		Application->MessageBox(
			"Bitte zuerst speichern!", "Fehler", MB_ICONEXCLAMATION
		);
}
//---------------------------------------------------------------------------

void __fastcall TZahlungForm::PaymentQueryAfterInsert(TDataSet *)
{
	PaymentQueryID->AsInteger = 0;
	PaymentQueryKURS_SCHUELER_ID->AsInteger = theId;
	PaymentQueryDATUM->AsDateTime = TDateTime::CurrentDate();
	PaymentQueryBESCHREIBUNG->AsString = "Kursgebühr";
}
//---------------------------------------------------------------------------

void __fastcall TZahlungForm::FormCloseQuery(TObject *, bool &CanClose)
{
	int	button;

	if( PaymentQuery->State == dsInsert || PaymentQuery->State == dsEdit )
	{
		button = Application->MessageBox(
			"Änderungen sind nicht gespeichert! Jetzt speichern?",
			"Speichern?",
			MB_YESNOCANCEL|MB_ICONQUESTION	);
		if( button == IDYES )
		{
			PaymentQuery->Post();
			CanClose = true;
		}
		else if( button == IDNO )
		{
			PaymentQuery->Cancel();
			CanClose = true;
		}
		else if( button == IDCANCEL )
		{
			CanClose = false;
		}
	}
	else
		CanClose = true;
}
//---------------------------------------------------------------------------

void __fastcall TZahlungForm::PaymentQueryAfterPost(TDataSet *)
{
	PaymentQuery->Close();
	PaymentQuery->Open();
}
//---------------------------------------------------------------------------

void __fastcall TZahlungForm::SpeedButton1Click(TObject *)
{
	PaymentQuery->Close();
	PaymentQuery->Open();
}
//---------------------------------------------------------------------------

