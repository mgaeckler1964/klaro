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
//----------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "baflRp.h"
//----------------------------------------------------------------------------
#pragma resource "*.dfm"
TbaflReport *baflReport;
//----------------------------------------------------------------------------
__fastcall TbaflReport::TbaflReport(TComponent* Owner)
	: TQuickRep(Owner)
{
}

void TbaflReport::showReport( int kurs_id, const char *title )
{
	pupilQuery->Close();
	pupilQuery->ParamByName( "theCourse" )->AsInteger = kurs_id;

	pupilQuery->Open();

	ReportTitle = title;

	Preview();
}

//----------------------------------------------------------------------------
void __fastcall TbaflReport::pupilQueryCalcFields(TDataSet *)
{
	TDateTime	now = TDateTime::CurrentDate();
	TDateTime	birthday = pupilQueryGEBURTSDATUM->AsDateTime;
	int			age = now - birthday;

	if( !pupilQueryGEBURTSDATUM->IsNull )
		pupilQueryAGE->AsInteger = age/365.25;
	else
		pupilQueryAGE->Clear();

	AnsiString	status = pupilQueryAUSLAENDER_STATUS->AsString;
	if( !status.AnsiCompareIC( "Asylbewerber(in)" )
	||  !status.AnsiCompareIC( "Asylberechtigte(r)" )
	||  !status.AnsiCompareIC( "Kontingentflüchtling" )
	||  !status.AnsiCompareIC( "Bürgerkriegsflüchtling" ) )
	{
		pupilQueryGOOD_STRANGER->AsString = "";
		pupilQueryBAD_STRANGER->AsString = "X";
	}
	else
	{
		pupilQueryGOOD_STRANGER->AsString = "X";
		pupilQueryBAD_STRANGER->AsString = "";
	}
}
//---------------------------------------------------------------------------
