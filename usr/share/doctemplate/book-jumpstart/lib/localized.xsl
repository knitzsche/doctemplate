<?xml version='1.0'?>
<xsl:stylesheet 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
        xmlns:xi="http://www.w3.org/2003/XInclude"
        version="1.0"
        >
<xsl:output
    method="xml"
    encoding="utf-8"
    omit-xml-declaration="no"
    indent="yes"
/>

<xsl:param name="lang"></xsl:param>

<xsl:template match="/">
    <xsl:apply-templates />
</xsl:template>

<xsl:template match="@*|node()">
    <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
</xsl:template>

<xsl:template match="art">
    <xi:include>
        <xsl:attribute name="href">
            <xsl:value-of select="dir"/>
            <xsl:text>/build/xml/</xsl:text>
            <xsl:value-of select="$lang"/>
            <xsl:text>/</xsl:text>
            <xsl:value-of select="content"/>
        </xsl:attribute>
    </xi:include>
</xsl:template>


</xsl:stylesheet>
