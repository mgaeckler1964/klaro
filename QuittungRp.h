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
#ifndef QuittungRpH
#define QuittungRpH
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
class TQuittungReport : public TQuickRep
{
__published:
	TQRBand *DetailBand1;
	TQRBand *TitleBand1;
	TQuery *theQuery;
	TStringField *theQueryNACHNAME;
	TStringField *theQueryVORNAME;
	TDateTimeField *theQueryDATUM;
	TDateTimeField *theQueryANFANGS_DATUM;
	TDateTimeField *theQueryENDE_DATUM;
	TStringField *theQueryBESCHREIBUNG;
	TStringField *theQueryZAHLUNGSART;
	TFloatField *theQueryBETRAG;
	TStringField *theQueryKURS;
	TQRLabel *QRLabel1;
	TQRLabel *QRLabel8;
	TQRDBText *QRDBText1;
	TQRDBText *QRDBText2;
	TQRLabel *QRLabel2;
	TQRLabel *QRLabel3;
	TQRLabel *QRLabel4;
	TQRDBText *QRDBText4;
	TQRDBText *QRDBText6;
	TQRDBText *QRDBText7;
	TQRLabel *QRLabel10;
	TQRLabel *QRLabel6;
	TQRLabel *QRLabel5;
	TQRDBText *QRDBText8;
	TQRDBText *QRDBText9;
	TQRDBText *QRDBText10;
	TQRLabel *QRLabel7;
	TQRDBText *QRDBText3;
	TQRLabel *QRLabel9;
private:
public:
   __fastcall TQuittungReport::TQuittungReport(TComponent* Owner);
	void TQuittungReport::ShowReport( int theId );
};
//----------------------------------------------------------------------------
extern TQuittungReport *QuittungReport;
//----------------------------------------------------------------------------
#endif