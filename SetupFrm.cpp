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
#pragma hdrstop

#include "DafMain.h"
#include "SetupFrm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TSetupForm *SetupForm;
//---------------------------------------------------------------------------
__fastcall TSetupForm::TSetupForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TSetupForm::FormShow(TObject *)
{
	TRegistry	*reg = new TRegistry;

	if( reg->OpenKey( registryKey, false ) )
	{
		if( reg->ValueExists( "CourseInfoColor1" ) )
			EditColor1->Color = (TColor)reg->ReadInteger( "CourseInfoColor1" );
		else
			EditColor1->Color = clRed;

		if( reg->ValueExists( "CourseInfoColor2" ) )
			EditColor2->Color = (TColor)reg->ReadInteger( "CourseInfoColor2" );
		else
			EditColor2->Color = clYellow;

		reg->CloseKey();
	}

	reg->RootKey = HKEY_LOCAL_MACHINE;
	if( reg->OpenKey( registryKey, false ) )
	{
		if( reg->ValueExists( "MultiStart" ) )
			CheckBoxMultiStart->Checked = reg->ReadBool( "MultiStart" );

		if( reg->ValueExists( "ReportPath" ) )
			EditReportPath->Text = reg->ReadString( "ReportPath" );

		reg->CloseKey();
	}
	else
	{
		CheckBoxMultiStart->Enabled = false;
		EditReportPath->Enabled = false;
	}

	delete reg;
}

//---------------------------------------------------------------------------
void __fastcall TSetupForm::ButtonOKClick(TObject *)
{
	TRegistry	*reg = new TRegistry;

	if( reg->OpenKey( registryKey, true ) )
	{
		reg->WriteInteger( "CourseInfoColor1", (int)EditColor1->Color );
		reg->WriteInteger( "CourseInfoColor2", (int)EditColor2->Color );

		reg->CloseKey();
	}

	if( CheckBoxMultiStart->Enabled || EditReportPath->Enabled )
	{
		reg->RootKey = HKEY_LOCAL_MACHINE;
		try
		{
			if( reg->OpenKey( registryKey, true ) )
			{
				if( CheckBoxMultiStart->Enabled )
					reg->WriteBool( "MultiStart", CheckBoxMultiStart->Checked );
				if( EditReportPath->Enabled )
					reg->WriteString( "ReportPath", EditReportPath->Text );

				reg->CloseKey();
			}
			else
				Application->MessageBox(
					"Kann Einstellungen nicht speichern",
					"Fehler",
					MB_ICONERROR
				);
		}
		catch( ... )
		{
			Application->MessageBox(
				"Kann Einstellungen nicht speichern",
				"Fehler",
				MB_ICONERROR
			);
		}
	}

	delete reg;
}
//---------------------------------------------------------------------------

void __fastcall TSetupForm::ButtonSelectColor1Click(TObject *)
{
	ColorDialog->Color = EditColor1->Color;
	if( ColorDialog->Execute() )
		EditColor1->Color = ColorDialog->Color;
}
//---------------------------------------------------------------------------

void __fastcall TSetupForm::ButtonSelectColor2Click(TObject *)
{
	ColorDialog->Color = EditColor2->Color;
	if( ColorDialog->Execute() )
		EditColor2->Color = ColorDialog->Color;
}
//---------------------------------------------------------------------------

