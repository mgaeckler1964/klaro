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
			<head><title>Anwesenheitsliste - <xsl:value-of select="@nummer" /></title></head>
			<body>
				<table border="1" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th align="left"   style="border:0;">Anwesenheitsliste</th>
							<th align="center" style="border:0;" colspan="3"><xsl:value-of select="@nummer" /></th>
							<th align="right"  style="border:0;" colspan="3">Woche von _______ bis _______</th>
						</tr>
						<tr>
							<th width="30%">Name</th>
							<th width="10%">Mo</th>
							<th width="10%">Di</th>
							<th width="10%">Mi</th>
							<th width="10%">Do</th>
							<th width="10%">Fr</th>
							<th width="10%">Sa</th>
						</tr>
					</thead>
					<tfoot>
						<tr><td colspan="7"><br />Es wird bestätigt, dass oben genannte Schüler am Kurs teilgenommen haben. Datum, Unterschrift</td></tr>
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

	<xsl:template match='schueler'>
		<tr valign="top">
			<td><br/><xsl:value-of select="@nachname" /><xsl:text>, </xsl:text><xsl:value-of select="@vorname" /><br/><br/></td>
			<td><br /></td>
			<td><br /></td>
			<td><br /></td>
			<td><br /></td>
			<td><br /></td>
			<td><br /></td>
		</tr>
	</xsl:template>

</xsl:stylesheet>

