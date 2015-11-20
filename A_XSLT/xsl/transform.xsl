<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="ISO-8859-1" indent="yes" method="xml" />

	
	<xsl:template match="/greetings">
		<html>
			<body>
				<xsl:apply-templates select="greeting[1]" />
			</body>
		</html>
	</xsl:template>
	<xsl:template match="greeting">
		<h1>
			<xsl:value-of select="." />
		</h1>
	</xsl:template>
	


</xsl:stylesheet>


