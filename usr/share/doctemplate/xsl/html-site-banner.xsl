<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">

<!-- Header -->

<xsl:template name="header.navigation">
	<div id="header">
<!-- Site Banner -->
<!--		<div id="sitename"><img src="" alt="Missing"/></div>-->
	</div>
</xsl:template>

<!-- Footer -->

<xsl:template name="user.footer.navigation">
<hr />
<div id="footer">
<!--  <div id="footer">-->
<!--<p>You can add footer content here</p>-->
<!--  </div>-->
</div>

<!--<div id="bottomcap">-->
<!--	<img src="" alt=""/>-->
<!--</div>-->

</xsl:template>

<!-- Content -->

<xsl:template name="chunk-element-content">
  <xsl:param name="prev"/>
  <xsl:param name="next"/>
  <xsl:param name="nav.context"/>
  <xsl:param name="content">
    <xsl:apply-imports/>
  </xsl:param>

  <xsl:call-template name="user.preroot"/>

  <html>
    <xsl:call-template name="html.head">
      <xsl:with-param name="prev" select="$prev"/>
      <xsl:with-param name="next" select="$next"/>
    </xsl:call-template>

    <body>
	<div id="round">
<!--	<img id="topcap" alt="" src="" />-->
	<div id="layout" class="container clear-block">
      <xsl:call-template name="body.attributes"/>
      <xsl:call-template name="user.header.navigation"/>

      <xsl:call-template name="header.navigation">
        <xsl:with-param name="prev" select="$prev"/>
        <xsl:with-param name="next" select="$next"/>
        <xsl:with-param name="nav.context" select="$nav.context"/>
      </xsl:call-template>

      <xsl:call-template name="user.header.content"/>
	<div id="page">
	<div id="content">
      <xsl:copy-of select="$content"/>
	</div>
      <xsl:call-template name="user.footer.content"/>

      <xsl:call-template name="footer.navigation">
        <xsl:with-param name="prev" select="$prev"/>
        <xsl:with-param name="next" select="$next"/>
        <xsl:with-param name="nav.context" select="$nav.context"/>
      </xsl:call-template>

      <xsl:call-template name="user.footer.navigation"/>
	</div>
	</div>
	</div>
    </body>
  </html>
  <xsl:value-of select="$chunk.append"/>
</xsl:template>

</xsl:stylesheet>
