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
#ifndef KursFrmH
#define KursFrmH
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
class TKursForm : public TForm
{
__published:
	TDataSource *DataSourceCourse;
	TPanel *Panel1;
	TDBGrid *DBGrid1;
	TTabSheet *TabSheetKurs;
	TPanel *Panel3;
	TButton *ButtonCourseInfo;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TDBEdit *DBEditNUMMER;
	TDBEdit *DBEditANFANGS_DATUM;
	TDBEdit *DBEditENDE_DATUM;
	TLabel *Label13;
	TLabel *Label4;
	TDBEdit *DBEditLEHRBUCH;
	TDBEdit *DBEditNIVEAU;
	TLabel *Label15;
	TLabel *Label14;
	TDBEdit *DBEditVORKURS;
	TDBEdit *DBEditRAUM;
	TLabel *LabelStaatlFoerderung;
	TLabel *Label5;
	TDBEdit *DBEditFOERDERUNG;
	TDBEdit *DBEditKURSGEBUEHR;
	TPageControl *Sheet;
	TTabSheet *TabSheetBemerkung;
	TDBMemo *DBMemoBEMERKUNG;
	TTable *TableCourse;
	TStringField *TableCourseJAHR;
	TStringField *TableCourseNUMMER;
	TDateTimeField *TableCourseANFANGS_DATUM;
	TDateTimeField *TableCourseENDE_DATUM;
	TFloatField *TableCourseUNTERRICHTSSTUNDEN;
	TFloatField *TableCourseWOCHENSTUNDEN;
	TFloatField *TableCourseTT_STUNDEN;
	TFloatField *TableCourseSOZ_PAED_STUNDEN;
	TStringField *TableCourseKURSTAGE;
	TStringField *TableCourseFEIERTAGE;
	TStringField *TableCourseVORKURS;
	TStringField *TableCourseNIVEAU;
	TStringField *TableCourseLEHRBUCH;
	TStringField *TableCourseRAUM;
	TFloatField *TableCourseKURSGEBUEHR;
	TFloatField *TableCourseFOERDERUNG;
	TMemoField *TableCourseBEMERKUNG;
	TPanel *Panel2;
	TLabel *LabelYear;
	TDBNavigator *DBNavigator;
	TUpDown *YearSelectUpDown;
	TSplitter *Splitter1;
	TLabel *Label16;
	TEdit *SearchEdit;
	TButton *ButtonAttendance;
	TIntegerField *TableCourseID;
	TLabel *Label17;
	TDBComboBox *DBComboBoxKURSTYP;
	TDBComboBox *DBComboBoxKURSABSCHNITT;
	TLabel *Label18;
	TStringField *TableCourseKURSTYP;
	TStringField *TableCourseKURSABSCHNITT;
	TLabel *Label19;
	TDBComboBox *DBComboBoxKURSART;
	TStringField *TableCourseKURSART;
	TTabSheet *TabSheetUnterrichtszeiten;
	TScrollBox *ScrollBox1;
	TLabel *Label21;
	TDateTimeField *TableCourseDI_ANF;
	TDateTimeField *TableCourseDI_END;
	TDateTimeField *TableCourseDI_PAUS_ANF;
	TDateTimeField *TableCourseDI_PAUS_END;
	TDateTimeField *TableCourseMI_ANF;
	TDateTimeField *TableCourseMI_END;
	TDateTimeField *TableCourseMI_PAUS_ANF;
	TDateTimeField *TableCourseMI_PAUS_END;
	TDateTimeField *TableCourseDO_ANF;
	TDateTimeField *TableCourseDO_END;
	TDateTimeField *TableCourseDO_PAUS_ANF;
	TDateTimeField *TableCourseDO_PAUS_END;
	TDateTimeField *TableCourseFR_ANF;
	TDateTimeField *TableCourseFR_END;
	TDateTimeField *TableCourseFR_PAUS_ANF;
	TDateTimeField *TableCourseFR_PAUS_END;
	TDateTimeField *TableCourseSA_ANF;
	TDateTimeField *TableCourseSA_END;
	TDateTimeField *TableCourseSA_PAUS_ANF;
	TDateTimeField *TableCourseSA_PAUS_END;
	TDateTimeField *TableCourseSO_ANF;
	TDateTimeField *TableCourseSO_END;
	TDateTimeField *TableCourseSO_PAUS_ANF;
	TDateTimeField *TableCourseSO_PAUS_END;
	TDateTimePicker *DateTimePickerMO_ANF;
	TDateTimePicker *DateTimePickerDI_ANF;
	TDateTimePicker *DateTimePickerMI_ANF;
	TDateTimePicker *DateTimePickerDO_ANF;
	TDateTimePicker *DateTimePickerFR_ANF;
	TDateTimePicker *DateTimePickerSA_ANF;
	TLabel *Label22;
	TLabel *Label23;
	TLabel *Label24;
	TLabel *Label25;
	TLabel *Label26;
	TLabel *Label27;
	TLabel *Label28;
	TDateTimePicker *DateTimePickerSO_ANF;
	TDateTimePicker *DateTimePickerMO_END;
	TDateTimePicker *DateTimePickerDI_END;
	TDateTimePicker *DateTimePickerMI_END;
	TDateTimePicker *DateTimePickerDO_END;
	TDateTimePicker *DateTimePickerFR_END;
	TDateTimePicker *DateTimePickerSA_END;
	TDateTimePicker *DateTimePickerSO_END;
	TDateTimePicker *DateTimePickerMO_PAUS_ANF;
	TDateTimePicker *DateTimePickerDI_PAUS_ANF;
	TDateTimePicker *DateTimePickerMI_PAUS_ANF;
	TDateTimePicker *DateTimePickerDO_PAUS_ANF;
	TDateTimePicker *DateTimePickerFR_PAUS_ANF;
	TDateTimePicker *DateTimePickerSA_PAUS_ANF;
	TDateTimePicker *DateTimePickerSO_PAUS_ANF;
	TDateTimePicker *DateTimePickerMO_PAUS_END;
	TDateTimePicker *DateTimePickerDI_PAUS_END;
	TDateTimePicker *DateTimePickerMI_PAUS_END;
	TDateTimePicker *DateTimePickerDO_PAUS_END;
	TDateTimePicker *DateTimePickerFR_PAUS_END;
	TDateTimePicker *DateTimePickerSA_PAUS_END;
	TDateTimePicker *DateTimePickerSO_PAUS_END;
	TLabel *Label29;
	TDateTimeField *TableCourseMO_ANF;
	TDateTimeField *TableCourseMO_END;
	TDateTimeField *TableCourseMO_PAUS_ANF;
	TDateTimeField *TableCourseMO_PAUS_END;
	TLabel *Label11;
	TLabel *Label12;
	TLabel *Label7;
	TLabel *Label8;
	TLabel *LabelTeamteacherst;
	TLabel *LabelSozpaedSt;
	TDBEdit *DBEditKURSTAGE;
	TDBMemo *DBMemoFEIERTAGE;
	TDBEdit *DBEditUNTERRICHTSSTUNDEN;
	TDBEdit *DBEditWOCHENSTUNDEN;
	TDBEdit *DBEditTT_STUNDEN;
	TDBEdit *DBEditSOZ_PAED_STUNDEN;
	TBevel *Bevel1;
	TLabel *Label31;
	TFloatField *TableCourseUMSATZSTEUER;
	TDBComboBox *DBComboBoxUMSATZSTEUER;
	TButton *ButtonBuecher;
	TStringField *TableCourseHALBJAHR;
	TStringField *TableCourseBAMF_NUMMER;
	TDBEdit *DBEditBAMF_NUMMER;
	TLabel *LabelBAMFNummer;
	TStringField *TableCourseKURSNUMMER;
	TButton *ButtonLehrzeiten;
	TSpeedButton *SpeedButtonRefresh;
	TMemoField *TableCourseZEIT_BEMERKUNG;
	TDBMemo *DBMemoZEIT_BEMERKUNG;
	TLabel *Label30;
	TComboBox *ComboBoxSemester;
	TDateTimeField *TableCourseAENDERUNGSDATUM;
	TStringField *TableCourseAENDERUNG_VON;
	TDBText *DBTextAENDERUNG_VON;
	TDBText *DBTextAENDERUNGSDATUM;
	TQuery *QueryKursart;
	TStringField *QueryKursartKURSART;
	TQuery *QueryKurstyp;
	TStringField *QueryKurstypKURSTYP;
	TButton *ButtonInvitations;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall ButtonCourseInfoClick(TObject *Sender);
	void __fastcall DBEditANFANGS_DATUMChange(TObject *Sender);
	void __fastcall YearSelectUpDownChangingEx(TObject *Sender, bool &AllowChange,
          short NewValue, TUpDownDirection Direction);
	void __fastcall TableCourseBeforePost(TDataSet *DataSet);
	void __fastcall SearchEditChange(TObject *Sender);
	void __fastcall ButtonAttendanceClick(TObject *Sender);
	void __fastcall TableCourseAfterInsert(TDataSet *DataSet);
	void __fastcall TableCourseRefreshTimes(TDataSet *DataSet);
	void __fastcall DateTimePickerChange(TObject *Sender);
	void __fastcall ButtonBuecherClick(TObject *Sender);
	void __fastcall TableCourseCalcFields(TDataSet *DataSet);
	void __fastcall ButtonLehrzeitenClick(TObject *Sender);
	void __fastcall SpeedButtonRefreshClick(TObject *Sender);
	void __fastcall ComboBoxSemesterChange(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);
	void __fastcall ButtonInvitationsClick(TObject *Sender);
private:
	TDateTimePicker *timePickers[4][7];
	// private declarations
	void refreshDB( void );
	void setYearField( void );
	void setYearFilter( short year, int semester );

public:
	// public declarations
	__fastcall TKursForm(TComponent *Owner);
};
//----------------------------------------------------------------------------
extern TKursForm *KursForm;
//----------------------------------------------------------------------------
#endif
 