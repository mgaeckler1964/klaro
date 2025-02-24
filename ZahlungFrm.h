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
#ifndef ZahlungFrmH
#define ZahlungFrmH
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
//---------------------------------------------------------------------------
class TZahlungForm : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TDBText *DBText1;
	TDBText *DBText3;
	TDBGrid *DBGridZahlungen;
	TQuery *pupilCourseQuery;
	TDataSource *pupilCourseSource;
	TDataSource *PaymentSource;
	TQuery *PaymentQuery;
	TButton *Button1;
	TDBNavigator *DBNavigator1;
	TStringField *PaymentQueryBESCHREIBUNG;
	TFloatField *PaymentQueryBETRAG;
	TIntegerField *PaymentQueryKURS_SCHUELER_ID;
	TFloatField *pupilCourseQuerykursgebuehr;
	TDateTimeField *PaymentQueryDATUM;
	TStringField *PaymentQueryZAHLUNGSART;
	TStringField *pupilCourseQueryname;
	TIntegerField *PaymentQueryID;
	TSpeedButton *SpeedButton1;
	void __fastcall PaymentQueryBeforePost(TDataSet *DataSet);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall PaymentQueryAfterInsert(TDataSet *DataSet);
	void __fastcall FormCloseQuery(TObject *Sender, bool &CanClose);
	void __fastcall PaymentQueryAfterPost(TDataSet *DataSet);
	void __fastcall SpeedButton1Click(TObject *Sender);
private:	// User declarations
	int	theId;

public:		// User declarations
	__fastcall TZahlungForm(TComponent* Owner);
	void showPayment( int theId );
};
//---------------------------------------------------------------------------
extern PACKAGE TZahlungForm *ZahlungForm;
//---------------------------------------------------------------------------
#endif
