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

#include <gak/array.h>
#include <gak/string.h>
#pragma hdrstop


#include "klarodbmain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

TDbConvertForm *DbConvertForm;
//---------------------------------------------------------------------------
__fastcall TDbConvertForm::TDbConvertForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void TDbConvertForm::upgradeSchueler()
{
	OldSchueler->Open();
	NewSchueler->Open();

	while( !OldSchueler->Eof )
	{
		NewSchueler->Insert();
		NewSchuelerID->AsInteger = OldSchuelerID->AsInteger;
		NewSchuelerAENDERUNGSDATUM->AsDateTime = OldSchuelerAENDERUNGSDATUM->AsDateTime;
		NewSchuelerANREDE->AsString = OldSchuelerANREDE->AsString;
		NewSchuelerNACHNAME->AsString = OldSchuelerNACHNAME->AsString;
		NewSchuelerVORNAME->AsString = OldSchuelerVORNAME->AsString;
		NewSchuelerWOHNUNG->AsString = OldSchuelerWOHNUNG->AsString;
		NewSchuelerSTRASSE->AsString = OldSchuelerSTRASSE->AsString;
		NewSchuelerGESCHLECHT->AsString = OldSchuelerGESCHLECHT->AsString;
		NewSchuelerLAND->AsString = OldSchuelerLAND->AsString;
		NewSchuelerPLZ->AsString = OldSchuelerPLZ->AsString;
		NewSchuelerORT->AsString = OldSchuelerORT->AsString;
		NewSchuelerTEL_PRIV->AsString = OldSchuelerTEL_PRIV->AsString;
		NewSchuelerTEL_BUERO->AsString = OldSchuelerTEL_BUERO->AsString;
		NewSchuelerTEL_MOBIL->AsString = OldSchuelerTEL_MOBIL->AsString;
		NewSchuelerTEL_FAX->AsString = OldSchuelerTEL_FAX->AsString;
		NewSchuelerE_MAIL->AsString = OldSchuelerE_MAIL->AsString;
		if( !OldSchuelerGEBURTSDATUM->IsNull )
			NewSchuelerGEBURTSDATUM->AsDateTime = OldSchuelerGEBURTSDATUM->AsDateTime;
		NewSchuelerGEBURTSORT->AsString = OldSchuelerGEBURTSORT->AsString;
		NewSchuelerNATIONALITAET->AsString = OldSchuelerNATIONALITAET->AsString;
		NewSchuelerAUSLAENDER_STATUS->AsString = OldSchuelerAUSLAENDER_STATUS->AsString;
		NewSchuelerBERUF->AsString = OldSchuelerBERUF->AsString;
		NewSchuelerTAETIGKEIT->AsString = OldSchuelerTAETIGKEIT->AsString;
		NewSchuelerWOHER->AsString = OldSchuelerWOHER->AsString;
		NewSchuelerEINSTUFUNG->AsString = OldSchuelerEINSTUFUNG->AsString;
		NewSchuelerBEMERKUNG->AsString = OldSchuelerBEMERKUNG->AsString;
		NewSchuelerABGESCHLOSSEN->AsString = 'N';

		try
		{
			NewSchueler->Post();
		}
		catch( ... )
		{
			AnsiString	message = "Fehler bei Speichern des Schülers ";
			message += NewSchuelerNACHNAME->AsString;
			message += ", ";
			message += NewSchuelerVORNAME->AsString;

			Application->MessageBox( message.c_str(), "Fehler", MB_OK );

			throw;
		}

		OldSchueler->Next();
	}
	NewSchueler->Close();
	OldSchueler->Close();
}

