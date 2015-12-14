<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:variable name="x" select="50"/>
	
	<xsl:template match="/">

		<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="800" height="800">
			<xsl:choose>
			  <xsl:when test="count(//piece[@couleur='red']) &lt; count(//piece[@couleur='yellow'])-1 or count(//piece[@couleur='yellow']) &lt; count(//piece[@couleur='red'])-1">
			  	 <text x="0" y="15" fill="red">La configuration contient trop de pions jaunes ou rouges</text>
			  </xsl:when>
			  <xsl:otherwise>
			  	<rect width="790" height="680" x="0" y="0" fill="blue" />
				<xsl:apply-templates/>
			  </xsl:otherwise>
			</xsl:choose>
		
					
			
		</svg>
	</xsl:template>
	
	<xsl:template match="//colonne">
		
		<xsl:variable name="posCol" select="position()"/>
			
		<xsl:for-each select="piece">
				<circle cx="{((($posCol) div 2)-1)*110+60}" cy="{670-(position()*110)+50}" r="50" fill="{@couleur}" />
		</xsl:for-each>
			<xsl:call-template name="completerColonne">
				<xsl:with-param name="nbNoeuds" select="count(piece)" />
        	  	<xsl:with-param name="posCol" select="$posCol" />
          	</xsl:call-template>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template name="completerColonne">
		<xsl:param name="nbNoeuds" />
		<xsl:param name="posCol" />
    	<xsl:if test="$nbNoeuds &lt; 6">
    		<circle cx="{((($posCol) div 2)-1)*110+60}" cy="{670-((($nbNoeuds)+1)*110)+50}" r="50" fill="white" />
    		<xsl:call-template name="completerColonne">
				<xsl:with-param name="nbNoeuds" select="$nbNoeuds+1" />
	          	<xsl:with-param name="posCol" select="$posCol" />
          	</xsl:call-template>
		<xsl:apply-templates/>
    	</xsl:if>
	</xsl:template>
	
	
	

</xsl:stylesheet>
