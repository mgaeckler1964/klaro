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
				<title>Meldung über den Beginn eines Integrationskurses gemäß § 8 Abs. 2 Satz 1 IntV</title>
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
					h3
					{
						font-size: 10pt;
						letter-spacing: 3px;
						text-align: center;
					}
				</style>
			</head>
			<body>
				<img src="bamf_logo.gif" />
				<h1>Meldung über den Beginn eines Integrationskurses gemäß § 8 Abs. 2 Satz 1 IntV</h1>
				<h2>Angaben zum Kursträger / Kursort</h2>
				<xsl:apply-templates select="traeger"  mode='angaben' />
				<h2>Angaben zum Kurs</h2>

				<table cellpadding="0" cellspacing="0">
					<tr>
						<td valign="top">
							<b>Kursart</b>
							<table class="border">
								<tr>
									<td><u>Integrationskurs allgemein</u></td>
									<td>
										<xsl:if test="@kursart='Integrationskurs allgemein'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Integrationskurs allgemein'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr style="color:#FFFFFF;">
									<td>_</td>
									<td>_</td>
								</tr>
								<tr>
									<td><u>Integrationskurs spez. Zielgruppen</u></td>
									<td>
									</td>
								</tr>
								<tr>
									<td>Jugend</td>
									<td>
										<xsl:if test="@kursart='Jugendkurs'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Jugendkurs'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Eltern</td>
									<td>
										<xsl:if test="@kursart='Elternkurs'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Elternkurs'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Frauen</td>
									<td>
										<xsl:if test="@kursart='Frauenkurs'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Frauenkurs'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Alpha</td>
									<td>
										<xsl:if test="@kursart='Alphakurs'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Alphakurs'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Förderkurs</td>
									<td>
										<xsl:if test="@kursart='Förderkurs'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Förderkurs'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Sonst. spez. Integrationskurs</td>
									<td>
										<xsl:if test="@kursart='Sonst. spez. Integrationskurs'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Sonst. spez. Integrationskurs'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr style="color:#FFFFFF;">
									<td>_</td>
									<td>_</td>
								</tr>
								<tr>
									<td><u>Intensivkurs</u></td>
									<td>
										<xsl:if test="@kursart='Intensivkurs'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Intensivkurs'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td><u>Wiederholerkurs</u></td>
									<td>
										<xsl:if test="@kursart='Wiederholerkurs'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Wiederholerkurs'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td><u>Wiederholerkurs Alpha</u></td>
									<td>
										<xsl:if test="@kursart='Wiederholerkurs Alpha'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Wiederholerkurs Alpha'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td><u>Wiederholerkurs Jugendliche</u></td>
									<td>
										<xsl:if test="@kursart='Wiederholerkurs Jugendliche'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Wiederholerkurs Jugendliche'">
											[ ]
										</xsl:if>
									</td>
								</tr>
							</table>
						</td>
						<td valign="top" style="padding-left:12pt;">
							<b>Kursbeginn mit</b> (nicht auszufüllen bei Wiederholerkursen)
							<table class="border">
								<tr><td><b>Kurstyp</b></td><td /><td><b>Kursabschnitt (Modul)</b></td><td /></tr>
								<tr style="color:#FFFFFF;">
									<td>_</td>
									<td>_</td>
									<td>_</td>
									<td>_</td>
								</tr>
								<tr>
									<td>Basiskurs</td>
									<td>
										<xsl:if test="@kurstyp='Basiskurs'">
											[X]
										</xsl:if>
										<xsl:if test="@kurstyp!='Basiskurs'">
											[ ]
										</xsl:if>
									</td>
									<td>Abschnitt 1</td>
									<td>
										<xsl:if test="@kursabschnitt='Kursabschnitt 1'">
											[X]
										</xsl:if>
										<xsl:if test="@kursabschnitt!='Kursabschnitt 1'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Aufbaukurs</td>
									<td>
										<xsl:if test="@kurstyp='Aufbaukurs'">
											[X]
										</xsl:if>
										<xsl:if test="@kurstyp!='Aufbaukurs'">
											[ ]
										</xsl:if>
									</td>
									<td>Abschnitt 2</td>
									<td>
										<xsl:if test="@kursabschnitt='Kursabschnitt 2'">
											[X]
										</xsl:if>
										<xsl:if test="@kursabschnitt!='Kursabschnitt 2'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Orientierungskurs</td>
									<td>
										<xsl:if test="@kurstyp='Orientierungskurs'">
											[X]
										</xsl:if>
										<xsl:if test="@kurstyp!='Orientierungskurs'">
											[ ]
										</xsl:if>
									</td>
									<td>Abschnitt 3</td>
									<td>
										<xsl:if test="@kursabschnitt='Kursabschnitt 3'">
											[X]
										</xsl:if>
										<xsl:if test="@kursabschnitt!='Kursabschnitt 3'">
											[ ]
										</xsl:if>
									</td>
								</tr>
							</table>
							<b>Wochenstunden</b>
							<table class="border">
								<tr>
									<td>Vollzeitkurs</td>
									<td>
										<xsl:if test="@wochenstunden&gt;'30'">
											[X]
										</xsl:if>
										<xsl:if test="@wochenstunden&lt;='30'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Teilzeitkurs</td>
									<td>
										<xsl:if test="@wochenstunden&lt;='30'">
											[X]
										</xsl:if>
										<xsl:if test="@wochenstunden&gt;'30'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Anzahl der Wochenstunden.....</td>
									<td><xsl:value-of select="@mo_zeit + @di_zeit + @mi_zeit + @do_zeit + @fr_zeit + @sa_zeit + @so_zeit" /></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>

				<table class="border">
					<tr>
						<td><b>Kursbeginn am</b> (Datum)<br /><xsl:value-of select="@anfangs_datum" /></td>
						<td><b>Vorraussichtl. Kursende</b> (Datum)<br /><xsl:value-of select="@ende_datum" /></td>
						<td><b>Abschlusstest Sprachkurs</b> (Datum)<br />(soweit bereits bekannt) <xsl:value-of select="@abschlusstest_datum" /></td>
					</tr>
				</table>

				<h2>Unterrichtszeiten</h2>
				<table class="border">
					<tr>
						<td colspan="2"/>
						<td>Montag</td><td>Dienstag</td><td>Mittwoch</td><td>Donnerstag</td><td>Freitag</td><td>Samstag</td><td>Sonntag</td>
					</tr>
					<tr>
						<td style="border-bottom-width:0; border-right-width:0;">Unterricht</td><td style="border-bottom-width:0; border-left-width:0;">von:</td>
						<td>
							<xsl:if test="@mo_zeit&gt;'0'">
								<xsl:value-of select="@mo_anf" />
							</xsl:if>
						</td>
						<td>
							<xsl:if test="@di_zeit&gt;'0'">
								<xsl:value-of select="@di_anf" />
							</xsl:if>
						</td>
						<td>
							<xsl:if test="@mi_zeit&gt;'0'">
								<xsl:value-of select="@mi_anf" />
							</xsl:if>
						</td>
						<td>
							<xsl:if test="@do_zeit&gt;'0'">
								<xsl:value-of select="@do_anf" />
							</xsl:if>
						</td>
						<td>
							<xsl:if test="@fr_zeit&gt;'0'">
								<xsl:value-of select="@fr_anf" />
							</xsl:if>
						</td>
						<td>
							<xsl:if test="@sa_zeit&gt;'0'">
								<xsl:value-of select="@sa_anf" />
							</xsl:if>
						</td>
						<td>
							<xsl:if test="@so_zeit&gt;'0'">
								<xsl:value-of select="@so_anf" />
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td style="border-top-width:0; border-right-width:0;" /><td style="border-top-width:0; border-left-width:0;">bis:</td>
						<td>
							<xsl:if test="@mo_zeit&gt;'0'">
								<xsl:value-of select="@mo_end" />
							</xsl:if>
						</td>
						<td>
							<xsl:if test="@di_zeit&gt;'0'">
								<xsl:value-of select="@di_end" />
							</xsl:if>
						</td>
						<td>
							<xsl:if test="@mi_zeit&gt;'0'">
								<xsl:value-of select="@mi_end" />
							</xsl:if>
						</td>
						<td>
							<xsl:if test="@do_zeit&gt;'0'">
								<xsl:value-of select="@do_end" />
							</xsl:if>
						</td>
						<td>
							<xsl:if test="@fr_zeit&gt;'0'">
								<xsl:value-of select="@fr_end" />
							</xsl:if>
						</td>
						<td>
							<xsl:if test="@sa_zeit&gt;'0'">
								<xsl:value-of select="@sa_end" />
							</xsl:if>
						</td>
						<td>
							<xsl:if test="@so_zeit&gt;'0'">
								<xsl:value-of select="@so_end" />
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td style="border-top-width:2px; border-bottom-width:0; border-right-width:0;">Pause</td><td style="border-top-width:2px; border-bottom-width:0; border-left-width:0;">von:</td>
						<td style="border-top-width:2px;">
							<xsl:if test="@mo_zeit&gt;'0'">
								<xsl:value-of select="@mo_paus_anf" />
							</xsl:if>
						</td>
						<td style="border-top-width:2px;">
							<xsl:if test="@di_zeit&gt;'0'">
								<xsl:value-of select="@di_paus_anf" />
							</xsl:if>
						</td>
						<td style="border-top-width:2px;">
							<xsl:if test="@mi_zeit&gt;'0'">
								<xsl:value-of select="@mi_paus_anf" />
							</xsl:if>
						</td>
						<td style="border-top-width:2px;">
							<xsl:if test="@do_zeit&gt;'0'">
								<xsl:value-of select="@do_paus_anf" />
							</xsl:if>
						</td>
						<td style="border-top-width:2px;">
							<xsl:if test="@fr_zeit&gt;'0'">
								<xsl:value-of select="@fr_paus_anf" />
							</xsl:if>
						</td>
						<td style="border-top-width:2px;">
							<xsl:if test="@sa_zeit&gt;'0'">
								<xsl:value-of select="@sa_paus_anf" />
							</xsl:if>
						</td>
						<td style="border-top-width:2px;">
							<xsl:if test="@so_zeit&gt;'0'">
								<xsl:value-of select="@so_paus_anf" />
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td style="border-top-width:0; border-right-width:0;"/><td style="border-top-width:0; border-left-width:0;">bis:</td>
						<td>
							<xsl:if test="@mo_zeit&gt;'0'">
								<xsl:value-of select="@mo_paus_end" />
							</xsl:if>
						</td>
						<td>
							<xsl:if test="@di_zeit&gt;'0'">
								<xsl:value-of select="@di_paus_end" />
							</xsl:if>
						</td>
						<td>
							<xsl:if test="@mi_zeit&gt;'0'">
								<xsl:value-of select="@mi_paus_end" />
							</xsl:if>
						</td>
						<td>
							<xsl:if test="@do_zeit&gt;'0'">
								<xsl:value-of select="@do_paus_end" />
							</xsl:if>
						</td>
						<td>
							<xsl:if test="@fr_zeit&gt;'0'">
								<xsl:value-of select="@fr_paus_end" />
							</xsl:if>
						</td>
						<td>
							<xsl:if test="@sa_zeit&gt;'0'">
								<xsl:value-of select="@sa_paus_end" />
							</xsl:if>
						</td>
						<td>
							<xsl:if test="@so_zeit&gt;'0'">
								<xsl:value-of select="@so_paus_end" />
							</xsl:if>
						</td>
					</tr>
					<tr>
						<td style="border-top-width:4px;" colspan="2">Zahl d. Unterrichtsst.</td>
						<td style="border-top-width:4px;">
							<xsl:if test="@mo_zeit&gt;'0'">
								<xsl:value-of select="@mo_zeit" />
							</xsl:if>
						</td>
						<td style="border-top-width:4px;">
							<xsl:if test="@di_zeit&gt;'0'">
								<xsl:value-of select="@di_zeit" />
							</xsl:if>
						</td>
						<td style="border-top-width:4px;">
							<xsl:if test="@mi_zeit&gt;'0'">
								<xsl:value-of select="@mi_zeit" />
							</xsl:if>
						</td>
						<td style="border-top-width:4px;">
							<xsl:if test="@do_zeit&gt;'0'">
								<xsl:value-of select="@do_zeit" />
							</xsl:if>
						</td>
						<td style="border-top-width:4px;">
							<xsl:if test="@fr_zeit&gt;'0'">
								<xsl:value-of select="@fr_zeit" />
							</xsl:if>
						</td>
						<td style="border-top-width:4px;">
							<xsl:if test="@sa_zeit&gt;'0'">
								<xsl:value-of select="@sa_zeit" />
							</xsl:if>
						</td>
						<td style="border-top-width:4px;">
							<xsl:if test="@so_zeit&gt;'0'">
								<xsl:value-of select="@so_zeit" />
							</xsl:if>
						</td>
					</tr>
				</table>
				
				<table class="border">
					<tr><td><b>Ferien / Kursunterbrechungen (Von/bis/Grund)</b><br/>
						<xsl:apply-templates select="ferien" />
						<xsl:if test="@feiertage &gt; ''">
							<table border="0"><tr>
								<td style="border-width: 0"><xsl:value-of select="@feiertage" /></td>
							</tr></table>
						</xsl:if>
					</td></tr>
				</table>
				<p align="right">KNr. 630 017o BAMF 10/2008</p>
				
				<h2 style="page-break-before:always;">Angaben zum Kursleiter / zur Kursleiterin (Zulassung vom Bundesamt muß vorliegen)</h2>
				<div class="border">
					<table border="0">
						<xsl:apply-templates select="lehrer">
							<xsl:sort select="@nachname" />
							<xsl:sort select="@vorname" />
						</xsl:apply-templates>
					</table>
				</div>

				<h2>Eingesetztes Lehrwerk</h2>
				<xsl:call-template name="lehrbuecher">
					<xsl:with-param name="gruppe">Sprachkurs</xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="lehrbuecher">
					<xsl:with-param name="gruppe">Orientierungskurs</xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="lehrbuecher">
					<xsl:with-param name="gruppe">Sprachkurs des Alphabetisierungskurses</xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="lehrbuecher">
					<xsl:with-param name="gruppe">Orientierungskurs des Alphabetisierungskurses</xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="lehrbuecher">
					<xsl:with-param name="gruppe">Zusatzmaterialien Alphabetisierungskurs</xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="lehrbuecher">
					<xsl:with-param name="gruppe">Zusatzmaterialien</xsl:with-param>
				</xsl:call-template>

				<h2 style="page-break-before:always;">Kursteilnehmer/innen soweit nach dem Zuwandergesetz zur Teilnahme berechtigt/verpflichtet</h2>
				<table class="border">
					<tr>
						<td valign="top">Nr.<br/><br/></td>
						<td width="100%" valign="top">Name, Vorname<br/><br/></td>
						<td valign="top">Personenkennziffer des Bundesamtes<br/><br/></td>
						<td valign="top">ABH-Kennziffer<br/><br/></td>
						<td valign="top">BVA-Kennziffer<br/><br/></td>
						<td valign="top">Aktenzeichen Träger d. Grunds. f. Arbeitssuchende<br/><br/></td>
					</tr>

					<xsl:apply-templates select="schueler">
						<xsl:sort select="@nachname" />
						<xsl:sort select="@vorname" />
					</xsl:apply-templates>
				</table>
				<table class="border">
					<tr><td>Zahl der Kursteilnehmer/innen insgesamt	<xsl:value-of select="count( schueler )" /> Personen</td></tr>
				</table>
				<xsl:apply-templates select="traeger"  mode='unterschrift' />
			</body>
		</html>
	</xsl:template>

	<xsl:template match='traeger' mode='angaben'>
		<table class="border">
			<tr>
				<td valign="top">Name des Kursträgers <xsl:value-of select="@traeger_name" /></td>
				<td valign="top">Kennziffer des Kursträgers <xsl:value-of select="@traeger_bamf_nr" /></td>
			</tr>
		</table>
		Anschrift des <span style="letter-spacing:3px;">Kursortes</span>
		<table class="border">
			<tr>
				<td>Staße / Hausnummer <xsl:value-of select="@traeger_strasse" /></td>
				<td>Postleitzahl <xsl:value-of select="@traeger_plz" /></td>
				<td>Ort <xsl:value-of select="@traeger_ort" /></td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match='ferien'>
		<table border="0">
			<xsl:for-each select="unterbrechung">
				<tr>
					<td style="border-width: 0"><xsl:value-of select="@anfang" /></td>
					<td style="border-width: 0"><xsl:value-of select="@ende" /></td>
					<td style="border-width: 0"><xsl:value-of select="@bezeichnung" /></td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>

	<xsl:template match="lehrer">
		<tr><td style="padding-top:12pt;">Name:</td><td style="padding-top:12pt;"><xsl:value-of select="@nachname" /></td></tr>
		<tr><td>Vorname:</td><td><xsl:value-of select="@vorname" /></td></tr>
		<tr><td>Zulassungsnummer (falls verfügbar):</td><td><xsl:value-of select="@bamf_nummer" /></td></tr>
		<tr><td style="padding-bottom:12pt;">Geburtsdatum:</td><td style="padding-bottom:12pt;"><xsl:value-of select="@geburtsdatum" /></td></tr>
	</xsl:template>
	
	<xsl:template name="lehrbuecher">
		<xsl:param name="gruppe">Sprachkurs</xsl:param>
		<h3><xsl:value-of select="$gruppe" /></h3>
		<table class="border">
			<xsl:apply-templates select="lehrbuecher/buch[@gruppe=$gruppe]">
				<xsl:sort select="@titel" />
			</xsl:apply-templates>
		</table>
	</xsl:template>

	<xsl:template match="buch">
		<tr>
			<td>
				<b><xsl:value-of select="@titel" /></b>
				<xsl:if test="@untertitel!=''">
					<xsl:text>, </xsl:text>
					<xsl:value-of select="@untertitel" />
				</xsl:if>
				<xsl:if test="@verlag!=''">
					<xsl:text>, </xsl:text>
					<xsl:value-of select="@verlag" />
				</xsl:if>
				<xsl:if test="@kurs_titel != ''">
					<br/>
					<xsl:value-of select="@kurs_titel" />
				</xsl:if>
			</td>
			<td nowrap="1" width="3%" align="center" valign="top">
				<xsl:if test="@verwendet='1'">
					[X]
				</xsl:if>
				<xsl:if test="@verwendet='0'">
					[ ]
				</xsl:if>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match='schueler'>
		<xsl:if test="@bamf_nummer!='' or @abh_nummer!='' or @bva_nummer!=''">
			<tr valign="top">
				<td><xsl:value-of select="position()" /></td>
				<td>
					<xsl:value-of select="@nachname" />, <xsl:value-of select="@vorname" />
				</td>
				<td>
					<xsl:value-of select="@bamf_nummer" />
				</td>
				<td>
					<xsl:value-of select="@abh_nummer" />
				</td>
				<td>
					<xsl:value-of select="@bva_nummer" />
				</td>
				<td>
					<xsl:value-of select="@az_grundsicherung" />
				</td>
			</tr>
		</xsl:if>
	</xsl:template>

	<xsl:template match='traeger' mode="unterschrift">
		<table class="border">
			<tr height="80pt"><td valign="top">
				Ort/Datum, Unterschrift des Kursträgers<br/>
				<xsl:value-of select="@traeger_ort" />, den <!-- xsl:value-of select="fn:current-date()" / not yet supported by seamonkey-->
			</td></tr>
		</table>
	</xsl:template>

</xsl:stylesheet>

