<?xml version='1.0'?>
<xsl:stylesheet  
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	version="1.0"
	>

<xsl:param name="section.autolabel" select="1"></xsl:param>

<!-- Override docbook templates to customize output -->

<!-- for example, this commented out template overrides every <para> and -->
<!-- inserts an attribute -->
<!--<xsl:template match="para">-->
<!--	<para class="mypara">-->
<!--		<xsl:apply-templates/>-->
<!--	</para>-->
<!--</xsl:template>-->

<!-- this ensures all content not handled specifically is passed through -->
<xsl:template match="node()|@*">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()" />
      </xsl:copy>    
</xsl:template>

</xsl:stylesheet>
