<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:b="http://www.performgroup.com/ns/editorial/ArticleList"
	exclude-result-prefixes="b">
	<xsl:output encoding="ISO-8859-1" indent="yes" method="xml"
		cdata-section-elements="body headline teaser seoPageTitle" />

	<xsl:variable name="headline" select="'headline'" />
	<xsl:template match="/">

		<ARTICLES>
			<xsl:apply-templates />
		</ARTICLES>
	</xsl:template>

	<!-- Matches the article and applying templates -->
	<xsl:template match="/b:articles/b:article">

		<!-- article variable declarations -->
		<xsl:variable name="id" select="@id" />
		<xsl:variable name="lastUpdateTime" select="@lastUpdateTime" />
		<xsl:variable name="publishedTime" select="@publishedTime" />
		<xsl:variable name="byLine" select="@byLine" />

		<!-- creating new node for article -->
		<xsl:element name="article">
			<!-- adding attribute -->
			<xsl:attribute name="id">
				<xsl:value-of select="$id" />
			</xsl:attribute>

			<!-- creating new node for headline -->
			<xsl:element name="headline">
				<xsl:value-of select="./b:headline" />
			</xsl:element>

			<!-- creating new node for teaser -->
			<xsl:element name="teaser">
				<xsl:value-of select="./b:teaser" />
			</xsl:element>

			<!-- creating new node for published time -->
			<xsl:element name="publishedTime">
				<xsl:value-of select="$publishedTime" />
			</xsl:element>

			<!-- creating new node for last update time -->
			<xsl:element name="lastUpdateTime">
				<xsl:value-of select="$lastUpdateTime" />
			</xsl:element>

			<!-- creating new node for byline -->
			<xsl:element name="byLine">
				<xsl:value-of select="$byLine" />
			</xsl:element>

			<!-- creating new node for body -->
			<xsl:element name="body">
				<xsl:value-of select="./b:body" />
			</xsl:element>


			<!-- creating new node for seoPageTitle -->
			<xsl:element name="seoPageTitle">
				<xsl:value-of select="./b:seoPageTitle" />
			</xsl:element>

		</xsl:element>

	</xsl:template>

	<!-- Not considering this nodes -->
	<xsl:template match="//seoPageUrl | //seoPageDescription | //shortHeadline" />
	<xsl:template match="//link " />

</xsl:stylesheet>