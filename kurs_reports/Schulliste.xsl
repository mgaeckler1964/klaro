<?xml version="1.0" encoding="iso-8859-1" ?>
<!-- 
	XSL-Beispiel fuer den XML Export von Klaro 1.1
	(c) 2003 by CRESD GmbH, Muenchen, Deutschland
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
					th
					{
						text-align:left;
						vertical-align: top;
					}
					th.bezahlt, td.bezahlt
					{
						text-align:right;
					}
				</style>
			</head>
			<body>
				<table border="0" width="100%">
					<tr>
						<td width="25%"><b>KursNr:</b><xsl:text> </xsl:text><xsl:value-of select="@nummer" /><xsl:text> </xsl:text></td>
						<td width="25%"><b>Folgekurs von:</b><xsl:text> </xsl:text><xsl:value-of select="@vorkurs" /><xsl:text> </xsl:text></td>
						<td width="25%"><b>Buch:</b><xsl:text> </xsl:text><xsl:value-of select="@lehrbuch" /><xsl:text> </xsl:text></td>
						<td width="25%"><b>Raum:</b><xsl:text> </xsl:text><xsl:value-of select="@raum" /><xsl:text> </xsl:text></td>
					</tr>
					<tr>
						<td><b>Beginn:</b><xsl:text> </xsl:text><xsl:value-of select="@anfangs_datum" /><xsl:text> </xsl:text></td>
						<td><b>Ende:</b><xsl:text> </xsl:text><xsl:value-of select="@ende_datum" /><xsl:text> </xsl:text></td>
						<td colspan="2"><b>Kurstage:</b><xsl:text> </xsl:text><xsl:value-of select="@kurstage" /><xsl:text> </xsl:text></td>
					</tr>
					<tr>
						<td colspan="4"><b>Feiertage:</b><xsl:text> </xsl:text><xsl:value-of select="@feiertage" /><xsl:text> </xsl:text></td>
					</tr>
					<tr>
						<td colspan="4"><table border="0" width="100%">
							<tr>
								<td width="10%"><b>Lehrkraft:</b></td>
								<td width="30%"><xsl:for-each select="lehrer">
									<xsl:if test="@team_teacher='' and @soz_paed=''">
										<xsl:value-of select="@nachname" /><xsl:text> </xsl:text>
									</xsl:if>
								</xsl:for-each></td>
								<td width="10%"><b>TT:</b></td>
								<td width="20%"><xsl:for-each select="lehrer">
									<xsl:if test="@team_teacher != ''">
										<xsl:value-of select="@nachname" /><xsl:text> </xsl:text>
									</xsl:if>
								</xsl:for-each></td>
								<td width="10%"><b>Soz-P�d:</b></td>
								<td width="20%"><xsl:for-each select="lehrer">
									<xsl:if test="@soz_paed != ''">
										<xsl:value-of select="@nachname" /><xsl:text> </xsl:text>
									</xsl:if>
								</xsl:for-each></td>
							</tr>
						</table></td>
					</tr>
				</table>
				<hr />
				<p><b>Bemerkung:</b><br /><xsl:apply-templates select="bemerkung" /></p>
				<hr />

				<table border="1" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>Nr</th>
							<th>Sch�ler</th>
							<th>c/o<br/>Stra�e<br/>PLZ Ort<br/>
							<font size="-1">
								<table cellspacing="0" cellpadding="0" border="0" width="99%">
									<tr>
										<td width="33%" style="padding-right:4pt;">Tel. privat</td>
										<td width="33%" style="padding-right:4pt;">Tel. Arbeit</td>
										<td width="33%">Tel. Mobil</td>
									</tr>
								</table>
								<table cellspacing="0" cellpadding="2" border="0" width="100%">
									<tr>
										<td width="10%" style="padding-right:4pt;">m/w</td>
										<td width="30%" style="padding-right:4pt;">Nationalit�t</td>
										<td width="10%" style="padding-right:4pt;">Alter</td>
										<td width="50%" style="overflow:hidden;">Status</td>
									</tr>
								</table>
							</font>
							</th>
							<th>Besonderes</th>
							<th class="bezahlt">Bezahlt</th>
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

	<xsl:template match='schueler'>
		<tr valign="top">
			<td><xsl:value-of select="position()" /></td>
			<td><xsl:value-of select="@nachname" /><xsl:text>, </xsl:text><xsl:value-of select="@vorname" /></td>
			<td>
				<xsl:if test="@strasse!=''">
					<xsl:value-of select="@strasse" /><br />
				</xsl:if>
				<xsl:if test="@land!='' or @plz!='' or @ort!=''">
					<xsl:if test="@land!=''">
						<xsl:value-of select="@land" /><xsl:text>-</xsl:text>
					</xsl:if>
					<xsl:value-of select="@plz" /><xsl:text> </xsl:text><xsl:value-of select="@ort" />
				</xsl:if>
				<font size="-1">
					<table cellspacing="0" cellpadding="0" border="0" width="99%">
						<tr valign="top">
							<td width="33%" style="padding-right:4pt;"><xsl:value-of select="@tel_priv" /></td>
							<td width="33%" style="padding-right:4pt;"><xsl:value-of select="@tel_buero" /></td>
							<td width="33%"><xsl:value-of select="@tel_mobil" /></td>
						</tr>
					</table>
					<table cellspacing="0" cellpadding="2" border="0" width="100%">
						<tr valign="top">
							<td width="10%" style="padding-right:4pt;"><xsl:value-of select="@geschlecht" /></td>
							<td width="30%" style="padding-right:4pt;"><xsl:value-of select="@nationalitaet" /></td>
							<td width="10%" style="padding-right:4pt;"><xsl:value-of select="@alter" /></td>
							<td width="50%" style="overflow:hidden;"><xsl:value-of select="@auslaender_status" /></td>
						</tr>
					</table>
				</font>
			</td>
			<td><xsl:apply-templates select="schueler_bemerkung"/><br /><xsl:apply-templates select="kurs_bemerkung"/><br /></td>
			<td class="bezahlt"><xsl:apply-templates select="zahlungen"/><b><xsl:value-of select="sum(zahlungen/bezahlt/@betrag)" /><xsl:text>&#160;&#8364;</xsl:text></b></td>
		</tr>
	</xsl:template>

	<xsl:template match='zahlungen'>
		<table>
			<xsl:apply-templates />
		</table>
	</xsl:template>

	<xsl:template match='bezahlt'>
		<tr>
			<td class="bezahlt"><xsl:value-of select="@betrag" /><xsl:text>&#160;&#8364;</xsl:text></td>
		</tr>
	</xsl:template>
</xsl:stylesheet>

