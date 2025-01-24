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
#include <gak/vcl_tools.h>
#pragma hdrstop

#include "KursBooksFrm.h"
#include "DafMain.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TKursbooksForm *KursbooksForm;
//---------------------------------------------------------------------------
__fastcall TKursbooksForm::TKursbooksForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void TKursbooksForm::refreshDB( void )
{
	int	buch_id = kursbuecherQueryBUCH_ID->AsInteger;

	if( !MainForm->theDatabase->IsSQLBased )
	{
		kursbuecherQuery->FlushBuffers();
		kursbuecherQuery->Refresh();
	}

	kursbuecherQuery->Close();
	kursbuecherQuery->UnPrepare();
	kursbuecherQuery->Prepare();
	kursbuecherQuery->ParamByName( "theKurs" )->AsInteger = kurs_id;
	kursbuecherQuery->Open();

	kursbuecherQuery->DisableControls();
	while( kursbuecherQueryBUCH_ID->AsInteger != buch_id && !kursbuecherQuery->Eof )
		kursbuecherQuery->Next();
	kursbuecherQuery->EnableControls();

	if( !MainForm->theDatabase->IsSQLBased )
	{
		kursbuecherQuery->FlushBuffers();
		kursbuecherQuery->Refresh();
	}
}
//---------------------------------------------------------------------------
void TKursbooksForm::showKursBooks( int kurs_id, const char *kursNummer )
{
	char	caption[256];

	this->kurs_id = kurs_id;

	strcpy( caption, "Kursbücher " );
	strcat( caption, kursNummer );
	this->Caption = caption;

	kursbuecherQuery->ParamByName( "theKurs" )->AsInteger = kurs_id;

	buecherQuery->Open();
	kursbuecherQuery->Open();

	restoreColumSettings( DBGridBooks, registryKey );
	ShowModal();
	saveColumSettings( DBGridBooks, registryKey );

	kursbuecherQuery->Close();
	buecherQuery->Close();
}
//---------------------------------------------------------------------------
void __fastcall TKursbooksForm::kursbuecherQueryAfterInsert(TDataSet *)
{
	kursbuecherQueryKURS_ID->AsInteger = kurs_id;
}
//---------------------------------------------------------------------------
void __fastcall TKursbooksForm::kursbuecherQueryAfterDelete(TDataSet *)
{
	MainForm->ApplyChanges( kursbuecherQuery );
	refreshDB();
}
//---------------------------------------------------------------------------
void __fastcall TKursbooksForm::kursbuecherQueryAfterPost(TDataSet *)
{
	MainForm->ApplyChanges( kursbuecherQuery );
	refreshDB();
}
//---------------------------------------------------------------------------
void __fastcall TKursbooksForm::kursbuecherQueryBeforeClose(TDataSet *)
{
	MainForm->ApplyChanges( kursbuecherQuery );
}
//---------------------------------------------------------------------------
void __fastcall TKursbooksForm::FormCreate(TObject *)
{
	if( false && MainForm->theDatabase->IsSQLBased )
	{
		buecherQuery->SQL->Clear();
		buecherQuery->SQL->Add(
			"select ID, substr( GRUPPE || ': ' || TITEL, 1, 255 ) as TITEL "
			"from lehrbuecher "
			"order by titel"
		);

		kursbuecherQuery->SQL->Clear();
		kursbuecherQuery->SQL->Add(
			"select kb.*, substr( lb.GRUPPE || ': ' || lb.TITEL, 1, 255 ) as TITEL "
			"from kursbuecher kb, lehrbuecher lb "
			"where kb.kurs_id = :theKurs "
			"and  kb.buch_id = lb.id "
			"order by titel"
		);
	}
}
//---------------------------------------------------------------------------

void __fastcall TKursbooksForm::SpeedButtonRefreshClick(TObject *)
{
	refreshDB();
}
//---------------------------------------------------------------------------

