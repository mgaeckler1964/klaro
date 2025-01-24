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
		<xsl:variable name="tmpAbschnitt">
			<xsl:if test="@kurstyp='Aufbaukurs'">
				<xsl:if test="@kursabschnitt='Kursabschnitt 1'">Kursabschnitt 4</xsl:if>
				<xsl:if test="@kursabschnitt='Kursabschnitt 2'">Kursabschnitt 5</xsl:if>
				<xsl:if test="@kursabschnitt='Kursabschnitt 3'">Kursabschnitt 6</xsl:if>
			</xsl:if>
			<xsl:if test="@kurstyp='Spezialkurs'">
				<xsl:if test="@kursabschnitt='Kursabschnitt 1'">Kursabschnitt 7</xsl:if>
				<xsl:if test="@kursabschnitt='Kursabschnitt 2'">Kursabschnitt 8</xsl:if>
				<xsl:if test="@kursabschnitt='Kursabschnitt 3'">Kursabschnitt 9</xsl:if>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="kursAbschnitt">
			<xsl:if test="$tmpAbschnitt!=''"><xsl:value-of select="$tmpAbschnitt" /></xsl:if>
			<xsl:if test="$tmpAbschnitt=''"><xsl:value-of select="@kursabschnitt" /></xsl:if>
		</xsl:variable>
			
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
							<table><tr style="height:30pt">
								<td valign="top"><b>Kursart</b></td>
							</tr></table>
							<table class="border">
								<tr>
									<td>Integrationskurs allgemein</td>
									<td>
										<xsl:if test="@kursart='Integrationskurs allgemein'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Integrationskurs allgemein'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Wiederholerkurs allgemein</td>
									<td>
										<xsl:if test="@kursart='Wiederholerkurs allgemein' or @kursart='Wiederholerkurs'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Wiederholerkurs allgemein' and @kursart!='Wiederholerkurs'">
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
									<td>Jugendkurs</td>
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
									<td>Elternkurs</td>
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
									<td>Frauenkurs</td>
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
									<td>Alphakurs</td>
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
									<td>Intensivkurs</td>
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
									<td>Gehörlosenkurs</td>
									<td>
										<xsl:if test="@kursart='Gehörlosenkurs'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Gehörlosenkurs'">
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
									<td>Wiederholerkurs Jugendkurs</td>
									<td>
										<xsl:if test="@kursart='Wiederholerkurs Jugendliche' or @kursart='Wiederholerkurs Jugendkurs'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Wiederholerkurs Jugendliche' and @kursart!='Wiederholerkurs Jugendkurs'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Wiederholerkurs Elternkurs</td>
									<td>
										<xsl:if test="@kursart='Wiederholerkurs Elternkurs'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Wiederholerkurs Elternkurs'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Wiederholerkurs Frauenkurs</td>
									<td>
										<xsl:if test="@kursart='Wiederholerkurs Frauenkurs'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Wiederholerkurs Frauenkurs'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Wiederholerkurs Alphakurs</td>
									<td>
										<xsl:if test="@kursart='Wiederholerkurs Alpha' or @kursart='Wiederholerkurs Alphakurs'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Wiederholerkurs Alpha' and @kursart!='Wiederholerkurs Alphakurs'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Wiederholerkurs Förderkurs</td>
									<td>
										<xsl:if test="@kursart='Wiederholerkurs Förderkurs'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Wiederholerkurs Förderkurs'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Wiederholerkurs Gehörlosenkurs</td>
									<td>
										<xsl:if test="@kursart='Wiederholerkurs Gehörlosenkurs'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Wiederholerkurs Gehörlosenkurs'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Wiederholerkurs Sonst. spez.<br/>Integrationskurs</td>
									<td>
										<xsl:if test="@kursart='Wiederholerkurs Sonst. spez. Integrationskurs'">
											[X]
										</xsl:if>
										<xsl:if test="@kursart!='Wiederholerkurs Sonst. spez. Integrationskurs'">
											[ ]
										</xsl:if>
									</td>
								</tr>
							</table>
						</td>
						<td valign="top" style="padding-left:12pt;">
							<table><tr style="height:30pt">
								<td valign="top"><b>Kursbeginn mit</b></td>
								<td valign="top">(nicht auszufüllen bei<br/>Wiederholerkursen)</td>
							</tr></table>
							<table class="border">
								<tr style="color:#FFFFFF;">
									<td>_</td>
									<td>_</td>
								</tr>
								<tr>
									<td>Abschnitt 1</td>
									<td>
										<xsl:if test="$kursAbschnitt='Kursabschnitt 1'">
											[X]
										</xsl:if>
										<xsl:if test="$kursAbschnitt!='Kursabschnitt 1'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Abschnitt 2</td>
									<td>
										<xsl:if test="$kursAbschnitt='Kursabschnitt 2'">
											[X]
										</xsl:if>
										<xsl:if test="$kursAbschnitt!='Kursabschnitt 2'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Abschnitt 3</td>
									<td>
										<xsl:if test="$kursAbschnitt='Kursabschnitt 3'">
											[X]
										</xsl:if>
										<xsl:if test="$kursAbschnitt!='Kursabschnitt 3'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Abschnitt 4</td>
									<td>
										<xsl:if test="$kursAbschnitt='Kursabschnitt 4'">
											[X]
										</xsl:if>
										<xsl:if test="$kursAbschnitt!='Kursabschnitt 4'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Abschnitt 5</td>
									<td>
										<xsl:if test="$kursAbschnitt='Kursabschnitt 5'">
											[X]
										</xsl:if>
										<xsl:if test="$kursAbschnitt!='Kursabschnitt 5'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Abschnitt 6</td>
									<td>
										<xsl:if test="$kursAbschnitt='Kursabschnitt 6'">
											[X]
										</xsl:if>
										<xsl:if test="$kursAbschnitt!='Kursabschnitt 6'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Abschnitt 7 (Spezialkurs)</td>
									<td>
										<xsl:if test="$kursAbschnitt='Kursabschnitt 7'">
											[X]
										</xsl:if>
										<xsl:if test="$kursAbschnitt!='Kursabschnitt 7'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Abschnitt 8 (Spezialkurs)</td>
									<td>
										<xsl:if test="$kursAbschnitt='Kursabschnitt 8'">
											[X]
										</xsl:if>
										<xsl:if test="$kursAbschnitt!='Kursabschnitt 8'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>Abschnitt 9 (Spezialkurs)</td>
									<td>
										<xsl:if test="$kursAbschnitt='Kursabschnitt 9'">
											[X]
										</xsl:if>
										<xsl:if test="$kursAbschnitt!='Kursabschnitt 9'">
											[ ]
										</xsl:if>
									</td>
								</tr>
								<tr style="color:#FFFFFF;">
									<td>_</td>
									<td>_</td>
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
								</tr>
							</table>
						</td>
						<td valign="top" style="padding-left:12pt;">
							<table><tr style="height:30pt">
								<td valign="top"><b>Wochenstunden</b></td>
							</tr></table>
							<table class="border">
								<tr style="color:#FFFFFF;">
									<td>_</td>
									<td>_</td>
								</tr>
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
				<table width="100%" style="border:2pt solid #000000;" border="0">
					<tr><td colspan="2" valign="top">
						<p style="letter-spacing:3px;">Nur vom Bundesamt auszufüllen</p>
						<p><u>Festsetzung der Fahrtkostenvorausleistung nach dem Kooperationsmodell (handschriftlich)</u></p>
					</td></tr>
					<tr>
						<td><br/><br/>______ Teilnehmer X 75,00 Euro = _______ Euro</td>
						<td><br/><br/>Belegnummer des Systems Mach 1</td>
					</tr>
					<tr>
						<td><br/><br/>Sachlich richtig (und) rechnerisch richtig</td>
						<td><br/><br/>Stempel geprüft und genehmigt mit Datum </td>
					</tr>
					<tr>
						<td><br/><br/>Jeweils Unterschrift und Namensstempel einfügen</td>
						<td><br/><br/>Jeweils Unterschrift und Namensstempel einfügen</td>
					</tr>
					<tr><td colspan="2">
						<br/><br/>Bitte Vermerk anbringen: Das Original befindet sich in der Kursakte (mit Datum und Unterschrift)
					</td></tr>
				</table>
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

