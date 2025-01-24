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

#ifndef PruefungsTeilnehmerFrmH
#define PruefungsTeilnehmerFrmH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DBCtrls.hpp>
#include <DBGrids.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <Db.hpp>
#include <DBTables.hpp>
#include <Buttons.hpp>
//---------------------------------------------------------------------------
class TPruefungsTeilnehmerForm : public TForm
{
__published:	// Von der IDE verwaltete Komponenten
	TPanel *Panel1;
	TDBGrid *DBGridTeilnehmer;
	TDBNavigator *DBNavigator1;
	TQuery *QueryPruefungsTeilnehmer;
	TDataSource *DataSourcePruefungsTeilnehmer;
	TStringField *QueryPruefungsTeilnehmerVORNAME;
	TStringField *QueryPruefungsTeilnehmerNACHNAME;
	TStringField *QueryPruefungsTeilnehmerBESTANDEN;
	TUpdateSQL *UpdateSQL;
	TIntegerField *QueryPruefungsTeilnehmerSCHUELER_ID;
	TIntegerField *QueryPruefungsTeilnehmerID;
	TSpeedButton *SpeedButtonRefresh;
	void __fastcall DBGridTeilnehmerDblClick(TObject *Sender);
	void __fastcall QueryPruefungsTeilnehmerAbort(TDataSet *DataSet);
	void __fastcall QueryPruefungsTeilnehmerBeforeClose(TDataSet *DataSet);
	void __fastcall SpeedButtonRefreshClick(TObject *Sender);
	void __fastcall QueryPruefungsTeilnehmerAfterPost(TDataSet *DataSet);
	void __fastcall FormShow(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
private:	// Anwender-Deklarationen
	int pruef_id;
	void refreshDB( void );
public:		// Anwender-Deklarationen
	__fastcall TPruefungsTeilnehmerForm(TComponent* Owner);
	void showPruefungsTeilnehmer( int pruef_id );
};
//---------------------------------------------------------------------------
extern PACKAGE TPruefungsTeilnehmerForm *PruefungsTeilnehmerForm;
//---------------------------------------------------------------------------
#endif
