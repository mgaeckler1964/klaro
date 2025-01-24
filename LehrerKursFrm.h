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
#ifndef LehrerKursFrmH
#define LehrerKursFrmH
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
class TLehrerKursForm : public TForm
{
__published:	// IDE-managed Components
	TQuery *teacherQuery;
	TDataSource *teacherSource;
	TQuery *teacherCourseQuery;
	TDataSource *teacherCourseSource;
	TPanel *Panel1;
	TDBText *DBText1;
	TDBNavigator *DBNavigator1;
	TDBGrid *DBGridTeacherCourse;
	TDateTimeField *teacherCourseQueryANFANG;
	TDateTimeField *teacherCourseQueryENDE;
	TDateTimeField *teacherCourseQueryANFANGS_DATUM;
	TDateTimeField *teacherCourseQueryENDE_DATUM;
	TStringField *teacherCourseQueryNIVEAU;
	TUpdateSQL *UpdateSQL;
	TQuery *QueryCourse;
	TIntegerField *teacherCourseQueryKURS_ID;
	TIntegerField *teacherCourseQueryLEHRER_ID;
	TIntegerField *teacherCourseQueryID;
	TStringField *teacherCourseQueryNUMMER;
	TStringField *teacherCourseQueryTEAM_TEACHER;
	TStringField *teacherCourseQuerySOZ_PAED;
	TLabel *yearLabel;
	TUpDown *YearSelectUpDown;
	TStringField *teacherCourseQueryjahr;
	TSpeedButton *SpeedButtonRefresh;
	TCheckBox *CheckBoxFilter;
	TQuery *QueryFerien;
	TDateTimeField *teacherCourseQueryMO_ANF;
	TDateTimeField *teacherCourseQueryMO_END;
	TDateTimeField *teacherCourseQueryMO_PAUS_ANF;
	TDateTimeField *teacherCourseQueryMO_PAUS_END;
	TDateTimeField *teacherCourseQueryDI_ANF;
	TDateTimeField *teacherCourseQueryDI_END;
	TDateTimeField *teacherCourseQueryDI_PAUS_ANF;
	TDateTimeField *teacherCourseQueryDI_PAUS_END;
	TDateTimeField *teacherCourseQueryMI_ANF;
	TDateTimeField *teacherCourseQueryMI_END;
	TDateTimeField *teacherCourseQueryMI_PAUS_ANF;
	TDateTimeField *teacherCourseQueryMI_PAUS_END;
	TDateTimeField *teacherCourseQueryDO_ANF;
	TDateTimeField *teacherCourseQueryDO_END;
	TDateTimeField *teacherCourseQueryDO_PAUS_ANF;
	TDateTimeField *teacherCourseQueryDO_PAUS_END;
	TDateTimeField *teacherCourseQueryFR_ANF;
	TDateTimeField *teacherCourseQueryFR_END;
	TDateTimeField *teacherCourseQueryFR_PAUS_ANF;
	TDateTimeField *teacherCourseQueryFR_PAUS_END;
	TDateTimeField *teacherCourseQuerySA_ANF;
	TDateTimeField *teacherCourseQuerySA_END;
	TDateTimeField *teacherCourseQuerySA_PAUS_ANF;
	TDateTimeField *teacherCourseQuerySA_PAUS_END;
	TDateTimeField *teacherCourseQuerySO_ANF;
	TDateTimeField *teacherCourseQuerySO_END;
	TDateTimeField *teacherCourseQuerySO_PAUS_ANF;
	TDateTimeField *teacherCourseQuerySO_PAUS_END;
	void __fastcall teacherCourseQueryAfterInsert(TDataSet *DataSet);
	void __fastcall teacherCourseQueryAfterPost(TDataSet *DataSet);
	void __fastcall teacherCourseQueryAfterDelete(TDataSet *DataSet);
	void __fastcall teacherCourseQueryBeforeClose(TDataSet *DataSet);
	void __fastcall FormCloseQuery(TObject *Sender, bool &CanClose);
	void __fastcall FormShow(TObject *Sender);
	void __fastcall YearSelectUpDownChangingEx(TObject *Sender,
          bool &AllowChange, short NewValue, TUpDownDirection Direction);
	void __fastcall teacherCourseQueryBeforePost(TDataSet *DataSet);
	void __fastcall SpeedButtonRefreshClick(TObject *Sender);
	void __fastcall CheckBoxFilterClick(TObject *Sender);
	void __fastcall teacherCourseQueryBeforeDelete(TDataSet *DataSet);
private:	// User declarations
	int		theTeacher, lastCreatedId;
	void	refreshDB( void );
	void	setYearFilter( short theYear );
public:		// User declarations
	__fastcall TLehrerKursForm(TComponent* Owner);

	void showTeacher( int id );
};
//---------------------------------------------------------------------------
extern PACKAGE TLehrerKursForm *LehrerKursForm;
//---------------------------------------------------------------------------
#endif
