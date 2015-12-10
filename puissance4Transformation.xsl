<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="800" height="800">
			<rect width="700" height="600" x="0" y="0" fill="blue" />
			<xsl:for-each select="colonne">
				<circle cx="90" cy="80" r="50" fill="green" />
			</xsl:for-each>
		</svg>
	</xsl:template>
	
	<xsl:template match="colonne">
		<circle cx="90" cy="80" r="50" fill="green" />
	</xsl:template>
</xsl:stylesheet>