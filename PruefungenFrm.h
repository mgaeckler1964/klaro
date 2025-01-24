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

#ifndef PruefungenFrmH
#define PruefungenFrmH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Db.hpp>
#include <DBCtrls.hpp>
#include <DBGrids.hpp>
#include <DBTables.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <Buttons.hpp>
#include <Menus.hpp>
//---------------------------------------------------------------------------
class TPruefungenForm : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TDBNavigator *DBNavigator1;
	TDBGrid *DBGridPruefungen;
	TDataSource *PruefungenDataSource;
	TTable *PruefungenTable;
	TIntegerField *PruefungenTableID;
	TStringField *PruefungenTablePRUEFUNG;
	TDateTimeField *PruefungenTableDATUM;
	TStringField *PruefungenTableDATUM_STRING;
	TStringField *PruefungenTableJAHR;
	TButton *ButtonPruefungsteilnehmer;
	TStringField *PruefungenTablePRUEFUNGS_NUMMER;
	TStringField *PruefungenTableAUFSICHT;
	TBitBtn *BitBtnXmlExport;
	TPopupMenu *xmlPopupMenu;
	TMenuItem *SelectaXSLFile1;
	TMenuItem *Ohne1;
	TStringField *PruefungenTableANSPRECHPARTNER;
	TStringField *PruefungenTableRAUM;
	TSpeedButton *SpeedButtonRefresh;
	TQuery *QueryPruefungen;
	TStringField *QueryPruefungenPRUEFUNG;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall PruefungenTableAfterInsert(TDataSet *DataSet);
	void __fastcall PruefungenTableBeforePost(TDataSet *DataSet);
	void __fastcall DBGridPruefungenDblClick(TObject *Sender);
	void __fastcall BitBtnXmlExportClick(TObject *Sender);
	void __fastcall xslMenuClick(TObject *Sender);
	void __fastcall FormCloseQuery(TObject *Sender, bool &CanClose);
	void __fastcall SpeedButtonRefreshClick(TObject *Sender);
private:	// User declarations
	void setYearField( void );
	AnsiString	selectedXSL;
public:		// User declarations
	__fastcall TPruefungenForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPruefungenForm *PruefungenForm;
//---------------------------------------------------------------------------
#endif
