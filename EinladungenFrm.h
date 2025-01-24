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

#ifndef EinladungenFrmH
#define EinladungenFrmH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Db.hpp>
#include <DBGrids.hpp>
#include <DBTables.hpp>
#include <Grids.hpp>
#include <ExtCtrls.hpp>
#include <Buttons.hpp>

#include <gak/array.h>

//---------------------------------------------------------------------------
class TEinladungenForm : public TForm
{
__published:	// IDE-managed Components
	TDBGrid *DBGridInvitations;
	TDataSource *DataSourceInvitations;
	TQuery *QueryInvitations;
	TIntegerField *QueryInvitationsID;
	TStringField *QueryInvitationsANREDE;
	TStringField *QueryInvitationsNACHNAME;
	TStringField *QueryInvitationsVORNAME;
	TStringField *QueryInvitationsWOHNUNG;
	TStringField *QueryInvitationsSTRASSE;
	TStringField *QueryInvitationsLAND;
	TStringField *QueryInvitationsPLZ;
	TStringField *QueryInvitationsORT;
	TStringField *QueryInvitationsE_MAIL;
	TPanel *Panel1;
	TBooleanField *QueryInvitationsSELECTED;
	TBitBtn *BitBtnSelectAll;
	TBitBtn *BitBtnSwap;
	TBitBtn *BitBtnNone;
	TButton *ButtonExport;
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
	void __fastcall FormShow(TObject *Sender);
	void __fastcall QueryInvitationsCalcFields(TDataSet *DataSet);
	void __fastcall QueryInvitationsAfterOpen(TDataSet *DataSet);
	void __fastcall DBGridInvitationsCellClick(TColumn *Column);
	void __fastcall BitBtnSelectAllClick(TObject *Sender);
	void __fastcall BitBtnNoneClick(TObject *Sender);
	void __fastcall BitBtnSwapClick(TObject *Sender);
	void __fastcall QueryInvitationsSELECTEDGetText(TField *Sender,
          AnsiString &Text, bool DisplayText);
	void __fastcall QueryInvitationsFilterRecord(TDataSet *DataSet,
          bool &Accept);
	void __fastcall ButtonExportClick(TObject *Sender);
private:	// User declarations
	ARRAY_OF_INTS	selected;
	bool isSelected( int id )
	{
		size_t	pos = selected.findElement( id );

		return pos != (size_t)-1;
	}
	void select( int id )
	{
		selected.addElement( id );
	}
	void unselect( int id )
	{
		selected.removeElementVal( id );
	}
public:		// User declarations
	__fastcall TEinladungenForm(TComponent* Owner);

	void ShowForm( const AnsiString &kArt, const AnsiString &kTyp, const AnsiString &kAbschnit )
	{
		QueryInvitations->Params->Items[0]->AsString = kArt;
		QueryInvitations->Params->Items[1]->AsString = kTyp;
		QueryInvitations->Params->Items[2]->AsString = kAbschnit;

		ShowModal();
	}
};
//---------------------------------------------------------------------------
extern PACKAGE TEinladungenForm *EinladungenForm;
//---------------------------------------------------------------------------
#endif
