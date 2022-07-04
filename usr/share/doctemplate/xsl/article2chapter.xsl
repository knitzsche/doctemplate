<?xml version='1.0'?>
<xsl:stylesheet 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
        version="1.0"
        >
<xsl:output 
    method="html"
    encoding="utf-8"
    omit-xml-declaration="yes"
    indent="yes"

/>
<xsl:variable name="title"/>

<xsl:template match="/article">
    <xsl:apply-templates select="articleinfo/title"/>
</xsl:template>

<xsl:template match="@*|node()">
    <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
</xsl:template>


<xsl:template name="sect1">
    <sect1>
    <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
    </sect1>
</xsl:template>

<xsl:template match="articleinfo/title">
    <chapter>
        <title><xsl:value-of select="."/></title>
        <xsl:apply-templates select="../../sect1"/>
    </chapter>
</xsl:template>

</xsl:stylesheet>
