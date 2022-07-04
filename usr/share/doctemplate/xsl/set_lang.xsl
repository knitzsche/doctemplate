<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/2001/XInclude">

<xsl:output method="xml"
    indent="yes"
    encoding="utf-8"
    />

<!--Modify XInclude paths based on current language-->

<xsl:template match="include">
    <xsl:text disable-output-escaping="yes">&lt;include xmlns="http://www.w3.org/2001/XInclude" href="</xsl:text><xsl:value-of select="@href"/><xsl:text disable-output-escaping="yes">"&gt;&lt;/include&gt;</xsl:text>
</xsl:template>

<xsl:template match="node()|@*">
    <xsl:copy>
        <xsl:apply-templates select="@*|node()" />
    </xsl:copy>    
</xsl:template>

<xsl:template match="@lang[parent::HTML|parent::html|parent::article]">
  <xsl:attribute name="lang">
    <xsl:value-of select="$language"/>
  </xsl:attribute>
</xsl:template>

</xsl:stylesheet>
