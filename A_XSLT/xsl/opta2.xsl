<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:b="http://www.performgroup.com/ns/editorial/ArticleList" exclude-result-prefixes="b">
	<xsl:output encoding="ISO-8859-1" indent="yes" method="xml" />


	<xsl:template match="/*">
		<ARTICLES>
			<!-- <xsl:apply-templates select="/b:articles/b:article" />	 -->
			
			<xsl:for-each select="/b:articles/b:article">
				<xsl:apply-templates select="/b:articles/b:article" />
			</xsl:for-each>
		</ARTICLES>
	</xsl:template>

	<!-- Matches the article and applying templates -->
	<xsl:template match="/b:articles/b:article">
		<!-- article variable declarations -->
		<xsl:variable name="id" select="@id" />
		<xsl:variable name="lastUpdateTime" select="@lastUpdateTime" />
		<xsl:variable name="publishedTime" select="@publishedTime" />
		<xsl:variable name="byLine" select="@byLine" />
		
		<xsl:element name="article">
			<!-- adding attribute -->
			<xsl:attribute name="id">
				<xsl:value-of select="$id" />
			</xsl:attribute>
			
			<!-- adding headline -->
			<xsl:apply-templates select="/b:articles/b:article/b:headline" />
			
			<!-- adding teaser -->
			<xsl:apply-templates select="/b:articles/b:article/b:teaser" />
			
			<!-- creating new node for published time  -->
			<xsl:element name="publishedTime">
				<xsl:value-of select="$publishedTime" />
			</xsl:element>
			
			<!-- creating new node for last update time  -->
			<xsl:element name="lastUpdateTime">
				<xsl:value-of select="$lastUpdateTime" />
			</xsl:element>
			
			<!-- creating new node for byline  -->
			<xsl:element name="byLine">
				<xsl:value-of select="$byLine" />
			</xsl:element>
			
			<!-- adding body -->
			<xsl:apply-templates select="/b:articles/b:article/b:body" />
			
			<!-- adding seoPageTitle -->
			<xsl:apply-templates select="/b:articles/b:article/b:seoPageTitle" />
		</xsl:element>
		
	</xsl:template>

	<xsl:template match="/b:articles/b:article/*">
		<xsl:apply-templates select="/b:articles/b:article/b:headline"></xsl:apply-templates>
	</xsl:template>

	<xsl:template match="/b:articles/b:article/b:headline">
		<headline><xsl:value-of select="."/></headline>
	</xsl:template>
	
	<xsl:template match="/b:articles/b:article/b:teaser">
		<teaser><xsl:value-of select="."/></teaser>
	</xsl:template>
	
	<xsl:template match="/b:articles/b:article/b:body">
		<body><xsl:value-of select="."/></body>
	</xsl:template>
	
	<xsl:template match="/b:articles/b:article/b:seoPageTitle">
		<seoPageTitle><xsl:value-of select="."/></seoPageTitle>
	</xsl:template>
	
	<!-- Not considering this nodes -->
	<xsl:template match="//seoPageUrl | //seoPageDescription | //shortHeadline" />
	<xsl:template match="//link "/>

</xsl:stylesheet>