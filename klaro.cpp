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

#include "DafMain.h"

USERES("klaro.res");
USEFORM("DafMain.cpp", MainForm);
USEFORM("ZahlungFrm.cpp", ZahlungForm);
USEFORM("KursInfoFrm.cpp", KursInfoForm);
USEFORM("LehrerFrm.cpp", LehrerForm);
USEFORM("LehrerKursFrm.cpp", LehrerKursForm);
USEFORM("SchuelerFrm.cpp", SchuelerForm);
USEFORM("KursFrm.cpp", KursForm);
USEFORM("AboutFrm.cpp", AboutBox);
USEFORM("QuittungRp.cpp", QuittungReport);
USEFORM("..\GAKLIB\Repository\Config.cpp", ConfigDataModule); /* TDataModule: File Type */
USEFORM("..\GAKLIB\Repository\LicFrm.cpp", LicenceForm);
USEFORM("xmlExp.cpp", xmlDataModule); /* TDataModule: File Type */
USELIB("..\..\Object\gaklib\gaklib_bcb.lib");
USEFORM("AnwesenheitsFrm.cpp", AnwesenheitsForm);
USEFORM("StammdatenFrm.cpp", StammdatenForm);
USEFORM("FerienFrm.cpp", FerienForm);
USEFORM("PruefungenFrm.cpp", PruefungenForm);
USEFORM("SchuelerKursFrm.cpp", SchuelerKursForm);
USE("klaro.todo", ToDo);
USEFORM("LehrbuecherFrm.cpp", LehrbuecherForm);
USEFORM("KursBooksFrm.cpp", KursbooksForm);
USEFORM("LoginFrm.cpp", LoginForm);
USEFORM("KursplanFrm.cpp", KursplanForm);
USEFORM("SearchFrm.cpp", SearchForm);
USEFORM("KurswechslerFrm.cpp", KurswechslerForm);
USEFORM("AlleLehrzeitenFrm.cpp", AlleLehrzeitenForm);
USEFORM("PruefungsTeilnehmerFrm.cpp", PruefungsTeilnehmerForm);
USEFORM("OpenAccountsFrm.cpp", OpenAccountsForm);
USEFORM("OverlappedFrm.cpp", OverlappedForm);
USEFORM("LehrzeitenFrm.cpp", LehrzeitenForm);
USEFORM("AlleZahlungenFrm.cpp", AlleZahlungenForm);
USEFORM("csvExImportFrm.cpp", csvExImportForm);
USEFORM("SetupFrm.cpp", SetupForm);
USEFORM("EinladungenFrm.cpp", EinladungenForm);
//---------------------------------------------------------------------------
extern bool			MultiStart = false;
extern AnsiString	ReportBasePath = ".";
extern char			*registryKey = "\\Software\\CRESD\\Klaro";
//---------------------------------------------------------------------------
STRING	dbAliasName;

//---------------------------------------------------------------------------
static void saveActiveChild( void )
{
	TRegistry	*reg = new TRegistry;

	reg->OpenKey( registryKey, true );
	reg->WriteInteger( "ActiveChild", MainForm->ActiveMDIChild->Tag );
	reg->WriteInteger( "ActiveState", MainForm->ActiveMDIChild->WindowState );

	reg->CloseKey();

	delete reg;
}

static void reactivateChild( void )
{
	TForm			*theChild;
	int				i;

	int				theChildTag = 0;
	TWindowState	activeState = wsNormal;
	TRegistry		*reg = new TRegistry;

	if( reg->OpenKey( registryKey, false ) )
	{
		if( reg->ValueExists("ActiveChild") )
			theChildTag = reg->ReadInteger( "ActiveChild" );
		if( reg->ValueExists("ActiveState") )
			activeState = (TWindowState)reg->ReadInteger( "ActiveState" );

		reg->CloseKey();
	}
	delete reg;

	for( i=0; i<MainForm->MDIChildCount; i++ )
	{
		theChild = MainForm->MDIChildren[i];
		if( theChild->Tag == theChildTag )
		{
			theChild->BringToFront();
			theChild->SetFocus();
			theChild->WindowState = activeState;
			break;
		}
	}
}

WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR command, int)
{
	TRegistry	*reg = new TRegistry;

	reg->RootKey = HKEY_LOCAL_MACHINE;
	reg->Access = KEY_READ|KEY_EXECUTE;
	if( reg->OpenKey( registryKey, false ) )
	{
		if( reg->ValueExists( "MultiStart" ) )
			MultiStart = reg->ReadBool( "MultiStart" );
		if( reg->ValueExists( "ReportPath" ) )
			ReportBasePath = reg->ReadString( "ReportPath" );
		reg->CloseKey();
	}
	delete reg;

	if( ReportBasePath == "" )
		ReportBasePath = ".";
	else if( ReportBasePath[ReportBasePath.Length()] == '\\' )
		ReportBasePath.SetLength(ReportBasePath.Length()-1);

	dbAliasName = *command ? command : "KLARO";
	if( !MultiStart && FindWindow( "TApplication", "Klaro - DaF Kurse" ) )
	{
		MessageBox(
			NULL,
			"Klaro darf nicht zweimal auf dem gleichen Rechner "
			"gestartet werden.",
			"Klaro", MB_OK|MB_ICONWARNING
		);
		exit(0);
	}

	try
	{
		DateSeparator = '.';
		TimeSeparator = ':';
		ShortDateFormat = "dd/mm/yyyy";		// ensure 4 digit year
		LongDateFormat = "dd/mm/yyyy";		// ensure 4 digit year
		ShortTimeFormat = "hh:nn:ss";
		LongTimeFormat = "hh:nn:ss";

		Application->Initialize();
		Application->Title = "Klaro - DaF Kurse";

		Application->CreateForm(__classid(TMainForm), &MainForm);
		Application->CreateForm(__classid(TZahlungForm), &ZahlungForm);
		Application->CreateForm(__classid(TKursInfoForm), &KursInfoForm);
		Application->CreateForm(__classid(TLehrerForm), &LehrerForm);
		Application->CreateForm(__classid(TSchuelerForm), &SchuelerForm);
		Application->CreateForm(__classid(TKursForm), &KursForm);
		Application->CreateForm(__classid(TAboutBox), &AboutBox);
		Application->CreateForm(__classid(TQuittungReport), &QuittungReport);
		Application->CreateForm(__classid(TConfigDataModule), &ConfigDataModule);
		Application->CreateForm(__classid(TLicenceForm), &LicenceForm);
		Application->CreateForm(__classid(TxmlDataModule), &xmlDataModule);
		Application->CreateForm(__classid(TLehrerKursForm), &LehrerKursForm);
		Application->CreateForm(__classid(TAnwesenheitsForm), &AnwesenheitsForm);
		Application->CreateForm(__classid(TStammdatenForm), &StammdatenForm);
		Application->CreateForm(__classid(TFerienForm), &FerienForm);
		Application->CreateForm(__classid(TPruefungenForm), &PruefungenForm);
		Application->CreateForm(__classid(TSchuelerKursForm), &SchuelerKursForm);
		Application->CreateForm(__classid(TLehrbuecherForm), &LehrbuecherForm);
		Application->CreateForm(__classid(TKursbooksForm), &KursbooksForm);
		Application->CreateForm(__classid(TKursplanForm), &KursplanForm);
		Application->CreateForm(__classid(TSearchForm), &SearchForm);
		Application->CreateForm(__classid(TKurswechslerForm), &KurswechslerForm);
		Application->CreateForm(__classid(TAlleLehrzeitenForm), &AlleLehrzeitenForm);
		Application->CreateForm(__classid(TPruefungsTeilnehmerForm), &PruefungsTeilnehmerForm);
		Application->CreateForm(__classid(TOpenAccountsForm), &OpenAccountsForm);
		Application->CreateForm(__classid(TOverlappedForm), &OverlappedForm);
		Application->CreateForm(__classid(TLehrzeitenForm), &LehrzeitenForm);
		Application->CreateForm(__classid(TAlleZahlungenForm), &AlleZahlungenForm);
		Application->CreateForm(__classid(TcsvExImportForm), &csvExImportForm);
		Application->CreateForm(__classid(TSetupForm), &SetupForm);
		Application->CreateForm(__classid(TEinladungenForm), &EinladungenForm);
		reactivateChild();
		Application->Run();
		saveActiveChild();
	}
	catch (Exception &exception)
	{
		Application->ShowException(&exception);
	}
	return 0;
}
//---------------------------------------------------------------------------