//---------------------------------------------------------------------------
void TDbConvertForm::upgradeLehrer()
{
	OldLehrer->Open();
	NewLehrer->Open();

	while( !OldLehrer->Eof )
	{
		NewLehrer->Insert();
		NewLehrerID->AsInteger = OldLehrerID->AsInteger;
		NewLehrerANREDE->AsString = OldLehrerANREDE->AsString;
		NewLehrerGESCHLECHT->AsString = OldLehrerGESCHLECHT->AsString;
		NewLehrerNACHNAME->AsString = OldLehrerNACHNAME->AsString;
		NewLehrerVORNAME->AsString = OldLehrerVORNAME->AsString;
		NewLehrerWOHNUNG->AsString = OldLehrerWOHNUNG->AsString;
		NewLehrerSTRASSE->AsString = OldLehrerSTRASSE->AsString;
		NewLehrerLAND->AsString = OldLehrerLAND->AsString;
		NewLehrerPLZ->AsString = OldLehrerPLZ->AsString;
		NewLehrerORT->AsString = OldLehrerORT->AsString;
		NewLehrerTEL_PRIV->AsString = OldLehrerTEL_PRIV->AsString;
		NewLehrerTEL_BUERO->AsString = OldLehrerTEL_BUERO->AsString;
		NewLehrerTEL_MOBIL->AsString = OldLehrerTEL_MOBIL->AsString;
		NewLehrerTEL_FAX->AsString = OldLehrerTEL_FAX->AsString;
		NewLehrerE_MAIL->AsString = OldLehrerE_MAIL->AsString;
		if( !OldLehrerGEBURTSDATUM->IsNull )
			NewLehrerGEBURTSDATUM->AsDateTime = OldLehrerGEBURTSDATUM->AsDateTime;
		NewLehrerGEBURTSORT->AsString = OldLehrerGEBURTSORT->AsString;
		NewLehrerNATIONALITAET->AsString = OldLehrerNATIONALITAET->AsString;
		NewLehrerAKAD_TITEL->AsString = OldLehrerAKAD_TITEL->AsString;

		if( !OldLehrerSV_ABSCHLUSS->IsNull )
			NewLehrerSV_ABSCHLUSS->AsDateTime = OldLehrerSV_ABSCHLUSS->AsDateTime;
		if( !OldLehrerDAF_ERFAHRUNG->IsNull )
			NewLehrerDAF_ERFAHRUNG->AsDateTime = OldLehrerDAF_ERFAHRUNG->AsDateTime;
		if( !OldLehrerEINSTIEG->IsNull )
			NewLehrerEINSTIEG->AsDateTime = OldLehrerEINSTIEG->AsDateTime;
		if( !OldLehrerVERTRAG->IsNull )
			NewLehrerVERTRAG->AsDateTime = OldLehrerVERTRAG->AsDateTime;

		NewLehrerBEMERKUNG->AsString = OldLehrerBEMERKUNG->AsString;

		try
		{
			NewLehrer->Post();
		}
		catch( ... )
		{
			AnsiString	message = "Fehler bei Speichern des Lehrers ";
			message += NewLehrerNACHNAME->AsString;
			message += ", ";
			message += NewLehrerVORNAME->AsString;

			Application->MessageBox( message.c_str(), "Fehler", MB_OK );

			throw;
		}

		OldLehrer->Next();
	}
	NewLehrer->Close();
	OldLehrer->Close();
}

void TDbConvertForm::upgradeKurs()
{
	unsigned short	year, month, day;

	OldKurs->Open();
	NewKurs->Open();

	while( !OldKurs->Eof )
	{
		NewKurs->Insert();
		NewKursID->AsInteger = OldKursID->AsInteger;
		NewKursJAHR->AsString = OldKursJAHR->AsString;

		TDateTime	startDate = OldKursENDE_DATUM->AsDateTime;

		startDate.DecodeDate( &year, &month, &day );

		if( month >= 3 && month < 9 )
			NewKursHALBJAHR->AsString = "S";
		else
			NewKursHALBJAHR->AsString = "W";

		NewKursNUMMER->AsString = OldKursNUMMER->AsString;
		NewKursANFANGS_DATUM->AsDateTime = OldKursANFANGS_DATUM->AsDateTime;
		NewKursENDE_DATUM->AsDateTime = OldKursENDE_DATUM->AsDateTime;
		NewKursUNTERRICHTSSTUNDEN->AsFloat = OldKursUNTERRICHTSSTUNDEN->AsFloat;
		NewKursWOCHENSTUNDEN->AsFloat = OldKursWOCHENSTUNDEN->AsFloat;
		NewKursTT_STUNDEN->AsFloat = OldKursTT_STUNDEN->AsFloat;
		NewKursSOZ_PAED_STUNDEN->AsFloat = OldKursSOZ_PAED_STUNDEN->AsFloat;
		NewKursKURSTAGE->AsString = OldKursKURSTAGE->AsString;
		NewKursFEIERTAGE->AsString = OldKursFEIERTAGE->AsString;
		NewKursVORKURS->AsString = OldKursVORKURS->AsString;
		NewKursNIVEAU->AsString = OldKursNIVEAU->AsString;
		NewKursLEHRBUCH->AsString = OldKursLEHRBUCH->AsString;
		NewKursRAUM->AsString = OldKursRAUM->AsString;
		NewKursKURSGEBUEHR->AsFloat = OldKursKURSGEBUEHR->AsFloat;
		NewKursFOERDERUNG->AsFloat = OldKursFOERDERUNG->AsFloat;
		NewKursBEMERKUNG->AsString = OldKursBEMERKUNG->AsString;

		try
		{
			NewKurs->Post();
		}
		catch( ... )
		{
			AnsiString	message = "Fehler bei Speichern des Kurses ";
			message += NewKursJAHR->AsString;
			message += ", ";
			message += NewKursNUMMER->AsString;

			Application->MessageBox( message.c_str(), "Fehler", MB_OK );

			throw;
		}

		OldKurs->Next();
	}
	NewKurs->Close();
	OldKurs->Close();
}

