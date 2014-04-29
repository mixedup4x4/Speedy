<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="separator" select="'&#9;'"/>
	<xsl:param name="line-separator" select="'&#13;&#10;'"/>

	<xsl:template match="/">
		<xsl:for-each select="FCIV/FILE_ENTRY">
			<xsl:number/>
			<xsl:value-of select="$separator"/>
			<xsl:value-of select="name"/>
			<xsl:value-of select="$separator"/>
			<xsl:value-of select="SHA1"/>
			<xsl:value-of select="$line-separator"/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
