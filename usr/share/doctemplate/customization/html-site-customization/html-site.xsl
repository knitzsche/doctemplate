<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">

    <!-- Imports -->
    <xsl:import href="/usr/share/xml/docbook/stylesheet/docbook-xsl/xhtml/docbook.xsl"/>
    <xsl:import href="html-site-banner.xsl"/>
    <xsl:import href="/usr/share/doctemplate/xsl/draft-watermark.xsl"/>
    <xsl:import href="mytitlepage.xsl"/>

<xsl:output method="html" indent="yes" encoding="UTF-8"
    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    omit-xml-declaration="yes"
    />


<xsl:param name="generate.toc">
appendix  toc,title
article/appendix  nop,nop
article   nop,nop
book      toc,nop
chapter   toc,title
part      toc,title
preface   toc,title
qandadiv  toc
qandaset  toc
reference toc,title
sect1     toc
sect2     toc
sect3     toc
sect4     toc
sect5     toc
section   toc
set       toc,title
</xsl:param>

    <!-- Params -->
    <xsl:param name="generate.legalnotice.link" select="0"/>
    <!-- requires DocBook XSL 1.69.1a -->
    <xsl:param name="generate.revhistory.link" select="0"/>
<!--    <xsl:param name="toc.max.depth" select=""/>-->
    <xsl:param name="chunker.output.indent" select="'yes'"/>
    <xsl:param name="body.font.master" select="10"/>
    <xsl:param name="shade.verbatim" select="0"/>
    <xsl:param name="draft.mode" select="'no'"/>
<!--    <xsl:param name="chunk.first.sections" select="'1'"/>-->
    <!--Navigation Graphics-->
    <xsl:param name="navig.graphics" select="1"/>
    <xsl:param name="navig.graphics.path" select="'images/'"/>
    <xsl:param name="navig.graphics.extension" select="'.png'"/> 
    <xsl:param name="navig.showtitles" select="1"/>
    
    <!--Admon Graphics--> 
    <xsl:param name="admon.graphics" select="1"/>
    <xsl:param name="admon.textlabel" select="0"/>
    <xsl:param name="admon.graphics.path" select="'images/'"/>
    <xsl:param name="admon.graphics.extension" select="'.png'"/>
    
    <!-- Callout Graphics -->
    <xsl:param name="callout.unicode" select="1"/>
    <xsl:param name="callout.graphics" select="0"/>
    <xsl:param name="callout.graphics.path" select="'images/'"/>
    <xsl:param name="callout.graphics.extension" select="'.png'"/>
    
<!-- add doctemplate javascript -->
<xsl:template name="user.head.content">
    <xsl:variable name="codefile" select="document('javascript.xml',/)"/>
    <xsl:copy-of select="$codefile/javascript/node()"/>
</xsl:template>


    <!-- Inline Formatting -->
    <xsl:template match="application">
      <xsl:call-template name="inline.boldseq"/>
    </xsl:template>
    <xsl:template match="guibutton">
      <xsl:call-template name="inline.boldseq"/>
    </xsl:template>
    <xsl:template match="guilabel">
      <xsl:call-template name="inline.italicseq"/>
    </xsl:template>

    <xsl:param name="use.id.as.filename" select="1"/>
    
<!-- Dont' display revhistory -->
<xsl:template match="revhistory" mode="titlepage.mode"/>

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


</xsl:stylesheet>
