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

#ifndef AnwesenheitsFrmH
#define AnwesenheitsFrmH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <Db.hpp>
#include <DBTables.hpp>

#include <gak/array.h>

//---------------------------------------------------------------------------
class TAnwesenheitsForm : public TForm
{
__published:	// IDE-managed Components
	TScrollBox *theScrollBox;
	TButton *CloseButton;
	TQuery *pupilQuery;
	TButton *BackButton;
	TButton *NextButton;
	TLabel *CourseTimeLabel;
	TLabel *CurrentWeekLabel;
	TQuery *attendanceQuery;
	TQuery *deleteQuery;
	TQuery *insertQuery;
	TQuery *updateQuery;
	TQuery *ferienQuery;
	void __fastcall FormShow(TObject *Sender);
	void __fastcall FormHide(TObject *Sender);
	void __fastcall CloseButtonClick(TObject *Sender);
	void __fastcall BackButtonClick(TObject *Sender);
	void __fastcall NextButtonClick(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
private:	// User declarations
	int					kurs_id;
	double				*stunden;
	TDateTime			anfangs_datum, ende_datum;
	TDateTime			currentDate;
	TLabel				*dayLabels[7];
	ARRAY<TLabel *>		pupilLabels;
	ARRAY<TCheckBox *>	pupilCheckboxes;

	bool IsHolliday( TDateTime theDay );
	void LoadValues( void );
	void SaveValues( void );
public:		// User declarations
	__fastcall TAnwesenheitsForm(TComponent* Owner);
	void showAttendance(
		int kurs_id,
		TDateTime anfangs_datum, TDateTime ende_datum,
		double stunden[7], const char *kursNummer
	);
};
//---------------------------------------------------------------------------
extern PACKAGE TAnwesenheitsForm *AnwesenheitsForm;
//---------------------------------------------------------------------------
#endif
