<?xml version="1.0" encoding="iso-8859-1" ?>
<!-- 
	XSL-Beispiel fuer den XML Export von Klaro 2.0
	(c) 2009 by CRESD GmbH, Muenchen, Deutschland
	http://www.cresd.de
-->


<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform' xmlns:fn="http://www.w3.org/2005/02/xpath-functions">

	<xsl:output method="html" indent="yes" encoding="iso-8859-1" />

	<xsl:template match='/|*'>
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match='kurs'>
		<html>
			<head>
				<title>Anmeldeformular für den Integrationskurs gemäß § 7 Abs. 1 IntV</title>
				<style>
					td.border, table.border td
					{
						border: 1px solid #000000;
						padding: 2px;
					}
					table.border
					{
						border-collapse: collapse;
						margin-bottom: 12pt;
						width: 100%;
					}
					body, h1, h2, td
					{
						font-family:Helvetica,Arial,sans-serif;
						font-size: 10pt;
					}
					h1, h2
					{
						font-weight:bold
					}
					h1
					{
						font-size: 12pt;
					}
					h2
					{
						font-size: 10pt;
					}
				</style>
			</head>
			<body>
				<xsl:apply-templates select="schueler">
					<xsl:sort select="@nachname" />
					<xsl:sort select="@vorname" />
				</xsl:apply-templates>
			</body>
		</html>
	</xsl:template>

	<xsl:template match='schueler'>

		<img  style="page-break-before:always" src="bamf_logo.gif" />
		<h1>Anmeldeformular für den Integrationskurs gemäß § 7 Abs. 1 IntV</h1>
		<table class="border">
			<tr>
				<td width="100%" style="border-right-width:0;">Personenkennziffer des Bundesamtes: <xsl:value-of select="@bamf_nummer" /></td><td class="border" style="border-left-width-width:0;"><u>oder</u></td>
			</tr>
			<tr>
				<td colspan="2">Behörden-Aktenzeichen (ABH oder BVA oder Träger der Grundsicherung)
					<xsl:if test="@abh_nummer!=''">
						<xsl:value-of select="@abh_nummer" />
					</xsl:if>
					<xsl:if test="@bva_nummer!=''">
						<xsl:value-of select="@bva_nummer" />
					</xsl:if>
					<xsl:if test="@az_grundsicherung!=''">
						<xsl:value-of select="@az_grundsicherung" />
					</xsl:if>
				</td>
			</tr>
		</table>

		<xsl:if test="@anrede!='Herr'">
			[ ] Herr
		</xsl:if>
		<xsl:if test="@anrede='Herr'">
			[X] Herr
		</xsl:if>
		<xsl:if test="@anrede!='Frau'">
			[ ] Frau
		</xsl:if>
		<xsl:if test="@anrede='Frau'">
			[X] Frau
		</xsl:if>

		<table class="border">
			<tr>
				<td>Name <xsl:value-of select="@nachname" /></td>
				<td>Vorname <xsl:value-of select="@vorname" /></td>
			</tr>
		</table>

		Anschrift
		<table class="border">
			<tr>
				<td>Straße / Hausnummer<br /> <xsl:value-of select="@strasse" /></td>
				<td>Postleitzahl<br /> <xsl:value-of select="@plz" /></td>
				<td>Ort<br /> <xsl:value-of select="@ort" /></td>
			</tr>
		</table>

		<table class="border">
			<tr>
				<td>Geburtsort <xsl:value-of select="@geburtsort" /></td>
				<td>Geburtsdatum <xsl:value-of select="@geburtsdatum" /></td>
			</tr>
		</table>

		<table class="border">
			<tr>
				<td>Staatsangehörigkeit <xsl:value-of select="@nationalitaet" /></td>
			</tr>
		</table>
			
		Bildungsstand (ISCED-Level):
		<table class="border" cellspacing="0" cellpadding="2">
			<tr>
				<td>
					<xsl:if test="@isced_level!='1'">
						1 [ ]
					</xsl:if>
					<xsl:if test="@isced_level='1'">
						1 [X]
					</xsl:if>
				</td>
				<td>
					<xsl:if test="@isced_level!='2'">
						2 [ ]
					</xsl:if>
					<xsl:if test="@isced_level='2'">
						2 [X]
					</xsl:if>
				</td>
				<td>
					<xsl:if test="@isced_level!='3 A'">
						3 A [ ]
					</xsl:if>
					<xsl:if test="@isced_level='3 A'">
						3 A [X]
					</xsl:if>
				</td>
				<td>
					<xsl:if test="@isced_level!='3 B'">
						3 B [ ]
					</xsl:if>
					<xsl:if test="@isced_level='3 B'">
						3 B [X]
					</xsl:if>
				</td>
				<td>
					<xsl:if test="@isced_level!='4 A'">
						4 A [ ]
					</xsl:if>
					<xsl:if test="@isced_level='4 A'">
						4 A [X]
					</xsl:if>
				</td>
				<td>
					<xsl:if test="@isced_level!='5 A'">
						5 A [ ]
					</xsl:if>
					<xsl:if test="@isced_level='5 A'">
						5 A [X]
					</xsl:if>
				</td>
				<td>
					<xsl:if test="@isced_level!='5 B'">
						5 B [ ]
					</xsl:if>
					<xsl:if test="@isced_level='5 B'">
						5 B [X]
					</xsl:if>
				</td>
				<td>
					<xsl:if test="@isced_level!='6'">
						6 [ ]
					</xsl:if>
					<xsl:if test="@isced_level='6'">
						6 [X]
					</xsl:if>
				</td>
			</tr>
		</table>

		<table class="border">
			<tr><td>Anzahl der Schuljahre, falls kein Abschluß (=ISCED-Level 1): <xsl:value-of select="@schuljahre" /></td></tr>
		</table>

		Ergebnis des Einstufungstests:
		<table class="border">
			<tr><td>Datum: <xsl:value-of select="pruefungen/pruefung[@pruefung='Einstufungstest']/@datum" /></td><td colspan="4">Empfohlene Kursart:</td></tr>
			<tr>
				<td>Empfohlenes Kursmodul: <xsl:value-of select="@kurs_modul" /> (1-9)</td>
				<td>Allgemeiner Integrationskurs</td>
				<td>
					<xsl:if test="@kursart!='Allgemeiner Integrationskurs'">
						[ ]
					</xsl:if>
					<xsl:if test="@kursart='Allgemeiner Integrationskurs'">
						[X]
					</xsl:if>
				</td>
				<td>Alphabetisierungskurs</td>
				<td>
					<xsl:if test="@kursart!='Alphabetisierungskurs'">
						[ ]
					</xsl:if>
					<xsl:if test="@kursart='Alphabetisierungskurs'">
						[X]
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td style="border-width:0;" />
				<td>Frauenkurs</td>
				<td>
					<xsl:if test="@kursart!='Frauenkurs'">
						[ ]
					</xsl:if>
					<xsl:if test="@kursart='Frauenkurs'">
						[X]
					</xsl:if>
				</td>
				<td>Förderkurs</td>
				<td>
					<xsl:if test="@kursart!='Förderkurs'">
						[ ]
					</xsl:if>
					<xsl:if test="@kursart='Förderkurs'">
						[X]
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td style="border-width:0;" />
				<td>Elternkurs</td>
				<td>
					<xsl:if test="@kursart!='Elternkurs'">
						[ ]
					</xsl:if>
					<xsl:if test="@kursart='Elternkurs'">
						[X]
					</xsl:if>
				</td>
				<td>Intensivkurs</td>
				<td>
					<xsl:if test="@kursart!='Intensivkurs'">
						[ ]
					</xsl:if>
					<xsl:if test="@kursart='Intensivkurs'">
						[X]
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td style="border-width:0;" />
				<td>Jugendkurs</td>
				<td>
					<xsl:if test="@kursart!='Jugendkurs'">
						[ ]
					</xsl:if>
					<xsl:if test="@kursart='Jugendkurs'">
						[X]
					</xsl:if>
				</td>
				<td>Sonst. spez. Integrationskurs</td>
				<td>
					<xsl:if test="@kursart!='Sonst. spez. Integrationskurs'">
						[ ]
					</xsl:if>
					<xsl:if test="@kursart='Sonst. spez. Integrationskurs'">
						[X]
					</xsl:if>
				</td>
			</tr>
		</table>

		Angaben zur Schreibkundigkeit
		<table class="border">
			<td style="border-right-width:0;">
				<xsl:if test="@schreibfaehigkeit!='0'">
					[ ]
				</xsl:if>
				<xsl:if test="@schreibfaehigkeit='0'">
					[X]
				</xsl:if>
				nicht alphabetisiert
			</td>
			<td style="border-left-width:0; border-right-width:0;">
				<xsl:if test="@schreibfaehigkeit!='1'">
					[ ]
				</xsl:if>
				<xsl:if test="@schreibfaehigkeit='1'">
					[X]
				</xsl:if>
				nicht lateinisch alphabetisiert
			</td>
			<td style="border-left-width:0;">
				<xsl:if test="@schreibfaehigkeit!='2'">
					[ ]
				</xsl:if>
				<xsl:if test="@schreibfaehigkeit='2'">
					[X]
				</xsl:if>
				lateinisch alphabetisiert
			</td>
		</table>

		<table class="border">
			<tr><td>Datum der Anmeldung beim Kursträger <xsl:value-of select="@anmelde_datum" /></td></tr>
		</table>

		<table class="border">
			<tr><td>
				<xsl:if test="@antrag_kostenbefreiung!='J'">
					[ ]
				</xsl:if>
				<xsl:if test="@antrag_kostenbefreiung='J'">
					[X]
				</xsl:if>
				Ein separater Antrag auf Kostenbefreiung wurde mit der Anmeldung gestellt.
			</td></tr>
		</table>

		<xsl:apply-templates select="../traeger" />

		<p align="right">KNr. 630 016d BAMF 11/2007</p>
	</xsl:template>

	<xsl:template match='traeger'>
		<table class="border">
			<tr>
				<td>Name des Kursträgers <xsl:value-of select="@traeger_name" /></td>
				<td>Kennziffer des Kursträgers <xsl:value-of select="@traeger_bamf_nr" /></td>
			</tr>
			<tr>
				<td colspan="2">Ort, Datum <xsl:value-of select="@traeger_ort" />, den <!-- xsl:value-of select="fn:current-date()" / not yet supported by seamonkey--></td>
			</tr>
			<tr height="80pt">
				<td valign="top">Unterschrift Kursträger</td>
				<td valign="top">Unterschrift Teilnahmeberechtigter</td>
			</tr>
			
		</table>
	</xsl:template>

</xsl:stylesheet>