void TDbConvertForm::upgradeSchuelerKurs()
{
	STRING				kursNummer, schuelerName;

	OldSchuelerKurs->Open();
	NewSchuelerKurs->Open();

	while( !OldSchuelerKurs->Eof )
	{
		NewSchuelerKurs->Insert();

		NewSchuelerKursID->AsInteger = OldSchuelerKursID->AsInteger;
		NewSchuelerKursKURS_ID->AsInteger = OldSchuelerKursKURS_ID->AsInteger;
		NewSchuelerKursSCHUELER_ID->AsInteger = OldSchuelerKursSCHUELER_ID->AsInteger;

		if( !OldSchuelerKursANFANG->IsNull )
			NewSchuelerKursANFANG->AsDateTime = OldSchuelerKursANFANG->AsDateTime;
		if( !OldSchuelerKursENDE->IsNull )
			NewSchuelerKursENDE->AsDateTime = OldSchuelerKursENDE->AsDateTime;

		NewSchuelerKursBEMERKUNG->AsString = OldSchuelerKursBEMERKUNG->AsString;

		try
		{
			NewSchuelerKurs->Post();
		}
		catch( ... )
		{
			AnsiString	message = "Fehler bei Speichern des Kurses ";
			message += (const char *)kursNummer;
			message += " für den Schüler ";
			message += (const char *)schuelerName;

			Application->MessageBox( message.c_str(), "Fehler", MB_OK );

			throw;
		}

		OldSchuelerKurs->Next();
	}
	NewSchuelerKurs->Close();
	OldSchuelerKurs->Close();
}

void TDbConvertForm::upgradeLehrerKurs()
{
	STRING				kursNummer, lehrerName;

	OldLehrerKurs->Open();
	NewLehrerKurs->Open();

	while( !OldLehrerKurs->Eof )
	{
		NewLehrerKurs->Insert();

		NewLehrerKursID->AsInteger = OldLehrerKursID->AsInteger;
		NewLehrerKursKURS_ID->AsInteger = OldLehrerKursKURS_ID->AsInteger;
		NewLehrerKursKURS_ID->AsInteger = OldLehrerKursKURS_ID->AsInteger;
		NewLehrerKursLEHRER_ID->AsInteger = OldLehrerKursLEHRER_ID->AsInteger;

		if( !OldLehrerKursANFANG->IsNull )
			NewLehrerKursANFANG->AsDateTime = OldLehrerKursANFANG->AsDateTime;
		if( !OldLehrerKursENDE->IsNull )
			NewLehrerKursENDE->AsDateTime = OldLehrerKursENDE->AsDateTime;
		NewLehrerKursTEAM_TEACHER->AsString = OldLehrerKursTEAM_TEACHER->AsString;
		NewLehrerKursSOZ_PAED->AsString = OldLehrerKursSOZ_PAED->AsString;
		try
		{
			NewLehrerKurs->Post();
		}
		catch( ... )
		{
			AnsiString	message = "Fehler bei Speichern des Kurses ";
			message += (const char *)kursNummer;
			message += " für den Lehrer ";
			message += (const char *)lehrerName;

			Application->MessageBox( message.c_str(), "Fehler", MB_OK );

			throw;
		}

		OldLehrerKurs->Next();
	}
	NewLehrerKurs->Close();
	OldLehrerKurs->Close();
}

void TDbConvertForm::upgradeBezahlung()
{
	OldBezahlung->Open();
	NewBezahlung->Open();

	while( !OldBezahlung->Eof )
	{
		NewBezahlung->Insert();
		NewBezahlungID->AsInteger = OldBezahlungID->AsInteger;
		NewBezahlungKURS_SCHUELER_ID->AsInteger = OldBezahlungKURS_SCHUELER_ID->AsInteger;
		NewBezahlungDATUM->AsDateTime = OldBezahlungDATUM->AsDateTime;
		NewBezahlungBESCHREIBUNG->AsString = OldBezahlungBESCHREIBUNG->AsString;
		NewBezahlungZAHLUNGSART->AsString = OldBezahlungZAHLUNGSART->AsString;
		NewBezahlungBETRAG->AsFloat = OldBezahlungBETRAG->AsFloat;
		NewBezahlung->Post();

		OldBezahlung->Next();
	}
	NewBezahlung->Close();
	OldBezahlung->Close();
}

