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

<xsl:template match="/">
    <xsl:apply-templates />
</xsl:template>

<xsl:template match="@*|node()">
    <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
</xsl:template>

<xsl:template match="xincludes">
<!--    <xsl:message>HEY</xsl:message> -->
    <xsl:copy-of select="document('../build/tmp/tmp/xincludes.xml')/root/*" />
</xsl:template>


</xsl:stylesheet>
