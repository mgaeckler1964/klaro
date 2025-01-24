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

	<xsl:template match='pruefung'>
		<html>
			<head>
				<title>Anmeldung Orientierungskurstest</title>
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
				<img src="bamf_logo.gif" />
				<h1>Anmeldung Orientierungskurstest</h1>
				<table class="border"><tr><td>
					Anlagen<br />
					Teilnehmerbögen externer Teilnehmer liegen in Kopie bei.
				</td></tr></table>
				
				<h1>1. Angaben zum Kursträger</h1>
				<table class="border"><tr>
					<td>Name des Kursträgers<br/><xsl:value-of select="traeger/@traeger_name" /></td>
					<td>Kennziffer des Kursträgers<br/><xsl:value-of select="traeger/@traeger_bamf_nr" /></td>
				</tr></table>

				<h1>2. Angaben zum Testort</h1>
				<table class="border">
					<tr>
						<td colspan="2">Anschrift<br/><xsl:value-of select="traeger/@traeger_strasse" /></td>
						<td>PLZ, Ort<br/><xsl:value-of select="traeger/@traeger_plz" />, <xsl:value-of select="traeger/@traeger_ort" /></td>
					</tr>
					<tr>
						<td>Raumnummer<br/><xsl:value-of select="@raum" /></td>
						<td>Ansprechpartner/in<br/><xsl:value-of select="@ansprechpartner" /></td>
						<td>Telefon<br/><xsl:value-of select="traeger/@traeger_telefon" /></td>
					</tr>
				</table>

				<h1>3. Angaben zum Testtermin</h1>
				<table class="border">
					<tr>
						<td>Datum des Testtermins<br/><xsl:value-of select="substring(@datum, 1, 10)" /></td>
						<td>Uhrzeit des Testtermins<br/><xsl:value-of select="substring(@datum, 11, 6)" /></td>
						<td>Teilnehmeranzahl insgesamt<br/><xsl:value-of select="count(teilnehmer/schueler)" /></td>
					</tr>
					<tr>
						<td colspan="3">Aufsichtsperson<br/><xsl:value-of select="@aufsicht" /></td>
					</tr>
				</table>
				<p>
					Alle auf der Teilnehmerliste (S. 3) aufgeführten externen Kursteilnehmer ohne Teilnahme-<br/>
					berechtigung haben sich mit den als Kopie in der Anlage beigefügten Teilnehmermeldebögen in<br/>
					unserer Einrichtung zum obigen Testtermin angemeldet.
				</p>
				
				<table class="border">
					<tr>
						<td style="height:80pt;" valign="top">Ort,Datum</td>
						<td style="height:80pt;" valign="top">Stempel und Unterschrift der Prüfstelle</td>
					</tr>
				</table>
				<p>KNr. 630 060 BAMF 01/2009</p>

				<h1 style="page-break-before:always">Teilnehmerliste zum Orientierungskurstest am <xsl:value-of select="substring(@datum, 1, 10)" /> um <xsl:value-of select="substring(@datum, 11, 6)" /> Uhr</h1>
				<table class="border">
					<tr><td colspan="5" align="center"><b>Integrationskursteilnehmer mit Teilnahmeberechtigung</b></td></tr>
					<tr>
						<td>Nr.</td>
						<td>Name, Vorname</td>
						<td>Geburtstag</td>
						<td>Personenkennziffer</td>
						<td>Orientierungskursnr.</td>
					</tr>
					<xsl:apply-templates select="teilnehmer/schueler" mode="intern">
						<xsl:sort select="@nachname" />
						<xsl:sort select="@vorname" />
					</xsl:apply-templates>
				</table>
				<p align="center">2</p>
				<table class="border" style="page-break-before:always">
					<tr><td colspan="5" align="center"><b>Externe Kursteilnehmer (s. beigefügte Teilnehmermeldebögen)</b></td></tr>
					<tr>
						<td>Nr.</td>
						<td>Name, Vorname</td>
						<td>Geburtstag</td>
						<td>Personenkennziffer</td>
						<td>Orientierungskursnr.</td>
					</tr>
					<xsl:apply-templates select="teilnehmer/schueler" mode="extern">
						<xsl:sort select="@nachname" />
						<xsl:sort select="@vorname" />
					</xsl:apply-templates>
				</table>
				<p align="center">3</p>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="teilnehmer/schueler" mode="intern">
		<xsl:if test="kurse/kurs[@kurstyp='Orientierungskurs']/@bamf_nummer != ''" >
			<tr>
				<td><xsl:value-of select="position()" /></td>
				<td><xsl:value-of select="@nachname" />, <xsl:value-of select="@vorname" /></td>
				<td><xsl:value-of select="@geburtsdatum" /></td>
				<td><xsl:value-of select="@bamf_nummer" /></td>
				<td><xsl:value-of select="kurse/kurs[@kurstyp='Orientierungskurs']/@bamf_nummer" /></td>
			</tr>
		</xsl:if>
	</xsl:template>

	<xsl:template match="teilnehmer/schueler" mode="extern">
		<xsl:if test="not( kurse/kurs[@kurstyp='Orientierungskurs']/@bamf_nummer != '')" >
			<tr>
				<td><xsl:value-of select="position()" /></td>
				<td><xsl:value-of select="@nachname" />, <xsl:value-of select="@vorname" /></td>
				<td><xsl:value-of select="@geburtsdatum" /></td>
				<td><xsl:value-of select="@bamf_nummer" /></td>
				<td></td>
			</tr>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
