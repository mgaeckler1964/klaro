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

#ifndef AlleZahlungenFrmH
#define AlleZahlungenFrmH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <Db.hpp>
#include <DBCtrls.hpp>
#include <DBGrids.hpp>
#include <DBTables.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
//---------------------------------------------------------------------------
class TAlleZahlungenForm : public TForm
{
__published:	// Von der IDE verwaltete Komponenten
	TPanel *Panel1;
	TLabel *Label1;
	TDateTimePicker *DateTimePickerStart;
	TDateTimePicker *DateTimePickerEnd;
	TLabel *Label2;
	TButton *ButtonStart;
	TButton *ButtonExport;
	TDBNavigator *DBNavigator1;
	TDataSource *DataSourceZahlungen;
	TQuery *QueryZahlungen;
	TStringField *QueryZahlungenVORNAME;
	TStringField *QueryZahlungenNACHNAME;
	TStringField *QueryZahlungenKURS;
	TDateTimeField *QueryZahlungenDATUM;
	TStringField *QueryZahlungenBESCHREIBUNG;
	TStringField *QueryZahlungenZAHLUNGSART;
	TFloatField *QueryZahlungenBETRAG;
	TIntegerField *QueryZahlungenID;
	TDBGrid *DBGridZahlungen;
	void __fastcall ButtonStartClick(TObject *Sender);
	void __fastcall FormHide(TObject *Sender);
	void __fastcall ButtonExportClick(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);
	void __fastcall DBGridZahlungenDblClick(TObject *Sender);
private:	// Anwender-Deklarationen
	TDateTime	startDate, endDate;
public:		// Anwender-Deklarationen
	__fastcall TAlleZahlungenForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAlleZahlungenForm *AlleZahlungenForm;
//---------------------------------------------------------------------------
#endif
