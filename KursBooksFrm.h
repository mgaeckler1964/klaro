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

#ifndef KursBooksFrmH
#define KursBooksFrmH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Db.hpp>
#include <DBGrids.hpp>
#include <DBTables.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <DBCtrls.hpp>
#include <Buttons.hpp>
//---------------------------------------------------------------------------
class TKursbooksForm : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TQuery *kursbuecherQuery;
	TQuery *buecherQuery;
	TDBGrid *DBGridBooks;
	TDataSource *kursbuecherDataSource;
	TDBNavigator *DBNavigator1;
	TUpdateSQL *UpdateSQL;
	TSpeedButton *SpeedButtonRefresh;
	TIntegerField *kursbuecherQueryKURS_ID;
	TIntegerField *kursbuecherQueryBUCH_ID;
	TStringField *kursbuecherQueryTITEL;
	TStringField *kursbuecherQueryKURS_TITEL;
	void __fastcall kursbuecherQueryAfterInsert(TDataSet *DataSet);
	void __fastcall kursbuecherQueryAfterDelete(TDataSet *DataSet);
	void __fastcall kursbuecherQueryAfterPost(TDataSet *DataSet);
	void __fastcall kursbuecherQueryBeforeClose(TDataSet *DataSet);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall SpeedButtonRefreshClick(TObject *Sender);
private:	// User declarations
	int	kurs_id;
	void refreshDB( void );
public:		// User declarations
	__fastcall TKursbooksForm(TComponent* Owner);

	void showKursBooks( int kurs_id, const char *kursNummer );
};
//---------------------------------------------------------------------------
extern PACKAGE TKursbooksForm *KursbooksForm;
//---------------------------------------------------------------------------
#endif
