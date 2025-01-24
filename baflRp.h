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
#ifndef baflRpH
#define baflRpH
//----------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\QuickRpt.hpp>
#include <vcl\QRCtrls.hpp>
#include <Db.hpp>
#include <DBTables.hpp>
#include <ExtCtrls.hpp>
#include <Qrctrls.hpp>
//----------------------------------------------------------------------------
class TbaflReport : public TQuickRep
{
__published:
	TQRBand *ColumnHeaderBand1;
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
	TQRBand *TitleBand1;
	TQRLabel *QRLabel11;
	TQuery *pupilQuery;
	TQRBand *DetailBand1;
	TQRSysData *QRSysData1;
	TQRDBText *QRDBText1;
	TStringField *pupilQueryNACHNAME;
	TStringField *pupilQueryANSCHRIFT;
	TQRDBText *QRDBText2;
	TStringField *pupilQueryGESCHLECHT;
	TStringField *pupilQueryNATIONALITAET;
	TStringField *pupilQueryTAETIGKEIT;
	TStringField *pupilQueryAUSLAENDER_STATUS;
	TQRDBText *QRDBText3;
	TQRDBText *QRDBText4;
	TQRDBText *QRDBText5;
	TQRLabel *QRLabel13;
	TSmallintField *pupilQueryAGE;
	TDateTimeField *pupilQueryGEBURTSDATUM;
	TQRDBText *QRDBText7;
	TStringField *pupilQueryGOOD_STRANGER;
	TStringField *pupilQueryBAD_STRANGER;
	TQRLabel *QRLabel14;
	TQRLabel *QRLabel15;
	TQRDBText *QRDBText6;
	TQRDBText *QRDBText8;
	TQRBand *PageFooterBand1;
	TQRLabel *QRLabel16;
	TQRLabel *QRLabel17;
	TQRLabel *QRLabel18;
	TQRLabel *QRLabel19;
	TQRLabel *QRLabel20;
	TQRLabel *QRLabel21;
	TQRSysData *QRSysData2;
	TQRBand *SummaryBand1;
	TQRLabel *QRLabel22;
	TQRLabel *QRLabel23;
	TQRLabel *QRLabel24;
	TQRSysData *QRSysData3;
	TQRLabel *QRLabel25;
	void __fastcall pupilQueryCalcFields(TDataSet *DataSet);
private:
public:
   __fastcall TbaflReport::TbaflReport(TComponent* Owner);

   void showReport( int kurs_id, const char *title );
};
//----------------------------------------------------------------------------
extern TbaflReport *baflReport;
//----------------------------------------------------------------------------
#endif