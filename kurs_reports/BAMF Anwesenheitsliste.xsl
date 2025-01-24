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

	<xsl:template match='kurs'>
		<html>
			<head>
				<title>Anwesenheitsliste - <xsl:value-of select="@nummer" /></title>
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
						font-size: 8pt;
					}
					h1, h2
					{
						font-weight:bold
					}
					h1
					{
						font-size: 12pt;
						text-align: center;
					}
					h2
					{
						font-size: 10pt;
					}
					.label1, .label2, .label4, .label4 td, .label5
					{
						font-size:7pt;
						white-space:pre;
					}
					.label1
					{
						text-align: center;
					}
					.label2
					{
						text-align: left;
						font-style: italic;
						text-decoration: underline;
					}
					.label3
					{
						font-size:9pt;
						font-weight:bold;
						text-align: center;
					}
					.label4, .label4 td
					{
						background-color: #CCCCCC;
						text-align: center;
					}
					.label5
					{
						text-align: right;
					}
				</style>
			</head>
			<body>
				<table class="border">
					<tr>
						<td><h1>Anwesenheitsliste - Integrationskurs</h1></td>
					</tr>
				</table>
				<table class="border">
					<thead>
						<tr><td style="border-width:0px;">&#160;</td></tr>
						<tr>
							<td colspan="2" style="border-width:0;" nowrap="1">Kurs Nummer / Haushaltsjahr</td>
							<td colspan="5">
								<xsl:value-of select="traeger/@traeger_bamf_nr" /> -
								<xsl:value-of select="@nummer" /> -
								<xsl:value-of select="traeger/@traeger_bundesland" /> -
								<xsl:value-of select="@jahr" />
							</td>
						</tr>
						<tr><td style="border-width:0px;">&#160;</td></tr>
						<tr>
							<td colspan="2" style="border-width:0;">Kursabschnitt</td>
							<td colspan="5">
								<xsl:if test="@kurstyp='Basiskurs' and @kursabschnitt='Kursabschnitt 1'">
									1 (Basiskurs 1)
								</xsl:if>
								<xsl:if test="@kurstyp='Basiskurs' and @kursabschnitt='Kursabschnitt 2'">
									2 (Basiskurs 2)
								</xsl:if>
								<xsl:if test="@kurstyp='Basiskurs' and @kursabschnitt='Kursabschnitt 3'">
									3 (Basiskurs 3)
								</xsl:if>
								<xsl:if test="@kurstyp='Aufbaukurs' and @kursabschnitt='Kursabschnitt 1'">
									4 (Aufbaukurs 1)
								</xsl:if>
								<xsl:if test="@kurstyp='Aufbaukurs' and @kursabschnitt='Kursabschnitt 2'">
									5 (Aufbaukurs 2)
								</xsl:if>
								<xsl:if test="@kurstyp='Aufbaukurs' and @kursabschnitt='Kursabschnitt 3'">
									6 (Aufbaukurs 3)
								</xsl:if>
								<xsl:if test="@kurstyp='Spezialkurs' and @kursabschnitt='Kursabschnitt 1'">
									7 (Spezialkurs 1)
								</xsl:if>
								<xsl:if test="@kurstyp='Spezialkurs' and @kursabschnitt='Kursabschnitt 2'">
									8 (Spezialkurs 2)
								</xsl:if>
								<xsl:if test="@kurstyp='Spezialkurs' and @kursabschnitt='Kursabschnitt 3'">
									9 (Spezialkurs 3)
								</xsl:if>
								<xsl:if test="@kurstyp='Orientierungskurs'">
									Orientierungskurs
								</xsl:if>
							</td>
						</tr>
						<tr><td style="border-width:0px;">&#160;</td></tr>
						<tr>
							<td align="center">X</td><td style="border-width:0px;" colspan="2">= anwesend</td>
							<td align="center" colspan="8" style="border-width:0px;"><b>nzv</b> = nicht zu vertretende Fehlstunden</td>
						</tr>
						<tr>
							<td align="center">E</td><td style="border-width:0px;" colspan="2">= entschuldigt (nachgewiesen)</td>
							<td align="center" colspan="8" style="border-width:0px;"><b>zv</b> = zu vertretende Fehlstunden</td>
						</tr>
						<tr>
							<td/><td style="border-width:0px;" colspan="2">= nicht anwesend</td>
							<td colspan="8" style="border-width:0px;" />
							<td align="center" colspan="8" style="border-width:0px; border-top-width:1px;">Stempel, Unterschrift Kursträger</td>
						</tr>
						<tr><td style="border-width:0px;">&#160;</td></tr>
						<tr>
							<td colspan="3" style="border-width:0px;" />
							<td>Datum</td>
							<xsl:apply-templates select="kurstage/kurstag" mode="datum"/>
							<td colspan="2" style="border-width:0;"/>
							<td><xsl:value-of select="@gesamt_zeit"/></td>
						</tr>
						<tr>
							<td>lfd.Nr.</td>
							<td nowrap="1">Name, Vorname</td>
							<td>Geb. Datum</td>
							<td>Stunden (45 Minuten)</td>
							<xsl:apply-templates select="kurstage/kurstag" mode="stunden"/>
							<td>nzv</td>
							<td>zv</td>
							<td>förderfähige Stunden</td>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="4" align="center">Handzeichen Kursleiter/in:</td>
							<xsl:apply-templates select="kurstage/kurstag" mode="sign"/>
							<td colspan="3" style="border-width:0;" />
						</tr>
						<tr>
							<td colspan="4" align="center">Handzeichen Teamteacher:</td>
							<xsl:apply-templates select="kurstage/kurstag" mode="sign"/>
							<td colspan="3" style="border-width:0;" />
						</tr>
					</tfoot>
					<tbody>
						<xsl:apply-templates select="schueler">
							<xsl:sort select="@nachname" />
							<xsl:sort select="@vorname" />
						</xsl:apply-templates>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="kurstage/kurstag" mode="datum">
		<td><xsl:value-of select="@datum" /></td>
	</xsl:template>

	<xsl:template match="kurstage/kurstag" mode="stunden">
		<td><center><xsl:value-of select="@stunden" /></center></td>
	</xsl:template>

	<xsl:template match="kurstage/kurstag" mode="sign">
		<td/>
	</xsl:template>

	<xsl:template match='schueler'>
		<tr valign="top">
			<td><xsl:value-of select="position()" /></td>
			<td nowrap="1"><xsl:value-of select="@nachname" />, <xsl:value-of select="@vorname" /></td>
			<td><xsl:value-of select="@geburtsdatum" /></td>
			<td style="border-width:0px;"/>
			<xsl:apply-templates select="schuelertage/schuelertag"/>
			<td align="right"><xsl:value-of select="number(@entschuldigt)" /></td>
			<td align="right"><xsl:value-of select="number(@fehl_stunden)" /></td>
			<td align="right"><xsl:value-of select="number(../@gesamt_zeit)-number(@fehl_stunden)" /></td>
		</tr>
	</xsl:template>

	<xsl:template match="schuelertage/schuelertag">
		<td><center><xsl:value-of select="@anwesenheit" /></center></td>
	</xsl:template>

</xsl:stylesheet>

