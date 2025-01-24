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
#ifndef SchuelerKursFrmH
#define SchuelerKursFrmH
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
#include <ComCtrls.hpp>
#include <Buttons.hpp>
//---------------------------------------------------------------------------
class TSchuelerKursForm : public TForm
{
__published:	// IDE-managed Components
	TQuery *pupilQuery;
	TDataSource *pupilSource;
	TQuery *pupilCourseQuery;
	TDataSource *pupilCourseSource;
	TDateTimeField *pupilCourseQueryANFANG;
	TDateTimeField *pupilCourseQueryENDE;
	TDateTimeField *pupilCourseQueryANFANGS_DATUM;
	TDateTimeField *pupilCourseQueryENDE_DATUM;
	TStringField *pupilCourseQueryNIVEAU;
	TUpdateSQL *UpdateSQLCourse;
	TQuery *courseQuery;
	TDataSource *courseSource;
	TIntegerField *pupilCourseQueryKURS_ID;
	TIntegerField *pupilCourseQuerySCHUELER_ID;
	TIntegerField *pupilCourseQueryID;
	TStringField *pupilCourseQueryNUMMER;
	TMemoField *pupilCourseQueryBEMERKUNG;
	TStringField *pupilCourseQueryJAHR;
	TStringField *pupilCourseQueryORDNUNGSGEMAESS;
	TStringField *pupilCourseQueryKOSTENBETEILIGUNG;
	TStringField *pupilCourseQueryANTRAG_KOSTENBEFREIUNG;
	TStringField *pupilCourseQueryFAHRTKOSTENBEWILLIGUNG;
	TStringField *pupilCourseQueryBAMF_NUMMER;
	TStringField *pupilCourseQuerySCHUELER_MODUL;
	TPageControl *PageControl;
	TTabSheet *TabSheetCourse;
	TDBMemo *DBMemoCourse;
	TDBGrid *DBGridCourse;
	TPanel *Panel1;
	TDBText *DBTextNameCourse;
	TLabel *yearLabelCourse;
	TSpeedButton *SpeedButtonRefreshCourse;
	TDBNavigator *DBNavigatorCourse;
	TButton *ButtonPayment;
	TUpDown *YearSelectUpDownCourse;
	TCheckBox *CheckBoxFilterCourse;
	TTabSheet *TabSheetTests;
	TQuery *testQuery;
	TDataSource *testSource;
	TDataSource *pupilTestSource;
	TQuery *pupilTestQuery;
	TIntegerField *pupilTestQueryID;
	TIntegerField *pupilTestQueryPRUEF_ID;
	TIntegerField *pupilTestQuerySCHUELER_ID;
	TMemoField *pupilTestQueryBEMERKUNG;
	TStringField *pupilTestQueryBESTANDEN;
	TStringField *pupilTestQueryPRUEFUNG;
	TDateTimeField *pupilTestQueryDATUM;
	TStringField *pupilTestQueryJAHR;
	TUpdateSQL *UpdateSQLTest;
	TDBMemo *DBMemoTest;
	TDBGrid *DBGridTest;
	TPanel *Panel2;
	TDBText *DBTextNameTest;
	TLabel *yearLabelTest;
	TDBNavigator *DBNavigatorTest;
	TUpDown *YearSelectUpDownTest;
	TDateTimeField *pupilCourseQueryANMELDE_DATUM;
	TDateTimeField *pupilCourseQuerySTORNO;
	TStringField *pupilTestQueryKOSTENBETEILIGUNG;
	TDateTimeField *pupilCourseQueryKOSTENBEFREIUNG;
	TStringField *pupilCourseQueryKURS_WECHSEL;
	TCheckBox *CheckBoxFilterTest;
	TStringField *pupilCourseQueryBEHOERDE;
	TStringField *pupilCourseQueryBERECHTIGUNGS_NR;
	TStringField *pupilTestQueryBEHOERDE;
	TStringField *pupilTestQueryBERECHTIGUNGS_NR;
	TSpeedButton *SpeedButtonRefreshTests;
	void __fastcall pupilCourseQueryAfterInsert(TDataSet *DataSet);
	void __fastcall pupilCourseQueryAfterPost(TDataSet *DataSet);
	void __fastcall pupilCourseQueryAfterDelete(TDataSet *DataSet);
	void __fastcall pupilCourseQueryBeforeClose(TDataSet *DataSet);
	void __fastcall ButtonPaymentClick(TObject *Sender);
	void __fastcall FormCloseQuery(TObject *Sender, bool &CanClose);
	void __fastcall FormShow(TObject *Sender);
	void __fastcall YearSelectUpDownCourseChangingEx(TObject *Sender,
          bool &AllowChange, short NewValue, TUpDownDirection Direction);
	void __fastcall pupilCourseQueryBeforePost(TDataSet *DataSet);
	void __fastcall SpeedButtonRefreshCourseClick(TObject *Sender);
	void __fastcall CheckBoxFilterCourseClick(TObject *Sender);
	void __fastcall pupilTestQueryBeforePost(TDataSet *DataSet);
	void __fastcall YearSelectUpDownTestChangingEx(TObject *Sender,
          bool &AllowChange, short NewValue, TUpDownDirection Direction);
	void __fastcall DBNavigatorTestClick(TObject *Sender,
          TNavigateBtn Button);
	void __fastcall pupilTestQueryBeforeClose(TDataSet *DataSet);
	void __fastcall pupilTestQueryAfterPost(TDataSet *DataSet);
	void __fastcall pupilTestQueryAfterInsert(TDataSet *DataSet);
	void __fastcall CheckBoxFilterTestClick(TObject *Sender);
	void __fastcall SpeedButtonRefreshTestsClick(TObject *Sender);
private:	// User declarations
	AnsiString	behoerde, berechtigungsScheinNr;
	int			thePupil;
	void		refreshDBCourse( void );
	void		setYearFilterCourse( short theYear );

	void		refreshDBTest();
	void		setYearFilterTest( short theYear );

public:		// User declarations
	__fastcall TSchuelerKursForm(TComponent* Owner);

	void showPupil( int id, const AnsiString &behoerde, const AnsiString &berechtigungsScheinNr );
};
//---------------------------------------------------------------------------
extern PACKAGE TSchuelerKursForm *SchuelerKursForm;
//---------------------------------------------------------------------------
#endif
