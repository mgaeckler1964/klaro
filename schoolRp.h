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
//----------------------------------------------------------------------------
#ifndef schoolRpH
#define schoolRpH
//----------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\QuickRpt.hpp>
#include <vcl\QRCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Qrctrls.hpp>
#include <Db.hpp>
#include <DBTables.hpp>
//----------------------------------------------------------------------------
class TSchoolReport : public TQuickRep
{
__published:
	TQRBand *ColumnHeaderBand1;
	TQRBand *DetailBand1;
	TQRLabel *QRLabel1;
	TQRLabel *QRLabel2;
	TQRLabel *QRLabel3;
	TQRLabel *QRLabel4;
	TQRLabel *QRLabel5;
	TQRLabel *QRLabel6;
	TQRLabel *QRLabel7;
	TQRLabel *QRLabel8;
	TQRLabel *QRLabel9;
	TQRLabel *QRLabel10;
	TQRLabel *QRLabel11;
	TQRLabel *QRLabel12;
	TQRLabel *QRLabel13;
	TQRLabel *QRLabel14;
	TQRLabel *QRLabel15;
	TQuery *pupilQuery;
	TStringField *pupilQueryNACHNAME;
	TStringField *pupilQueryVORNAME;
	TStringField *pupilQuerySTRASSE;
	TStringField *pupilQueryPLZ;
	TStringField *pupilQueryORT;
	TStringField *pupilQueryTEL_PRIV;
	TStringField *pupilQueryTEL_BUERO;
	TStringField *pupilQueryTEL_MOBIL;
	TStringField *pupilQueryGESCHLECHT;
	TStringField *pupilQueryNATIONALITAET;
	TDateTimeField *pupilQueryGEBURTSDATUM;
	TStringField *pupilQueryAUSLAENDER_STATUS;
	TQRDBText *QRDBText2;
	TQRDBText *QRDBText3;
	TQRDBText *QRDBText4;
	TQRDBText *QRDBText5;
	TQRDBText *QRDBText6;
	TQRDBText *QRDBText7;
	TQRDBText *QRDBText8;
	TQRDBText *QRDBText9;
	TQRDBText *QRDBText10;
	TQRDBText *QRDBText11;
	TQRDBText *QRDBText12;
	TQRSysData *QRSysData1;
	TSmallintField *pupilQueryAGE;
	TQRDBText *QRDBText13;
	TQuery *moneyQuery;
	TMemoField *pupilQueryBEMERKUNG;
	TCurrencyField *pupilQueryBETRAG;
	TQRDBText *QRDBText14;
	TIntegerField *pupilQueryID;
	TFloatField *moneyQueryBETRAG;
	TQuery *courseQuery;
	TQRBand *PageHeaderBand1;
	TQRDBText *QRDBText15;
	TQRDBText *QRDBText16;
	TQRDBText *QRDBText17;
	TQRDBText *QRDBText18;
	TStringField *courseQueryNUMMER;
	TStringField *courseQueryVORKURS;
	TStringField *courseQueryLEHRBUCH;
	TStringField *courseQueryRAUM;
	TDateTimeField *courseQueryANFANGS_DATUM;
	TDateTimeField *courseQueryENDE_DATUM;
	TStringField *courseQueryKURSTAGE;
	TStringField *courseQueryFEIERTAGE;
	TQRLabel *QRLabel16;
	TQRLabel *QRLabel17;
	TQRLabel *QRLabel18;
	TQRLabel *QRLabel19;
	TQRLabel *QRLabel20;
	TQRLabel *QRLabel21;
	TQRDBText *QRDBText19;
	TQRDBText *QRDBText20;
	TQRDBText *QRDBText21;
	TQRLabel *QRLabel22;
	TQuery *teacherQuery;
	TQRDBText *QRDBText22;
	TStringField *teacherQueryNACHNAME;
	TQuery *ttQuery;
	TStringField *StringField1;
	TQuery *spQuery;
	TStringField *StringField2;
	TQRDBText *QRDBText23;
	TQRDBText *QRDBText24;
	TQRLabel *QRLabel23;
	TQRLabel *QRLabel24;
	TQRLabel *QRLabel25;
	TQRLabel *QRLabel26;
	TQRDBText *QRDBText25;
	TQRBand *PageFooterBand1;
	TQRSysData *QRSysData2;
	TQRSysData *QRSysData3;
	TQRSysData *QRSysData4;
	TQRLabel *QRLabel27;
	TQRLabel *QRLabel28;
	TStringField *pupilQueryWOHNUNG;
	TQRDBText *QRDBText26;
	TQRLabel *QRLabel29;
	TStringField *pupilQueryCO_APRTM;
	TStringField *pupilQueryFULL_NAME;
	TQRDBText *QRDBText1;
	TMemoField *courseQueryBEMERKUNG;
	void __fastcall pupilQueryCalcFields(TDataSet *DataSet);
private:
public:
   __fastcall TSchoolReport::TSchoolReport(TComponent* Owner);
   void showReport( int kurs_id, const char *title );
};
//----------------------------------------------------------------------------
extern TSchoolReport *SchoolReport;
//----------------------------------------------------------------------------
#endif