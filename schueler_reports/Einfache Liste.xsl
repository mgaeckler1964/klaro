<?xml version="1.0" encoding="iso-8859-1" ?>
<!-- 
	XSL-Beispiel fuer den XML Export von Klaro 2.0
	(c) 2009 by CRESD GmbH, Muenchen, Deutschland
	http://www.cresd.de
-->


<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

	<xsl:output method="html" indent="yes" encoding="iso-8859-1" />

	<xsl:template match='/|*'>
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match='schueler'>
		<html>
			<head>
				<title>Kurs - <xsl:value-of select="@nummer" /></title>
				<style>
					td.border, table.border td, div.border
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
				<table border="1">
					<tr valign="top">
						<td>Anmeldung: <xsl:value-of select="@anmelde_datum" /><br />Änderungsdatum: <xsl:value-of select="@aenderungsdatum" /></td>
						<td>
							<xsl:value-of select="@anrede" /><xsl:text> </xsl:text><xsl:value-of select="@nachname" />, <xsl:value-of select="@vorname" /> (<xsl:value-of select="@geschlecht" />)<br />
							Ausweis/Pass: <xsl:value-of select="@ausweis_nummer" /><br />
							BAMF-Nr: <xsl:value-of select="@bamf_nummer" /><br />
							ABH-Nr: <xsl:value-of select="@abh_nummer" /><br />
							BVA-Nr: <xsl:value-of select="@bva_nummer" /><br />
							Grundsicherung-Nr: <xsl:value-of select="@az_grundsicherung" /><br />
							Kontoinhaber: <xsl:value-of select="@bank_inhaber" /><br />
							Kontonummer: <xsl:value-of select="@bank_konto" /><br />
							Blz: <xsl:value-of select="@bank_blz" /><br />
							Bank: <xsl:value-of select="@bank_name" /><br />
						</td>
						<td>
							<xsl:if test="@wohnung!=''">
								c/o <xsl:value-of select="@wohnung" /><br />
							</xsl:if>
							<xsl:if test="@strasse!=''">
								<xsl:value-of select="@strasse" /><br />
							</xsl:if>
							<xsl:if test="@land!='' or @plz!='' or @ort!=''">
								<xsl:if test="@land!=''">
									<xsl:value-of select="@land" /><xsl:text>-</xsl:text>
								</xsl:if>
								<xsl:value-of select="@plz" /><xsl:text> </xsl:text><xsl:value-of select="@ort" />
							</xsl:if>
							<br />
						</td>
						<td>
							<xsl:if test="@tel_priv!=''">
								Tel. (privat): <xsl:value-of select="@tel_priv" /><br />
							</xsl:if>
							<xsl:if test="@tel_buero!=''">
								Tel. (Büro): <xsl:value-of select="@tel_buero" /><br />
							</xsl:if>
							<xsl:if test="@tel_mobil!=''">
								Tel. (mobil): <xsl:value-of select="@tel_mobil" /><br />
							</xsl:if>
							<xsl:if test="@tel_fax!=''">
								Fax: <xsl:value-of select="@tel_fax" /><br />
							</xsl:if>
							<xsl:if test="@e_mail!=''">
								E-Mail: <xsl:value-of select="@e_mail" /><br />
							</xsl:if>
						</td>
					</tr>
					<tr valign="top">
						<td>
							<xsl:value-of select="@geburtsdatum" /><br />
						</td>
						<td colspan="2"><xsl:value-of select="bemerkung"/><br /></td>
						<td>
							ID: <xsl:value-of select="@id" /><br />
							Datum: <xsl:value-of select="@aenderungsdatum" /><br />
							Geburtsort: <xsl:value-of select="@geburtsort" /><br />
							Nationalität: <xsl:value-of select="@nationalitaet" /><br />
							Status: <xsl:value-of select="@auslaender_status" /><br />
							Beruf: <xsl:value-of select="@beruf" /><br />
							Tätigkeit: <xsl:value-of select="@taetigkeit" /><br />
							Woher: <xsl:value-of select="@woher" /><br />
							Prüfungen: <xsl:value-of select="@pruefungen" /><br />
							Einstufung: <xsl:value-of select="@einstufung" /><br />
							ISCED Level: <xsl:value-of select="@isced_level" /><br />
							Schuljahre: <xsl:value-of select="@schuljahre" /><br />
							Testdatum: <xsl:value-of select="@test_datum" /><br />
							Kursmodul: <xsl:value-of select="@kurs_modul" /><br />
							Empf. Kursart: <xsl:value-of select="@kursart" /><br />
							Schreibfähigkeit: <xsl:value-of select="@schreibfaehigkeit" /><br />
						</td>
					</tr>
					<tr valign="top"><td colspan="4">
						<b>Prüfungen</b>
						<xsl:apply-templates select="pruefungen"/>
					</td></tr>
				</table>
				<hr />
				<xsl:apply-templates select="kurse/kurs" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match='kurse/kurs'>
		<table border="0" width="100%" cellspacing="0" cellpadding="2">
			<tr>
				<td width="25%"><b>KursNr (ID):</b><xsl:text> </xsl:text><xsl:value-of select="@nummer" /> (<xsl:value-of select="@id" />)</td>
				<td width="25%"><b>Folgekurs von:</b><xsl:text> </xsl:text><xsl:value-of select="@vorkurs" /></td>
				<td width="25%"><b>Buch:</b><xsl:text> </xsl:text><xsl:value-of select="@lehrbuch" /></td>
				<td width="25%"><b>Raum:</b><xsl:text> </xsl:text><xsl:value-of select="@raum" /></td>
			</tr>
			<tr>
				<td><b>Kursart:</b><xsl:text> </xsl:text><xsl:value-of select="@kursart" /></td>
				<td><b>Kurstyp:</b><xsl:text> </xsl:text><xsl:value-of select="@kurstyp" /></td>
				<td><b>Kursabschnitt:</b><xsl:text> </xsl:text><xsl:value-of select="@kursabschnitt" /></td>
				<td><b>Niveau:</b><xsl:text> </xsl:text><xsl:value-of select="@niveau" /></td>
			</tr>
			<tr>
				<td><b>Kursgebühr:</b><xsl:text> </xsl:text><xsl:value-of select="@kursgebuehr" /></td>
				<td><b>Förderung:</b><xsl:text> </xsl:text><xsl:value-of select="@foerderung" /></td>
			</tr>
			<tr>
				<td><b>Beginn:</b><xsl:text> </xsl:text><xsl:value-of select="@anfangs_datum" /></td>
				<td><b>Ende:</b><xsl:text> </xsl:text><xsl:value-of select="@ende_datum" /></td>
				<td><b>Kurstage:</b><xsl:text> </xsl:text><xsl:value-of select="@kurstage" /></td>
				<td><b><xsl:value-of select="@abschlusstest_art" />:</b><xsl:text> </xsl:text><xsl:value-of select="@abschlusstest_datum" /></td>
			</tr>
			<tr>
				<td colspan="4"><b>Unterbrechungen:</b><xsl:text> </xsl:text><xsl:value-of select="@feiertage" /></td>
			</tr>
			<tr>
				<td><b>Unterrichtsstunden:</b><xsl:text> </xsl:text><xsl:value-of select="@unterrichtsstunden" /></td>
				<td><b>Wochenstunden:</b><xsl:text> </xsl:text><xsl:value-of select="@wochenstunden" /></td>
				<td><b>Teamteacherstunden:</b><xsl:text> </xsl:text><xsl:value-of select="@tt_stunden" /></td>
				<td><b>Sozpädstunden:</b><xsl:text> </xsl:text><xsl:value-of select="@soz_paed_stunden" /></td>
			</tr>
		</table>
		<hr />
		<b>Bemerkung:</b><br /><xsl:apply-templates select="bemerkung" />
		<hr />
		<xsl:apply-templates select="zahlungen" />
	</xsl:template>

	<xsl:template match='zahlungen|pruefungen|schuelertage'>
		<table>
			<xsl:apply-templates />
		</table>
	</xsl:template>

	<xsl:template match='bezahlt'>
		<tr>
			<td><xsl:value-of select="@datum" /></td>
			<td><xsl:value-of select="@beschreibung" /></td>
			<td><xsl:value-of select="@zahlungsart" /></td>
			<td align="right"><xsl:value-of select="@betrag" /><xsl:text>&#160;&#8364;</xsl:text></td>
		</tr>
	</xsl:template>

	<xsl:template match='pruefung'>
		<tr>
			<td><xsl:value-of select="@datum" /></td>
			<td><xsl:value-of select="@pruefung" /></td>
			<td><xsl:value-of select="@bestanden" /></td>
		</tr>
	</xsl:template>
</xsl:stylesheet>

