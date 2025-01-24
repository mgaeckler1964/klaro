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

#include "SearchFrm.h"
#include "SchuelerFrm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TSearchForm *SearchForm;
//---------------------------------------------------------------------------
__fastcall TSearchForm::TSearchForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSearchForm::ButtonCancelClick(TObject *)
{
	Close();
}
//---------------------------------------------------------------------------
void __fastcall TSearchForm::ButtonSearchClick(TObject *Sender)
{
	SchuelerForm->Show();
	SchuelerForm->BringToFront();

	SchuelerForm->TablePupil->DisableControls();

	if( Sender == ButtonSearch )
		SchuelerForm->TablePupil->First();
	else if( Sender == ButtonSearchNext )
		SchuelerForm->TablePupil->Next();

	while( !SchuelerForm->TablePupil->Eof )
	{
		if( !strncmpi(
			EditSearch->Text.c_str(),
			SchuelerForm->TablePupilNACHNAME->AsString.c_str(),
			EditSearch->Text.Length() )
		)
		{
			SchuelerForm->PageControl->ActivePage = SchuelerForm->TabSheetAnschrift;
			SchuelerForm->DBEditNACHNAME->SetFocus();
			break;
		}

		if( !strncmpi(
			EditSearch->Text.c_str(),
			SchuelerForm->TablePupilVORNAME->AsString.c_str(),
			EditSearch->Text.Length() )
		)
		{
			SchuelerForm->PageControl->ActivePage = SchuelerForm->TabSheetAnschrift;
			SchuelerForm->DBEditVORNAME->SetFocus();
			break;
		}

		if( !strncmpi(
			EditSearch->Text.c_str(),
			SchuelerForm->TablePupilAUSWEIS_NUMMER->AsString.c_str(),
			EditSearch->Text.Length() )
		)
		{
			SchuelerForm->PageControl->ActivePage = SchuelerForm->TabSheetNummern;
			SchuelerForm->DBEditAUSWEIS_NUMMER->SetFocus();
			break;
		}

		if( !strncmpi(
			EditSearch->Text.c_str(),
			SchuelerForm->TablePupilBAMF_NUMMER->AsString.c_str(),
			EditSearch->Text.Length() )
		)
		{
			SchuelerForm->PageControl->ActivePage = SchuelerForm->TabSheetNummern;
			SchuelerForm->DBEditBAMF_NUMMER->SetFocus();
			break;
		}

		if( !strncmpi(
			EditSearch->Text.c_str(),
			SchuelerForm->TablePupilABH_NUMMER->AsString.c_str(),
			EditSearch->Text.Length() )
		)
		{
			SchuelerForm->PageControl->ActivePage = SchuelerForm->TabSheetNummern;
			SchuelerForm->DBEditABH_NUMMER->SetFocus();
			break;
		}

		if( !strncmpi(
			EditSearch->Text.c_str(),
			SchuelerForm->TablePupilBVA_NUMMER->AsString.c_str(),
			EditSearch->Text.Length() )
		)
		{
			SchuelerForm->PageControl->ActivePage = SchuelerForm->TabSheetNummern;
			SchuelerForm->DBEditBVA_NUMMER->SetFocus();
			break;
		}

		if( !strncmpi(
			EditSearch->Text.c_str(),
			SchuelerForm->TablePupilAZ_GRUNDSICHERUNG->AsString.c_str(),
			EditSearch->Text.Length() )
		)
		{
			SchuelerForm->PageControl->ActivePage = SchuelerForm->TabSheetNummern;
			SchuelerForm->DBEditAZ_GRUNDSICHERUNG->SetFocus();
			break;
		}

		if( !strncmpi(
			EditSearch->Text.c_str(),
			SchuelerForm->TablePupilTEILNEHMER_NUMMER->AsString.c_str(),
			EditSearch->Text.Length() )
		)
		{
			SchuelerForm->PageControl->ActivePage = SchuelerForm->TabSheetNummern;
			SchuelerForm->DBEditTEILNEHMER_NUMMER->SetFocus();
			break;
		}

		SchuelerForm->TablePupil->Next();
	}

	SchuelerForm->TablePupil->EnableControls();
}
//---------------------------------------------------------------------------
