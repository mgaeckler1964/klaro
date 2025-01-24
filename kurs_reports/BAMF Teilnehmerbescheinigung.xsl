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
				<title>Bescheinigung über die Teilnahme am Integrationskurs (kursabschnittsweise) gemäß § 14 Abs. 4 IntV</title>
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

		<h1 style="page-break-before:always;">Bescheinigung über die Teilnahme am Integrationskurs (kursabschnittsweise) gemäß § 14 Abs. 4 IntV</h1>

		Hiermit wird bescheinigt, dass
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
				<td>
					Name,Vorname<br />
					<xsl:value-of select="@nachname" />, <xsl:value-of select="@vorname" />
				</td>
				<td>
					Geburtsdatum<br />
					<xsl:value-of select="@geburtsdatum" />
				</td>
			</tr>
		</table>

		<table cellspacing="0" cellpadding="2">
			<tr>
				<td>an folgendem Kursabschnitt</td>
				<td>
					<xsl:if test="@ordnungsgemaess!='J'">
						[ ]
					</xsl:if>
					<xsl:if test="@ordnungsgemaess='J'">
						[X]
					</xsl:if>
				</td>
				<td>
					ordnunngsgemäß<sup>*</sup>
				</td>
			</tr>
			<tr>
				<td />
				<td>
					<xsl:if test="@ordnungsgemaess!='N'">
						[ ]
					</xsl:if>
					<xsl:if test="@ordnungsgemaess='N'">
						[X]
					</xsl:if>
				</td>
				<td>
					<span style="letter-spacing:3px;">nicht</span> ordnunngsgemäß
				</td>
			</tr>
			<tr>
				<td />
				<td colspan="2">teilgenommen hat:</td>
			</tr>
		</table>

		<table class="border">
			<tr>
				<td colspan="2">Kurstyp</td>
				<td colspan="2">Kursabschnitt</td>
				<td>Beginn des Kursabschnitts (Datum)</td>
				<td>Ende des Kursabschnitts (Datum)</td>
			</tr>
			<tr>
				<td style="border-right-width:0;" nowrap="1">
					<xsl:if test="../@kurstyp!='Basiskurs'">
						[ ]
					</xsl:if>
					<xsl:if test="../@kurstyp='Basiskurs'">
						[X]
					</xsl:if>
				</td>
				<td style="border-left-width:0;">Basiskurs</td>
				<td style="border-right-width:0;" nowrap="1">
					<xsl:if test="../@kurstyp!='Basiskurs' or ../@kursabschnitt!='Kursabschnitt 1'">
						[ ]
					</xsl:if>
					<xsl:if test="../@kurstyp='Basiskurs' and ../@kursabschnitt='Kursabschnitt 1'">
						[X]
					</xsl:if>
				</td>
				<td style="border-left-width:0;" nowrap="1">Kursabschnitt 1</td>
				<td>
					<xsl:if test="../@kurstyp='Basiskurs' and ../@kursabschnitt='Kursabschnitt 1'">
						<xsl:value-of select="../@anfangs_datum" />
					</xsl:if>
				</td>
				<td>
					<xsl:if test="../@kurstyp='Basiskurs' and ../@kursabschnitt='Kursabschnitt 1'">
						<xsl:value-of select="../@ende_datum" />
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" />

				<td style="border-right-width:0;" nowrap="1">
					<xsl:if test="../@kurstyp!='Basiskurs' or ../@kursabschnitt!='Kursabschnitt 2'">
						[ ]
					</xsl:if>
					<xsl:if test="../@kurstyp='Basiskurs' and ../@kursabschnitt='Kursabschnitt 2'">
						[X]
					</xsl:if>
				</td>
				<td style="border-left-width:0;" nowrap="1">Kursabschnitt 2</td>
				<td>
					<xsl:if test="../@kurstyp='Basiskurs' and ../@kursabschnitt='Kursabschnitt 2'">
						<xsl:value-of select="../@anfangs_datum" />
					</xsl:if>
				</td>
				<td>
					<xsl:if test="../@kurstyp='Basiskurs' and ../@kursabschnitt='Kursabschnitt 2'">
						<xsl:value-of select="../@ende_datum" />
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" />

				<td style="border-right-width:0;" nowrap="1">
					<xsl:if test="../@kurstyp!='Basiskurs' or ../@kursabschnitt!='Kursabschnitt 3'">
						[ ]
					</xsl:if>
					<xsl:if test="../@kurstyp='Basiskurs' and ../@kursabschnitt='Kursabschnitt 3'">
						[X]
					</xsl:if>
				</td>
				<td style="border-left-width:0;" nowrap="1">Kursabschnitt 3</td>
				<td>
					<xsl:if test="../@kurstyp='Basiskurs' and ../@kursabschnitt='Kursabschnitt 3'">
						<xsl:value-of select="../@anfangs_datum" />
					</xsl:if>
				</td>
				<td>
					<xsl:if test="../@kurstyp='Basiskurs' and ../@kursabschnitt='Kursabschnitt 3'">
						<xsl:value-of select="../@ende_datum" />
					</xsl:if>
				</td>
			</tr>

			<tr>
				<td style="border-right-width:0;" nowrap="1">
					<xsl:if test="../@kurstyp!='Aufbaukurs'">
						[ ]
					</xsl:if>
					<xsl:if test="../@kurstyp='Aufbaukurs'">
						[X]
					</xsl:if>
				</td>
				<td style="border-left-width:0;">Aufbaukurs</td>
				<td style="border-right-width:0;" nowrap="1">
					<xsl:if test="../@kurstyp!='Aufbaukurs' or ../@kursabschnitt!='Kursabschnitt 1'">
						[ ]
					</xsl:if>
					<xsl:if test="../@kurstyp='Aufbaukurs' and ../@kursabschnitt='Kursabschnitt 1'">
						[X]
					</xsl:if>
				</td>
				<td style="border-left-width:0;" nowrap="1">Kursabschnitt 1</td>
				<td>
					<xsl:if test="../@kurstyp='Aufbaukurs' and ../@kursabschnitt='Kursabschnitt 1'">
						<xsl:value-of select="../@anfangs_datum" />
					</xsl:if>
				</td>
				<td>
					<xsl:if test="../@kurstyp='Aufbaukurs' and ../@kursabschnitt='Kursabschnitt 1'">
						<xsl:value-of select="../@ende_datum" />
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" />

				<td style="border-right-width:0;" nowrap="1">
					<xsl:if test="../@kurstyp!='Aufbaukurs' or ../@kursabschnitt!='Kursabschnitt 2'">
						[ ]
					</xsl:if>
					<xsl:if test="../@kurstyp='Aufbaukurs' and ../@kursabschnitt='Kursabschnitt 2'">
						[X]
					</xsl:if>
				</td>
				<td style="border-left-width:0;" nowrap="1">Kursabschnitt 2</td>
				<td>
					<xsl:if test="../@kurstyp='Aufbaukurs' and ../@kursabschnitt='Kursabschnitt 2'">
						<xsl:value-of select="../@anfangs_datum" />
					</xsl:if>
				</td>
				<td>
					<xsl:if test="../@kurstyp='Aufbaukurs' and ../@kursabschnitt='Kursabschnitt 2'">
						<xsl:value-of select="../@ende_datum" />
					</xsl:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" />

				<td style="border-right-width:0;" nowrap="1">
					<xsl:if test="../@kurstyp!='Aufbaukurs' or ../@kursabschnitt!='Kursabschnitt 3'">
						[ ]
					</xsl:if>
					<xsl:if test="../@kurstyp='Aufbaukurs' and ../@kursabschnitt='Kursabschnitt 3'">
						[X]
					</xsl:if>
				</td>
				<td style="border-left-width:0;" nowrap="1">Kursabschnitt 3</td>
				<td>
					<xsl:if test="../@kurstyp='Aufbaukurs' and ../@kursabschnitt='Kursabschnitt 3'">
						<xsl:value-of select="../@anfangs_datum" />
					</xsl:if>
				</td>
				<td>
					<xsl:if test="../@kurstyp='Aufbaukurs' and ../@kursabschnitt='Kursabschnitt 3'">
						<xsl:value-of select="../@ende_datum" />
					</xsl:if>
				</td>
			</tr>


			<tr>
				<td style="border-right-width:0;">
					<xsl:if test="../@kurstyp!='Orientierungskurs'">
						[ ]
					</xsl:if>
					<xsl:if test="../@kurstyp='Orientierungskurs'">
						[X]
					</xsl:if>
				</td>
				<td style="border-left-width:0;">Orientierungskurs</td>
				<td colspan="2" />
				<td>
					<xsl:if test="../@kurstyp='Orientierungskurs'">
						<xsl:value-of select="../@anfangs_datum" />
					</xsl:if>
				</td>
				<td>
					<xsl:if test="../@kurstyp='Orientierungskurs'">
						<xsl:value-of select="../@ende_datum" />
					</xsl:if>
				</td>
			</tr>

		</table>

		<xsl:apply-templates select="../traeger" />

		<p style="margin-top:2cm">
			<sup>*</sup> Erläuterung: Ordnungsgemäß ist die Teilnahme, wenn ein Teilnehmer so regelmäßig am Kurs teilnimmt, dass ein Kurserfolg möglich ist
			und der Lernerfolg insbesondere durch Kursabbruch oder häufige Nichtteilnahme nicht gefährdet ist (§ 14 Abs. 4 Satz 2 IntV):
		</p>
		<p align="right">KNr. 630 037b BAMF 6/2005</p>
	</xsl:template>

	<xsl:template match='traeger'>
		<table class="border">
			<tr><td>Name des Kursträgers <xsl:value-of select="@traeger_name" /></td></tr>
			<tr><td>Kennziffer des Kursträgers <xsl:value-of select="@traeger_bamf_nr" /></td></tr>
		</table>

		<table class="border">
			<tr><td height="80pt" valign="top">Ort, Datum Unterschrift des Kursträgers <xsl:value-of select="@traeger_ort" />, den <!-- xsl:value-of select="fn:current-date()" / not yet supported by seamonkey--></td></tr>
		</table>
	</xsl:template>

</xsl:stylesheet>

