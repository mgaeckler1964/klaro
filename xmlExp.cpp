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
#include <gak/gaklib.h>
#include <gak/xml.h>
#include <gak/vcl_tools.h>

#pragma hdrstop

#include "xmlExp.h"
#include "config.h"
#include "DafMain.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TxmlDataModule *xmlDataModule;
//---------------------------------------------------------------------------
__fastcall TxmlDataModule::TxmlDataModule(TComponent* Owner)
	: TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void TxmlDataModule::fillLessonTime( TQuery *query, double lessonTime[7] )
{
	lessonTime[0] = (double)(query->FieldByName( "SO_END" )->AsDateTime - query->FieldByName( "SO_ANF" )->AsDateTime - query->FieldByName( "SO_PAUS_END" )->AsDateTime + query->FieldByName( "SO_PAUS_ANF" )->AsDateTime) *32;
	lessonTime[1] = (double)(query->FieldByName( "MO_END" )->AsDateTime - query->FieldByName( "MO_ANF" )->AsDateTime - query->FieldByName( "MO_PAUS_END" )->AsDateTime + query->FieldByName( "MO_PAUS_ANF" )->AsDateTime) *32;
	lessonTime[2] = (double)(query->FieldByName( "DI_END" )->AsDateTime - query->FieldByName( "DI_ANF" )->AsDateTime - query->FieldByName( "DI_PAUS_END" )->AsDateTime + query->FieldByName( "DI_PAUS_ANF" )->AsDateTime) *32;
	lessonTime[3] = (double)(query->FieldByName( "MI_END" )->AsDateTime - query->FieldByName( "MI_ANF" )->AsDateTime - query->FieldByName( "MI_PAUS_END" )->AsDateTime + query->FieldByName( "MI_PAUS_ANF" )->AsDateTime) *32;
	lessonTime[4] = (double)(query->FieldByName( "DO_END" )->AsDateTime - query->FieldByName( "DO_ANF" )->AsDateTime - query->FieldByName( "DO_PAUS_END" )->AsDateTime + query->FieldByName( "DO_PAUS_ANF" )->AsDateTime) *32;
	lessonTime[5] = (double)(query->FieldByName( "FR_END" )->AsDateTime - query->FieldByName( "FR_ANF" )->AsDateTime - query->FieldByName( "FR_PAUS_END" )->AsDateTime + query->FieldByName( "FR_PAUS_ANF" )->AsDateTime) *32;
	lessonTime[6] = (double)(query->FieldByName( "SA_END" )->AsDateTime - query->FieldByName( "SA_ANF" )->AsDateTime - query->FieldByName( "SA_PAUS_END" )->AsDateTime + query->FieldByName( "SA_PAUS_ANF" )->AsDateTime) *32;
}

//---------------------------------------------------------------------------

