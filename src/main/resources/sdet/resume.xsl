<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:lgcy="urn:tarhely.gov.hu:1.0:legacy">
    
    <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
    <xsl:param name="versionParam" select="'1.0'"/> 

    <xsl:template match="Resume">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master 
                    master-name="simpleA4" 
                    page-height="11in" 
                    page-width="8.5in" 
                    margin-top="0.5in" 
                    margin-bottom="0.5in" 
                    margin-left="0.5in" 
                    margin-right="0.5in" 
                    font-family="Roboto">
                    <fo:region-body/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="simpleA4">
                <fo:flow flow-name="xsl-region-body">
                    <fo:table background-color="#CD6155">
                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell width="3.0in" color="#FDFEFE" padding="6mm 6mm 6mm 6mm">
                                    <fo:block 
                                        font-size="20pt" 
                                        font-weight="bold">
                                        <xsl:value-of select="Header/Name"/>
                                    </fo:block>
                                    <fo:block
                                        font-size="12pt" 
                                        font-weight="bold">
                                        <xsl:value-of select="Header/Title"/>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell width="4.25in" color="#FDFEFE" padding="6mm 6mm 6mm 6mm">
                                    <fo:table font-size="12pt">
                                        <fo:table-body>
                                            <fo:table-row>
                                                <fo:table-cell text-align="right" font-weight="bold">
                                                    <fo:block>Phone:</fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell margin-left="5px">
                                                    <fo:block>
                                                        <xsl:value-of select="Header/Phone"/>
                                                    </fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                            <fo:table-row>
                                                <fo:table-cell text-align="right" font-weight="bold">
                                                    <fo:block>Email: </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell margin-left="5px">
                                                    <fo:block>
                                                        <xsl:value-of select="Header/Email"/>
                                                    </fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                        </fo:table-body>
                                    </fo:table>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                    <fo:table>
                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell width="4.25in">
                                    <fo:block 
                                        padding-top="10px"
                                        font-size="20pt" 
                                        color="#CD6155">
                                        Relevant Work Experience
                                    </fo:block>
                                    <fo:block margin-bottom="8px">
                                        <xsl:for-each select="Jobs/Job">
                                            <fo:block font-size="12pt" font-weight="bold" keep-with-next="always">
                                                <xsl:value-of select="Title"/>
                                            </fo:block>
                                            <fo:block font-size="10pt" font-style="italic" color="#000000" margin-bottom="10pt">
                                                <fo:inline>
                                                    <xsl:value-of select="Company"/> - <xsl:value-of select="Period"/>
                                                </fo:inline>
                                            </fo:block>
                                            <fo:block font-size="10pt">
                                                <xsl:for-each select="Accomplishments/Accomplishment">
                                                    <fo:list-block margin-left="5pt" provisional-distance-between-starts="10pt">
                                                        <fo:list-item margin-bottom="4pt">
                                                            <fo:list-item-label end-indent="label-end()">
                                                                <fo:block>&#x2022;</fo:block>
                                                            </fo:list-item-label>
                                                            <fo:list-item-body start-indent="body-start()">
                                                                <fo:block>
                                                                    <xsl:value-of select="."/>
                                                                </fo:block>
                                                            </fo:list-item-body>
                                                        </fo:list-item>
                                                    </fo:list-block>
                                                </xsl:for-each>
                                            </fo:block>                                    
                                        </xsl:for-each>
                                    </fo:block>
                                    <!-- <fo:block 
                                        padding-top="10px"
                                        font-size="20pt" 
                                        color="#CD6155">
                                        Additional Work Experience
                                    </fo:block> -->
                                    <fo:block>
                                        <xsl:for-each select="AdditionalJobs/Job">
                                            <fo:block font-size="12pt" font-weight="bold" keep-with-next="always">
                                                <xsl:value-of select="Title"/>
                                            </fo:block>
                                            <fo:block font-size="10pt" font-style="italic" color="#000000" margin-bottom="10pt">
                                                <fo:inline>
                                                    <xsl:value-of select="Company"/> - <xsl:value-of select="Period"/>
                                                </fo:inline>
                                            </fo:block>
                                        </xsl:for-each>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell width="0.25in">
                                    <fo:block/>
                                </fo:table-cell>
                                <!-- ================================================================ -->
                                <!-- Right Column                                                     -->
                                <!-- ================================================================ -->
                                <fo:table-cell padding="10px" background-color="#F2F3F4" width="3.0in">
                                    <fo:block
                                        font-size="20pt" 
                                        color="#CD6155">
                                        Summary
                                    </fo:block>
                                    <fo:block font-size="10pt">
                                        <xsl:value-of select="Summary"/>
                                    </fo:block>
                                    <fo:block margin-top="20px"
                                        padding="5px"
                                        background-color="#CD6155"
                                        text-align="center"
                                        font-size="16pt" 
                                        color="#FFFFFF">
                                        <xsl:value-of select="Clearance"/>
                                    </fo:block>
                                    <fo:block margin-top="20px"
                                        font-size="20pt" 
                                        color="#CD6155">
                                        Skills
                                    </fo:block>
                                    <fo:block
                                        font-size="14pt" 
                                        color="#000000">
                                        Core Skills
                                    </fo:block>
                                    <xsl:for-each select="Skills/Core/Skill">
                                        <fo:list-block margin-left="5pt" provisional-distance-between-starts="10pt">
                                            <fo:list-item margin-bottom="4pt">
                                                <fo:list-item-label end-indent="label-end()">
                                                    <fo:block>&#x2022;</fo:block>
                                                </fo:list-item-label>
                                                <fo:list-item-body start-indent="body-start()">
                                                    <fo:block font-size="10pt">
                                                        <xsl:value-of select="."/>
                                                    </fo:block>
                                                </fo:list-item-body>
                                            </fo:list-item>
                                        </fo:list-block>
                                    </xsl:for-each>
                                    <fo:block margin-top="10px"
                                        font-size="14pt" 
                                        color="#000000">
                                        Additional Skills
                                    </fo:block>
                                    <xsl:for-each select="Skills/Additional/Skill">
                                        <fo:list-block margin-left="5pt" provisional-distance-between-starts="10pt">
                                            <fo:list-item margin-bottom="4pt">
                                                <fo:list-item-label end-indent="label-end()">
                                                    <fo:block>&#x2022;</fo:block>
                                                </fo:list-item-label>
                                                <fo:list-item-body start-indent="body-start()">
                                                    <fo:block font-size="10pt">
                                                        <xsl:value-of select="."/>
                                                    </fo:block>
                                                </fo:list-item-body>
                                            </fo:list-item>
                                        </fo:list-block>
                                    </xsl:for-each>
                                    <fo:block margin-top="20px"
                                        font-size="20pt" 
                                        color="#CD6155">
                                        Recent Courses
                                    </fo:block>
                                    <xsl:for-each select="RecentCourses/Course">
                                        <fo:block font-size="10pt" font-style="italic">
                                            <xsl:value-of select="./Date"/>
                                        </fo:block>
                                        <fo:block font-size="10pt" font-weight="bold">
                                            <xsl:value-of select="./Name"/>
                                        </fo:block>
                                        <fo:block font-size="10pt" margin-bottom="20px">
                                            <xsl:value-of select="./Details"/>
                                        </fo:block>
                                    </xsl:for-each>
                                    <fo:block margin-top="20px"
                                        font-size="20pt" 
                                        color="#CD6155">
                                        Education
                                    </fo:block>
                                    <xsl:for-each select="Education/School">
                                        <fo:block font-size="10pt" font-style="italic">
                                            <xsl:value-of select="./Period"/>
                                        </fo:block>
                                        <fo:block font-size="10pt" font-weight="bold">
                                            <xsl:value-of select="./Name"/>
                                        </fo:block>
                                        <fo:block font-size="10pt" margin-bottom="20px">
                                            <xsl:value-of select="./Major"/>
                                        </fo:block>
                                    </xsl:for-each>
                                </fo:table-cell>                                                         
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>


</xsl:stylesheet>
