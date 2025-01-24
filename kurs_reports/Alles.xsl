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
				<xsl:apply-templates select="traeger" />
				<hr />
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
						<td><b>Unterrichtsstunden (Angegeben/Berechnet):</b><xsl:text> </xsl:text><xsl:value-of select="@unterrichtsstunden" />/<xsl:value-of select="@gesamt_zeit" /></td>
						<td><b>Wochenstunden:</b><xsl:text> </xsl:text><xsl:value-of select="@wochenstunden" /></td>
						<td><b>Teamteacherstunden:</b><xsl:text> </xsl:text><xsl:value-of select="@tt_stunden" /></td>
						<td><b>Sozpädstunden:</b><xsl:text> </xsl:text><xsl:value-of select="@soz_paed_stunden" /></td>
					</tr>
					<tr>
						<td colspan="4" style="padding:0; margin:0;"><hr/><table border="0" width="100%" cellspacing="0" cellpadding="2">
							<tr>
								<td width="10%" valign="top"><b>Lehrkraft:</b></td>
								<td width="30%" valign="top"><xsl:for-each select="lehrer">
									<xsl:if test="@team_teacher='' and @soz_paed=''">
										<xsl:value-of select="@anrede" /><xsl:text> </xsl:text>
										<xsl:value-of select="@vorname" /><xsl:text> </xsl:text>
										<xsl:value-of select="@nachname" /><xsl:text> </xsl:text><br />
										<xsl:if test="@anfang!=''">
											von: <xsl:value-of select="@anfang" />
										</xsl:if>
										<xsl:if test="@ende!=''">
											bis: <xsl:value-of select="@ende" />
										</xsl:if>
									</xsl:if>
								</xsl:for-each></td>
								<td width="10%" valign="top"><b>TT:</b></td>
								<td width="20%" valign="top"><xsl:for-each select="lehrer">
									<xsl:if test="@team_teacher != ''">
										<xsl:value-of select="@anrede" /><xsl:text> </xsl:text>
										<xsl:value-of select="@vorname" /><xsl:text> </xsl:text>
										<xsl:value-of select="@nachname" /><xsl:text> </xsl:text><br />
										<xsl:if test="@anfang!=''">
											von: <xsl:value-of select="@anfang" />
										</xsl:if>
										<xsl:if test="@ende!=''">
											bis: <xsl:value-of select="@ende" />
										</xsl:if>
									</xsl:if>
								</xsl:for-each></td>
								<td width="10%" valign="top"><b>Soz-Päd:</b></td>
								<td width="20%" valign="top"><xsl:for-each select="lehrer">
									<xsl:if test="@soz_paed != ''">
										<xsl:value-of select="@anrede" /><xsl:text> </xsl:text>
										<xsl:value-of select="@vorname" /><xsl:text> </xsl:text>
										<xsl:value-of select="@nachname" /><xsl:text> </xsl:text><br />
										<xsl:if test="@anfang!=''">
											von: <xsl:value-of select="@anfang" />
										</xsl:if>
										<xsl:if test="@ende!=''">
											bis: <xsl:value-of select="@ende" />
										</xsl:if>
									</xsl:if>
								</xsl:for-each></td>
							</tr>
						</table></td>
					</tr>
				</table>
				<hr />
				<b>Bemerkung:</b><br /><xsl:apply-templates select="bemerkung" />
				<hr />
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
				<hr />
				<table border="1" cellspacing="0" cellpadding="2">
					<thead>
						<tr>
							<th>Nr</th>
							<th>Schüler</th>
							<th>Adresse</th>
							<th>Contact</th>
							<th>Alter</th>
							<th>Bemerkung über Schüler im Kurs</th>
							<th>Bemerkung über Schüler</th>
							<th>Weitere Infos</th>
							<th align="right">Bezahlt</th>
							<th>Prüfungen</th>
							<th>Anwesenheiten</th>
						</tr>
					</thead>
					<tfoot />
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

	<xsl:template match='traeger'>
		<table>
			<tr><td><b>Träger</b></td><td><xsl:value-of select="@traeger_name" /></td></tr>
			<tr><td><b>Anschrift</b></td><td><xsl:value-of select="@traeger_strasse" />, <xsl:value-of select="@traeger_plz" /><xsl:text> </xsl:text><xsl:value-of select="@traeger_ort" />, <xsl:value-of select="@traeger_bundesland" /></td></tr>
			<tr><td><b>Bankverbindung</b></td><td>Konto <xsl:value-of select="@traeger_konto" /> BLZ <xsl:value-of select="@traeger_blz" /><xsl:text> </xsl:text><xsl:value-of select="@traeger_bank" /></td></tr>
			<tr><td><b>BAMF Kennziffer</b></td><td><xsl:value-of select="@traeger_bamf_nr" /></td></tr>
			<tr><td><b>BAMF Regionalstelle</b></td><td><xsl:value-of select="@traeger_bamf_regionalstelle" /></td></tr>
		</table>
	</xsl:template>

	<xsl:template match='schueler'>
		<tr valign="top">
			<td><xsl:value-of select="position()" /><br />Anmeldung: <xsl:value-of select="@anmelde_datum" /><br />Änderungsdatum: <xsl:value-of select="@aenderungsdatum" /></td>
			<td>
				<xsl:value-of select="@anrede" /><xsl:text> </xsl:text><xsl:value-of select="@nachname" />, <xsl:value-of select="@vorname" /> (<xsl:value-of select="@geschlecht" />)<br />
				<xsl:if test="@anfang!=''">
					von: <xsl:value-of select="@anfang" />
				</xsl:if>
				<xsl:if test="@ende!=''">
					bis: <xsl:value-of select="@ende" />
				</xsl:if>
				<xsl:if test="@ordnungsgemaess!=''">
					Ordnungsgemäß: <xsl:value-of select="@ordnungsgemaess" />
				</xsl:if>
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
			<td>
				<xsl:value-of select="@alter" /><br />
				<xsl:value-of select="@geburtsdatum" /><br />
			</td>
			<td>
				<xsl:value-of select="kurs_bemerkung"/><br /><br/>
				<b>Fehlstunden:</b> <xsl:value-of select="@fehl_stunden"/><br />
				<b>Entschuldigt:</b> <xsl:value-of select="@entschuldigt"/><br />
			</td>
			<td><xsl:value-of select="schueler_bemerkung"/><br /></td>
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
			<td align="right">
				Kostenbefreiung beantragt: <xsl:value-of select="@antrag_kostenbefreiung" /><br />
				Kostenbeteiligung: <xsl:value-of select="@kostenbeteiligung" /><br />
				Fahrtkostenbewilligung: <xsl:value-of select="@fahrtkostenbewilligung" /><br />
				<xsl:apply-templates select="zahlungen"/>
				<b>Summe: <xsl:value-of select="sum(zahlungen/bezahlt/@betrag)" /><xsl:text>&#160;&#8364;</xsl:text></b>
			</td>
			<td>
				<xsl:apply-templates select="pruefungen"/>
			</td>
			<td>
				<xsl:apply-templates select="schuelertage"/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match='zahlungen|pruefungen|schuelertage'>
		<table>
			<xsl:apply-templates />
		</table>
	</xsl:template>

	<xsl:template match='bezahlt'>
		<tr>
			<td align="right"><xsl:value-of select="@datum" /></td>
			<td align="right"><xsl:value-of select="@beschreibung" /></td>
			<td align="right"><xsl:value-of select="@zahlungsart" /></td>
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

	<xsl:template match='schuelertag'>
		<tr>
			<td><xsl:value-of select="@tag" /></td>
			<td><xsl:value-of select="@datum" /></td>
			<td><xsl:value-of select="@anwesenheit" /></td>
		</tr>
	</xsl:template>
</xsl:stylesheet>

