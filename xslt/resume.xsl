<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:lgcy="urn:tarhely.gov.hu:1.0:legacy">
    
    <xsl:import href="Styles.xsl"/>
    
    <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
    <xsl:param name="versionParam" select="'1.0'"/> 

    <xsl:template match="Resume">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master 
                    master-name="simpleA4" 
                    page-height="11in" 
                    page-width="8.5in" 
                    margin-top="1.0in" 
                    margin-bottom="1.0in" 
                    margin-left="1.0in" 
                    margin-right="1.0in">
                    <fo:region-body/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="simpleA4">
                <fo:flow flow-name="xsl-region-body">
                    <fo:table>
                        <fo:table-column width="4.0in"/>
                        <fo:table-column width="2.5in"/>
                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell 
                                    border-bottom-style="solid" 
                                    border-bottom-color="#336699" 
                                    border-bottom-width="1px">
                                    <fo:block 
                                        font-family="Roboto Condensed" 
                                        font-size="20pt" 
                                        color="#336699">
                                        <xsl:value-of select="Header/Name"/>
                                    </fo:block>
                                    <fo:block
                                        font-family="Verdana" 
                                        font-size="12pt" 
                                        color="#336699">
                                        <xsl:value-of select="Header/Title"/>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell 
                                    border-bottom-style="solid" 
                                    border-bottom-color="#336699" 
                                    border-bottom-width="1px">
                                    <fo:block
                                        font-family="Verdana" 
                                        font-size="8pt" 
                                        color="#336699"
                                        text-align="right">
                                        <xsl:value-of select="Header/Address"/>
                                    </fo:block>
                                    <fo:block
                                        font-family="Verdana" 
                                        font-size="8pt" 
                                        color="#336699"
                                        text-align="right">
                                        <fo:inline>
                                        <xsl:value-of select="Header/City"/>, 
                                        <xsl:value-of select="Header/State"/>&#160;
                                        <xsl:value-of select="Header/Zip"/>
                                        </fo:inline>
                                    </fo:block>
                                    <fo:block
                                        font-family="Verdana" 
                                        font-size="8pt" 
                                        color="#336699"
                                        text-align="right">
                                        <xsl:value-of select="Header/Email"/>
                                    </fo:block>
                                    <fo:block
                                        font-family="Verdana" 
                                        font-size="8pt" 
                                        color="#336699"
                                        text-align="right">
                                        <xsl:value-of select="Header/Phone"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                    <xsl:for-each select="Section">
                        <xsl:choose>
                            <xsl:when test="count(./Job) = 0">
                                <fo:block 
                                    font-family="Arial" 
                                    font-size="14pt" 
                                    color="#336699"
                                    margin-top="20pt"
                                    margin-bottom="6pt">
                                    <xsl:value-of select="./Name"/>
                                </fo:block>
                                <fo:block 
                                    font-family="Arial" 
                                    font-size="11pt" 
                                    color="#000000"
                                    margin-top="6pt"
                                    margin-bottom="6pt">
                                    <xsl:value-of select="./Description"/>
                                </fo:block>
                            </xsl:when>
                            <xsl:otherwise>
                                <fo:block 
                                    font-family="Arial" 
                                    font-size="14pt" 
                                    color="#336699"
                                    margin-top="20pt"
                                    margin-bottom="6pt">
                                    <xsl:value-of select="./Name"/>
                                </fo:block>
                                <fo:table>
                                    <fo:table-column width="4.0in"/>
                                    <fo:table-column width="2.5in"/>
                                    <fo:table-body>
                                        <xsl:for-each select="Job">
                                            <fo:table-row>
                                                <fo:table-cell>
                                                    <fo:block 
                                                        font-family="Verdana" 
                                                        font-size="12pt">
                                                        <xsl:value-of select="Company"/>
                                                    </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell>
                                                    <fo:block 
                                                        text-align="right"
                                                        font-family="Verdana" 
                                                        font-size="12pt">
                                                        <xsl:value-of select="Period"/>
                                                    </fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                            <fo:table-row>
                                                <fo:table-cell number-columns-spanned="2">
                                                    <fo:block 
                                                        font-family="Verdana" 
                                                        font-size="11pt">
                                                        <xsl:value-of select="Title"/>
                                                    </fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                            <fo:table-row>
                                                <fo:table-cell number-columns-spanned="2" padding-top="4pt"
                                                    padding-bottom="10pt">
                                                    <fo:block 
                                                        font-family="Verdana" 
                                                        font-size="10pt">
                                                        <xsl:value-of select="Description"/>
                                                    </fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                        </xsl:for-each>
                                    </fo:table-body>
                                </fo:table>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="Job">
                        </xsl:if>
                    </xsl:for-each>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

</xsl:stylesheet>
