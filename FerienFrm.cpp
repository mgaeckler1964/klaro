/*
		Project:		Klaro
		Module:			
		Description:	
		Author:			Martin G�ckler
		Address:		Hofmannsthalweg 14, A-4030 Linz
		Web:			https://www.gaeckler.at/

		Copyright:		(c) 1988-2025 Martin G�ckler

		This program is free software: you can redistribute it and/or modify  
		it under the terms of the GNU General Public License as published by  
		the Free Software Foundation, version 3.

		You should have received a copy of the GNU General Public License 
		along with this program. If not, see <http://www.gnu.org/licenses/>.

		THIS SOFTWARE IS PROVIDED BY Martin G�ckler, Austria, Linz ``AS IS''
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

#include "FerienFrm.h"
#include "DafMain.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFerienForm *FerienForm;
//---------------------------------------------------------------------------
__fastcall TFerienForm::TFerienForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFerienForm::FormShow(TObject *)
{
	FerienTable->Open();
	restoreColumSettings( DBGridFerien, registryKey );
}
//---------------------------------------------------------------------------
void __fastcall TFerienForm::FormClose(TObject *, TCloseAction &)
{
	saveColumSettings( DBGridFerien, registryKey );
	FerienTable->Close();
}
//---------------------------------------------------------------------------
void __fastcall TFerienForm::FerienTableBeforePost(TDataSet *)
{
	MainForm->checkLicence();
	if( FerienTableANFANG->AsDateTime > FerienTableENDE->AsDateTime )
		throw( Exception( "Anfang mu� vor dem Ende liegen!" ) );
}
//---------------------------------------------------------------------------

void __fastcall TFerienForm::SpeedButtonRefreshClick(TObject *)
{
	FerienTable->Close();
	FerienTable->Open();	
}
//---------------------------------------------------------------------------

