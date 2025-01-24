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

#include "EinladungenFrm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TEinladungenForm *EinladungenForm;
//---------------------------------------------------------------------------
__fastcall TEinladungenForm::TEinladungenForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TEinladungenForm::FormClose(TObject *,
	  TCloseAction &)
{
	QueryInvitations->Close();	
}
//---------------------------------------------------------------------------
void __fastcall TEinladungenForm::FormShow(TObject *)
{
	QueryInvitations->Open();
}
//---------------------------------------------------------------------------
void __fastcall TEinladungenForm::QueryInvitationsCalcFields(
      TDataSet *)
{
	QueryInvitationsSELECTED->AsBoolean = isSelected( QueryInvitationsID->AsInteger );	
}
//---------------------------------------------------------------------------



void __fastcall TEinladungenForm::QueryInvitationsAfterOpen(
	  TDataSet *)
{
	selected.clear();	
}
//---------------------------------------------------------------------------

void __fastcall TEinladungenForm::DBGridInvitationsCellClick(
	  TColumn *Column)
{
	if( Column->Field == QueryInvitationsSELECTED )
	{
		int	id = QueryInvitationsID->AsInteger;

		if( isSelected( id ) )
			unselect( id );
		else
			select( id );

		QueryInvitations->Refresh();
	}
}
//---------------------------------------------------------------------------

void __fastcall TEinladungenForm::BitBtnSelectAllClick(TObject *)
{
	int	id;
	QueryInvitations->DisableControls();
	for(
		QueryInvitations->First();
		!QueryInvitations->Eof;
		QueryInvitations->Next()
	)
	{
		id = QueryInvitationsID->AsInteger;

		if( !isSelected( id ) )
			select( id );
	}
	QueryInvitations->EnableControls();
	QueryInvitations->Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TEinladungenForm::BitBtnNoneClick(TObject *)
{
	int	id;
	QueryInvitations->DisableControls();
	for(
		QueryInvitations->First();
		!QueryInvitations->Eof;
		QueryInvitations->Next()
	)
	{
		id = QueryInvitationsID->AsInteger;

		if( isSelected( id ) )
			unselect( id );
	}
	QueryInvitations->EnableControls();
	QueryInvitations->Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TEinladungenForm::BitBtnSwapClick(TObject *)
{
	int	id;
	QueryInvitations->DisableControls();
	for(
		QueryInvitations->First();
		!QueryInvitations->Eof;
		QueryInvitations->Next()
	)
	{
		id = QueryInvitationsID->AsInteger;

		if( isSelected( id ) )
			unselect( id );
		else
			select( id );
	}
	QueryInvitations->EnableControls();
	QueryInvitations->Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TEinladungenForm::QueryInvitationsSELECTEDGetText(
	  TField *Sender, AnsiString &Text, bool )
{
	if( Sender->AsBoolean )
		Text = "Einladen";
	else
		Text = "";
}
//---------------------------------------------------------------------------

void __fastcall TEinladungenForm::QueryInvitationsFilterRecord(
	  TDataSet *, bool &Accept)
{
	Accept = isSelected( QueryInvitationsID->AsInteger );
}
//---------------------------------------------------------------------------

void __fastcall TEinladungenForm::ButtonExportClick(TObject *Sender)
{
	STRING	exportName = Session->PrivateDir.c_str();

	exportName += DIRECTORY_DELIMITER_STRING "einladung.csv";

	QueryInvitations->DisableControls();
	QueryInvitations->Filtered = true;

	exportTable2CSV( QueryInvitations, exportName );

	QueryInvitations->Filtered = false;
	QueryInvitations->EnableControls();

	ShellExecute(
		Handle,
		"open",
		exportName,
		"", ".",
		SW_SHOW
	);
}
//---------------------------------------------------------------------------

