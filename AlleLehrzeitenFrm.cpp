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

#include "AlleLehrzeitenFrm.h"
#include "DafMain.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TAlleLehrzeitenForm *AlleLehrzeitenForm;
//---------------------------------------------------------------------------
__fastcall TAlleLehrzeitenForm::TAlleLehrzeitenForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAlleLehrzeitenForm::ButtonStartClick(TObject *)
{
	MainForm->checkLicence();

	if( !QueryLehrzeiten->Active
	|| startDate != DateTimePickerStart->Date
	|| endDate != DateTimePickerEnd->Date )
	{
		QueryLehrzeiten->Close();
		startDate = DateTimePickerStart->Date;
		endDate = DateTimePickerEnd->Date;

		QueryLehrzeiten->Params->Items[0]->AsDateTime = startDate;
		QueryLehrzeiten->Params->Items[1]->AsDateTime = endDate;

		QueryLehrzeiten->Open();
	}
}
//---------------------------------------------------------------------------
void __fastcall TAlleLehrzeitenForm::FormHide(TObject *)
{
	QueryLehrzeiten->Close();
	MainForm->setRegistryStartDate( DateTimePickerStart->Date );
	MainForm->setRegistryEndDate( DateTimePickerEnd->Date );
}
//---------------------------------------------------------------------------
void __fastcall TAlleLehrzeitenForm::ButtonExportClick(TObject *Sender)
{
	ButtonStartClick( Sender );

	double	totalTime = 0;
	int		lastTeacher = QueryLehrzeitenLEHRER_ID->AsInteger;
	STRING	csvDest = Session->PrivateDir.c_str();

	csvDest += "\\Lehrzeiten.csv";

	ofstream	fStream( csvDest );
	if( fStream.is_open() )
	{
		fStream << "Nachname,Vorname,Kursnummer,Datum,Anfang,Ende,Pause Anfang, Pause Ende\n";
		for( QueryLehrzeiten->First(); !QueryLehrzeiten->Eof; QueryLehrzeiten->Next() )
		{
			if( QueryLehrzeitenLEHRER_ID->AsInteger != lastTeacher && totalTime > 0.001 )
			{
				fStream << "Total:," << totalTime*24.0 << ",Stunden," << totalTime*32.0 << ",Einheiten\n"; 
				lastTeacher = QueryLehrzeitenLEHRER_ID->AsInteger;
				totalTime = 0;
			}

			fStream << '"'
				<< QueryLehrzeitenNACHNAME->AsString.c_str() << "\",\""
				<< QueryLehrzeitenVORNAME->AsString.c_str() << "\",\""
				<< QueryLehrzeitenKURS->AsString.c_str() << "\","
				<< QueryLehrzeitenDATUM->AsString.c_str() << ','
				<< QueryLehrzeitenSTART_ZEIT->AsDateTime.FormatString("hh:nn").c_str() << ','
				<< QueryLehrzeitenENDE_ZEIT->AsDateTime.FormatString("hh:nn").c_str() << ','
				<< QueryLehrzeitenPAUSE_ANFANG->AsDateTime.FormatString("hh:nn").c_str() << ','
				<< QueryLehrzeitenPAUSE_ENDE->AsDateTime.FormatString("hh:nn").c_str() << '\n';

			totalTime += (double)QueryLehrzeitenENDE_ZEIT->AsDateTime  - (double)QueryLehrzeitenSTART_ZEIT->AsDateTime;
			totalTime -= (double)QueryLehrzeitenPAUSE_ENDE->AsDateTime - (double)QueryLehrzeitenPAUSE_ANFANG->AsDateTime;
		}
		if( totalTime > 0.001 )
			fStream << "Total:," << totalTime*24.0 << ",Stunden," << totalTime*32.0 << ",Einheiten\n";

		fStream.close();

		ShellExecute( NULL, "open", csvDest, "", "", SW_SHOW );
	}
}
//---------------------------------------------------------------------------
void __fastcall TAlleLehrzeitenForm::FormShow(TObject *)
{
	DateTimePickerStart->Date = MainForm->getRegistryStartDate();
	DateTimePickerEnd->Date = MainForm->getRegistryEndDate();
}
//---------------------------------------------------------------------------


