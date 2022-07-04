<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- This file is a customization layer for HTML only -->
    <!-- ======================= -->
    <!-- Imports -->
	<xsl:import href="/usr/share/xml/docbook/stylesheet/docbook-xsl/xhtml/chunk.xsl"/>
	<xsl:import href="html-site-banner.xsl"/>	
	<xsl:import href="draft-watermark.xsl"/>

    <!-- Params -->
    <xsl:param name="generate.legalnotice.link" select="1"/>
	<!-- requires DocBook XSL 1.69.1a -->
    <xsl:param name="generate.revhistory.link" select="1"/>
    <xsl:param name="toc.max.depth" select="2"/>
    <xsl:param name="chunker.output.indent" select="'yes'"/>
    <xsl:param name="body.font.master" select="10"/>
    <xsl:param name="html.stylesheet" select="'html-site.css'"/>
    <xsl:param name="shade.verbatim" select="0"/>
    <xsl:param name="draft.mode" select="'no'"/>
    <xsl:param name="chunk.first.sections" select="'1'"/>
	<!--Navigation Graphics-->
	<xsl:param name="navig.graphics" select="1"/>
	<xsl:param name="navig.graphics.path" select="'/usr/share/doctemplate/lib/img/navig/'"/>
	<xsl:param name="navig.graphics.extension" select="'.png'"/> 
	<xsl:param name="navig.showtitles" select="1"/>
	
	<!--Admon Graphics--> 
	<xsl:param name="admon.graphics" select="1"/>
	<xsl:param name="admon.textlabel" select="0"/>
	<xsl:param name="admon.graphics.path" select="'../../libs/admon/'"/>
	<xsl:param name="admon.graphics.extension" select="'.png'"/>
	
	<!-- Callout Graphics -->
	<xsl:param name="callout.unicode" select="1"/>
	<xsl:param name="callout.graphics" select="0"/>
	<xsl:param name="callout.graphics.path" select="'../../libs/callouts/'"/>
	<xsl:param name="callout.graphics.extension" select="'.png'"/>
	
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
    

</xsl:stylesheet>
