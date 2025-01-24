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
				<title>Abrechnungsbogen Integrationskurse (Kursträger)</title>
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
						font-size:10pt;
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
					td.fahrtkosten
					{
						background-color: #CCFFFF;
					}
					.label6
					{
						text-align: right;
						font-size: 9pt;
						font-weight: bold;
					}
				</style>
			</head>
			<body>
				<table class="border" style="border:2px solid #000000;">
					<tr><td colspan="11"><h1><img src="bamf_logo.gif" align="left"/>Abrechnungsbogen Integrationskurse (Kursträger)</h1></td></tr>
					<tr>
						<td colspan="2" class="label1" style="border-bottom-width:0;">Träger-Nr- Bundesland- Kurs-Nr - Haushaltsjahr</td>
						<td colspan="4">
							<xsl:value-of select="traeger/@traeger_bamf_nr" /> -
							<xsl:value-of select="@nummer" /> -
							<xsl:value-of select="traeger/@traeger_bundesland" /> -
							<xsl:value-of select="@jahr" />
						</td>
						<td colspan="5" class="label3">Umsatzsteuerpflicht</td>
					</tr>
					<tr>
						<td colspan="2" class="label1" style="border-bottom-width:0; border-top-width:0;">Kursabschnitt</td>
						<td colspan="4">
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
						<td colspan="5">
							<table width="100%"><tr>
								<td style="border-width:0;">
									<xsl:if test="@umsatzsteuer='0.00'">[X]</xsl:if>
									<xsl:if test="@umsatzsteuer!='0.00'">[ ]</xsl:if>
									nein
								</td>
								<td style="border-width:0;">
									<xsl:if test="@umsatzsteuer='7.00'">[X]</xsl:if>
									<xsl:if test="@umsatzsteuer!='7.00'">[ ]</xsl:if>
									Ja 7%
								</td>
								<td style="border-width:0;">
									<xsl:if test="@umsatzsteuer='19.00'">[X]</xsl:if>
									<xsl:if test="@umsatzsteuer!='19.00'">[ ]</xsl:if>
									Ja 19%
								</td>
							</tr></table>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="label1" style="border-top-width:0;">Kursart</td>
						<td colspan="4"><xsl:value-of select="@kursart" /></td>
						<td colspan="5" align="center" class="fahrtkosten label3" style="border-width:0;">Kooperationsmodell Fahrtkosten</td>
					</tr>
					<tr>
						<td colspan="3" rowspan="3" valign="top">
							<div class="label2">Anschrift Integrationskursträger:</div>
							<center>
								<xsl:value-of select="traeger/@traeger_name" /><br/>
								<xsl:value-of select="traeger/@traeger_strasse" />,<xsl:value-of select="traeger/@traeger_plz" /><xsl:text> </xsl:text> <xsl:value-of select="traeger/@traeger_ort" />
							</center>
						</td>
						<td colspan="3" rowspan="2" valign="top">
							<div class="label2">Mein Zeichen:</div>
							<center>
								<xsl:value-of select="@nummer" /><br/>
							</center>
						</td>
						<td class="fahrtkosten label6" style="border-width:0; border-bottom:1pt dotted #000000;" colspan="3">
							Teilnahme
						</td>
						<td class="fahrtkosten" style="border-width:0; border-bottom:1pt dotted #000000; padding-left:5pt;">[_] ja</td>
						<td class="fahrtkosten" style="border-width:0; border-bottom:1pt dotted #000000; padding-left:5pt;">[_] nein</td>
					</tr>
					<tr>
						<td colspan="3" class="fahrtkosten label6" style="border-width:0;">vorzeitiges Kursende/<br />Fahrtkostenverrechnung</td>
						<td class="fahrtkosten" style="border-width:0; padding-left:5pt;">[_] ja</td>
						<td class="fahrtkosten" style="border-width:0; padding-left:5pt;">(Hinweis:<br/>siehe unten)</td>
					</tr>
					<tr>
						<td colspan="3" valign="top">
							<div class="label2">Kursort:</div>
							<center>
								<xsl:value-of select="traeger/@traeger_strasse" />,<xsl:value-of select="traeger/@traeger_plz" /><xsl:text> </xsl:text> <xsl:value-of select="traeger/@traeger_ort" />
							</center>
						</td>
						<td colspan="5" class="label3">Zahlungsrelevante Angaben</td>
					</tr>
					<tr class="label4">
						<td>Lfd.<br/>Nr.</td>
						<td>Name, Vorname</td>
						<td>Geburtsdatum</td>
						<td>TN-<br/>Typ</td>
						<td>KB-<br/>Typ</td>
						<td>Nummer der<br/>Bestätigung</td>
						<td>Einstufungstest<br/>(Datum)</td>
						<td>Fahrt-<br/>kosten<br/>(Betrag)</td>
						<td>Abschlußtest<br/>Sprachkurs<br/>B1 / skaliert<br/>(Datum)</td>
						<td>Abschlußtest<br/>Sprachkurs<br/>A2<br/>(Datum)</td>
						<td>Abschlußtest<br/>Orientierungs-<br/>kurs<br/>(Datum)</td>
					</tr>
					<xsl:apply-templates select="schueler">
						<xsl:sort select="@nachname" />
						<xsl:sort select="@vorname" />
					</xsl:apply-templates>
					
					<tr>
						<td colspan="5" rowspan="7" style="font-size:7pt;" valign="top">
							<u><i>TN (Teilnehmer-) Typ:</i></u><br/>
							1 = Neuzuwandernde Ausländer<br/>
							2 = Bestandsausländer (Verpflichtung durch ABH)<br/>
							3 = Bestandsausländer/ EU-Bürger/Deutscher (Zulassung)<br/>
							4 = Spätaussiedler<br/>
							5 = ALG II-Bezieher (Verpflichtung durch TGS)<br/>
							6 = Kurswiederholer<br/>
							<br/>
							<u><i>KB (Kostenbeitrags-) Typ:</i></u><br />
							1 = mit Kostenbeitrag       1,00 EUR Regelfall<br/>
							2 = ohne Kostenbeitrag      BAMF-Entscheidung<br/>
							<br/>
							<u>Testkosten:</u><br/>
							Einstufungstest:       bis 15.01.08   12,50 EUR/TN<br/>
							                        ab 16.01.08   30,00 EUR/TN<br/>
							<b>bis 30.06.2009</b><br/>
							Abschlusstest Sprachkurs B1:       78,65 EUR/TN<br/>
							(Testunterlagen/Auswertungen 44,65 EUR + Testdurchführung 34,00 EUR)<br/>
							Abschlusstest Sprachkurs A2:       53,30 EUR/TN<br/>
							(Testunterlagen/Auswertungen 22,80 EUR + Testdurchführung 30,50 EUR)<br/>
							<b>ab 01.07.2009</b><br/>
							Skalierter Abschlusstest Sprachkurs:       78,65 EUR/TN<br/>
							(Testunterlagen/Auswertungen 48,45 EUR + Testdurchführung 30,20 EUR)<br/>
							Abschlusstest Orientierungskurs:    5,00 EUR/TN
						</td>
						<td colspan="6" style="font-size:8pt;" align="center"><b>Bankverbindung des Sprachkursträgers</b></td>
					</tr>
					<tr><td class="label5">Bankname</td><td colspan="5"><xsl:value-of select="traeger/@traeger_bank" /></td></tr>
					<tr><td class="label5">Bankleitzahl</td><td colspan="5"><xsl:value-of select="traeger/@traeger_blz" /></td></tr>
					<tr><td class="label5">Kontonummer</td><td colspan="5"><xsl:value-of select="traeger/@traeger_konto" /></td></tr>
					<tr><td class="label5">Verwendungszweck</td><td colspan="5"><xsl:value-of select="@nummer" /></td></tr>
					<tr><td colspan="6" style="height:4cm" /></tr>
					<tr><td colspan="6" class="label1">Datum, Unterschrift Kursträger, Stempel</td></tr>
					<tr><td style="font-size:8pt;" colspan="11">
						Hinweis zu vorzeitigem Kursende: Bitte stets ankreuzen, wenn mit diesem Kursabschnitt  der Kurs vorzeitig (d.h. vor Durchführung 
						des Orientierungskurses) beendet wird. Für Teilnehmer des Kooperationsmodells Fahrtkosten bedeutet dies zudem, dass das 
						Fahrtkostenbudget mit der Abrechnung dieses Kursabschnitts verrechnet wird.
					</td></tr>
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match='schueler'>
		<tr>
			<td><xsl:value-of select="position()" /></td>
			<td><xsl:value-of select="@nachname" />, <xsl:value-of select="@vorname" /></td>
			<td>
				<xsl:value-of select="@geburtsdatum" />
			</td>
			<td>
				<xsl:if test="@auslaender_status='Neuzuwandernde Ausländer'">
					1
				</xsl:if>
				<xsl:if test="@auslaender_status='Verpflichtet (ABH)'">
					1
				</xsl:if>
				<xsl:if test="@auslaender_status='Berechtigt (ABH)'">
					1
				</xsl:if>
				<xsl:if test="@auslaender_status='Bestandsausländer (Verpflichtung durch ABH)'">
					2
				</xsl:if>
				<xsl:if test="@auslaender_status='Bestandsausländer/EU-Bürger/Deutscher'">
					3
				</xsl:if>
				<xsl:if test="@auslaender_status='Spätaussiedler'">
					4
				</xsl:if>
				<xsl:if test="@auslaender_status='ALG II-Bezieher (Verpflichtung durch TGS)'">
					5
				</xsl:if>
				<xsl:if test="@auslaender_status='Kurswiederholer'">
					6
				</xsl:if>
			</td>
			<td>
				<xsl:if test="@kostenbeteiligung='Standard'">
					1
				</xsl:if>
				<xsl:if test="@kostenbeteiligung='Befreit'">
					2
				</xsl:if>
			</td>
			<td><xsl:value-of select="@bamf_nummer" /></td>
			<td><xsl:value-of select="pruefungen/pruefung[(@pruefung='Einstufungstest' and @bestanden='J') or @bestanden='Einstufungstest']/@datum" /></td>
			<td><!-- xsl:value-of select="@fahrtkostenbewilligung" / --></td>
			<td><xsl:value-of select="pruefungen/pruefung[(@pruefung='B1-Test' and @bestanden='J') or @bestanden='B1-Test']/@datum" /></td>
			<td><xsl:value-of select="pruefungen/pruefung[(@pruefung='A2-Test' and @bestanden='J') or @bestanden='A2-Test']/@datum" /></td>
			<td><xsl:value-of select="pruefungen/pruefung[(@pruefung='Orientierungstest' and @bestanden='J') or @bestanden='Orientierungstest']/@datum" /></td>
		</tr>
	</xsl:template>


</xsl:stylesheet>

