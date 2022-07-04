<?xml version="1.0"?>
<xsl:stylesheet 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
        xmlns:xi="http://www.w3.org/2003/XInclude"
        version="1.0"
        >
<xsl:output
    method="html"
    encoding="utf-8"
    omit-xml-declaration="yes"
    indent="yes"
/>

<!--

only pass from module html/head/link elements through if their
href attribute does NOT start with" book"

only pass from module html/head/script elements through if their
src attribute does NOT start with" book"

-->

<xsl:template match="/">
    <xsl:apply-templates />
    <xsl:apply-templates select='/html/head/link'/>
    <xsl:apply-templates select='/html/head/script'/>
</xsl:template>

<xsl:template match='/html/head/link'>
    <xsl:variable name="href" >
        <xsl:value-of select="./@href"/>
    </xsl:variable>
    <xsl:message ><xsl:value-of select="$href"/></xsl:message>
    <xsl:if test="not(starts-with($href, 'book'))">
        <xsl:copy-of select="."/>
    </xsl:if>
</xsl:template>

<xsl:template match='/html/head/script'>
    <xsl:variable name="src" >
        <xsl:value-of select="./@src"/>
    </xsl:variable>
    <xsl:message ><xsl:value-of select="$src"/></xsl:message>
    <xsl:if test="not(starts-with($src, 'book'))">
        <xsl:copy-of select="."/>
    </xsl:if>
</xsl:template>

<xsl:template match='/html/head/'>
    <xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="@*|node()" />

<xsl:template match="text()" />

</xsl:stylesheet>
