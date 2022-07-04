<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns="http://www.w3.org/2001/XInclude">

<!--    <xsl:output method="xml" indent="yes" encoding="utf-8"-->
<!--        doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"-->
<!--        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" />-->

<!--<xsl:output method="html" indent="yes" encoding="UTF-8"/>-->

<xsl:output method="xml" indent="yes" encoding="utf-8" 
   doctype-public="-//OASIS//DTD DocBook XML V4.3//EN"
   doctype-system="http://docbook.org/xml/4.3/docbookx.dtd" />


<xsl:template match="node()|@*">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()" />
      </xsl:copy>    
</xsl:template>

</xsl:stylesheet>
