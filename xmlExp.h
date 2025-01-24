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

#ifndef xmlExpH
#define xmlExpH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Db.hpp>
#include <DBTables.hpp>

#include <gak/xml.h>
//---------------------------------------------------------------------------


class TxmlDataModule : public TDataModule
{
__published:	// IDE-managed Components
	TQuery *CourseQuery;
	TIntegerField *CourseQueryID;
	TDateTimeField *CourseQueryMO_ANF;
	TDateTimeField *CourseQueryMO_END;
	TDateTimeField *CourseQueryMO_PAUS_ANF;
	TDateTimeField *CourseQueryMO_PAUS_END;
	TDateTimeField *CourseQueryDI_ANF;
	TDateTimeField *CourseQueryDI_END;
	TDateTimeField *CourseQueryDI_PAUS_ANF;
	TDateTimeField *CourseQueryDI_PAUS_END;
	TDateTimeField *CourseQueryMI_ANF;
	TDateTimeField *CourseQueryMI_END;
	TDateTimeField *CourseQueryMI_PAUS_ANF;
	TDateTimeField *CourseQueryMI_PAUS_END;
	TDateTimeField *CourseQueryDO_ANF;
	TDateTimeField *CourseQueryDO_END;
	TDateTimeField *CourseQueryDO_PAUS_ANF;
	TDateTimeField *CourseQueryDO_PAUS_END;
	TDateTimeField *CourseQueryFR_ANF;
	TDateTimeField *CourseQueryFR_END;
	TDateTimeField *CourseQueryFR_PAUS_ANF;
	TDateTimeField *CourseQueryFR_PAUS_END;
	TDateTimeField *CourseQuerySA_ANF;
	TDateTimeField *CourseQuerySA_END;
	TDateTimeField *CourseQuerySA_PAUS_ANF;
	TDateTimeField *CourseQuerySA_PAUS_END;
	TDateTimeField *CourseQuerySO_ANF;
	TDateTimeField *CourseQuerySO_END;
	TDateTimeField *CourseQuerySO_PAUS_ANF;
	TDateTimeField *CourseQuerySO_PAUS_END;
	TQuery *TestPupilQuery;
	TQuery *FerienQuery;
	TDateTimeField *FerienQueryANFANG;
	TDateTimeField *FerienQueryENDE;
	TQuery *PresenceQuery;
	TDateTimeField *PresenceQueryDATUM;
	TStringField *PresenceQueryENTSCHULDIGT;
	TTable *LEHRBUECHERTable;
	TQuery *courseBooksQuery;
	TQuery *PupilCourseQuery;
	TQuery *PaymentQuery;
	TQuery *LEHRERTable;
	TStringField *FerienQueryBEZEICHNUNG;
	TQuery *PupilQuery;
	TQuery *CoursePupilQuery;
	TQuery *TestQuery;
	TQuery *PupilTestQuery;
	TDateTimeField *CourseQueryANFANGS_DATUM;
	TDateTimeField *CourseQueryENDE_DATUM;
	TDateTimeField *CourseQueryAENDERUNGSDATUM;
	TStringField *CourseQueryAENDERUNG_VON;
	TStringField *CourseQueryJAHR;
	TStringField *CourseQueryHALBJAHR;
	TStringField *CourseQueryNUMMER;
	TStringField *CourseQueryBAMF_NUMMER;
	TFloatField *CourseQueryUNTERRICHTSSTUNDEN;
	TFloatField *CourseQueryWOCHENSTUNDEN;
	TFloatField *CourseQueryTT_STUNDEN;
	TFloatField *CourseQuerySOZ_PAED_STUNDEN;
	TStringField *CourseQueryKURSTAGE;
	TStringField *CourseQueryFEIERTAGE;
	TStringField *CourseQueryKURSART;
	TStringField *CourseQueryKURSTYP;
	TStringField *CourseQueryKURSABSCHNITT;
	TStringField *CourseQueryVORKURS;
	TStringField *CourseQueryNIVEAU;
	TStringField *CourseQueryLEHRBUCH;
	TStringField *CourseQueryRAUM;
	TFloatField *CourseQueryUMSATZSTEUER;
	TFloatField *CourseQueryKURSGEBUEHR;
	TFloatField *CourseQueryFOERDERUNG;
	TMemoField *CourseQueryBEMERKUNG;
	TMemoField *CourseQueryZEIT_BEMERKUNG;
	TIntegerField *courseBooksQueryBUCH_ID;
	TStringField *courseBooksQueryKURS_TITEL;
	TDateTimeField *PupilCourseQueryGEBURTSDATUM;
	TDateTimeField *PupilCourseQueryANFANG;
	TDateTimeField *PupilCourseQueryENDE;
	TIntegerField *PupilCourseQueryID;
	TStringField *PupilCourseQueryNACHNAME;
	TStringField *PupilCourseQueryVORNAME;
	TDateTimeField *PupilCourseQueryAENDERUNGSDATUM;
	TStringField *PupilCourseQueryAENDERUNG_VON;
	TDateTimeField *PupilCourseQueryANMELDE_DATUM;
	TDateTimeField *PupilCourseQueryRUECKGABE_DATUM;
	TStringField *PupilCourseQueryTEILNEHMER_NUMMER;
	TStringField *PupilCourseQueryANREDE;
	TStringField *PupilCourseQueryGESCHLECHT;
	TStringField *PupilCourseQueryWOHNUNG;
	TStringField *PupilCourseQuerySTRASSE;
	TStringField *PupilCourseQueryLAND;
	TStringField *PupilCourseQueryPLZ;
	TStringField *PupilCourseQueryORT;
	TStringField *PupilCourseQueryTEL_PRIV;
	TStringField *PupilCourseQueryTEL_BUERO;
	TStringField *PupilCourseQueryTEL_MOBIL;
	TStringField *PupilCourseQueryTEL_FAX;
	TStringField *PupilCourseQueryE_MAIL;
	TStringField *PupilCourseQueryGEBURTSORT;
	TStringField *PupilCourseQueryNATIONALITAET;
	TStringField *PupilCourseQueryAUSLAENDER_STATUS;
	TStringField *PupilCourseQueryBERUF;
	TStringField *PupilCourseQueryTAETIGKEIT;
	TStringField *PupilCourseQueryWOHER;
	TStringField *PupilCourseQueryPRUEFUNGEN;
	TStringField *PupilCourseQueryEINSTUFUNG;
	TMemoField *PupilCourseQueryBEMERKUNG;
	TStringField *PupilCourseQueryISCED_LEVEL;
	TSmallintField *PupilCourseQuerySCHULJAHRE;
	TSmallintField *PupilCourseQueryKURS_MODUL;
	TStringField *PupilCourseQueryKURSART;
	TSmallintField *PupilCourseQuerySCHREIBFAEHIGKEIT;
	TStringField *PupilCourseQueryAUSWEIS_NUMMER;
	TStringField *PupilCourseQueryBAMF_NUMMER;
	TStringField *PupilCourseQueryABH_NUMMER;
	TStringField *PupilCourseQueryBVA_NUMMER;
	TStringField *PupilCourseQueryAZ_GRUNDSICHERUNG;
	TStringField *PupilCourseQueryABGESCHLOSSEN;
	TStringField *PupilCourseQueryBANK_INHABER;
	TStringField *PupilCourseQueryBANK_KONTO;
	TStringField *PupilCourseQueryBANK_BLZ;
	TStringField *PupilCourseQueryBANK_NAME;
	TStringField *PupilCourseQueryAP_NAME;
	TStringField *PupilCourseQueryAP_VORNAME;
	TStringField *PupilCourseQueryAP_ORGANISATION;
	TStringField *PupilCourseQueryAP_STRASSE;
	TStringField *PupilCourseQueryAP_PLZ;
	TStringField *PupilCourseQueryAP_ORT;
	TStringField *PupilCourseQueryAP_TELEFON;
	TStringField *PupilCourseQueryAP_FAX;
	TStringField *PupilCourseQueryAP_EMAIL;
	TStringField *PupilCourseQueryAP_INFO;
	TMemoField *PupilCourseQuerySCHUELER_KURS_BEMERKUNG;
	TStringField *PupilCourseQueryKOSTENBETEILIGUNG;
	TStringField *PupilCourseQueryANTRAG_KOSTENBEFREIUNG;
	TStringField *PupilCourseQueryORDNUNGSGEMAESS;
	TStringField *PupilCourseQueryFAHRTKOSTENBEWILLIGUNG;
	TStringField *PupilCourseQuerySCHUELER_MODUL;
	TDateTimeField *PupilCourseQuerySTORNO;
	TDateTimeField *PupilCourseQueryKURS_ANMELDE_DATUM;
	TDateTimeField *PupilCourseQueryKOSTENBEFREIUNG;
	TStringField *PupilCourseQueryKURS_WECHSEL;
	TStringField *PupilCourseQueryBEHOERDE;
	TStringField *PupilCourseQueryBERECHTIGUNGS_NR;
private:	// User declarations
	XML_ANY	*makeTestXML( int pupil_id );
	XML_ANY	*makePaymentXML( int pupil_id, int course_id );
	void fillLessonTime( TQuery *query, double lessonTime[7] );
	void makePresenceXML( XML_ANY *thePupil, TDateTime startDate, TDateTime endDate, double lessonTime[7], int pupil_id, int kurs_id );
	void addPupilCoursesXML( XML_ANY *theCourses, int pupil_id );
	XML_ANY *makeSchoolXML( void );

public:		// User declarations
	void exportTestXML( int test_id, const char *sourcePath, const char *selXsl );
	void exportPupilXML( int pupil_id, const char *sourcePath, const char *selXsl );
	void exportCourseXML( int kurs_id, const char *sourcePath, const char*selXSL );
	void exportCourseCSV( int kurs_id );
	__fastcall TxmlDataModule(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TxmlDataModule *xmlDataModule;
//---------------------------------------------------------------------------
#endif