void TxmlDataModule::addPupilCoursesXML( XML_ANY *theCourses, int pupil_id )
{
	double		lessonTime[7];

	CoursePupilQuery->ParamByName( "thePupil" )->AsInteger = pupil_id;
	CoursePupilQuery->Open();

	while( !CoursePupilQuery->Eof )
	{
		XML_ANY *theCourse = (XML_ANY *)theCourses->addObject( makeQueryXML( CoursePupilQuery, "kurs", 2 ) );
		XML_ANY *bemerkung = (XML_ANY*)theCourse->getElement( "bemerkung" );
		if( bemerkung )
			bemerkung->setTag( "kurs_bemerkung" );



		XML_ANY *payments = makePaymentXML(
			pupil_id,
			CoursePupilQuery->FieldByName( "ID" )->AsInteger
		);
		if( payments )
			theCourse->addObject( payments );

		fillLessonTime( CoursePupilQuery, lessonTime );

		makePresenceXML(
			theCourse,
			CoursePupilQuery->FieldByName( "ANFANGS_DATUM" )->AsDateTime,
			CoursePupilQuery->FieldByName( "ENDE_DATUM" )->AsDateTime,
			lessonTime,
			pupil_id,
			CoursePupilQuery->FieldByName( "ID" )->AsInteger
		);

		CoursePupilQuery->Next();
	}

	CoursePupilQuery->Close();
}
//---------------------------------------------------------------------------
void TxmlDataModule::exportTestXML( int test_id, const char *sourcePath, const char *selXsl )
{
	STRING		xmlDest = Session->PrivateDir.c_str();
	STRING		dtdDest, xslDest;
	STRING		source;

	xmlDest += "\\";
	dtdDest = xmlDest;
	dtdDest += "test.dtd";


	if( selXsl && *selXsl && *selXsl != '<' )
	{
		xslDest = xmlDest;
		xslDest += selXsl;

		STRING bamfLogoDest = xmlDest;
		bamfLogoDest += "bamf_logo.gif";

		source = ReportBasePath.c_str();
		if( !source.isEmpty() )
			source += '\\';
		source += "bamf_logo.gif";
		fcopy( source, bamfLogoDest );
	}
	else
		selXsl = "";

	xmlDest += "test.xml";

	if( xslDest[0U] )
	{
		source = sourcePath;
		if( !source.isEmpty() )
			source += '\\';
		source += selXsl;
		fcopy( source, xslDest );
	}
	source = sourcePath;
	if( !source.isEmpty() )
		source += '\\';
	source += "test.dtd";
	fcopy( source, dtdDest );


	TestQuery->ParamByName( "theTest" )->AsInteger = test_id;
	TestQuery->Open();

	PupilTestQuery->ParamByName( "theTest" )->AsInteger = test_id;
	PupilTestQuery->Open();

	ofstream	fStream( xmlDest );
	if( fStream.is_open() )
	{
		XML_ANY *theTest = makeQueryXML( TestQuery, "pruefung", 2 );

		theTest->addObject( makeSchoolXML() );

		XML_ANY *thePupils = (XML_ANY *)theTest->addObject(
			new XML_ANY( "teilnehmer" )
		);
		for( PupilTestQuery->First(); !PupilTestQuery->Eof; PupilTestQuery->Next() )
		{
			XML_ANY * thePupil = (XML_ANY*)thePupils->addObject(
				makeQueryXML( PupilTestQuery, "schueler", 2 )
			);
			XML_ANY *theCourses = (XML_ANY*)thePupil->addObject(
				new XML_ANY( "kurse" )
			);
			addPupilCoursesXML(
				theCourses, PupilTestQuery->FieldByName( "ID" )->AsInteger
			);
		}

		STRING	xmlCode = theTest->generateDoc( "pruefung", selXsl );
		fStream << xmlCode;
		delete theTest;
	}

	PupilTestQuery->Close();
	TestQuery->Close();

	ShellExecute( NULL, "open", xmlDest, "", "", SW_SHOW );
}
//---------------------------------------------------------------------------
void TxmlDataModule::exportPupilXML( int pupil_id, const char *sourcePath, const char *selXsl )
{
	STRING		xmlDest = Session->PrivateDir.c_str();
	STRING		dtdDest, xslDest;
	STRING		source;

	xmlDest += "\\";
	dtdDest = xmlDest;
	dtdDest += "schueler.dtd";


	if( selXsl && *selXsl && *selXsl != '<' )
	{
		xslDest = xmlDest;
		xslDest += selXsl;

		STRING bamfLogoDest = xmlDest;
		bamfLogoDest += "bamf_logo.gif";

		source = ReportBasePath.c_str();
		if( !source.isEmpty() )
			source += '\\';
		source += "bamf_logo.gif";
		fcopy( source, bamfLogoDest );
	}
	else
		selXsl = "";

	xmlDest += "schueler.xml";

	if( xslDest[0U] )
	{
		source = sourcePath;
		if( !source.isEmpty() )
			source += '\\';
		source += selXsl;
		fcopy( source, xslDest );
	}
	source = sourcePath;
	if( !source.isEmpty() )
		source += '\\';
	source += "schueler.dtd";
	fcopy( source, dtdDest );


	PupilQuery->ParamByName( "thePupil" )->AsInteger = pupil_id;
	PupilQuery->Open();

	ofstream	fStream( xmlDest );
	if( fStream.is_open() )
	{
		XML_ANY *thePupil = makeQueryXML( PupilQuery, "schueler", 2 );
		XML_ANY *bemerkung = (XML_ANY*)thePupil->getElement( "bemerkung" );
		if( bemerkung )
			bemerkung->setTag( "schueler_bemerkung" );

		thePupil->addObject( makeSchoolXML() );

		XML_ANY *theCourses = (XML_ANY*)thePupil->addObject( new XML_ANY( "kurse" ) );
		addPupilCoursesXML( theCourses, pupil_id );

		XML_ANY *tests = makeTestXML( pupil_id );
		if( tests )
			thePupil->addObject( tests );

		STRING	xmlCode = thePupil->generateDoc( "schueler", selXsl );
		fStream << xmlCode;
		delete thePupil;
	}

	PupilQuery->Close();

	ShellExecute( NULL, "open", xmlDest, "", "", SW_SHOW );
}
//---------------------------------------------------------------------------

