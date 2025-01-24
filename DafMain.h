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
#ifndef DafMainH
#define DafMainH
//---------------------------------------------------------------------------
#include <math.h>

#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Menus.hpp>
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include <ToolWin.hpp>
#include <Db.hpp>
#include <DBTables.hpp>
#include <ExtCtrls.hpp>

//---------------------------------------------------------------------------
extern AnsiString	ReportBasePath;
extern bool			MultiStart;
extern char			*registryKey;
//---------------------------------------------------------------------------
class TMainForm : public TForm
{
__published:	// IDE-managed Components
	TMainMenu *MainMenu;
	TMenuItem *Datei1;
	TMenuItem *Ende1;
	TMenuItem *Fenster1;
	TMenuItem *Anordnen1;
	TToolBar *ToolBar1;
	TStatusBar *StatusBar;
	TSpeedButton *SpeedButtonExit;
	TSpeedButton *SpeedButtonKurse;
	TSpeedButton *SpeedButtonSchueler;
	TSpeedButton *SpeedButtonLehrer;
	TMenuItem *Nebeneinander1;
	TMenuItem *Symboleanordnen1;
	TMenuItem *berKlaro1;
	TMenuItem *bereinander1;
	TDatabase *theDatabase;
	TMenuItem *N1;
	TMenuItem *Lizenz1;
	TTimer *theTimer;
	TMenuItem *Stammdaten1;
	TMenuItem *Ferien;
	TSpeedButton *SpeedButtonPruefungen;
	TMenuItem *Lehrbcher1;
	TMenuItem *Kursplan;
	TMenuItem *Auswertung2;
	TMenuItem *Kurswechsler;
	TMenuItem *Zahlungen;
	TMenuItem *OffeneZahlungen;
	TMenuItem *Ueberlappungen;
	TMenuItem *Lehrzeiten;
	TMenuItem *N2;
	TMenuItem *ExImport1;
	TMenuItem *Einstellungen1;
	TMenuItem *N3;
	TStoredProc *StoredProcUpdateData;
	TMenuItem *N4;
	TMenuItem *SRXReports1;
	void __fastcall Ende1Click(TObject *Sender);
	void __fastcall SpeedButtonKurseClick(TObject *Sender);
	void __fastcall SpeedButtonSchuelerClick(TObject *Sender);
	void __fastcall SpeedButtonLehrerClick(TObject *Sender);
	void __fastcall Anordnen1Click(TObject *Sender);
	void __fastcall Nebeneinander1Click(TObject *Sender);
	void __fastcall Symboleanordnen1Click(TObject *Sender);
	void __fastcall berKlaro1Click(TObject *Sender);
	void __fastcall bereinander1Click(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FormDestroy(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
	void __fastcall Lizenz1Click(TObject *Sender);
	void __fastcall theTimerTimer(TObject *Sender);
	void __fastcall FormActivate(TObject *Sender);
	void __fastcall AppWindowProc(TMessage &Sender);
	void __fastcall Stammdaten1Click(TObject *Sender);
	void __fastcall FerienClick(TObject *Sender);
	void __fastcall SpeedButtonPruefungenClick(TObject *Sender);
	void __fastcall Lehrbcher1Click(TObject *Sender);
	void __fastcall theDatabaseLogin(TDatabase *Database,
		  TStrings *LoginParams);
	void __fastcall KursplanClick(TObject *Sender);
	void __fastcall KurswechslerClick(TObject *Sender);
	void __fastcall ZahlungenClick(TObject *Sender);
	void __fastcall OffeneZahlungenClick(TObject *Sender);
	void __fastcall UeberlappungenClick(TObject *Sender);
	void __fastcall LehrzeitenClick(TObject *Sender);
	void __fastcall ExImport1Click(TObject *Sender);
	void __fastcall Einstellungen1Click(TObject *Sender);
	void __fastcall theDatabaseAfterConnect(TObject *Sender);
	void __fastcall SRXReportsClick(TObject *Sender);
private:	// User declarations
	TDateTime getRegistryDate( const char *valueName );
	void setRegistryDate( const char *valueName, TDateTime theDate );
	AnsiString	privateDir,
				privateLock,
				dbString,
				theOsUserName;
	int			sessionId;
	bool		bamfEnabled;
public:		// User declarations
	__fastcall TMainForm(TComponent* Owner);
	void ApplyChanges( TDBDataSet *theQuery );
	void checkLicence( void );

	TDateTime getRegistryStartDate( void )
	{
		return getRegistryDate( "startDate" );
	}
	TDateTime getRegistryEndDate( void )
	{
		return getRegistryDate( "endDate" );
	}
	void setRegistryStartDate( TDateTime theDate )
	{
		setRegistryDate( "startDate", theDate );
	}
	void setRegistryEndDate( TDateTime theDate )
	{
		setRegistryDate( "endDate", theDate );
	}

	void __fastcall updateOsbizData( void );
	AnsiString getOsUserName( void )
	{
		return theOsUserName;
	}

	bool isBamfEnabled( void ) const
	{
		return bamfEnabled;
	}

};
//---------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//---------------------------------------------------------------------------
bool OpenTable( TTable *table );
//---------------------------------------------------------------------------
inline TDateTime GetTime( TDateTime source )
{
	return source - floor( source );
}
inline TDateTime GetDate( TDateTime source )
{
	return floor( source );
}
//---------------------------------------------------------------------------
#endif
