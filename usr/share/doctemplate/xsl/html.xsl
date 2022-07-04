<?xml version='1.0'?>
<!-- A simple demo XSL stylesheet for generating HTML -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh/xhtml/docbook.xsl"/>
   <xsl:param name="toc.max.depth">2</xsl:param>
   <xsl:param name="html.stylesheet" select="'/ubuntu.css'"/>
   <xsl:template name="user.header.content">
     <a href="/">Back to main page</a>
   </xsl:template>
  
</xsl:stylesheet>
