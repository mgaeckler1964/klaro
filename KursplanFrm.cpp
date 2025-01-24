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

#include <fstream.h>

#include <vcl.h>

#include <gak/string.h>

#pragma hdrstop

#include "KursplanFrm.h"
#include "DafMain.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TKursplanForm *KursplanForm;
//---------------------------------------------------------------------------
__fastcall TKursplanForm::TKursplanForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TKursplanForm::ButtonCancelClick(TObject *)
{
	Close();
}
//---------------------------------------------------------------------------
void __fastcall TKursplanForm::ButtonOKClick(TObject *)
{
	MainForm->checkLicence();

	AnsiString	anfang, ende;
	STRING		csvDest = Session->PrivateDir.c_str();
	TQuery		*theCourses = new TQuery( this );

	theCourses->DatabaseName = "KlaroDB";
	theCourses->SQL->Add( "select * from kurse" );
	theCourses->SQL->Add( "where anfangs_datum >= :theStart" );
	theCourses->SQL->Add( "and anfangs_datum <= :theEnd" );

	if( EditRaum->Text > "" )
		theCourses->SQL->Add( "and raum = '" + EditRaum->Text + "'" );

	if( EditTeacher->Text > "" )
		theCourses->SQL->Add(
			"and exists ( select * from kurslehrer, lehrer "
				"where kurslehrer.lehrer_id = lehrer.id "
				"and lehrer.nachname = '" + EditTeacher->Text + "' "
				"and kurslehrer.kurs_id = kurse.id"
			")" );

	theCourses->SQL->Add( "order by anfangs_datum, nummer" );

	csvDest += "\\Kursplan.csv";

	ofstream	fStream( csvDest );
	if( fStream.is_open() )
	{
		theCourses->Params->Items[0]->AsDateTime = DateTimePickerStart->Date;
		theCourses->Params->Items[1]->AsDateTime = DateTimePickerEnd->Date;
		theCourses->Open();
		fStream << "Kursplan vom " << DateTimePickerStart->Date.DateString().c_str() << " bis " << DateTimePickerEnd->Date.DateString().c_str();
		if( EditTeacher->Text > "" )
			fStream << " für " << EditTeacher->Text.c_str();

		fStream << '\n';
		fStream << "Kurs,Raum,Anfang,Ende,Montag,Dienstag,Mittwoch,Donnerstag,Freitag,Samsag,Sonntag\n";
		while( !theCourses->Eof )
		{
			fStream <<
				theCourses->FieldByName( "NUMMER" )->AsString.c_str() << ',' <<
				theCourses->FieldByName( "RAUM" )->AsString.c_str() << ',' <<
				theCourses->FieldByName( "ANFANGS_DATUM" )->AsString.c_str() << ',' <<
				theCourses->FieldByName( "ENDE_DATUM" )->AsString.c_str() << ',';

			anfang = theCourses->FieldByName( "MO_ANF" )->AsDateTime.TimeString().c_str();
			ende   = theCourses->FieldByName( "MO_END" )->AsDateTime.TimeString().c_str();
			if( anfang != ende )
				fStream << anfang.c_str() << '-' << ende.c_str();
			fStream << ',';

			anfang = theCourses->FieldByName( "DI_ANF" )->AsDateTime.TimeString().c_str();
			ende   = theCourses->FieldByName( "DI_END" )->AsDateTime.TimeString().c_str();
			if( anfang != ende )
				fStream << anfang.c_str() << '-' << ende.c_str();
			fStream << ',';

			anfang = theCourses->FieldByName( "MI_ANF" )->AsDateTime.TimeString().c_str();
			ende   = theCourses->FieldByName( "MI_END" )->AsDateTime.TimeString().c_str();
			if( anfang != ende )
				fStream << anfang.c_str() << '-' << ende.c_str();
			fStream << ',';

			anfang = theCourses->FieldByName( "DO_ANF" )->AsDateTime.TimeString().c_str();
			ende   = theCourses->FieldByName( "DO_END" )->AsDateTime.TimeString().c_str();
			if( anfang != ende )
				fStream << anfang.c_str() << '-' << ende.c_str();
			fStream << ',';

			anfang = theCourses->FieldByName( "FR_ANF" )->AsDateTime.TimeString().c_str();
			ende   = theCourses->FieldByName( "FR_END" )->AsDateTime.TimeString().c_str();
			if( anfang != ende )
				fStream << anfang.c_str() << '-' << ende.c_str();
			fStream << ',';

			anfang = theCourses->FieldByName( "SA_ANF" )->AsDateTime.TimeString().c_str();
			ende   = theCourses->FieldByName( "SA_END" )->AsDateTime.TimeString().c_str();
			if( anfang != ende )
				fStream << anfang.c_str() << '-' << ende.c_str();
			fStream << ',';

			anfang = theCourses->FieldByName( "SO_ANF" )->AsDateTime.TimeString().c_str();
			ende   = theCourses->FieldByName( "SO_END" )->AsDateTime.TimeString().c_str();
			if( anfang != ende )
				fStream << anfang.c_str() << '-' << ende.c_str();
			fStream << ',';

			fStream << '\n';
			theCourses->Next();
		}
		theCourses->Close();

		fStream.close();

		ShellExecute( NULL, "open", csvDest, "", "", SW_SHOW );
	}

	delete theCourses;
	Close();
}
//---------------------------------------------------------------------------
void __fastcall TKursplanForm::FormHide(TObject *)
{
	MainForm->setRegistryStartDate( DateTimePickerStart->Date );
	MainForm->setRegistryEndDate( DateTimePickerEnd->Date );
}
//---------------------------------------------------------------------------

void __fastcall TKursplanForm::FormShow(TObject *)
{
	DateTimePickerStart->Date = MainForm->getRegistryStartDate();
	DateTimePickerEnd->Date = MainForm->getRegistryEndDate();
}
//---------------------------------------------------------------------------

