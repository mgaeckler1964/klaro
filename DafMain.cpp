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
#include <vcl.h>
#include <vcl/registry.hpp>

#include <gak/string.h>

#pragma hdrstop

#include <dir.h>
#include <io.h>

#include "DafMain.h"
#include "KursFrm.h"
#include "SchuelerFrm.h"
#include "LehrerFrm.h"
#include "PruefungenFrm.h"
#include "AboutFrm.h"
#include "StammdatenFrm.h"
#include "FerienFrm.h"
#include "LehrbuecherFrm.h"
#include "LoginFrm.h"
#include "KursplanFrm.h"
#include "KurswechslerFrm.h"
#include "AlleZahlungenFrm.h"
#include "OpenAccountsFrm.h"
#include "OverlappedFrm.h"
#include "AlleLehrzeitenFrm.h"
#include "csvExImportFrm.h"
#include "SetupFrm.h"

#include "config.h"
#include "LicFrm.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

TMainForm		*MainForm;
extern STRING	dbAliasName;

#define OLD_LICENCE_CODE	17021965L
#define LICENCE_CODE		27092001L

//---------------------------------------------------------------------------
__fastcall TMainForm::TMainForm(TComponent* Owner)
	: TForm(Owner)
{
	bamfEnabled = false;
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Ende1Click(TObject *)
{
	Close();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::SpeedButtonKurseClick(TObject *)
{
	KursForm->Show();
	KursForm->BringToFront();
	if( KursForm->WindowState == wsMinimized )
		KursForm->WindowState = wsNormal;
	KursForm->SetFocus();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::SpeedButtonPruefungenClick(TObject *)
{
	PruefungenForm->Show();
	PruefungenForm->BringToFront();
	if( PruefungenForm->WindowState == wsMinimized )
		PruefungenForm->WindowState = wsNormal;
	PruefungenForm->SetFocus();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::SpeedButtonSchuelerClick(TObject *)
{
	SchuelerForm->Show();
	SchuelerForm->BringToFront();
	if( SchuelerForm->WindowState == wsMinimized )
		SchuelerForm->WindowState = wsNormal;
	SchuelerForm->SetFocus();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::SpeedButtonLehrerClick(TObject *)
{
	LehrerForm->Show();
	LehrerForm->BringToFront();
	if( LehrerForm->WindowState == wsMinimized )
		LehrerForm->WindowState = wsNormal;
	LehrerForm->SetFocus();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::Anordnen1Click(TObject *)
{
	Cascade();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::Nebeneinander1Click(TObject *)
{
	TileMode = tbVertical;
	Tile();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::Symboleanordnen1Click(TObject *)
{
	ArrangeIcons();
}
//---------------------------------------------------------------------------


void __fastcall TMainForm::berKlaro1Click(TObject *)
{
	AboutBox->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::bereinander1Click(TObject *)
{
	TileMode = tbHorizontal;
	Tile();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::FormCreate(TObject *)
{
	WindowProc = AppWindowProc;

	const char	*temp;

	Caption = Application->Title;

	privateLock = "";
	privateDir = "C:\\";

	if( (temp=getenv("TEMP")) != NULL )
		privateDir = temp;
	if( privateDir[privateDir.Length()] != '\\' )
		privateDir += '\\';

	privateDir += "Klaro";
	if( MultiStart )
	{
		char buffer[128];
		sprintf( buffer, "%d", (int)GetCurrentProcessId() );
		privateDir += buffer;
	}

	mkdir( privateDir.c_str() );
	privateLock = privateDir;
	privateLock += "\\klaro.lck";
	if( !access( privateLock.c_str(), 00 ) )
	{
		AnsiString	errorText = "Lockdatei\n";
		errorText += privateLock;
		errorText += "\nexisitert bereits.\n"
			"Klaro kann nicht zweimal gestartet werden";
		Application->MessageBox(
			errorText.c_str(),
			"Fehler", MB_ICONSTOP
		);
		privateLock = "";
		exit(1);
	}

	FILE	*fp = fopen( privateLock.c_str(), "w" );
	if( !fp )
	{
		Application->MessageBox(
			"Lockdatei kann nicht erzeugt werden.", "Fehler", MB_ICONSTOP
		);
		privateLock = "";
		exit(1);
	}
	else
		fclose( fp );

	Session->PrivateDir = privateDir;

	theDatabase->AliasName = (const char*)dbAliasName;

	try
	{
		theDatabase->Open();
		if( dbString.Length() == 0 )
		{
			dbString = theDatabase->Params->Values["USER NAME"];
			dbString += '/';
			dbString += theDatabase->Params->Values["PASSWORD"];
			dbString += '@';
			dbString += theDatabase->AliasName;
		}

	}
	catch( Exception &e )
	{
		STRING	msg = "Keine Verbindung zu Datenbank möglich\n";
		msg += e.Message.c_str();
		Application->MessageBox(
			msg, "Fehler", MB_ICONSTOP
		);
		exit( 1 );
	}
	catch( ... )
	{
		Application->MessageBox(
			"Keine Verbindung zu Datenbank möglich\nUnbekannter Fehler",
			"Fehler", MB_ICONSTOP
		);
		exit( 1 );
	}

	STRING bamfNr = ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_bamf_nr", "" );
	bamfEnabled = !bamfNr.isEmpty();
}

//---------------------------------------------------------------------------
void __fastcall TMainForm::FormDestroy(TObject *)
{
	theDatabase->Close();
	Session->Close();

	if( privateLock.Length() )
		remove( privateLock.c_str() );

	rmdir(privateDir.c_str());
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::FormShow(TObject *)
{
	int		sessionCount;

	try
	{
		sessionId = ConfigDataModule->CreateSession( theDatabase, &sessionCount );
	}
	catch( Exception &e )
	{
		Application->MessageBox( "Kann Session nicht erzeugen.", "Fehler", MB_ICONSTOP );
		Application->MessageBox( e.Message.c_str(), "Fehler", MB_ICONSTOP );
		Application->Terminate();
/*@*/	return;
	}
	LicenceForm->readLicence( "Klaro", LICENCE_CODE );
	if( !LicenceForm->checkLicence( LICENCE_CODE ) )
		LicenceForm->ShowModal();

	if( !LicenceForm->checkLicence( LICENCE_CODE ) )
	{
		ConfigDataModule->DeleteSession( theDatabase, sessionId );
		Close();
/*@*/	return;
	}

	while( true )
	{
		AnsiString	tmp, product = LicenceForm->productEdit->Text;
		AnsiString	error = "";
		int			dashPos = product.LastDelimiter( "-" );

		if( dashPos > 0 )
		{
			int	maxSessCount =
				product.SubString( dashPos+1, product.Length() - dashPos ).ToInt();
			if( maxSessCount < sessionCount )
				error = "Maximale Anzahl an Arbeitsstationen im Netz erreicht.";

			product = product.SubString( 1, dashPos-1 );
		}

		dashPos = product.LastDelimiter( "-" );
		if( dashPos > 0 )
		{
			AnsiString		dateStr = product.SubString( dashPos+1, product.Length() - dashPos );
			int				lastMonth, lastYear;

			sscanf( dateStr.c_str(), "%d:%d", &lastMonth, &lastYear );

			TDateTime		now = TDateTime::CurrentDate();
			unsigned short	thisYear, thisMonth, dummy;
			now.DecodeDate( &thisYear, &thisMonth, &dummy );

			if( thisYear > lastYear
			|| (thisYear == lastYear && thisMonth > lastMonth) )
			{
				error = "Testlizenz abgelaufen";
			}

			product = product.SubString( 1, dashPos-1 );
		}

		if( product != "KlaroSQL" && product != "Klaro" )
			error = "Falscher Produktcode";
		else if( product != "KlaroSQL" && theDatabase->IsSQLBased )
			error = "Keine gültige Lizenz für die Verwendung dieser Datenbank";

		if( error.Length() )
		{
			Application->MessageBox(
				error.c_str(), "Fehler", MB_ICONSTOP
			);
			if( LicenceForm->ShowModal() == mrOk )
/*^*/			continue;
			else
			{
				ConfigDataModule->DeleteSession( theDatabase, sessionId );
				Close();
/*@*/			return;
			}
		}
		break;
	}

	theTimer->Enabled = true;

	TMenuItem	*newMenu;
	TSearchRec	fileData;

	AnsiString	searchPattern = ReportBasePath;
	searchPattern += "\\srx_reports\\*.srx";

	if( !FindFirst( searchPattern, 0, fileData ) ) do
	{
		newMenu = new TMenuItem( this );
		newMenu->AutoHotkeys = maManual;
		newMenu->Caption = fileData.Name;
		newMenu->RadioItem = true;
		newMenu->OnClick = SRXReportsClick;

		SRXReports1->Add( newMenu );
	} while( !FindNext( fileData ) );

	FindClose( fileData );

	char		userName[256];
	DWORD		size = sizeof( userName ) -1;

	GetUserName( userName, &size );
	theOsUserName = userName;
}

//---------------------------------------------------------------------------

void __fastcall TMainForm::FormClose(TObject *, TCloseAction &)
{
	if( theTimer->Enabled )
	{
		theTimer->Enabled = false;
		ConfigDataModule->DeleteSession( theDatabase, sessionId );
	}
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::Lizenz1Click(TObject *)
{
	LicenceForm->ShowModal();
}
//---------------------------------------------------------------------------
void TMainForm::checkLicence(void)
{
#ifndef _DEBUG
	if( !ConfigDataModule->IsSessionThere( theDatabase, sessionId ) )
	{
		Application->MessageBox( "Lizenz abgelaufen.", "Fehler", MB_ICONSTOP );
		Close();
		Application->Terminate();
	}
#endif
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::theTimerTimer(TObject *)
{
	checkLicence();
	theTimer->Enabled = true;
}
//---------------------------------------------------------------------------
void TMainForm::ApplyChanges( TDBDataSet *theQuery )
{
	theDatabase->TransIsolation = tiDirtyRead;
	Boolean	inTransaction = theDatabase->InTransaction;

	if( !inTransaction )
		theDatabase->StartTransaction();
	try
	{
		if( !theDatabase->IsSQLBased )
			theQuery->FlushBuffers();

		theQuery->ApplyUpdates(); // try to write the updates to the database
		if( !inTransaction )
			theDatabase->Commit(); // on success, commit the changes;

		theQuery->CommitUpdates(); // try to write the updates to the database
	}
	catch (...)
	{
		if( !inTransaction )
			theDatabase->Rollback(); // on failure, undo the changes

		theQuery->CancelUpdates();
	}

	if( !theDatabase->IsSQLBased )
		theQuery->Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::FormActivate(TObject *)
{
	DateSeparator = '.';
	TimeSeparator = ':';
	ShortDateFormat = "dd/mm/yyyy";		// ensure 4 digit year
	LongDateFormat = "dd/mm/yyyy";		// ensure 4 digit year
	ShortTimeFormat = "hh:nn:ss";
	LongTimeFormat = "hh:nn:ss";
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::AppWindowProc(TMessage &msg)
{
	if( msg.Msg == WM_QUERYENDSESSION )
	{
		if( theTimer->Enabled )
		{
			theTimer->Enabled = false;
			ConfigDataModule->DeleteSession( theDatabase, sessionId );
		}

/*
		msg.Result = FALSE;
		Application->MessageBox(
			"Bitte beenden Sie vorher die Klaro.", "Klaro", 0
		);

		ShowWindow( Application->Handle, SW_SHOW );
		Application->Restore();
		Activate();
		SetFocus();
		Show();
*/
///***/	return;
	}

	WndProc( msg );
}

//---------------------------------------------------------------------------

void __fastcall TMainForm::Stammdaten1Click(TObject *)
{
	StammdatenForm->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::FerienClick(TObject *)
{
	FerienForm->ShowModal();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Lehrbcher1Click(TObject *)
{
	LehrbuecherForm->ShowModal();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::theDatabaseLogin(TDatabase *, TStrings *LoginParams)
{
	TRegistry	*reg = new TRegistry;
	int			dbCredcentials = 0;

	AnsiString	userName = LoginParams->Values["USER NAME"];
	AnsiString	password = LoginParams->Values["PASSWORD"];

	LoginForm = new TLoginForm( this );

	reg->OpenKey( registryKey, false );

	if( reg->ValueExists( "dbCredcentials" ) )
		dbCredcentials = reg->ReadInteger( "dbCredcentials" );

	if( dbCredcentials )
	{
		if( userName == "" || reg->ValueExists( "dbUsername" ) )
			userName = reg->ReadString( "dbUsername" );
		if( password == "" || reg->ValueExists( "dbPassword" ) )
			password = reg->ReadString( "dbPassword" );

		LoginForm->CheckBoxSavePassword->Checked = true;
	}
	else
		LoginForm->CheckBoxSavePassword->Checked = false;

	reg->CloseKey();

	LoginForm->EditUsername->Text = userName;
	LoginForm->EditPassword->Text = password;

	if( LoginForm->ShowModal() == mrOk )
	{
		userName = LoginForm->EditUsername->Text;
		password = LoginForm->EditPassword->Text;

		LoginParams->Values["USER NAME"] = userName;
		LoginParams->Values["PASSWORD"] = password;

		dbString = userName;
		dbString += '/';
		dbString += password;
		dbString += '@';
		dbString += theDatabase->AliasName;

		reg->OpenKey( registryKey, true );
		if( LoginForm->CheckBoxSavePassword->Checked )
		{
			reg->WriteInteger( "dbCredcentials", 1 );
			reg->WriteString( "dbUsername", userName );
			reg->WriteString( "dbPassword", password );
		}
		else
		{
			reg->WriteInteger( "dbCredcentials", 0 );
			reg->WriteString( "dbUsername", "" );
			reg->WriteString( "dbPassword", "" );
		}
		reg->CloseKey();

	}

	delete LoginForm;
	delete reg;
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::KursplanClick(TObject *)
{
	MainForm->checkLicence();
	KursplanForm->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::KurswechslerClick(TObject *)
{
	MainForm->checkLicence();
	KurswechslerForm->Show();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::ZahlungenClick(TObject *)
{
	MainForm->checkLicence();
	AlleZahlungenForm->Show();
}
//---------------------------------------------------------------------------
TDateTime TMainForm::getRegistryDate( const char *valueName )
{
	TDateTime	theDate = TDateTime::CurrentDate();
	TRegistry	*reg = new TRegistry;

	if( reg->OpenKey( registryKey, false )
	&& reg->ValueExists( valueName ) )
		theDate = reg->ReadDate( valueName );

	reg->CloseKey();

	delete reg;

	return GetDate( theDate );
}
//---------------------------------------------------------------------------
void TMainForm::setRegistryDate( const char *valueName, TDateTime theDate )
{
	TRegistry	*reg = new TRegistry;

	if( reg->OpenKey( registryKey, true ) )
		reg->WriteDate( valueName, theDate );

	reg->CloseKey();

	delete reg;
}
//---------------------------------------------------------------------------

bool OpenTable( TTable *table )
{
	bool	openFailed;
	try
	{
		openFailed = false;
		table->Open();
	}
	catch( ... )
	{
		openFailed = true;
	}
	try
	{
		if( openFailed && table->IndexName > "" )
		{
			AnsiString	newIndexName = "KLARO.";
			newIndexName += table->IndexName;
			table->IndexName = newIndexName;
/*
			AnsiString	newTableName = "KLARO.";
			newTableName += table->TableName;
			table->TableName = newTableName;
*/
			openFailed = false;
			table->Open();
		}
	}
	catch( ... )
	{
		openFailed = true;
	}
	try
	{
		if( openFailed && table->IndexName > "" )
		{
			table->IndexName = "";
			openFailed = false;
			table->Open();
		}
	}
	catch( ... )
	{
		openFailed = true;
		throw;
	}

	return openFailed;
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::OffeneZahlungenClick(TObject *)
{
	MainForm->checkLicence();
	OpenAccountsForm->Show();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::UeberlappungenClick(TObject *)
{
	MainForm->checkLicence();
	OverlappedForm->Show();
}
//---------------------------------------------------------------------------


void __fastcall TMainForm::LehrzeitenClick(TObject *)
{
	MainForm->checkLicence();
	AlleLehrzeitenForm->Show();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::ExImport1Click(TObject *)
{
	MainForm->checkLicence();
	csvExImportForm->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::Einstellungen1Click(TObject *)
{
	SetupForm->ShowModal();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::updateOsbizData( void )
{
	if( theDatabase->IsSQLBased )
	{
		try
		{
			StoredProcUpdateData->ExecProc();
		}
		catch( ... )
		{
			// ignore
		}
	}
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::theDatabaseAfterConnect(TObject *)
{
	updateOsbizData();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::SRXReportsClick(TObject *Sender)
{
	AnsiString	srxCmd = "srxViewer.exe \"";

	srxCmd += dbString;
	srxCmd += "\" \"";
	srxCmd += ReportBasePath;
	srxCmd += "\\srx_reports\\";
	srxCmd += ((TMenuItem*)Sender)->Caption;
	srxCmd += '\"';

	WinExec( srxCmd.c_str(), SW_SHOW );
}
//---------------------------------------------------------------------------

