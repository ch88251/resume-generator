<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Common Template 
    to display the Amount in formatted form Template No : 01 Parameter : Required 
    Parameter Name : COM_Amount Parameter Type : Numeric ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
  <xsl:template name="COMMONXSL_FORMAT_AMOUNT">
    <!-- Parameter to format the Amount. User Needs to Pass this Parameter -->
    <xsl:param name="COM_Amount" />
    <!-- Check the Parameter value and decide how to display the Amount -->
    <xsl:choose>
      <xsl:when test="$COM_Amount = -999999999999.999">
        <xsl:text>-</xsl:text>
      </xsl:when>
      <xsl:when test="$COM_Amount &gt;= 1.0">
        <xsl:choose>
          <xsl:when test="$COM_Amount &lt;= 9999999 ">
            $
            <xsl:value-of
              select="format-number(number($COM_Amount),'#,###.00;(#,###.00)')" />
          </xsl:when>
          <xsl:when
            test="$COM_Amount &gt; 9999999 and
                                                        $COM_Amount &lt;= 99999999">
            $
            <xsl:value-of
              select="format-number(number($COM_Amount),'#,###.0;(#,###.0)')" />
          </xsl:when>
          <xsl:when test="$COM_Amount &gt; 99999999">
            $
            <xsl:value-of
              select="format-number(number($COM_Amount),'#,###;(#,###)')" />
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$COM_Amount &lt; 0.00">
        <xsl:variable name="COM_Amt">
          <xsl:value-of select="$COM_Amount*(-1)" />
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$COM_Amt &gt; 1.00 and $COM_Amt &lt;= 9999999">
            $ (
            <xsl:value-of select="format-number(number($COM_Amt),'#,###.00')" />
            )
          </xsl:when>
          <xsl:when
            test="$COM_Amt &gt; 9999999 and
                                                        $COM_Amt &lt;= 99999999">
            $ (
            <xsl:value-of select="format-number(number($COM_Amt),'#,###.0')" />
            )
          </xsl:when>
          <xsl:when test="$COM_Amt &gt; 99999999">
            $ (
            <xsl:value-of select="format-number(number($COM_Amt),'#,###')" />
            )
          </xsl:when>
          <xsl:otherwise>
            $ (
            <xsl:value-of select="format-number(number($COM_Amt),'0.00')" />
            )
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$COM_Amount &gt; 0.0 and $COM_Amount &lt; 1.0">
        $
        <xsl:value-of select="$COM_Amount " />
      </xsl:when>
      <xsl:when test="$COM_Amount = 0 ">
        $
        <xsl:value-of select="format-number(number($COM_Amount),'0.00')" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>-</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ End of Amount 
    Format Template 01 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
  <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Common Template 
    to Check the Validity of % Values Template No : 02 Parameter : Required Parameter 
    Name : COM_Value Parameter Type : Numeric ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
  <xsl:template name="COMMONXSL_CHECK_NEGATIVE_INTEGER">
    <!-- Parameter to Check the Valid % Value. User Needs to Pass this Parameter -->
    <xsl:param name="COM_value" />
    <!-- Check the Parameter value and decide how to display the Value -->
    <xsl:choose>
      <xsl:when test="($COM_value = -999999999)">
        <xsl:text>-</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$COM_value" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="COMMONXSL_CHECK_VALID_VALUE">
    <!-- Parameter to Check the Valid % Value. User Needs to Pass this Parameter -->
    <xsl:param name="COM_value" />
    <!-- Check the Parameter value and decide how to display the Value -->
    <xsl:choose>
      <xsl:when
        test="($COM_value = -999999999999.999 or string-length($COM_value) = 0)">
        <xsl:text>-</xsl:text>
      </xsl:when>
      <xsl:when test="$COM_value = 0 ">
        <xsl:value-of select="format-number(number($COM_value),'0.0')" />
        <xsl:text>%</xsl:text>
      </xsl:when>
      <xsl:when test="$COM_value &gt;= 1.0">
        <xsl:value-of select="format-number(number($COM_value),'###.0')" />
        <xsl:text>%</xsl:text>
      </xsl:when>
      <xsl:when test="$COM_value &lt; 1.0 and $COM_value &gt; 0.0">
        <xsl:value-of select="$COM_value" />
        <xsl:text>%</xsl:text>
      </xsl:when>
      <xsl:when test="$COM_value &lt; 0.0">
        <xsl:value-of select="$COM_value" />
        <xsl:text>%</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ End of Checking 
    Valid % Value Template 02 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
  <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Common Template 
    to Display any given String to required length Template No : 05 Parameter 
    : Required Parameter Name : COM_Position_Name ,COM_Position_Width, COM_Position_End 
    Parameter Type : String ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
  <xsl:template name="COMMONXSL_TRUNCATE_NAME">
    <!-- Parameter to truncate the Position Name. User Needs to Pass this 
      Parameter -->
    <xsl:param name="COM_Position_Name" />
    <!-- Parameter to truncate the Position Width. User Needs to Pass this 
      Parameter -->
    <xsl:param name="COM_Position_Width" />
    <!-- Check the Parameter length and truncate the String -->
    <xsl:choose>
      <xsl:when test="string-length($COM_Position_Name)=0">
        <xsl:text disable-output-escaping="yes">-</xsl:text>
      </xsl:when>
      <xsl:when
        test="string-length($COM_Position_Name) > $COM_Position_Width">
        <xsl:value-of
          select="substring($COM_Position_Name,1,$COM_Position_Width)" />
        <xsl:if
          test="string-length($COM_Position_Name) > $COM_Position_Width">
          <xsl:text>...</xsl:text>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$COM_Position_Name" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="REPORT_NAME">
    <xsl:choose>
      <xsl:when test="/Report/reportPackageType = 'portfolioReview' ">
        Portfolio Review
      </xsl:when>
      <xsl:when test="/Report/reportPackageType = 'cashFlowSummary' ">
        Cash Flow Summary
      </xsl:when>
      <xsl:otherwise>
        Portfolio Consultation Report
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:template name="COMMONXSL_CHECK_VALID_QTY">
    <!-- Parameter to Check the Valid Quantity Value. User Needs to Pass 
      this Parameter -->
    <xsl:param name="COM_quantity" />
    <!-- Check the Parameter value and decide how to display the Value -->
    <xsl:choose>
      <xsl:when
        test="($COM_quantity = -999999999999.999 or string-length($COM_quantity) =0)">
        <xsl:text>-</xsl:text>
      </xsl:when>
      <xsl:when test="$COM_quantity &gt;= 0.0 and $COM_quantity &lt; 1.0">
        <xsl:value-of select="$COM_quantity" />
      </xsl:when>
      <xsl:when test="$COM_quantity &lt; 0.0">
        <xsl:variable name="COM_Qty">
          <xsl:value-of select="$COM_quantity*(-1)" />
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$COM_Qty &gt;= 1.0">
            (
            <xsl:value-of select="format-number(number($COM_Qty),'#,###.0000')" />
            )
          </xsl:when>
          <xsl:otherwise>
            (
            <xsl:value-of select="format-number(number($COM_Qty),'0.0000')" />
            )
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of
          select="format-number(number($COM_quantity),'#,###.0000;(#,###.0000) ')" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ End of Template 
    to Display truncated String with specific charcters ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

  <xsl:template name="COMMONXSL_FORMAT_AMOUNT_CASH">
    <!-- Parameter to format the Amount. User Needs to Pass this Parameter -->
    <xsl:param name="COM_Amount" />
    <!-- Check the Parameter value and decide how to display the Amount -->
    <xsl:choose>
      <xsl:when test="$COM_Amount = -999999999999.999">
        <xsl:text>-</xsl:text>
      </xsl:when>
      <xsl:when test="$COM_Amount &gt;= 1.0">
        <xsl:choose>
          <xsl:when test="$COM_Amount &lt;= 9999999 ">
            $
            <xsl:value-of
              select="format-number(number($COM_Amount),'#,###.00;(#,###.00)')" />
          </xsl:when>
          <xsl:when
            test="$COM_Amount &gt; 9999999 and
                                                        $COM_Amount &lt;= 99999999">
            $
            <xsl:value-of
              select="format-number(number($COM_Amount),'#,###.0;(#,###.0)')" />
          </xsl:when>
          <xsl:when test="$COM_Amount &gt; 99999999">
            $
            <xsl:value-of
              select="format-number(number($COM_Amount),'#,###;(#,###)')" />
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$COM_Amount &lt; 0.00">
        <xsl:variable name="COM_Amt">
          <xsl:value-of select="$COM_Amount*(-1)" />
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$COM_Amt &gt; 1.00 and $COM_Amt &lt;= 9999999">
            ($
            <xsl:value-of select="format-number(number($COM_Amt),'#,###.00')" />
            )
          </xsl:when>
          <xsl:when
            test="$COM_Amt &gt; 9999999 and
                                                        $COM_Amt &lt;= 99999999">
            ($
            <xsl:value-of select="format-number(number($COM_Amt),'#,###.0')" />
            )
          </xsl:when>
          <xsl:when test="$COM_Amt &gt; 99999999">
            ($
            <xsl:value-of select="format-number(number($COM_Amt),'#,###')" />
            )
          </xsl:when>
          <xsl:otherwise>
            ($
            <xsl:value-of select="format-number(number($COM_Amt),'0.00')" />
            )
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$COM_Amount &gt; 0.0 and $COM_Amount &lt; 1.0">
        $
        <xsl:value-of select="$COM_Amount " />
      </xsl:when>
      <xsl:when test="$COM_Amount = 0">
        $
        <xsl:value-of select="format-number(number($COM_Amount),'0.00')" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>-</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="COMMONXSL_FORMAT_SECTOR_DETAIL_AMOUNT">
    <!-- Parameter to format the Amount. User Needs to Pass this Parameter -->
    <xsl:param name="COM_Amount" />
    <!-- Check the Parameter value and decide how to display the Amount -->
    <xsl:choose>
      <xsl:when test="$COM_Amount = -999999999999.999">
        <fo:block text-align="center" font-size="7pt"
          font-family="{$COM_FONTFL_CMCR}">
          -
        </fo:block>
      </xsl:when>
      <xsl:when test="$COM_Amount &gt;= 1.0">
        <xsl:choose>
          <xsl:when test="$COM_Amount &lt;= 9999999 ">
            <fo:block text-align="right" font-size="7pt"
              font-family="{$COM_FONTFL_CMCR}">
              $
              <xsl:value-of
                select="format-number(number($COM_Amount),'#,###.00;(#,###.00)')" />
            </fo:block>
          </xsl:when>
          <xsl:when test="$COM_Amount &gt; 9999999">
            <fo:block text-align="right" font-size="6pt"
              font-family="{$COM_FONTFL_CMCR}">
              $
              <xsl:value-of
                select="format-number(number($COM_Amount),'#,###.00;(#,###.00)')" />
            </fo:block>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$COM_Amount &lt; 0.00">
        <xsl:variable name="COM_Amt">
          <xsl:value-of select="$COM_Amount*(-1)" />
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$COM_Amt &gt; 1.00 and $COM_Amt &lt;= 9999999">
            <fo:block text-align="right" font-size="7pt"
              font-family="{$COM_FONTFL_CMCR}">
              $
              <xsl:value-of
                select="format-number(number($COM_Amount),'#,###.00;(#,###.00)')" />
            </fo:block>
          </xsl:when>
          <xsl:when test="$COM_Amt &gt; 9999999">
            <fo:block text-align="right" font-size="6pt"
              font-family="{$COM_FONTFL_CMCR}">
              $
              <xsl:value-of
                select="format-number(number($COM_Amount),'#,###.00;(#,###.00)')" />
            </fo:block>
          </xsl:when>
          <xsl:otherwise>
            <fo:block text-align="right" font-size="7pt"
              font-family="{$COM_FONTFL_CMCR}">
              $ (
              <xsl:value-of select="format-number(number($COM_Amt),'0.00')" />
              )
            </fo:block>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$COM_Amount &gt; 0.0 and $COM_Amount &lt; 1.0">
        <fo:block text-align="right" font-size="7pt"
          font-family="{$COM_FONTFL_CMCR}">
          $
          <xsl:value-of select="$COM_Amount " />
        </fo:block>
      </xsl:when>
      <xsl:when test="$COM_Amount = 0 ">
        <fo:block text-align="right" font-size="7pt"
          font-family="{$COM_FONTFL_CMCR}">
          $
          <xsl:value-of select="format-number(number($COM_Amount),'0.00')" />
        </fo:block>
      </xsl:when>
      <xsl:otherwise>
        <fo:block text-align="center" font-size="7pt"
          font-family="{$COM_FONTFL_CMCR}">
          -
        </fo:block>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="COMMONXSL_FORMAT_MAC_AMOUNT">
    <!-- Parameter to format the Amount. User Needs to Pass this Parameter -->
    <xsl:param name="COM_Amount" />
    <!-- Check the Parameter value and decide how to display the Amount -->
    <xsl:choose>
      <xsl:when test="$COM_Amount = -999999999999.999">
        <fo:block text-align="center" font-size="7pt"
          font-family="{$COM_FONTFL_CMCR}">
          -
        </fo:block>
      </xsl:when>
      <xsl:when test="$COM_Amount &gt;= 1.0">
        <xsl:choose>
          <xsl:when test="$COM_Amount &lt;= 9999999 ">
            <fo:block text-align="right" font-size="8pt"
              font-family="{$COM_FONTFL_CMCR}">
              $
              <xsl:value-of
                select="format-number(number($COM_Amount),'#,###.00;(#,###.00)')" />
            </fo:block>
          </xsl:when>
          <xsl:when test="$COM_Amount &gt; 9999999">
            <fo:block text-align="right" font-size="7pt"
              font-family="{$COM_FONTFL_CMCR}">
              $
              <xsl:value-of
                select="format-number(number($COM_Amount),'#,###.00;(#,###.00)')" />
            </fo:block>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$COM_Amount &lt; 0.00">
        <xsl:variable name="COM_Amt">
          <xsl:value-of select="$COM_Amount*(-1)" />
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$COM_Amt &gt; 1.00 and $COM_Amt &lt;= 9999999">
            <fo:block text-align="right" font-size="8pt"
              font-family="{$COM_FONTFL_CMCR}">
              $
              <xsl:value-of
                select="format-number(number($COM_Amount),'#,###.00;(#,###.00)')" />
            </fo:block>
          </xsl:when>
          <xsl:when test="$COM_Amt &gt; 9999999">
            <fo:block text-align="right" font-size="7pt"
              font-family="{$COM_FONTFL_CMCR}">
              $
              <xsl:value-of
                select="format-number(number($COM_Amount),'#,###.00;(#,###.00)')" />
            </fo:block>
          </xsl:when>
          <xsl:otherwise>
            <fo:block text-align="right" font-size="8pt"
              font-family="{$COM_FONTFL_CMCR}">
              $ (
              <xsl:value-of select="format-number(number($COM_Amt),'0.00')" />
              )
            </fo:block>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$COM_Amount &gt; 0.0 and $COM_Amount &lt; 1.0">
        <fo:block text-align="right" font-size="8pt"
          font-family="{$COM_FONTFL_CMCR}">
          $
          <xsl:value-of select="$COM_Amount " />
        </fo:block>
      </xsl:when>
      <xsl:when test="$COM_Amount = 0 ">
        <fo:block text-align="right" font-size="8pt"
          font-family="{$COM_FONTFL_CMCR}">
          $
          <xsl:value-of select="format-number(number($COM_Amount),'0.00')" />
        </fo:block>
      </xsl:when>
      <xsl:otherwise>
        <fo:block text-align="center" font-size="7pt"
          font-family="{$COM_FONTFL_CMCR}">
          -
        </fo:block>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="COMMONXSL_FORMAT_AMOUNT_SELL_WITHOUT_DOLLAR">
    <!-- Parameter to format the Amount. User Needs to Pass this Parameter -->
    <xsl:param name="COM_Amount" />
    <!-- Check the Parameter value and decide how to display the Amount -->
    <xsl:choose>
      <xsl:when test="$COM_Amount = -999999999999.999">
        <xsl:text>-</xsl:text>
      </xsl:when>
      <xsl:when test="$COM_Amount &gt;= 1.0">
        <xsl:choose>
          <xsl:when test="$COM_Amount &lt;= 9999999 ">
            <xsl:value-of
              select="format-number(number($COM_Amount),'#,###.00')" />
          </xsl:when>
          <xsl:when
            test="$COM_Amount &gt; 9999999 and
                                                        $COM_Amount &lt;= 99999999">
            <xsl:value-of select="format-number(number($COM_Amount),'#,###.0')" />
          </xsl:when>
          <xsl:when test="$COM_Amount &gt; 99999999">
            <xsl:value-of select="format-number(number($COM_Amount),'#,###')" />
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$COM_Amount &lt; 0.00">
        <xsl:variable name="COM_Amt">
          <xsl:value-of select="$COM_Amount*(-1)" />
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$COM_Amt &gt; 1.00 and $COM_Amt &lt;= 9999999">
            <xsl:value-of select="format-number(number($COM_Amt),'#,###.00')" />
          </xsl:when>
          <xsl:when
            test="$COM_Amt &gt; 9999999 and
                                                        $COM_Amt &lt;= 99999999">
            <xsl:value-of select="format-number(number($COM_Amt),'#,###.0')" />
          </xsl:when>
          <xsl:when test="$COM_Amt &gt; 99999999">
            <xsl:value-of select="format-number(number($COM_Amt),'#,###')" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="format-number(number($COM_Amt),'0.00')" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$COM_Amount &gt; 0.0 and $COM_Amount &lt; 1.0">
        <xsl:value-of select="$COM_Amount " />
      </xsl:when>
      <xsl:when test="$COM_Amount = 0">
        <xsl:value-of select="format-number(number($COM_Amount),'0.00')" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>-</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="COMMONXSL_CHECK_VALID_QTY_SELL">
    <!-- Parameter to Check the Valid Quantity Value. User Needs to Pass 
      this Parameter -->
    <xsl:param name="COM_quantity" />
    <!-- Check the Parameter value and decide how to display the Value -->
    <xsl:choose>
      <xsl:when
        test="($COM_quantity = -999999999999.999 or string-length($COM_quantity) =0)">
        <xsl:text>-</xsl:text>
      </xsl:when>
      <xsl:when test="$COM_quantity &gt;= 0.0 and $COM_quantity &lt; 1.0">
        <xsl:value-of select="$COM_quantity" />
      </xsl:when>
      <xsl:when test="$COM_quantity &lt; 0.0">
        <xsl:variable name="COM_Qty">
          <xsl:value-of select="$COM_quantity*(-1)" />
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$COM_Qty &gt;= 1.0">
            <xsl:value-of select="format-number(number($COM_Qty),'#,###.0000')" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="format-number(number($COM_Qty),'0.0000')" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of
          select="format-number(number($COM_quantity),'#,###.0000')" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="COMMONXSL_CHECK_VALID_VALUE_EXT">
    <!-- Parameter to Check the Valid % Value. User Needs to Pass this Parameter -->
    <xsl:param name="COM_value" />
    <!-- Check the Parameter value and decide how to display the Value -->
    <xsl:choose>
      <xsl:when
        test="($COM_value = -999999999999.999 or string-length($COM_value) = 0)">
        <xsl:text>-</xsl:text>
      </xsl:when>
      <xsl:when test="$COM_value = 0 ">
        <xsl:value-of select="format-number(number($COM_value),'0.00')" />
        <xsl:text>%</xsl:text>
      </xsl:when>
      <xsl:when test="$COM_value &gt;= 0.0">
        <xsl:value-of select="format-number(number($COM_value),'###.00')" />
        <xsl:text>%</xsl:text>
      </xsl:when>
      <xsl:when test="$COM_value &lt; 0.0">
        <xsl:value-of select="$COM_value" />
        <xsl:text>%</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="COMMONXSL_FOOTER_TEXT">
    <xsl:param name="report_type" />
    <xsl:param name="hong_kong" />
    <xsl:param name="rep_date" />

    <xsl:choose>
      <xsl:when test="$hong_kong ='Y'">

        <xsl:choose>
          <xsl:when test="$report_type = 'cashFlowSummary' ">
            Charles Schwab, Hong Kong, Ltd. is registered with the
            Securities &amp; Futures Commission ("SFC") to carry out the
            regulated activities in dealing in securities, advising on
            securities and advising on futures contract under CE number
            ADV256. &#169;
            <xsl:value-of select="$rep_date " />
            Charles Schwab Hong Kong, Ltd. All rights reserved.
            (XXXX-XXXX)

          </xsl:when>
          <xsl:otherwise>
            Charles Schwab, Hong Kong, Ltd. is registered with the
            Securities &amp; Futures Commission ("SFC") to carry out the
            regulated activities in dealing in securities, advising on
            securities and advising on futures contract under CE number
            ADV256. &#169;
            <xsl:value-of select="$rep_date" />
            Charles Schwab Hong Kong, Ltd. All rights reserved.
            (XXXX-XXXX)
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="$report_type = 'cashFlowSummary' ">
        <xsl:value-of select="$rep_date" />
        Charles Schwab &amp; Co., Inc. All rights reserved. Member
        SIPC&#160;
        (XXXX-XXXX)

      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$rep_date" />
        Charles Schwab &amp; Co., Inc. All rights reserved. Member
        SIPC&#160;
        (XXXX-XXXX)


      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>
</xsl:stylesheet>