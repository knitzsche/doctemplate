<?xml version='1.0'?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
        xmlns:fo="http://www.w3.org/1999/XSL/Format"
        xmlns:xi="http://www.w3.org/2003/XInclude"
        version="1.0"
        >

<xsl:import href="/usr/share/xml/docbook/stylesheet/docbook-xsl/fo/docbook.xsl"/>
<xsl:import href="../build/tmp/mytitlepage.xsl"/>

<!-- let tables have rules within -->
<xsl:param name="default.table.rules">all</xsl:param>

<xsl:attribute-set name="section.title.properties">
  <xsl:attribute name="color">#333333</xsl:attribute>
</xsl:attribute-set>

<!-- let default font color be #333333 (gray) -->
<xsl:attribute-set name="root.properties">
  <xsl:attribute name="color">#333333</xsl:attribute>
</xsl:attribute-set>

<!-- let header text default color by orange -->
<xsl:attribute-set name="header.content.properties">
  <xsl:attribute name="color">#DD4814</xsl:attribute>
</xsl:attribute-set>

<!--
customize page header table column widths
-->
<xsl:param name="header.column.widths">1 3 1</xsl:param>

<!--
enable/disable daft mode. when "draft" is passed as $1 to
doctemplate_make_book_pdf, use DRAFT watermark 
-->
<xsl:param name="draft.mode"/>

<xsl:param name="draft.watermark.image">http://docbook.sourceforge.net/release/images/draft.png</xsl:param>

<!--
set page margins
-->
<xsl:param name="page.margin.inner">
  <xsl:choose>
    <xsl:when test="$double.sided != 0">0.25in</xsl:when>
    <xsl:otherwise>1in</xsl:otherwise>
  </xsl:choose>
</xsl:param>

<xsl:param name="page.margin.outer">
  <xsl:choose>
    <xsl:when test="$double.sided != 0">0.25in</xsl:when>
    <xsl:otherwise>1in</xsl:otherwise>
  </xsl:choose>
</xsl:param>

<xsl:param name="generate.toc">
appendix  toc,title
article/appendix  nop
book      toc,title
<!-- part      toc,title -->
qandadiv  toc
qandaset  toc
reference toc,title
</xsl:param>

<!--
Set sizes of sect1, sect2 and sec3 titles relative to body font
-->
<xsl:attribute-set name="section.title.level1.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 1.75"></xsl:value-of>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="section.title.level2.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 1.5"></xsl:value-of>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="section.title.level3.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master * 1.25"></xsl:value-of>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>


</xsl:stylesheet>
