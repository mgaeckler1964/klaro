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
#ifndef SchuelerPruefFrmH
#define SchuelerPruefFrmH
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
//---------------------------------------------------------------------------
class TSchuelerPruefForm : public TForm
{
__published:	// IDE-managed Components
	TQuery *pupilQuery;
	TDataSource *pupilSource;
	TQuery *pupilTestQuery;
	TDataSource *pupilTestSource;
	TPanel *Panel1;
	TDBText *DBTextNameTest;
	TDBNavigator *DBNavigatorTest;
	TDBGrid *DBGridTest;
	TUpdateSQL *UpdateSQL;
	TQuery *testQuery;
	TDataSource *testSource;
	TDBMemo *DBMemoTest;
	TUpDown *YearSelectUpDownTest;
	TLabel *yearLabelTest;
	TIntegerField *pupilTestQueryID;
	TIntegerField *pupilTestQueryPRUEF_ID;
	TIntegerField *pupilTestQuerySCHUELER_ID;
	TMemoField *pupilTestQueryBEMERKUNG;
	TStringField *pupilTestQueryBESTANDEN;
	TStringField *pupilTestQueryPRUEFUNG;
	TDateTimeField *pupilTestQueryDATUM;
	TStringField *pupilTestQueryJAHR;
private:	// User declarations
	int		thePupil;

public:		// User declarations
	__fastcall TSchuelerPruefForm(TComponent* Owner);

	void showPupil( int id );
};
//---------------------------------------------------------------------------
extern PACKAGE TSchuelerPruefForm *SchuelerPruefForm;
//---------------------------------------------------------------------------
#endif
