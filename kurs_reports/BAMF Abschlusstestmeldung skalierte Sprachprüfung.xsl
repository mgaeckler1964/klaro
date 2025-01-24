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
				<title>Meldung der Ergebnisse zu Sprachprüfung</title>
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
				<xsl:apply-templates select="traeger" />
				<p>
					Meldung der Ergebnisse des Sprachtests zum Zertifikat Integrationskurs zwecks Ausstellung der 
					Abschlusstestbescheinigungen (§ 17 Abs. 4 IntV). Kopien der Bewertungsbögen Deutsch-Test für Zuwanderer 
					und der telc-Zertifikate bei Erreichen von B1 oder A2 bzw. sonstige gleich- oder höherwertige 
					Sprachnachweise sind beigefügt.
				</p>
				<table class="border">
					<thead>
						<tr>
							<td>Name</td><td>Vorname</td><td>Selbst-<br />zahler<sup>*</sup></td>
							<td>Personen-Nr. des<br />BAMF</td><td>Pass- oder<br />Ausweis-Nr.</td>
							<td>Datum</td>
							<td>
								Keine Teilnahme am Deutsch-Test<br />
								für Zuwanderer, sondern Vorlage<br />
								eines Sprachnachweises gleich-<br />
								oder höherwertiger als B1
							</td>
						</tr>
					</thead>
					<tfoot>
						<tr><td colspan="11" style="border-width:0px; font-size:8pt;">
							<sup>*</sup> Bei Selbstzahlern erfolgt eine Meldung nur, wenn das Sprachniveau B1 erreicht wurde 
							(Testteilnahme oder sonstiger Nachweis) und die Mitteilung des Bundesamtes über die erfolgreiche 
							Teilnahme am Test zum Orientierungskurs beim Träger vorliegt. Für diese Personen ist zudem eine 
							Kopie des aktuellen Aufenthaltstitels und die Einverständniserklärung (Formular 630.049) zur 
							Datenübermittlung an das Bundesamt beizufügen.
						</td></tr>
					</tfoot>
					<xsl:apply-templates select="schueler">
						<xsl:sort select="@nachname" />
						<xsl:sort select="@vorname" />
					</xsl:apply-templates>
				</table>
				<table class="border">
					<tr><td style="height:80pt;" valign="top">Datum/Unterschrift</td></tr>
				</table>
				<p align="right">KNr. 630.102 BAMF 07/2009</p>
			</body>
		</html>
	</xsl:template>

	<xsl:template match='traeger'>
		<u>Sprachkursträger:</u>
		<table>
			<tr>
				<td>Name/Ort</td><td style="border-bottom:1px solid #000000;"><xsl:value-of select="@traeger_name" />/<xsl:value-of select="@traeger_plz" /> <xsl:value-of select="@traeger_ort" /></td>
			</tr>
			<tr>
				<td>Trägernummer</td><td style="border-bottom:1px solid #000000;"><xsl:value-of select="@traeger_bamf_nr" /></td>
			</tr>
		</table>
		<br /><br />
		<table>
			<tr>
				<td>An: Regionalstelle des Bundesamtes in:</td><td style="border-bottom:1px solid #000000;"><xsl:value-of select="@traeger_bamf_regionalstelle" /></td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match='schueler'>
		<xsl:if test="@kostenbeteiligung!= 'Selbstzahler' or count(pruefungen/pruefung[@pruefung='B1-Test' and @bestanden='J'])&gt;0">
			<tr>
				<td><xsl:value-of select="@nachname" /></td>
				<td><xsl:value-of select="@vorname" /></td>
				<td>
					<xsl:if test="@kostenbeteiligung='Selbstzahler'">
						[X]
					</xsl:if>
					<xsl:if test="@kostenbeteiligung!='Selbstzahler'">
						[ ]
					</xsl:if>
				</td>
				<td><xsl:value-of select="@bamf_nummer" /></td>
				<td><xsl:value-of select="@ausweis_nummer" /></td>
				<td>
					<xsl:if test="count( pruefungen/pruefung[((@pruefung='A2-Test' or @pruefung='B1-Test') and @bestanden='J') or @bestanden='A2-Test' or @bestanden='B1-Test'])&gt;0" >
						<xsl:value-of select="pruefungen/pruefung[((@pruefung='A2-Test' or @pruefung='B1-Test') and @bestanden='J') or @bestanden='A2-Test' or @bestanden='B1-Test']/@datum" />
					</xsl:if>
				</td>
				<td>
					<xsl:if test="count( pruefungen/pruefung[(@pruefung='B1-Gleichwertig' and @bestanden='J') or @bestanden='B1-Gleichwertig'])&gt;0" >
						[X]
					</xsl:if>
					<xsl:if test="count( pruefungen/pruefung[(@pruefung='B1-Gleichwertig' and @bestanden='J') or @bestanden='B1-Gleichwertig'])=0">
						[ ]
					</xsl:if>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>


</xsl:stylesheet>

