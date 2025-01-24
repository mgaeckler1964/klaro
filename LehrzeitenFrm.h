/*
		Project:		Klaro
		Module:			
		Description:	
		Author:			Martin G�ckler
		Address:		Hofmannsthalweg 14, A-4030 Linz
		Web:			https://www.gaeckler.at/

		Copyright:		(c) 1988-2025 Martin G�ckler

		This program is free software: you can redistribute it and/or modify  
		it under the terms of the GNU General Public License as published by  
		the Free Software Foundation, version 3.

		You should have received a copy of the GNU General Public License 
		along with this program. If not, see <http://www.gnu.org/licenses/>.

		THIS SOFTWARE IS PROVIDED BY Martin G�ckler, Austria, Linz ``AS IS''
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

#ifndef LehrzeitenFrmH
#define LehrzeitenFrmH
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
//---------------------------------------------------------------------------
class TLehrzeitenForm : public TForm
{
__published:	// Von der IDE verwaltete Komponenten
	TDBGrid *DBGrid1;
	TPanel *Panel1;
	TDBNavigator *DBNavigator1;
	TQuery *QueryLehrzeiten;
	TDataSource *DataSourceLehrzeiten;
	TQuery *QueryTeacher;
	TIntegerField *QueryLehrzeitenID;
	TIntegerField *QueryLehrzeitenLEHRER_KURS_ID;
	TDateTimeField *QueryLehrzeitenDATUM;
	TStringField *QueryLehrzeitenNAME;
	TDateTimeField *QueryLehrzeitenSTART_ZEIT;
	TDateTimeField *QueryLehrzeitenENDE_ZEIT;
	TDateTimeField *QueryLehrzeitenPAUSE_ANFANG;
	TDateTimeField *QueryLehrzeitenPAUSE_ENDE;
	TUpdateSQL *UpdateSQLLehrzeiten;
	void __fastcall QueryLehrzeitenAfterDelete(TDataSet *DataSet);
	void __fastcall QueryLehrzeitenAfterPost(TDataSet *DataSet);
	void __fastcall QueryLehrzeitenBeforeClose(TDataSet *DataSet);
	void __fastcall QueryLehrzeitenBeforePost(TDataSet *DataSet);
	void __fastcall QueryLehrzeitenAfterInsert(TDataSet *DataSet);
private:	// Anwender-Deklarationen
	int course_id;
	void refreshDB( void );
public:		// Anwender-Deklarationen
	__fastcall TLehrzeitenForm(TComponent* Owner);
	void showTeacherTimes( int course_id, const char *course_number );
};
//---------------------------------------------------------------------------
extern PACKAGE TLehrzeitenForm *LehrzeitenForm;
//---------------------------------------------------------------------------
#endif
