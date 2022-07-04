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

<xsl:param name="imagewidth" select="'2in'"/>
<xsl:variable name="title"/>

<xsl:template match="@*|node()">
    <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
</xsl:template>


<xsl:template match="t">
    <title>
        <xsl:apply-templates select="@*|node()"/>
    </title>
</xsl:template>
<xsl:template match="ul">
    <itemizedlist>
        <xsl:apply-templates select="@*|node()"/>
    </itemizedlist>
</xsl:template>
<xsl:template match="ol">
    <orderedlist>
        <xsl:apply-templates select="@*|node()"/>
    </orderedlist>
</xsl:template>
<xsl:template match="li">
    <listitem>
        <xsl:apply-templates select="@*|node()"/>
    </listitem>
</xsl:template>
<xsl:template match="p">
    <para>
        <xsl:apply-templates select="@*|node()"/>
    </para>
</xsl:template>
<xsl:template match="c">
    <code>
        <xsl:apply-templates select="@*|node()"/>
    </code>
</xsl:template>
<xsl:template match="img">
    <xsl:variable name="fileref"><xsl:value-of select="@fileref"/></xsl:variable>
    <informalfigure float="0">
        <mediaobject>
            <imageobject>
                <imagedata>
                    <xsl:attribute name="fileref">images/<xsl:value-of select="$fileref"/></xsl:attribute>
                    <xsl:choose>
                        <xsl:when test="@width">
                            <xsl:attribute name="contentwidth"><xsl:value-of select="@width"/></xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="contentwidth"><xsl:value-of select="$imagewidth"/></xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:attribute name="format">PNG</xsl:attribute>
                </imagedata>
            </imageobject>
        </mediaobject>
    </informalfigure>
</xsl:template>
<xsl:template match="pl">
    <programlisting>
<!-- <xsl:text>&lt;![CDATA[</xsl:text> -->
<xsl:apply-templates select="text()"/>
<!-- <xsl:text>]]&gt;</xsl:text> -->
    </programlisting>
</xsl:template>
</xsl:stylesheet>
