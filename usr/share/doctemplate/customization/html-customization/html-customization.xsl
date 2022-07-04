<?xml version='1.0'?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  version="1.0"
  >

<xsl:import href="/usr/share/xml/docbook/stylesheet/docbook-xsl/xhtml/docbook.xsl"/>
<xsl:import href="mytitlepage.xsl"/>

<xsl:output method="html" indent="yes" encoding="UTF-8"
    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    omit-xml-declaration="yes"
    />

<!-- add doctemplate javascript -->
<xsl:template name="user.head.content">
    <xsl:variable name="codefile" select="document('javascript.xml',/)"/>
    <xsl:copy-of select="$codefile/javascript/node()"/>
</xsl:template>

<!-- insert id attribute for sect1 so javascript can show the clicked toc div -->
<!-- based on non-localized value (the id, not the title -->
<xsl:template match="sect1">
  <xsl:call-template name="id.warning"/>

  <div>
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
    <xsl:call-template name="common.html.attributes">
      <xsl:with-param name="inherit" select="1"/>
    </xsl:call-template>

    <xsl:choose>
      <xsl:when test="@renderas = 'sect2'">
        <xsl:call-template name="sect2.titlepage"/>
      </xsl:when>
      <xsl:when test="@renderas = 'sect3'">
        <xsl:call-template name="sect3.titlepage"/>
      </xsl:when>
      <xsl:when test="@renderas = 'sect4'">
        <xsl:call-template name="sect4.titlepage"/>
      </xsl:when>
      <xsl:when test="@renderas = 'sect5'">
        <xsl:call-template name="sect5.titlepage"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="sect1.titlepage"/>
      </xsl:otherwise>
    </xsl:choose>

    <xsl:variable name="toc.params">
      <xsl:call-template name="find.path.params">
        <xsl:with-param name="table" select="normalize-space($generate.toc)"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:if test="contains($toc.params, 'toc')                   and $generate.section.toc.level &gt;= 1">
      <xsl:call-template name="section.toc">
        <xsl:with-param name="toc.title.p" select="contains($toc.params, 'title')"/>
      </xsl:call-template>
      <xsl:call-template name="section.toc.separator"/>
    </xsl:if>
    <xsl:apply-templates/>
    <xsl:call-template name="process.chunk.footnotes"/>
  </div>
</xsl:template>

<!--Provide an attribute so css can do what it wants-->
<xsl:template match="programlisting">
  <pre xmlns="http://www.w3.org/1999/xhtml" class="programlisting">
    <xsl:apply-templates/>
  </pre>
</xsl:template>

<!--Because index is not currently supported in html, we need to display the indexterm-->
<!--text content and it doesn't matter that we may be overriding index mechanisms -->
<xsl:template match="indexterm">
  <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="link">
  <a xmlns="http://www.w3.org/1999/xhtml">
    <xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute>
    <xsl:value-of select="."/>
  </a>
</xsl:template>

<xsl:template match="application">
  <span xmlns="http://www.w3.org/1999/xhtml" class="emphasis"><xsl:value-of select="."/></span>
</xsl:template>

</xsl:stylesheet>
