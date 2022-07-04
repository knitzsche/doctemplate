<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/2001/XInclude">

<xsl:output method="xml"
    indent="yes"
    encoding="utf-8"
    />

<xsl:param name="language"></xsl:param>

<xsl:template match="/*">
    <xsl:copy>
        <xsl:attribute name="xml:lang"><xsl:value-of select="$language"/></xsl:attribute>
        <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>

</xsl:template>

<xsl:template match="@*|node()">
    <xsl:copy>
        <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
</xsl:template>

</xsl:stylesheet>
