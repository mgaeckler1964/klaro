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

#ifndef klarodbmainH
#define klarodbmainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Db.hpp>
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TDbConvertForm : public TForm
{
__published:	// IDE-managed Components
	TDatabase *KlaroOldDatabase;
	TDatabase *KlaroNewDatabase;
	TTable *OldSchueler;
	TTable *OldKurs;
	TTable *OldLehrer;
	TTable *OldSchuelerKurs;
	TTable *OldLehrerKurs;
	TTable *OldBezahlung;
	TTable *NewSchueler;
	TTable *NewKurs;
	TTable *NewLehrer;
	TTable *NewSchuelerKurs;
	TTable *NewLehrerKurs;
	TTable *NewBezahlung;
	TAutoIncField *OldSchuelerID;
	TDateTimeField *OldSchuelerAENDERUNGSDATUM;
	TStringField *OldSchuelerANREDE;
	TStringField *OldSchuelerGESCHLECHT;
	TStringField *OldSchuelerNACHNAME;
	TStringField *OldSchuelerVORNAME;
	TStringField *OldSchuelerWOHNUNG;
	TStringField *OldSchuelerSTRASSE;
	TStringField *OldSchuelerLAND;
	TStringField *OldSchuelerPLZ;
	TStringField *OldSchuelerORT;
	TStringField *OldSchuelerTEL_PRIV;
	TStringField *OldSchuelerTEL_BUERO;
	TStringField *OldSchuelerTEL_MOBIL;
	TStringField *OldSchuelerTEL_FAX;
	TStringField *OldSchuelerE_MAIL;
	TDateTimeField *OldSchuelerGEBURTSDATUM;
	TStringField *OldSchuelerGEBURTSORT;
	TStringField *OldSchuelerNATIONALITAET;
	TStringField *OldSchuelerAUSLAENDER_STATUS;
	TStringField *OldSchuelerBERUF;
	TStringField *OldSchuelerTAETIGKEIT;
	TStringField *OldSchuelerWOHER;
	TStringField *OldSchuelerPRUEFUNGEN;
	TStringField *OldSchuelerEINSTUFUNG;
	TMemoField *OldSchuelerBEMERKUNG;
	TAutoIncField *OldKursID;
	TStringField *OldKursJAHR;
	TStringField *OldKursNUMMER;
	TDateTimeField *OldKursANFANGS_DATUM;
	TDateTimeField *OldKursENDE_DATUM;
	TFloatField *OldKursUNTERRICHTSSTUNDEN;
	TFloatField *OldKursWOCHENSTUNDEN;
	TFloatField *OldKursTT_STUNDEN;
	TFloatField *OldKursSOZ_PAED_STUNDEN;
	TStringField *OldKursKURSTAGE;
	TStringField *OldKursFEIERTAGE;
	TStringField *OldKursVORKURS;
	TStringField *OldKursNIVEAU;
	TStringField *OldKursLEHRBUCH;
	TStringField *OldKursRAUM;
	TFloatField *OldKursKURSGEBUEHR;
	TFloatField *OldKursFOERDERUNG;
	TAutoIncField *OldSchuelerKursID;
	TIntegerField *OldSchuelerKursKURS_ID;
	TIntegerField *OldSchuelerKursSCHUELER_ID;
	TDateTimeField *OldSchuelerKursANFANG;
	TDateTimeField *OldSchuelerKursENDE;
	TAutoIncField *OldLehrerKursID;
	TIntegerField *OldLehrerKursLEHRER_ID;
	TIntegerField *OldLehrerKursKURS_ID;
	TDateTimeField *OldLehrerKursANFANG;
	TDateTimeField *OldLehrerKursENDE;
	TStringField *OldLehrerKursTEAM_TEACHER;
	TStringField *OldLehrerKursSOZ_PAED;
	TAutoIncField *OldBezahlungID;
	TIntegerField *OldBezahlungKURS_SCHUELER_ID;
	TDateTimeField *OldBezahlungDATUM;
	TStringField *OldBezahlungBESCHREIBUNG;
	TStringField *OldBezahlungZAHLUNGSART;
	TFloatField *OldBezahlungBETRAG;
	TButton *UpgradeButton;
	TMemo *Memo1;
	TButton *EmptyButton;
	TAutoIncField *OldLehrerID;
	TStringField *OldLehrerNACHNAME;
	TStringField *OldLehrerVORNAME;
	TStringField *OldLehrerWOHNUNG;
	TStringField *OldLehrerSTRASSE;
	TStringField *OldLehrerLAND;
	TStringField *OldLehrerPLZ;
	TStringField *OldLehrerORT;
	TStringField *OldLehrerANREDE;
	TStringField *OldLehrerTEL_PRIV;
	TStringField *OldLehrerTEL_BUERO;
	TStringField *OldLehrerTEL_MOBIL;
	TStringField *OldLehrerTEL_FAX;
	TStringField *OldLehrerE_MAIL;
	TDateTimeField *OldLehrerGEBURTSDATUM;
	TStringField *OldLehrerGEBURTSORT;
	TStringField *OldLehrerNATIONALITAET;
	TStringField *OldLehrerAKAD_TITEL;
	TDateTimeField *OldLehrerSV_ABSCHLUSS;
	TDateTimeField *OldLehrerDAF_ERFAHRUNG;
	TDateTimeField *OldLehrerEINSTIEG;
	TDateTimeField *OldLehrerVERTRAG;
	TMemoField *OldLehrerBEMERKUNG;
	TMemoField *OldKursBEMERKUNG;
	TStringField *OldLehrerGESCHLECHT;
	TMemoField *OldSchuelerKursBEMERKUNG;
	TTable *NewFerien;
	TDateTimeField *NewFerienANFANG;
	TDateTimeField *NewFerienENDE;
	TStringField *NewFerienBEZEICHNUNG;
	TTable *NewKursbuecher;
	TIntegerField *NewKursbuecherKURS_ID;
	TIntegerField *NewKursbuecherBUCH_ID;
	TTable *NewAnwesenheiten;
	TIntegerField *NewAnwesenheitenSCHUELER_ID;
	TIntegerField *NewAnwesenheitenKURS_ID;
	TDateTimeField *NewAnwesenheitenDATUM;
	TStringField *NewAnwesenheitenENTSCHULDIGT;
	TTable *NewPruefschueler;
	TIntegerField *NewPruefschuelerID;
	TIntegerField *NewPruefschuelerPRUEF_ID;
	TIntegerField *NewPruefschuelerSCHUELER_ID;
	TMemoField *NewPruefschuelerBEMERKUNG;
	TStringField *NewPruefschuelerBESTANDEN;
	TTable *NewPruefungen;
	TIntegerField *NewSchuelerID;
	TDateTimeField *NewSchuelerAENDERUNGSDATUM;
	TDateTimeField *NewSchuelerANMELDE_DATUM;
	TStringField *NewSchuelerANREDE;
	TStringField *NewSchuelerGESCHLECHT;
	TStringField *NewSchuelerNACHNAME;
	TStringField *NewSchuelerVORNAME;
	TStringField *NewSchuelerWOHNUNG;
	TStringField *NewSchuelerSTRASSE;
	TStringField *NewSchuelerLAND;
	TStringField *NewSchuelerPLZ;
	TStringField *NewSchuelerORT;
	TStringField *NewSchuelerTEL_PRIV;
	TStringField *NewSchuelerTEL_BUERO;
	TStringField *NewSchuelerTEL_MOBIL;
	TStringField *NewSchuelerTEL_FAX;
	TStringField *NewSchuelerE_MAIL;
	TDateTimeField *NewSchuelerGEBURTSDATUM;
	TStringField *NewSchuelerGEBURTSORT;
	TStringField *NewSchuelerNATIONALITAET;
	TStringField *NewSchuelerAUSLAENDER_STATUS;
	TStringField *NewSchuelerBERUF;
	TStringField *NewSchuelerTAETIGKEIT;
	TStringField *NewSchuelerWOHER;
	TStringField *NewSchuelerPRUEFUNGEN;
	TStringField *NewSchuelerEINSTUFUNG;
	TMemoField *NewSchuelerBEMERKUNG;
	TStringField *NewSchuelerISCED_LEVEL;
	TSmallintField *NewSchuelerSCHULJAHRE;
	TSmallintField *NewSchuelerKURS_MODUL;
	TStringField *NewSchuelerKURSART;
	TSmallintField *NewSchuelerSCHREIBFAEHIGKEIT;
	TStringField *NewSchuelerAUSWEIS_NUMMER;
	TStringField *NewSchuelerBAMF_NUMMER;
	TStringField *NewSchuelerABH_NUMMER;
	TStringField *NewSchuelerBVA_NUMMER;
	TStringField *NewSchuelerAZ_GRUNDSICHERUNG;
	TStringField *NewSchuelerABGESCHLOSSEN;
	TIntegerField *NewKursID;
	TStringField *NewKursJAHR;
	TStringField *NewKursNUMMER;
	TDateTimeField *NewKursANFANGS_DATUM;
	TDateTimeField *NewKursENDE_DATUM;
	TFloatField *NewKursUNTERRICHTSSTUNDEN;
	TFloatField *NewKursWOCHENSTUNDEN;
	TFloatField *NewKursTT_STUNDEN;
	TFloatField *NewKursSOZ_PAED_STUNDEN;
	TStringField *NewKursKURSTAGE;
	TStringField *NewKursFEIERTAGE;
	TStringField *NewKursKURSART;
	TStringField *NewKursKURSTYP;
	TStringField *NewKursKURSABSCHNITT;
	TStringField *NewKursVORKURS;
	TStringField *NewKursNIVEAU;
	TStringField *NewKursLEHRBUCH;
	TStringField *NewKursRAUM;
	TFloatField *NewKursUMSATZSTEUER;
	TFloatField *NewKursKURSGEBUEHR;
	TFloatField *NewKursFOERDERUNG;
	TMemoField *NewKursBEMERKUNG;
	TDateTimeField *NewKursMO_ANF;
	TDateTimeField *NewKursMO_END;
	TDateTimeField *NewKursMO_PAUS_ANF;
	TDateTimeField *NewKursMO_PAUS_END;
	TDateTimeField *NewKursDI_ANF;
	TDateTimeField *NewKursDI_END;
	TDateTimeField *NewKursDI_PAUS_ANF;
	TDateTimeField *NewKursDI_PAUS_END;
	TDateTimeField *NewKursMI_ANF;
	TDateTimeField *NewKursMI_END;
	TDateTimeField *NewKursMI_PAUS_ANF;
	TDateTimeField *NewKursMI_PAUS_END;
	TDateTimeField *NewKursDO_ANF;
	TDateTimeField *NewKursDO_END;
	TDateTimeField *NewKursDO_PAUS_ANF;
	TDateTimeField *NewKursDO_PAUS_END;
	TDateTimeField *NewKursFR_ANF;
	TDateTimeField *NewKursFR_END;
	TDateTimeField *NewKursFR_PAUS_ANF;
	TDateTimeField *NewKursFR_PAUS_END;
	TDateTimeField *NewKursSA_ANF;
	TDateTimeField *NewKursSA_END;
	TDateTimeField *NewKursSA_PAUS_ANF;
	TDateTimeField *NewKursSA_PAUS_END;
	TDateTimeField *NewKursSO_ANF;
	TDateTimeField *NewKursSO_END;
	TDateTimeField *NewKursSO_PAUS_ANF;
	TDateTimeField *NewKursSO_PAUS_END;
	TIntegerField *NewLehrerID;
	TStringField *NewLehrerANREDE;
	TStringField *NewLehrerGESCHLECHT;
	TStringField *NewLehrerNACHNAME;
	TStringField *NewLehrerVORNAME;
	TStringField *NewLehrerWOHNUNG;
	TStringField *NewLehrerSTRASSE;
	TStringField *NewLehrerLAND;
	TStringField *NewLehrerPLZ;
	TStringField *NewLehrerORT;
	TStringField *NewLehrerTEL_PRIV;
	TStringField *NewLehrerTEL_BUERO;
	TStringField *NewLehrerTEL_MOBIL;
	TStringField *NewLehrerTEL_FAX;
	TStringField *NewLehrerE_MAIL;
	TDateTimeField *NewLehrerGEBURTSDATUM;
	TStringField *NewLehrerGEBURTSORT;
	TStringField *NewLehrerNATIONALITAET;
	TStringField *NewLehrerAKAD_TITEL;
	TDateTimeField *NewLehrerSV_ABSCHLUSS;
	TDateTimeField *NewLehrerDAF_ERFAHRUNG;
	TDateTimeField *NewLehrerEINSTIEG;
	TDateTimeField *NewLehrerVERTRAG;
	TStringField *NewLehrerBAMF_NUMMER;
	TMemoField *NewLehrerBEMERKUNG;
	TIntegerField *NewSchuelerKursID;
	TIntegerField *NewSchuelerKursKURS_ID;
	TIntegerField *NewSchuelerKursSCHUELER_ID;
	TDateTimeField *NewSchuelerKursANFANG;
	TDateTimeField *NewSchuelerKursENDE;
	TMemoField *NewSchuelerKursBEMERKUNG;
	TStringField *NewSchuelerKursKOSTENBETEILIGUNG;
	TStringField *NewSchuelerKursANTRAG_KOSTENBEFREIUNG;
	TStringField *NewSchuelerKursORDNUNGSGEMAESS;
	TStringField *NewSchuelerKursFAHRTKOSTENBEWILLIGUNG;
	TIntegerField *NewLehrerKursID;
	TIntegerField *NewLehrerKursLEHRER_ID;
	TIntegerField *NewLehrerKursKURS_ID;
	TDateTimeField *NewLehrerKursANFANG;
	TDateTimeField *NewLehrerKursENDE;
	TStringField *NewLehrerKursTEAM_TEACHER;
	TStringField *NewLehrerKursSOZ_PAED;
	TIntegerField *NewBezahlungID;
	TIntegerField *NewBezahlungKURS_SCHUELER_ID;
	TDateTimeField *NewBezahlungDATUM;
	TStringField *NewBezahlungBESCHREIBUNG;
	TStringField *NewBezahlungZAHLUNGSART;
	TFloatField *NewBezahlungBETRAG;
	TButton *SessionButton;
	TQuery *delSessionQuery;
	TDatabase *KlaroBackupDatabase;
	TButton *BackupButton;
	TButton *RestoreButton;
	TStringField *NewSchuelerTEILNEHMER_NUMMER;
	TStringField *NewSchuelerBANK_INHABER;
	TStringField *NewSchuelerBANK_KONTO;
	TStringField *NewSchuelerBANK_BLZ;
	TStringField *NewSchuelerBANK_NAME;
	TStringField *NewKursHALBJAHR;
	TStringField *NewKursBAMF_NUMMER;
	TTable *NewLehrzeiten;
	TIntegerField *IntegerField1;
	TIntegerField *IntegerField2;
	TDateTimeField *DateTimeField1;
	TStringField *StringField1;
	void __fastcall UpgradeButtonClick(TObject *Sender);
	void __fastcall EmptyButtonClick(TObject *Sender);
	void __fastcall SessionButtonClick(TObject *Sender);
	void __fastcall BackupButtonClick(TObject *Sender);
	void __fastcall RestoreButtonClick(TObject *Sender);
private:	// User declarations
	void upgradeSchueler();
	void upgradeLehrer();
	void upgradeKurs();

	void upgradeSchuelerKurs();
	void upgradeLehrerKurs();

	void upgradeBezahlung();
	void BackupRestoreDB( TDatabase *source, TDatabase *destination );

public:		// User declarations
	__fastcall TDbConvertForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDbConvertForm *DbConvertForm;
//---------------------------------------------------------------------------
#endif
