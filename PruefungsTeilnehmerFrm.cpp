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

#include "PruefungsTeilnehmerFrm.h"
#include "DafMain.h"
#include "SchuelerFrm.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TPruefungsTeilnehmerForm *PruefungsTeilnehmerForm;
//---------------------------------------------------------------------------
__fastcall TPruefungsTeilnehmerForm::TPruefungsTeilnehmerForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void TPruefungsTeilnehmerForm::refreshDB( void )
{
	int	id = QueryPruefungsTeilnehmerID->AsInteger;

	if( !MainForm->theDatabase->IsSQLBased )
	{
		QueryPruefungsTeilnehmer->FlushBuffers();
		QueryPruefungsTeilnehmer->Refresh();
	}

	QueryPruefungsTeilnehmer->Close();
	QueryPruefungsTeilnehmer->UnPrepare();
	QueryPruefungsTeilnehmer->Prepare();
	QueryPruefungsTeilnehmer->Params->Items[0]->AsInteger = pruef_id;
	QueryPruefungsTeilnehmer->Open();

	QueryPruefungsTeilnehmer->DisableControls();
	while( QueryPruefungsTeilnehmerID->AsInteger != id && !QueryPruefungsTeilnehmer->Eof )
		QueryPruefungsTeilnehmer->Next();
	QueryPruefungsTeilnehmer->EnableControls();

	if( !MainForm->theDatabase->IsSQLBased )
	{
		QueryPruefungsTeilnehmer->FlushBuffers();
		QueryPruefungsTeilnehmer->Refresh();
	}
}
//---------------------------------------------------------------------------
void TPruefungsTeilnehmerForm::showPruefungsTeilnehmer( int pruef_id )
{
	this->pruef_id = pruef_id;
	QueryPruefungsTeilnehmer->Params->Items[0]->AsInteger = pruef_id;
	QueryPruefungsTeilnehmer->Open();
	ShowModal();
	QueryPruefungsTeilnehmer->Close();
}
//---------------------------------------------------------------------------
void __fastcall TPruefungsTeilnehmerForm::DBGridTeilnehmerDblClick(TObject *)
{
	MainForm->checkLicence();
	SchuelerForm->gotoPupil( QueryPruefungsTeilnehmerSCHUELER_ID->AsInteger );
	Close();
}
//---------------------------------------------------------------------------
void __fastcall TPruefungsTeilnehmerForm::QueryPruefungsTeilnehmerAbort(
	  TDataSet *)
{
	throw( new EAbort("Nicht möglich") );
}
//---------------------------------------------------------------------------

void __fastcall TPruefungsTeilnehmerForm::QueryPruefungsTeilnehmerBeforeClose(
      TDataSet *)
{
	MainForm->ApplyChanges( QueryPruefungsTeilnehmer );
}
//---------------------------------------------------------------------------

void __fastcall TPruefungsTeilnehmerForm::SpeedButtonRefreshClick(TObject *)
{
	MainForm->ApplyChanges( QueryPruefungsTeilnehmer );
	refreshDB();
}
//---------------------------------------------------------------------------

void __fastcall TPruefungsTeilnehmerForm::QueryPruefungsTeilnehmerAfterPost(
      TDataSet *)
{
	MainForm->ApplyChanges( QueryPruefungsTeilnehmer );
	refreshDB();
}
//---------------------------------------------------------------------------

void __fastcall TPruefungsTeilnehmerForm::FormShow(TObject *)
{
	restoreColumSettings( DBGridTeilnehmer, registryKey );
}
//---------------------------------------------------------------------------

void __fastcall TPruefungsTeilnehmerForm::FormClose(TObject *, TCloseAction &)
{
	saveColumSettings( DBGridTeilnehmer, registryKey );
}
//---------------------------------------------------------------------------

