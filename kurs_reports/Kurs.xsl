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
			<head><title>Kurs - <xsl:value-of select="@nummer" /></title></head>
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
								<td width="10%"><b>Soz-Päd:</b></td>
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
				<b>Bemerkung:</b><br /><xsl:apply-templates select="bemerkung" />
				<hr />

				<table border="1" cellspacing="0">
					<thead>
						<tr>
							<th>Nr</th>
							<th>Schüler</th>
							<th>Adresse</th>
							<th>Alter</th>
							<th>Bemerkung über Schüler im Kurs</th>
							<th>Bemerkung über Schüler</th>
							<th>Andere Kurse</th>
							<th align="right">Bezahlt</th>
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
				<br />
			</td>
			<td><xsl:apply-templates select="@alter"/><br /></td>
			<td><xsl:apply-templates select="kurs_bemerkung"/><br /></td>
			<td><xsl:apply-templates select="schueler_bemerkung"/><br /></td>
			<td>
				<xsl:for-each select="schueler_kurse/kurs">
					<xsl:if test="../../../@bamf_nummer != @bamf_nummer" >
						<xsl:value-of select="@nummer" />-<xsl:value-of select="@halbjahr" />-<xsl:value-of select="@jahr" />-<xsl:value-of select="@bamf_nummer" /><br/>
					</xsl:if>
				</xsl:for-each>
			</td>
			<td align="right"><xsl:apply-templates select="zahlungen"/><b><xsl:value-of select="sum(zahlungen/bezahlt/@betrag)" /><xsl:text>&#160;&#8364;</xsl:text></b></td>
		</tr>
	</xsl:template>

	<xsl:template match='zahlungen'>
		<table>
			<xsl:apply-templates />
		</table>
	</xsl:template>

	<xsl:template match='bezahlt'>
		<tr>
			<td><xsl:value-of select="@betrag" /><xsl:text>&#160;&#8364;</xsl:text></td>
		</tr>
	</xsl:template>
</xsl:stylesheet>

