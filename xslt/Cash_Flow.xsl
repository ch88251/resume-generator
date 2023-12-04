<xsl:stylesheet version="1.1" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:fo="http://www.w3.org/1999/XSL/Format" 
    xmlns:svg="http://www.w3.org/2000/svg" 
    xmlns:fox="http://xmlgraphics.apache.org/fop/extensions">
  
    <xsl:include href="/Users/chayes/projects/xsl-fo-examples/xslt/CommonBuilderXSLColorCodings.xsl" />
    <!-- <xsl:include href="/Users/chayes/projects/xsl-fo-examples/xslt/CommonBuilderSVGComponents.xsl" />
    <xsl:include href="/Users/chayes/projects/xsl-fo-examples/xslt/CommonBuilderXSLTemplates.xsl" /> -->

    <xsl:template match="/Report">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="default-page" page-width="11in" page-height="8.5in">
                    <fo:region-body margin-top="1.5in" margin-bottom="0.75in" />
                    <fo:region-before extent="1.79in" />
                    <fo:region-after extent="0.25in" />
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-name="default-page"
                master-reference="default-page" initial-page-number="1" format="1">
                <fo:flow flow-name="xsl-region-body">
                    <xsl:call-template name="Cash_Flow" />
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template name="Cash_Flow">
        <fo:block>
            <!--If there is CashFlowPage element then generate Cash Flow Summary 
                Information page -->
            <xsl:if test="count(/Report/CashFlowPage) > 0">
                <xsl:if test="count(/Report/AssetAllocationPage) > 0">
                    <fo:block break-before="page" />
                </xsl:if>
                <xsl:call-template name="CashFlowSummary" />
            </xsl:if>
        </fo:block>
    </xsl:template>
    
    <xsl:template name="CashFlowSummary" match="/Report/CashFlowPage">
        <fo:block break-before="page"/>
        <fo:block>
            <fo:table table-omit-header-at-break="false" border-collapse="collapse">
                <fo:table-column column-width="7.375in"/>
                <fo:table-header table-omit-header-at-break="false" border-collapse="collapse">
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block height="0.1388in" space-before="0.3055in" 
                                space-after="0.0972in" color="{$COM_CLRCD_T13}" 
                                font-family="Arial" font-size="10pt" text-align="right">
                                Appendix | Security Details
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell text-align="start" padding-left="0.1388in" background-color="{$COM_CLRCD_C9}">
                            <fo:block font-size="16pt" color="{$COM_CLRCD_SLATE_BLUE}" font-family="Arial">
                                <fo:inline>Estimated Cash Flow Summary&#160;</fo:inline>
                                <fox:continued-label>
                                    <fo:inline font-size="9pt" color="{$COM_CLRCD_SLATE_BLUE}" font-family="Arial">
                                    (continued)
                                    </fo:inline>
                                </fox:continued-label>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block line-height="30pt">
                                <fo:leader leader-length="100%" leader-pattern="space"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-header>
            </fo:table>
        </fo:block>
    </xsl:template>
    
</xsl:stylesheet>