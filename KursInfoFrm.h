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
#ifndef KursInfoFrmH
#define KursInfoFrmH
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
#include <Menus.hpp>
//---------------------------------------------------------------------------
class TKursInfoForm : public TForm
{
__published:	// IDE-managed Components
	TDataSource *teacherSource;
	TQuery *teacherQuery;
	TDBGrid *DBGrid1;
	TStringField *teacherQueryNACHNAME;
	TStringField *teacherQueryVORNAME;
	TDateTimeField *teacherQueryANFANG;
	TDateTimeField *teacherQueryENDE;
	TQuery *pupilQuery;
	TDataSource *pupilSource;
	TDBGrid *pupilGrid;
	TStringField *pupilQueryNACHNAME;
	TStringField *pupilQueryVORNAME;
	TDateTimeField *pupilQueryANFANG;
	TDateTimeField *pupilQueryENDE;
	TSplitter *Splitter1;
	TPanel *Panel1;
	TStringField *teacherQueryTEAM_TEACHER;
	TStringField *teacherQuerySOZ_PAED;
	TFloatField *pupilQueryBETRAG;
	TFloatField *pupilQueryREST;
	TBitBtn *BitBtnXmlExport;
	TPopupMenu *xmlPopupMenu;
	TMenuItem *SelectaXSLFile1;
	TMenuItem *Ohne1;
	TBitBtn *BitBtnOnlineExport;
	TBitBtn *BitBtnCSVexport;
	TIntegerField *pupilQueryID;
	void __fastcall pupilGridDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
	void __fastcall pupilQueryCalcFields(TDataSet *DataSet);
	void __fastcall BitBtnXmlExportClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall xslMenuClick(TObject *Sender);
	void __fastcall BitBtnCSVexportClick(TObject *Sender);
	void __fastcall pupilGridDblClick(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);
private:	// User declarations
	int			kurs_id;
	const char *reportTitle;
	double		gebuehr;
	AnsiString	selectedXSL;
	TColor		creditColor, debitColor;

public:		// User declarations
	__fastcall TKursInfoForm(TComponent* Owner);
	void showKursInfo( int kurs_id, const char *reportTitle, double gebuehr );
};
//---------------------------------------------------------------------------
extern PACKAGE TKursInfoForm *KursInfoForm;
//---------------------------------------------------------------------------
#endif
