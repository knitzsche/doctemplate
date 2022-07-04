<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/2001/XInclude">

<xsl:template match="/">
    <xsl:apply-templates />
</xsl:template>

<xsl:template match="@*|node()">
    <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
</xsl:template>

<xsl:param name="path"/>

<xsl:template match="@metrics-url[parent::font]">
    <xsl:variable name="metrics-url">
        <xsl:value-of select="$path"/>
        <xsl:value-of select="."/>
    </xsl:variable>
    <xsl:attribute name="metrics-url">
        <xsl:value-of select="$metrics-url"/>
    </xsl:attribute>
</xsl:template>


</xsl:stylesheet>

