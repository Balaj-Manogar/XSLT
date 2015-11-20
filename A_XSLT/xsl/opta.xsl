<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:a="http://www.performgroup.com/ns/editorial/ArticleList" exclude-result-prefixes="a">
	<xsl:template match="/a:articles/a:article">
		<xsl:variable name="id" select="@id" />
		<xsl:variable name="lastUpdateTime" select="@lastUpdateTime" />
		<xsl:variable name="publishedTime" select="@publishedTime" />
		<article>
			<xsl:attribute name="id">
				<xsl:value-of select="$id" />
			</xsl:attribute>
		</article>
	</xsl:template>


</xsl:stylesheet>