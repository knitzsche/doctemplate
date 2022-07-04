<?xml version='1.0'?>
<xsl:stylesheet 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
        xmlns:xi="http://www.w3.org/2003/XInclude"
        version="1.0"
        >
<xsl:output
    method="xml"
    encoding="utf-8"
    omit-xml-declaration="yes"
    indent="yes"
/>

<xsl:param name="lang"></xsl:param>

<xsl:template match="/">
    <xsl:apply-templates select='//div[@class="module"]'/>
</xsl:template>

<xsl:template match='//div[@class="module"]'>
    <xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="@*|node()" />

<xsl:template match="text()" />

</xsl:stylesheet>
