<?xml version="1.0"?>
<xsl:stylesheet 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
        xmlns:xi="http://www.w3.org/2003/XInclude"
        version="1.0"
        >
<xsl:output
    method="xml"
    encoding="utf-8"
    omit-xml-declaration="no"
    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    indent="yes"
/>

<xsl:template match="/">
    <xsl:apply-templates/>
</xsl:template>

<xsl:template match="@*|node()">
    <xsl:copy-of select=".">
        <xsl:apply-templates />
    </xsl:copy-of>
</xsl:template>
<!--
<xsl:template match="text()" />
-->
</xsl:stylesheet>
