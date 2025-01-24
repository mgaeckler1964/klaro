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

	<xsl:template match='pruefung'>
		<html>
			<head>
				<title>Prüfung - <xsl:value-of select="@pruefungs_nummer" />-<xsl:value-of select="@pruefung" /></title>
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
				<table border="1">
					<tr valign="top">
						<td><b><xsl:value-of select="@pruefungs_nummer" />-<xsl:value-of select="@pruefung" /></b></td>
						<td colspan="4">
							<b>Datum:</b><xsl:text> </xsl:text><xsl:value-of select="@datum" /><xsl:text> </xsl:text>
							<b>Aufsicht:</b><xsl:text> </xsl:text><xsl:value-of select="@aufsicht" />
						</td>
					</tr>

					<xsl:apply-templates select="teilnehmer/schueler"/>
				</table>
				<hr />
			</body>
		</html>
	</xsl:template>

	<xsl:template match='teilnehmer/schueler'>
		<tr valign="top">
			<td>Anmeldung: <xsl:value-of select="@anmelde_datum" /><br />Änderungsdatum: <xsl:value-of select="@aenderungsdatum" /></td>
			<td>
				<xsl:value-of select="@anrede" /><xsl:text> </xsl:text><xsl:value-of select="@nachname" />, <xsl:value-of select="@vorname" /> (<xsl:value-of select="@geschlecht" />)<br />
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
			<td>Bestanden: <xsl:value-of select="@bestanden" /></td>
		</tr>
	</xsl:template>
</xsl:stylesheet>