//---------------------------------------------------------------------------
void __fastcall TDbConvertForm::UpgradeButtonClick(TObject *)
{
	KlaroOldDatabase->Open();
	KlaroNewDatabase->Open();

	upgradeSchueler();
	upgradeLehrer();
	upgradeKurs();

	upgradeSchuelerKurs();
	upgradeLehrerKurs();

	upgradeBezahlung();

	KlaroNewDatabase->Close();
	KlaroOldDatabase->Close();

	UpgradeButton->Caption = "Fertig";
}
//---------------------------------------------------------------------------

void __fastcall TDbConvertForm::EmptyButtonClick(TObject *)
{
	NewLehrzeiten->EmptyTable();
	NewBezahlung->EmptyTable();
	NewAnwesenheiten->EmptyTable();
	NewSchuelerKurs->EmptyTable();
	NewPruefschueler->EmptyTable();
	NewLehrerKurs->EmptyTable();
	NewKursbuecher->EmptyTable();

	NewLehrer->EmptyTable();
	NewSchueler->EmptyTable();
	NewKurs->EmptyTable();
	NewPruefungen->EmptyTable();

	NewFerien->EmptyTable();

	EmptyButton->Caption = "Fertig";
}
//---------------------------------------------------------------------------

void __fastcall TDbConvertForm::SessionButtonClick(TObject *)
{
	delSessionQuery->ExecSQL();	
}
//---------------------------------------------------------------------------
void TDbConvertForm::BackupRestoreDB( TDatabase *source, TDatabase *destination )
{
	const char *tables[] =
	{
		"CONFIG",
		"FERIEN",
		"KURSE",
		"LEHRBUECHER",
		"LEHRER",
		"PRUEFUNGEN",
		"SCHUELER",
		"KURSBUECHER",
		"KURSLEHRER",
		"KURSSCHUELER",
		"PRUEFSCHUELER",
		"ANWESENHEITEN",
		"BEZAHLUNG",
		"LEHRZEITEN",
		NULL
	};
	size_t		i;
	int			t, j;
	const char	*theTableName;
	TField		*theSourceField;
	TFieldType	theSourceType;
	AnsiString	fieldName;
	TTable		*sourceTable, *destTable;

	source->Open();
	destination->Open();

	sourceTable = new TTable( this );
	sourceTable->DatabaseName = source->DatabaseName;

	destTable = new TTable( this );
	destTable->DatabaseName = destination->DatabaseName;

	for( t=sizeof(tables)/sizeof(tables[0]) -1; t--; t>= 0 )
	{
		theTableName = tables[t];
		destTable->TableName = theTableName;

		destTable->EmptyTable();
	}
	i = 0;
	while( (theTableName = tables[i]) != NULL )
	{
		sourceTable->TableName = theTableName;
		sourceTable->Open();

		destTable->TableName = theTableName;
		destTable->Open();

		while( !sourceTable->Eof )
		{
			destTable->Insert();

			for( j=0; j<sourceTable->FieldCount; j++ )
			{
				theSourceField = sourceTable->Fields->Fields[j];
				fieldName = theSourceField->FieldName;
				theSourceType = theSourceField->DataType;
				switch( theSourceType )
				{
					case ftString:
					case ftMemo:
						destTable->FieldByName( fieldName )->AsString = theSourceField->AsString;
						break;
					case ftSmallint:
					case ftInteger:
						if( !theSourceField->IsNull )
							destTable->FieldByName( fieldName )->AsInteger = theSourceField->AsInteger;
						break;
					case ftFloat:
						if( !theSourceField->IsNull )
							destTable->FieldByName( fieldName )->AsFloat = theSourceField->AsFloat;
						break;
					case ftDateTime:
						if( !theSourceField->IsNull )
							destTable->FieldByName( fieldName )->AsDateTime = theSourceField->AsDateTime;
						break;
					default:
						throw( new Exception( "Unbekannter Typ" ) );
				}
			}
			destTable->Post();

			sourceTable->Next();
		}

		destTable->Close();
		sourceTable->Close();

		i++;
	}

	delete destTable;
	delete sourceTable;

	destination->Close();
	source->Close();
}

//---------------------------------------------------------------------------
void __fastcall TDbConvertForm::BackupButtonClick(TObject *)
{
	BackupRestoreDB( KlaroNewDatabase, KlaroBackupDatabase );
	BackupButton->Caption = "Fertig";
}
//---------------------------------------------------------------------------

void __fastcall TDbConvertForm::RestoreButtonClick(TObject *)
{
	BackupRestoreDB( KlaroBackupDatabase, KlaroNewDatabase );
	RestoreButton->Caption = "Fertig";
}
//---------------------------------------------------------------------------

