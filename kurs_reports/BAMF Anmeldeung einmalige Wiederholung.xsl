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
				<title>Anmeldeformular für die einmalige Wiederholung des Aufbausprachkurses im Rahmen des Integrationskurses</title>
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
		<h1>Anmeldeformular für die einmalige Wiederholung des Aufbausprachkurses im Rahmen des Integrationskurses</h1>

		<table class="border"><tr>
			<td width="100%">Personenkennziffer des Bundesamtes: <xsl:value-of select="@bamf_nummer" /></td>
		</tr></table>

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


		<table class="border"><tr>
			<td>
				Name<br />
				<xsl:value-of select="@nachname" />
			</td>
			<td>
				Vorname<br />
				<xsl:value-of select="@vorname" />
			</td>
			<td>
				Geburtsdatum<br />
				<xsl:value-of select="@geburtsdatum" />
			</td>
		</tr></table>

		Anschrift
		<table class="border"><tr>
			<td>Straße / Hausnummer<br /> <xsl:value-of select="@strasse" /></td>
			<td>Postleitzahl<br /> <xsl:value-of select="@plz" /></td>
			<td>Ort<br /> <xsl:value-of select="@ort" /></td>
		</tr></table>

		<table class="border"><tr>
			<td>Datum der Anmeldung beim Kursträger: <xsl:value-of select="@anmelde_datum" /></td>
		</tr></table>

		<table class="border"><tr>
			<td>
				<xsl:if test="@antrag_kostenbefreiung = 'J'">
					[X]
				</xsl:if>
				<xsl:if test="@antrag_kostenbefreiung != 'J'">
					[ ]
				</xsl:if>
				Ein separater Antrag auf Kostenbefreiung wurde mit der Anmeldung gestellt.
			</td>
		</tr></table>

		<xsl:apply-templates select="../traeger" />

		<p align="right">KNr. 630 019 BAMF 11/2007</p>
	</xsl:template>

	<xsl:template match='traeger'>
		<table class="border">
			<tr>
				<td>Name des Kursträgers<br /><xsl:value-of select="@traeger_name" /></td>
				<td>Kennziffer des Kursträgers<br /><xsl:value-of select="@traeger_bamf_nr" /></td>
			</tr>
			<tr>
				<td colspan="2">Ort, Datum <xsl:value-of select="@traeger_ort" /></td>
			</tr>
			<tr>
				<td>Unterschrift Kursträger<br/><br/></td>
				<td>Unterschrift Teilnahmeberechtigter<br/><br/></td>
			</tr>
		</table>
	</xsl:template>

</xsl:stylesheet>