XML_ANY	*TxmlDataModule::makePaymentXML( int pupil_id, int kurs_id )
{
	XML_ANY	*payments = NULL;

	PaymentQuery->ParamByName( "theCourse" )->AsInteger = kurs_id;
	PaymentQuery->ParamByName( "thePupil" )->AsInteger = pupil_id;
	PaymentQuery->Open();

	if( PaymentQuery->RecordCount )
		payments = exportTable2XML( PaymentQuery, "zahlungen", "bezahlt", 2 );

	PaymentQuery->Close();

	return payments;
}

//---------------------------------------------------------------------------

XML_ANY	*TxmlDataModule::makeTestXML( int pupil_id )
{
	XML_ANY	*tests = NULL;

	TestPupilQuery->ParamByName( "thePupil" )->AsInteger = pupil_id;
	TestPupilQuery->Open();
	if( TestPupilQuery->RecordCount )
		tests = exportTable2XML( TestPupilQuery, "pruefungen", "pruefung", 2 );

	TestPupilQuery->Close();

	return tests;
}
//---------------------------------------------------------------------------
void TxmlDataModule::makePresenceXML( XML_ANY *thePupil, TDateTime currentDate, TDateTime endDate, double lessonTime[7], int pupil_id, int kurs_id )
{
	int		weekday, dayIdx = 0;
	double	fehlStunden = 0,
			entschuldigt = 0;

	XML_ANY *kurstage = (XML_ANY*)thePupil->addObject( new XML_ANY( "schuelertage" ) );
	FerienQuery->Open();

	PresenceQuery->Params->Items[0]->AsInteger = pupil_id;
	PresenceQuery->Params->Items[1]->AsInteger = kurs_id;
	PresenceQuery->Open();

	while( currentDate <= endDate )
	{
		while( FerienQueryANFANG->AsDateTime < currentDate
		&& currentDate > FerienQueryENDE->AsDateTime
		&& !FerienQuery->Eof )
			FerienQuery->Next();

		while( PresenceQueryDATUM->AsDateTime < currentDate
		&& !PresenceQuery->Eof )
			PresenceQuery->Next();

		if( currentDate < FerienQueryANFANG->AsDateTime
		||	currentDate > FerienQueryENDE->AsDateTime )
		{

			weekday = currentDate.DayOfWeek()-1;

			if( lessonTime[weekday] > 0.5 )
			{
				XML_ANY *kurstag = (XML_ANY*)kurstage->addObject( new XML_ANY( "schuelertag" ) );
				kurstag->setAttribute( "tag", (long)(++dayIdx) );
				kurstag->setAttribute( "datum", currentDate.DateString().c_str() );
				if( PresenceQueryDATUM->AsDateTime == currentDate )
				{
					if( PresenceQueryENTSCHULDIGT->AsString == "J" )
						entschuldigt += lessonTime[weekday];

					kurstag->setAttribute( "anwesenheit", PresenceQueryENTSCHULDIGT->AsString == "J" ? "E" : "X" );
				}
				else
					fehlStunden += lessonTime[weekday];
			}
		}
		currentDate++;
	}
	PresenceQuery->Close();
	FerienQuery->Close();

	thePupil->setAttribute( "fehl_stunden", fehlStunden, 2 );
	thePupil->setAttribute( "entschuldigt", entschuldigt, 2 );
}
//---------------------------------------------------------------------------
XML_ANY *TxmlDataModule::makeSchoolXML( void )
{
	XML_ANY	*theSchool = new XML_ANY( "traeger" );
	theSchool->setAttribute("traeger_name", ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_name", "" ) );
	theSchool->setAttribute("traeger_strasse", ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_strasse", "" ) );
	theSchool->setAttribute("traeger_plz", ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_plz", "" ) );
	theSchool->setAttribute("traeger_ort", ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_ort", "" ) );
	theSchool->setAttribute("traeger_telefon", ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_telefon", "" ) );
	theSchool->setAttribute("traeger_bundesland", ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_bundesland", "" ) );
	theSchool->setAttribute("traeger_bamf_nr", ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_bamf_nr", "" ) );
	theSchool->setAttribute("traeger_bamf_regionalstelle", ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_bamf_regionalstelle", "" ) );
	theSchool->setAttribute("traeger_konto", ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_konto", "" ) );
	theSchool->setAttribute("traeger_blz", ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_blz", "" ) );
	theSchool->setAttribute("traeger_bank", ConfigDataModule->GetValue( MainForm->theDatabase, "traeger_bank", "" ) );

	return theSchool;
}
//---------------------------------------------------------------------------
void TxmlDataModule::exportCourseXML( int kurs_id, const char *sourcePath, const char *selXsl )
{
	STRING		xmlDest = Session->PrivateDir.c_str();
	STRING		dtdDest, xslDest;
	STRING		source;

	TField		*tmpField;
	TDateTime	now = TDateTime::CurrentDate();
	TDateTime	birthday;
	int			age, dayIdx, weekday;
	double		lessonTime[7], totalHours;

	xmlDest += "\\";
	dtdDest = xmlDest;
	dtdDest += "kurs.dtd";


	if( selXsl && *selXsl && *selXsl != '<' )
	{
		xslDest = xmlDest;
		xslDest += selXsl;

		STRING bamfLogoDest = xmlDest;
		bamfLogoDest += "bamf_logo.gif";

		source = ReportBasePath.c_str();
		if( !source.isEmpty() )
			source += '\\';
		source += "bamf_logo.gif";
		fcopy( source, bamfLogoDest );
	}
	else
		selXsl = "";

	xmlDest += "kurs.xml";

	if( xslDest[0U] )
	{
		source = sourcePath;
		if( !source.isEmpty() )
			source += '\\';
		source += selXsl;
		fcopy( source, xslDest );
	}
	source = sourcePath;
	if( !source.isEmpty() )
		source += '\\';
	source += "kurs.dtd";
	fcopy( source, dtdDest );

	CourseQuery->ParamByName( "theCourse" )->AsInteger = kurs_id;
	CourseQuery->Open();
	fillLessonTime( CourseQuery, lessonTime );

	ofstream	fStream( xmlDest );
	if( fStream.is_open() )
	{
		/*
			export course
		*/
		XML_ANY		*theKurs = makeQueryXML( CourseQuery, "kurs", 2 );

		XML_ANY *bemerkung = (XML_ANY*)theKurs->getElement( "bemerkung" );
		if( bemerkung )
			bemerkung->setTag( "kurs_bemerkung" );

		theKurs->setAttribute( CourseQueryMO_ANF->FieldName.LowerCase().c_str(), CourseQueryMO_ANF->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQueryMO_END->FieldName.LowerCase().c_str(), CourseQueryMO_END->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQueryMO_PAUS_ANF->FieldName.LowerCase().c_str(), CourseQueryMO_PAUS_ANF->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQueryMO_PAUS_END->FieldName.LowerCase().c_str(), CourseQueryMO_PAUS_END->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( "mo_zeit", ((double)(CourseQueryMO_END->AsDateTime - CourseQueryMO_ANF->AsDateTime)-(double)(CourseQueryMO_PAUS_END->AsDateTime - CourseQueryMO_PAUS_ANF->AsDateTime))*32+0.5, 2 );

		theKurs->setAttribute( CourseQueryDI_ANF->FieldName.LowerCase().c_str(), CourseQueryDI_ANF->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQueryDI_END->FieldName.LowerCase().c_str(), CourseQueryDI_END->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQueryDI_PAUS_ANF->FieldName.LowerCase().c_str(), CourseQueryDI_PAUS_ANF->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQueryDI_PAUS_END->FieldName.LowerCase().c_str(), CourseQueryDI_PAUS_END->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( "di_zeit", ((double)(CourseQueryDI_END->AsDateTime - CourseQueryDI_ANF->AsDateTime)-(double)(CourseQueryDI_PAUS_END->AsDateTime - CourseQueryDI_PAUS_ANF->AsDateTime))*32+0.5, 2 );

		theKurs->setAttribute( CourseQueryMI_ANF->FieldName.LowerCase().c_str(), CourseQueryMI_ANF->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQueryMI_END->FieldName.LowerCase().c_str(), CourseQueryMI_END->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQueryMI_PAUS_ANF->FieldName.LowerCase().c_str(), CourseQueryMI_PAUS_ANF->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQueryMI_PAUS_END->FieldName.LowerCase().c_str(), CourseQueryMI_PAUS_END->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( "mi_zeit", ((double)(CourseQueryMI_END->AsDateTime - CourseQueryMI_ANF->AsDateTime)-(double)(CourseQueryMI_PAUS_END->AsDateTime - CourseQueryMI_PAUS_ANF->AsDateTime))*32+0.5, 2 );

		theKurs->setAttribute( CourseQueryDO_ANF->FieldName.LowerCase().c_str(), CourseQueryDO_ANF->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQueryDO_END->FieldName.LowerCase().c_str(), CourseQueryDO_END->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQueryDO_PAUS_ANF->FieldName.LowerCase().c_str(), CourseQueryDO_PAUS_ANF->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQueryDO_PAUS_END->FieldName.LowerCase().c_str(), CourseQueryDO_PAUS_END->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( "do_zeit", ((double)(CourseQueryDO_END->AsDateTime - CourseQueryDO_ANF->AsDateTime)-(double)(CourseQueryDO_PAUS_END->AsDateTime - CourseQueryDO_PAUS_ANF->AsDateTime))*32+0.5, 2 );

		theKurs->setAttribute( CourseQueryFR_ANF->FieldName.LowerCase().c_str(), CourseQueryFR_ANF->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQueryFR_END->FieldName.LowerCase().c_str(), CourseQueryFR_END->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQueryFR_PAUS_ANF->FieldName.LowerCase().c_str(), CourseQueryFR_PAUS_ANF->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQueryFR_PAUS_END->FieldName.LowerCase().c_str(), CourseQueryFR_PAUS_END->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( "fr_zeit", ((double)(CourseQueryFR_END->AsDateTime - CourseQueryFR_ANF->AsDateTime)-(double)(CourseQueryFR_PAUS_END->AsDateTime - CourseQueryFR_PAUS_ANF->AsDateTime))*32+0.5, 2 );

		theKurs->setAttribute( CourseQuerySA_ANF->FieldName.LowerCase().c_str(), CourseQuerySA_ANF->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQuerySA_END->FieldName.LowerCase().c_str(), CourseQuerySA_END->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQuerySA_PAUS_ANF->FieldName.LowerCase().c_str(), CourseQuerySA_PAUS_ANF->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQuerySA_PAUS_END->FieldName.LowerCase().c_str(), CourseQuerySA_PAUS_END->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( "sa_zeit", ((double)(CourseQuerySA_END->AsDateTime - CourseQuerySA_ANF->AsDateTime)-(double)(CourseQuerySA_PAUS_END->AsDateTime - CourseQuerySA_PAUS_ANF->AsDateTime))*32+0.5, 2 );

		theKurs->setAttribute( CourseQuerySO_ANF->FieldName.LowerCase().c_str(), CourseQuerySO_ANF->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQuerySO_END->FieldName.LowerCase().c_str(), CourseQuerySO_END->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQuerySO_PAUS_ANF->FieldName.LowerCase().c_str(), CourseQuerySO_PAUS_ANF->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( CourseQuerySO_PAUS_END->FieldName.LowerCase().c_str(), CourseQuerySO_PAUS_END->AsDateTime.FormatString("hh:nn").c_str() );
		theKurs->setAttribute( "so_zeit", ((double)(CourseQuerySO_END->AsDateTime - CourseQuerySO_ANF->AsDateTime)-(double)(CourseQuerySO_PAUS_END->AsDateTime - CourseQuerySO_PAUS_ANF->AsDateTime))*32+0.5, 2 );

		theKurs->addObject( makeSchoolXML() );

		/*
			export holiday
		*/
		XML_ANY *ferien = (XML_ANY*)theKurs->addObject( new XML_ANY( "ferien" ) );
		for( FerienQuery->Open(); !FerienQuery->Eof; FerienQuery->Next() )
		{
			if(
				(
					   FerienQueryANFANG->AsDateTime >= CourseQueryANFANGS_DATUM->AsDateTime
					&& FerienQueryANFANG->AsDateTime <= CourseQueryENDE_DATUM->AsDateTime
				)
			||
				(
					   FerienQueryENDE->AsDateTime >= CourseQueryANFANGS_DATUM->AsDateTime
					&& FerienQueryENDE->AsDateTime <= CourseQueryENDE_DATUM->AsDateTime
				)
			)
			{
				XML_ANY *unterbrechung = (XML_ANY*)ferien->addObject( new XML_ANY( "unterbrechung" ) );
				unterbrechung->setAttribute( FerienQueryANFANG->FieldName.LowerCase().c_str(), FerienQueryANFANG->AsString.c_str() );
				unterbrechung->setAttribute( FerienQueryENDE->FieldName.LowerCase().c_str(), FerienQueryENDE->AsString.c_str() );
				unterbrechung->setAttribute( FerienQueryBEZEICHNUNG->FieldName.LowerCase().c_str(), FerienQueryBEZEICHNUNG->AsString.c_str() );
			}
		}

		/*
			export school days
		*/
		XML_ANY *kurstage = (XML_ANY*)theKurs->addObject( new XML_ANY( "kurstage" ) );
		FerienQuery->First();
		TDateTime	currentDate = CourseQueryANFANGS_DATUM->AsDateTime;
		dayIdx = 0;
		totalHours = 0;

		while( currentDate <= CourseQueryENDE_DATUM->AsDateTime )
		{
			while( FerienQueryANFANG->AsDateTime < currentDate
			&& currentDate > FerienQueryENDE->AsDateTime
			&& !FerienQuery->Eof )
				FerienQuery->Next();

			if( currentDate < FerienQueryANFANG->AsDateTime
			||	currentDate > FerienQueryENDE->AsDateTime )
			{

				weekday = currentDate.DayOfWeek()-1;

				if( lessonTime[weekday] > 0.5 )
				{
					XML_ANY *kurstag = (XML_ANY*)kurstage->addObject( new XML_ANY( "kurstag" ) );
					kurstag->setAttribute( "tag", (long)++dayIdx );
					kurstag->setAttribute( "datum", currentDate.DateString().c_str() );
					kurstag->setAttribute( "stunden", lessonTime[weekday], 0 );
					totalHours += lessonTime[weekday];
				}
			}
			currentDate++;
		}
		FerienQuery->Close();
		theKurs->setAttribute( "gesamt_zeit", totalHours, 2 );

		/*
			export teacher
			==============
		*/
		LEHRERTable->ParamByName( "theCourse" )->AsInteger = kurs_id;
		LEHRERTable->Open();
		while( !LEHRERTable->Eof )
		{
			XML_ANY		*theTeacher = (XML_ANY*)theKurs->addObject(
				makeQueryXML( LEHRERTable, "lehrer", 2 )
			);

			tmpField = LEHRERTable->FieldByName( "GEBURTSDATUM" );
			birthday = tmpField->AsDateTime;
			age = now - birthday;
			if( !tmpField->IsNull )
			{
				age = (double)age / 365.25;
				theTeacher->setAttribute( "alter", (long)age );
			}

			tmpField = LEHRERTable->FieldByName( "ANFANG" );
			if( !tmpField->IsNull )
				theTeacher->setAttribute( (STRING)tmpField->FieldName.LowerCase().c_str() + "_num", tmpField->AsFloat, 0 );
			else
				theTeacher->setAttribute( (STRING)tmpField->FieldName.LowerCase().c_str() + "_num", CourseQueryANFANGS_DATUM->AsFloat, 0 );

			LEHRERTable->Next();
		}
		LEHRERTable->Close();

		/*
			export pupils
		*/
		PupilCourseQuery->ParamByName( "theCourse" )->AsInteger = kurs_id;
		PupilCourseQuery->Open();
		while( !PupilCourseQuery->Eof )
		{
			XML_ANY		*thePupil = (XML_ANY*)theKurs->addObject(
				makeQueryXML( PupilCourseQuery, "schueler", 2 )
			);

			birthday = PupilCourseQueryGEBURTSDATUM->AsDateTime;
			age = now - birthday;

			if( !PupilCourseQueryGEBURTSDATUM->IsNull )
			{
				age = (double)age / 365.25;
				thePupil->setAttribute( "alter", (long)age );
			}

			if( !PupilCourseQueryANFANG->IsNull )
				thePupil->setAttribute( (STRING)PupilCourseQueryANFANG->FieldName.LowerCase().c_str() + "_num", PupilCourseQueryANFANG->AsFloat, 0 );
			else
				thePupil->setAttribute( (STRING)PupilCourseQueryANFANG->FieldName.LowerCase().c_str() + "_num", CourseQueryANFANGS_DATUM->AsFloat, 0 );

			XML_ANY *bemerkung = (XML_ANY*)thePupil->getElement( "bemerkung" );
			if( bemerkung )
				bemerkung->setTag( "schueler_bemerkung" );

			XML_ANY *theCourses = (XML_ANY*)thePupil->addObject( new XML_ANY( "schueler_kurse" ) );
			addPupilCoursesXML( theCourses, PupilCourseQueryID->AsInteger );

			XML_ANY *tests = makeTestXML( PupilCourseQueryID->AsInteger );
			if( tests )
				thePupil->addObject( tests );

			XML_ANY *payments = makePaymentXML( PupilCourseQueryID->AsInteger, kurs_id );
			if( payments )
				thePupil->addObject( payments );

			makePresenceXML(
				thePupil,
				CourseQueryANFANGS_DATUM->AsDateTime,
				CourseQueryENDE_DATUM->AsDateTime,
				lessonTime,
				PupilCourseQueryID->AsInteger,
				kurs_id
			);

			PupilCourseQuery->Next();
		}
		PupilCourseQuery->Close();


		/*
			export books
			============
		*/
		LEHRBUECHERTable->Open();
		courseBooksQuery->ParamByName( "theCourse" )->AsInteger = kurs_id;
		courseBooksQuery->Open();

		XML_ANY	*theBooks = (XML_ANY*)theKurs->addObject( new XML_ANY( "lehrbuecher" ) );

		tmpField = LEHRBUECHERTable->FieldByName( "ID" );
		while( !LEHRBUECHERTable->Eof )
		{
			XML_ANY	*theBook = (XML_ANY*)theBooks->addObject(
				makeQueryXML( LEHRBUECHERTable, "buch", 2 )
			);

			while( !courseBooksQuery->Eof && courseBooksQueryBUCH_ID->AsInteger < tmpField->AsInteger )
				courseBooksQuery->Next();

			if( courseBooksQueryBUCH_ID->AsInteger == tmpField->AsInteger )
			{
				theBook->setAttribute( "verwendet", (long)1 );
				theBook->setAttribute(
					courseBooksQueryKURS_TITEL->FieldName.LowerCase().c_str(),
					courseBooksQueryKURS_TITEL->AsString.c_str()
				);
			}
			else
				theBook->setAttribute( "verwendet", (long)0 );

			LEHRBUECHERTable->Next();
		}
		courseBooksQuery->Close();
		LEHRBUECHERTable->Close();

		STRING	xmlCode = theKurs->generateDoc( "kurs", selXsl );
		fStream << xmlCode;
		delete theKurs;
	} // if( fStream.is_open() )

	CourseQuery->Close();

	ShellExecute( NULL, "open", xmlDest, "", "", SW_SHOW );
}

void TxmlDataModule::exportCourseCSV( int kurs_id )
{
	STRING		csvDest = Session->PrivateDir.c_str();

	TDateTime	birthday;
	int			weekday;
	double		lessonTime[7];

	csvDest += "\\kurs.csv";

	CourseQuery->ParamByName( "theCourse" )->AsInteger = kurs_id;
	CourseQuery->Open();

	PupilCourseQuery->ParamByName( "theCourse" )->AsInteger = kurs_id;
	PupilCourseQuery->Open();

	fillLessonTime( CourseQuery, lessonTime );

	ofstream	fStream( csvDest );
	if( fStream.is_open() )
	{
		FerienQuery->Open();
		TDateTime	currentDate = CourseQueryANFANGS_DATUM->AsDateTime;

		fStream << ',';
		while( currentDate <= CourseQueryENDE_DATUM->AsDateTime )
		{
			while( FerienQueryANFANG->AsDateTime < currentDate
			&& currentDate > FerienQueryENDE->AsDateTime
			&& !FerienQuery->Eof )
				FerienQuery->Next();

			if( currentDate < FerienQueryANFANG->AsDateTime
			||	currentDate > FerienQueryENDE->AsDateTime )
			{

				weekday = currentDate.DayOfWeek()-1;

				if( lessonTime[weekday] > 0.5 )
				{
					fStream << ',' << currentDate.DateString().c_str();
				}
			}
			currentDate++;
		}
		fStream << '\n';

		currentDate = CourseQueryANFANGS_DATUM->AsDateTime;
		FerienQuery->First();

		fStream << ',';
		while( currentDate <= CourseQueryENDE_DATUM->AsDateTime )
		{
			while( FerienQueryANFANG->AsDateTime < currentDate
			&& currentDate > FerienQueryENDE->AsDateTime
			&& !FerienQuery->Eof )
				FerienQuery->Next();

			if( currentDate < FerienQueryANFANG->AsDateTime
			||	currentDate > FerienQueryENDE->AsDateTime )
			{
				weekday = currentDate.DayOfWeek()-1;

				if( lessonTime[weekday] > 0.5 )
				{
					fStream << ',' << lessonTime[weekday];
				}
			}
			currentDate++;
		}
		fStream << '\n';

		FerienQuery->Close();

		while( !PupilCourseQuery->Eof )
		{
			fStream
				<< '"'
				<< PupilCourseQueryNACHNAME->AsString.c_str()
				<< ", "
				<< PupilCourseQueryVORNAME->AsString.c_str()
				<< "\","
				<< PupilCourseQueryGEBURTSDATUM->AsString.c_str()
				<< ',';

			FerienQuery->Open();

			PresenceQuery->Params->Items[0]->AsInteger = PupilCourseQueryID->AsInteger;
			PresenceQuery->Params->Items[1]->AsInteger = kurs_id;
			PresenceQuery->Open();

			TDateTime	currentDate = CourseQueryANFANGS_DATUM->AsDateTime;

			while( currentDate <= CourseQueryENDE_DATUM->AsDateTime )
			{
				while( FerienQueryANFANG->AsDateTime < currentDate
				&& currentDate > FerienQueryENDE->AsDateTime
				&& !FerienQuery->Eof )
					FerienQuery->Next();

				while( PresenceQueryDATUM->AsDateTime < currentDate
				&& !PresenceQuery->Eof )
					PresenceQuery->Next();

				if( currentDate < FerienQueryANFANG->AsDateTime
				||	currentDate > FerienQueryENDE->AsDateTime )
				{

					weekday = currentDate.DayOfWeek()-1;

					if( lessonTime[weekday] > 0.5 )
					{
						if( PresenceQueryDATUM->AsDateTime == currentDate )
						{
							fStream << (PresenceQueryENTSCHULDIGT->AsString == "J" ? "E" : "X");
						}
						fStream << ',';
					}
				}
				currentDate++;
			}
			PresenceQuery->Close();
			FerienQuery->Close();
			fStream << '\n';

			PupilCourseQuery->Next();
		}

		fStream.close();

		ShellExecute( NULL, "open", csvDest, "", "", SW_SHOW );
	}

	PupilCourseQuery->Close();

	CourseQuery->Close();
}

