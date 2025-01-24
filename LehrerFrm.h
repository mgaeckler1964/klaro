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
#ifndef LehrerFrmH
#define LehrerFrmH
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
//----------------------------------------------------------------------------
class TLehrerForm : public TForm
{
__published:
	TDataSource *DataSourceTeacher;
	TDBGrid *DBGrid1;
	TPanel *Panel1;
	TDBNavigator *DBNavigator;
	TPanel *Panel2;
	TPageControl *PageControl1;
	TTabSheet *TabSheet1;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label12;
	TLabel *Label3;
	TLabel *Label4;
	TLabel *Label5;
	TLabel *Label6;
	TLabel *Label7;
	TLabel *Label8;
	TLabel *Label9;
	TLabel *Label11;
	TLabel *Label10;
	TLabel *Label15;
	TDBEdit *DBEditNACHNAME;
	TDBEdit *DBEditVORNAME;
	TDBEdit *DBEditAKAD_TITEL;
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
	TButton *ButtonCourses;
	TTabSheet *TabSheet2;
	TLabel *Label14;
	TDBMemo *DBMemoBEMERKUNG;
	TLabel *LabelSprachverbandsabschluss;
	TDBEdit *DBEditSV_ABSCHLUSS;
	TDBEdit *DBEditGEBURTSDATUM;
	TDBEdit *DBEditNATIONALITAET;
	TDBEdit *DBEditVERTRAG;
	TDBEdit *DBEditGEBURTSORT;
	TDBEdit *DBEditEINSTIEG;
	TDBEdit *DBEditDAF_ERFAHRUNG;
	TLabel *Label16;
	TLabel *Label17;
	TLabel *LabelDAFErfahrungseit;
	TLabel *Label19;
	TLabel *Label20;
	TLabel *Label21;
	TLabel *Label22;
	TDBEdit *DBEditE_MAIL;
	TSpeedButton *SpeedButtonEmail;
	TTable *TableTeacher;
	TStringField *TableTeacherNACHNAME;
	TStringField *TableTeacherVORNAME;
	TStringField *TableTeacherWOHNUNG;
	TStringField *TableTeacherSTRASSE;
	TStringField *TableTeacherLAND;
	TStringField *TableTeacherPLZ;
	TStringField *TableTeacherORT;
	TStringField *TableTeacherANREDE;
	TStringField *TableTeacherTEL_PRIV;
	TStringField *TableTeacherTEL_BUERO;
	TStringField *TableTeacherTEL_MOBIL;
	TStringField *TableTeacherTEL_FAX;
	TStringField *TableTeacherE_MAIL;
	TDateTimeField *TableTeacherGEBURTSDATUM;
	TStringField *TableTeacherGEBURTSORT;
	TStringField *TableTeacherNATIONALITAET;
	TStringField *TableTeacherAKAD_TITEL;
	TDateTimeField *TableTeacherSV_ABSCHLUSS;
	TDateTimeField *TableTeacherDAF_ERFAHRUNG;
	TDateTimeField *TableTeacherEINSTIEG;
	TDateTimeField *TableTeacherVERTRAG;
	TMemoField *TableTeacherBEMERKUNG;
	TSplitter *Splitter1;
	TDBComboBox *DBComboBoxAnrede;
	TEdit *SearchEdit;
	TLabel *Label23;
	TStringField *TableTeacherGESCHLECHT;
	TDBRadioGroup *DBRadioGroupSex;
	TIntegerField *TableTeacherID;
	TStringField *TableTeacherBAMF_NUMMER;
	TLabel *LabelBAMFZulassungsnummer;
	TDBEdit *DBEditBAMF_NUMMER;
	TSpeedButton *SpeedButtonRefresh;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall ButtonCoursesClick(TObject *Sender);
	void __fastcall SpeedButtonEmailClick(TObject *Sender);
	void __fastcall TableTeacherBeforePost(TDataSet *DataSet);
	void __fastcall SearchEditChange(TObject *Sender);
	void __fastcall DBRadioGroupSexExit(TObject *Sender);
	void __fastcall TableTeacherAfterInsert(TDataSet *DataSet);
	void __fastcall SpeedButtonRefreshClick(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);
private:
	// private declarations
	void refreshDB( void );
public:
	// public declarations
	__fastcall TLehrerForm(TComponent *Owner);
};
//----------------------------------------------------------------------------
extern TLehrerForm *LehrerForm;
//----------------------------------------------------------------------------
#endif
