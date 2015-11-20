<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" />

	<xsl:template match="/Books">
		<headings>
			<xsl:apply-templates select="id" mode="printName" />
			<xsl:apply-templates select="name" mode="printId" />
		</headings>
	</xsl:template>

	<xsl:template match="Books/Book" mode="printName">
		<h1>
			<xsl:value-of select="." />
		</h1>
	</xsl:template>
	<xsl:template match="Books/Book" mode="printId">
		<h3>
			<xsl:value-of select="." />
		</h3>
	</xsl:template>


</xsl:stylesheet>