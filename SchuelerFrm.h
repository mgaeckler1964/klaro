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
#ifndef SchuelerFrmH
#define SchuelerFrmH
//----------------------------------------------------------------------------
#include <SysUtils.hpp>
#include <Windows.hpp>
#include <Messages.hpp>
#include <Classes.hpp>
#include <Graphics.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DBCtrls.hpp>
#include <DB.hpp>
#include <Db.hpp>
#include <DBTables.hpp>
#include <ExtCtrls.hpp>
#include <Mask.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <ComCtrls.hpp>
#include <Buttons.hpp>
#include <Menus.hpp>
//----------------------------------------------------------------------------
class TSchuelerForm : public TForm
{
__published:
	TDataSource *DataSourcePupil;
	TDBGrid *DBGrid1;
	TPanel *Panel1;
	TPanel *Panel2;
	TDBNavigator *DBNavigator;
	TPageControl *PageControl;
	TTabSheet *TabSheetAnschrift;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TLabel *Label4;
	TLabel *Label5;
	TLabel *Label6;
	TLabel *Label7;
	TLabel *Label8;
	TLabel *Label9;
	TLabel *Label11;
	TLabel *Label10;
	TDBEdit *DBEditNACHNAME;
	TDBEdit *DBEditVORNAME;
	TDBEdit *DBEditWOHNUNG;
	TDBEdit *DBEditSTRASSE;
	TDBEdit *DBEditLAND;
	TDBEdit *DBEditPLZ;
	TDBEdit *DBEditORT;
	TDBEdit *DBEditTEL_PRIV;
	TDBEdit *DBEditTEL_BUERO;
	TDBEdit *DBEditTEL_FAX;
	TDBEdit *DBEditTEL_MOBIL;
	TPanel *Panel3;
	TButton *ButtonCourse;
	TLabel *Label15;
	TTabSheet *TabSheetInfo;
	TLabel *Label20;
	TDBEdit *DBEditGEBURTSDATUM;
	TLabel *Label21;
	TDBEdit *DBEditGEBURTSORT;
	TLabel *Label19;
	TDBEdit *DBEditNATIONALITAET;
	TLabel *Label14;
	TDBMemo *DBMemoBEMERKUNG;
	TLabel *Label12;
	TLabel *Label13;
	TDBEdit *DBEditBERUF;
	TDBEdit *DBEditEINSTUFUNG;
	TLabel *Label16;
	TLabel *Label17;
	TLabel *Label18;
	TDBEdit *DBEditWOHER;
	TSpeedButton *SpeedButtonEmail;
	TDBEdit *DBEditE_MAIL;
	TLabel *Label22;
	TDBEdit *DBEditPRUEFUNGEN;
	TEdit *SearchEdit;
	TLabel *Label23;
	TDBText *DBTextAENDERUNGSDATUM;
	TTable *TablePupil;
	TDateTimeField *TablePupilAENDERUNGSDATUM;
	TStringField *TablePupilANREDE;
	TStringField *TablePupilNACHNAME;
	TStringField *TablePupilVORNAME;
	TStringField *TablePupilWOHNUNG;
	TStringField *TablePupilSTRASSE;
	TStringField *TablePupilLAND;
	TStringField *TablePupilPLZ;
	TStringField *TablePupilORT;
	TStringField *TablePupilTEL_BUERO;
	TStringField *TablePupilTEL_MOBIL;
	TStringField *TablePupilTEL_FAX;
	TStringField *TablePupilE_MAIL;
	TDateTimeField *TablePupilGEBURTSDATUM;
	TStringField *TablePupilGEBURTSORT;
	TStringField *TablePupilNATIONALITAET;
	TStringField *TablePupilBERUF;
	TStringField *TablePupilTAETIGKEIT;
	TStringField *TablePupilWOHER;
	TStringField *TablePupilPRUEFUNGEN;
	TStringField *TablePupilEINSTUFUNG;
	TMemoField *TablePupilBEMERKUNG;
	TDBRadioGroup *DBRadioGroupSex;
	TStringField *TablePupilGESCHLECHT;
	TDBComboBox *DBComboBoxTAETIGKEIT;
	TStringField *TablePupilAUSLAENDER_STATUS;
	TDBComboBox *DBComboBoxAUSLAENDER_STATUS;
	TLabel *LabelAuslaenderstatus;
	TSplitter *Splitter1;
	TLabel *LabelISCEDLevel;
	TDBComboBox *DBComboBoxISCED;
	TLabel *LabelSchuljahre;
	TDBEdit *DBEditSCHULJAHRE;
	TDBEdit *DBEditKURS_MODUL;
	TLabel *Label28;
	TDBComboBox *DBComboBoxKURSART;
	TLabel *Label29;
	TComboBox *ComboBoxSCHREIBFAEHIGKEIT;
	TLabel *LabelSchreibfaehigkeit;
	TStringField *TablePupilTEL_PRIV;
	TStringField *TablePupilISCED_LEVEL;
	TSmallintField *TablePupilSCHULJAHRE;
	TSmallintField *TablePupilKURS_MODUL;
	TStringField *TablePupilKURSART;
	TSmallintField *TablePupilSCHREIBFAEHIGKEIT;
	TDBComboBox *DBComboBoxAnrede;
	TIntegerField *TablePupilID;
	TTabSheet *TabSheetNummern;
	TLabel *Label31;
	TStringField *TablePupilAUSWEIS_NUMMER;
	TStringField *TablePupilBAMF_NUMMER;
	TStringField *TablePupilABH_NUMMER;
	TStringField *TablePupilBVA_NUMMER;
	TLabel *LabelPersonenkennzifferdesBAMF;
	TLabel *LabelABHKennziffer;
	TLabel *LabelBVAKennziffer;
	TDBEdit *DBEditAUSWEIS_NUMMER;
	TDBEdit *DBEditBAMF_NUMMER;
	TDBEdit *DBEditABH_NUMMER;
	TDBEdit *DBEditBVA_NUMMER;
	TDateTimeField *TablePupilANMELDE_DATUM;
	TStringField *TablePupilAZ_GRUNDSICHERUNG;
	TLabel *LabelAZ_GRUNDSICHERUNG;
	TDBEdit *DBEditAZ_GRUNDSICHERUNG;
	TDBEdit *DBEditANMELDE_DATUM;
	TLabel *Label36;
	TStringField *TablePupilABGESCHLOSSEN;
	TDBCheckBox *DBCheckBoxABGESCHLOSSEN;
	TButton *ButtonFilter;
	TStringField *TablePupilBANK_INHABER;
	TStringField *TablePupilBANK_KONTO;
	TStringField *TablePupilBANK_BLZ;
	TStringField *TablePupilBANK_NAME;
	TLabel *Label27;
	TLabel *Label37;
	TLabel *Label38;
	TLabel *Label39;
	TDBEdit *DBEditBANK_INHABER;
	TDBEdit *DBEditBANK_KONTO;
	TDBEdit *DBEditBANK_BLZ;
	TDBEdit *DBEditBANK_NAME;
	TButton *ButtonSearch;
	TLabel *Label40;
	TDBEdit *DBEditTEILNEHMER_NUMMER;
	TStringField *TablePupilTEILNEHMER_NUMMER;
	TSpeedButton *SpeedButtonRefresh;
	TPopupMenu *xmlPopupMenu;
	TMenuItem *SelectaXSLFile1;
	TMenuItem *Ohne1;
	TStringField *TablePupilAENDERUNG_VON;
	TDBText *DBTextAENDERUNG_VON;
	TTabSheet *TabSheetAnsprechpartner;
	TStringField *TablePupilAP_NAME;
	TStringField *TablePupilAP_VORNAME;
	TStringField *TablePupilAP_ORGANISATION;
	TStringField *TablePupilAP_STRASSE;
	TStringField *TablePupilAP_PLZ;
	TStringField *TablePupilAP_ORT;
	TStringField *TablePupilAP_TELEFON;
	TStringField *TablePupilAP_FAX;
	TStringField *TablePupilAP_EMAIL;
	TStringField *TablePupilAP_INFO;
	TLabel *Label42;
	TDBEdit *DBEditAP_VORNAME;
	TDBEdit *DBEditAP_NAME;
	TLabel *Label43;
	TDBEdit *DBEditAP_ORGANISATION;
	TLabel *Label44;
	TDBEdit *DBEditAP_STRASSE;
	TLabel *Label45;
	TDBEdit *DBEditAP_PLZ;
	TDBEdit *DBEditAP_ORT;
	TLabel *Label46;
	TDBEdit *DBEditAP_TELEFON;
	TDBEdit *DBEditAP_FAX;
	TLabel *Label47;
	TDBEdit *DBEditAP_EMAIL;
	TLabel *Label48;
	TSpeedButton *SpeedButtonApEmail;
	TDBEdit *DBEditAP_INFO;
	TBitBtn *BitBtnXmlExport;
	TDBEdit *DBEditRUECKGABE_DATUM;
	TLabel *Label49;
	TDateTimeField *TablePupilRUECKGABE_DATUM;
	TQuery *QueryKursart;
	TStringField *QueryKursartKURSART;
	void __fastcall ButtonCourseClick(TObject *Sender);
	void __fastcall TablePupilBeforePost(TDataSet *DataSet);
	void __fastcall SpeedButtonEmailClick(TObject *Sender);
	void __fastcall SearchEditChange(TObject *Sender);
	void __fastcall DBRadioGroupSexExit(TObject *Sender);
	void __fastcall TablePupilAfterScroll(TDataSet *DataSet);
	void __fastcall ComboBoxSCHREIBFAEHIGKEITChange(TObject *Sender);
	void __fastcall TablePupilAfterInsert(TDataSet *DataSet);
	void __fastcall ButtonFilterClick(TObject *Sender);
	void __fastcall ButtonSearchClick(TObject *Sender);
	void __fastcall TablePupilAfterPost(TDataSet *DataSet);
	void __fastcall SpeedButtonRefreshClick(TObject *Sender);
	void __fastcall xslMenuClick(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);
	void __fastcall BitBtnXmlExportClick(TObject *Sender);
private:
	// private declarations
	void refreshDB( void );
	bool checkDuplicateValue( const char *fieldName, const char *value );
	AnsiString	selectedXSL;
public:
	// public declarations
	__fastcall TSchuelerForm(TComponent *Owner);

	void gotoPupil( int id );
};
//----------------------------------------------------------------------------
extern TSchuelerForm *SchuelerForm;
//----------------------------------------------------------------------------
#endif
