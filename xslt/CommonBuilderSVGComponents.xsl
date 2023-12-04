<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:svg="http://www.w3.org/2000/svg">
  <xsl:template name="COMMONSVG_LEGEND">
    <!-- Parameter to decide which Svg color to be filled for Rectangle -->
    <xsl:param name="COM_svg_Color" />
    <xsl:if test="string-length($COM_svg_Color) != 0">
      <!-- Draws the Rectangle filled with given Svg color -->
      <fo:instream-foreign-object>
        <svg:svg width=".233in" height=".133in">
          <svg:rect width="0.138in" height=".07in" fill="#{$COM_svg_Color}" />
        </svg:svg>
      </fo:instream-foreign-object>
    </xsl:if>
  </xsl:template>

  <xsl:template name="COMMONSVG_RATING_TEXT">
    <!-- Parameter to display as Rating Text. User Needs to Pass this Parameter -->
    <xsl:param name="COM_rating" />
    <xsl:param name="COM_Fill_Color" />
    <xsl:if test="string-length($COM_Fill_Color) != 0">
      <!-- Display the Text with specific fill color -->
      <xsl:choose>
        <xsl:when
          test="($COM_rating != '-') and (string-length($COM_rating) = 1) or (string-length($COM_rating) = 2 and substring($COM_rating, 2, 2) = '*')">
          &#160;
          <fo:instream-foreign-object>
            <svg:svg width=".133in" height=".133in">
              <svg:rect width=".133in" height=".133in"
                fill="{$COM_Fill_Color}" />
              <svg:text x="4.5" y="7.5" style="fill:#ffffff;"
                font-size="8pt" text-anchor="middle">
                <xsl:value-of select="$COM_rating" />
              </svg:text>
            </svg:svg>
          </fo:instream-foreign-object>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$COM_rating" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>

  <xsl:template name="COMMONSVG_RATING_TEXT_INTERNATIONAL">
    <!-- Parameter to display as Rating Text. User Needs to Pass this Parameter -->
    <xsl:param name="COM_rating" />
    <xsl:param name="COM_Fill_Color" />
    <xsl:if test="string-length($COM_Fill_Color) != 0">
      <!-- Display the Text with specific fill color -->
      <xsl:choose>
        <xsl:when
          test="($COM_rating != '-') and (string-length($COM_rating) = 1) or (string-length($COM_rating) = 2 and substring($COM_rating, 2, 2) = '*')">
          &#160;
          <fo:instream-foreign-object>
            <svg:svg width="0.2in" height="0.2in">
              <svg:path d="M 7 1 L 13 7 L7 13 L 1 7 Z"
                style="stroke:{$COM_Fill_Color};fill:{$COM_Fill_Color}"
                stroke-width="1pt" shape-rendering="crispEdges" />
              <svg:text x="7" y="10" style="fill:#ffffff;"
                font-size="8pt" text-anchor="middle">
                <xsl:value-of select="$COM_rating" />
              </svg:text>
            </svg:svg>
          </fo:instream-foreign-object>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$COM_rating" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>


  <xsl:template name="COMMONSVG_ALERT">
    <!-- Draws the Alert with specific fill color and Exclamation mark -->
    <fo:instream-foreign-object>
      <svg:svg width="0.141in" height=".100in">
        <svg:path d="M5 0 L17 25 L1 10 Z " fill="#CC0000" />
        <svg:text x="4.75" y="6.25" text-anchor="middle"
          font-size="6pt" fill="white">!</svg:text>
      </svg:svg>
    </fo:instream-foreign-object>

  </xsl:template>

    <xsl:template name="COMMONSVG_CIRCLE_ALERT_WITH_COLOR">
        <xsl:param name="COM_alert_value" />
        <g>
            <circle cx="100" cy="50" r="40" stroke="black" stroke-width="2" fill="red"/>
            <text x="0" y="10" font-family="Verdana" font-size="12" fill="blue">{$COM_alert_value}</text>
        </g>
    </xsl:template>
    
  <xsl:template name="COMMONSVG_STARSYMBOL_FOR_RATING">
    <!-- Parameter to decide how many stars to be filled, User needs to pass 
      this parameter value -->
    <xsl:param name="COM_noOfStars_ToFill" />
    <!-- Check the Parameter value and decide how many stars are to be filled -->
    <xsl:choose>
      <xsl:when test="$COM_noOfStars_ToFill = 0">
        <!-- Draws the stars with Zero Filled -->
        <fo:instream-foreign-object>
          <svg:svg height="0.1in" width="0.487in">
            <svg:polygon
              points="0,2.5 2.5,2.5 3.25,0 4,2.5 6.5,2.5 4.5,4 5.25,6.5 3.25,5 1.25,6.5 2,4"
              style="stroke:#5ACDE6;fill:#ffffff" stroke-width="0.25pt" />
            <svg:polygon
              points="7,2.5 9.5,2.5 10.25,0 11,2.5 13.5,2.5 11.5,4 12.25,6.5 10.25,5 8.25,6.5 9,4"
              style="stroke:#5ACDE6;fill:#ffffff" stroke-width="0.25pt" />
            <svg:polygon
              points="14,2.5 16.5,2.5 17.25,0 18,2.5 20.5,2.5 18.5,4 19.25,6.5 17.25,5 15.25,6.5 16,4"
              style="stroke:#5ACDE6;fill:#ffffff" stroke-width="0.25pt" />
            <svg:polygon
              points="21,2.5 23.5,2.5 24.25,0 25,2.5 27.5,2.5 25.5,4 26.25,6.5 24.25,5 22.25,6.5 23,4"
              style="stroke:#5ACDE6;fill:#ffffff" stroke-width="0.25pt" />
            <svg:polygon
              points="28,2.5 30.5,2.5 31.25,0 32,2.5 34.5,2.5 32.5,4 33.25,6.5 31.25,5 29.25,6.5 30,4"
              style="stroke:#5ACDE6;fill:#ffffff" stroke-width="0.25pt" />
          </svg:svg>
        </fo:instream-foreign-object>
      </xsl:when>
      <xsl:when test="$COM_noOfStars_ToFill = 1">
        <!-- Draws the stars with One Filled -->
        <fo:instream-foreign-object>
          <svg:svg height="0.1in" width="0.487in">
            <svg:polygon
              points="0,2.5 2.5,2.5 3.25,0 4,2.5 6.5,2.5 4.5,4 5.25,6.5 3.25,5 1.25,6.5 2,4"
              style="stroke:#5ACDE6;fill:#5ACDE6" stroke-width="0.25pt" />
            <svg:polygon
              points="7,2.5 9.5,2.5 10.25,0 11,2.5 13.5,2.5 11.5,4 12.25,6.5 10.25,5 8.25,6.5 9,4"
              style="stroke:#5ACDE6;fill:#ffffff" stroke-width="0.25pt" />
            <svg:polygon
              points="14,2.5 16.5,2.5 17.25,0 18,2.5 20.5,2.5 18.5,4 19.25,6.5 17.25,5 15.25,6.5 16,4"
              style="stroke:#5ACDE6;fill:#ffffff" stroke-width="0.25pt" />
            <svg:polygon
              points="21,2.5 23.5,2.5 24.25,0 25,2.5 27.5,2.5 25.5,4 26.25,6.5 24.25,5 22.25,6.5 23,4"
              style="stroke:#5ACDE6;fill:#ffffff" stroke-width="0.25pt" />
            <svg:polygon
              points="28,2.5 30.5,2.5 31.25,0 32,2.5 34.5,2.5 32.5,4 33.25,6.5 31.25,5 29.25,6.5 30,4"
              style="stroke:#5ACDE6;fill:#ffffff" stroke-width="0.25pt" />
          </svg:svg>
        </fo:instream-foreign-object>
      </xsl:when>
      <xsl:when test="$COM_noOfStars_ToFill = 2">
        <!-- Draws the stars with Two Filled -->
        <fo:instream-foreign-object>
          <svg:svg height="0.1in" width="0.487in">
            <svg:polygon
              points="0,2.5 2.5,2.5 3.25,0 4,2.5 6.5,2.5 4.5,4 5.25,6.5 3.25,5 1.25,6.5 2,4"
              style="stroke:#5ACDE6;fill:#5ACDE6" stroke-width="0.25pt" />
            <svg:polygon
              points="7,2.5 9.5,2.5 10.25,0 11,2.5 13.5,2.5 11.5,4 12.25,6.5 10.25,5 8.25,6.5 9,4"
              style="stroke:#5ACDE6;fill:#5ACDE6" stroke-width="0.25pt" />
            <svg:polygon
              points="14,2.5 16.5,2.5 17.25,0 18,2.5 20.5,2.5 18.5,4 19.25,6.5 17.25,5 15.25,6.5 16,4"
              style="stroke:#5ACDE6;fill:#ffffff" stroke-width="0.25pt" />
            <svg:polygon
              points="21,2.5 23.5,2.5 24.25,0 25,2.5 27.5,2.5 25.5,4 26.25,6.5 24.25,5 22.25,6.5 23,4"
              style="stroke:#5ACDE6;fill:#ffffff" stroke-width="0.25pt" />
            <svg:polygon
              points="28,2.5 30.5,2.5 31.25,0 32,2.5 34.5,2.5 32.5,4 33.25,6.5 31.25,5 29.25,6.5 30,4"
              style="stroke:#5ACDE6;fill:#ffffff" stroke-width="0.25pt" />
          </svg:svg>
        </fo:instream-foreign-object>
      </xsl:when>
      <xsl:when test="$COM_noOfStars_ToFill = 3">
        <!-- Draws the stars with Three Filled -->
        <fo:instream-foreign-object>
          <svg:svg height="0.1in" width="0.487in">
            <svg:polygon
              points="0,2.5 2.5,2.5 3.25,0 4,2.5 6.5,2.5 4.5,4 5.25,6.5 3.25,5 1.25,6.5 2,4"
              style="stroke:#5ACDE6;fill:#5ACDE6" stroke-width="0.25pt" />
            <svg:polygon
              points="7,2.5 9.5,2.5 10.25,0 11,2.5 13.5,2.5 11.5,4 12.25,6.5 10.25,5 8.25,6.5 9,4"
              style="stroke:#5ACDE6;fill:#5ACDE6" stroke-width="0.25pt" />
            <svg:polygon
              points="14,2.5 16.5,2.5 17.25,0 18,2.5 20.5,2.5 18.5,4 19.25,6.5 17.25,5 15.25,6.5 16,4"
              style="stroke:#5ACDE6;fill:#5ACDE6" stroke-width="0.25pt" />
            <svg:polygon
              points="21,2.5 23.5,2.5 24.25,0 25,2.5 27.5,2.5 25.5,4 26.25,6.5 24.25,5 22.25,6.5 23,4"
              style="stroke:#5ACDE6;fill:#ffffff" stroke-width="0.25pt" />
            <svg:polygon
              points="28,2.5 30.5,2.5 31.25,0 32,2.5 34.5,2.5 32.5,4 33.25,6.5 31.25,5 29.25,6.5 30,4"
              style="stroke:#5ACDE6;fill:#ffffff" stroke-width="0.25pt" />
          </svg:svg>
        </fo:instream-foreign-object>
      </xsl:when>
      <xsl:when test="$COM_noOfStars_ToFill = 4">
        <!-- Draws the stars with Four Filled -->
        <fo:instream-foreign-object>
          <svg:svg height="0.1in" width="0.487in">
            <svg:polygon
              points="0,2.5 2.5,2.5 3.25,0 4,2.5 6.5,2.5 4.5,4 5.25,6.5 3.25,5 1.25,6.5 2,4"
              style="stroke:#5ACDE6;fill:#5ACDE6" stroke-width="0.25pt" />
            <svg:polygon
              points="7,2.5 9.5,2.5 10.25,0 11,2.5 13.5,2.5 11.5,4 12.25,6.5 10.25,5 8.25,6.5 9,4"
              style="stroke:#5ACDE6;fill:#5ACDE6" stroke-width="0.25pt" />
            <svg:polygon
              points="14,2.5 16.5,2.5 17.25,0 18,2.5 20.5,2.5 18.5,4 19.25,6.5 17.25,5 15.25,6.5 16,4"
              style="stroke:#5ACDE6;fill:#5ACDE6" stroke-width="0.25pt" />
            <svg:polygon
              points="21,2.5 23.5,2.5 24.25,0 25,2.5 27.5,2.5 25.5,4 26.25,6.5 24.25,5 22.25,6.5 23,4"
              style="stroke:#5ACDE6;fill:#5ACDE6" stroke-width="0.25pt" />
            <svg:polygon
              points="28,2.5 30.5,2.5 31.25,0 32,2.5 34.5,2.5 32.5,4 33.25,6.5 31.25,5 29.25,6.5 30,4"
              style="stroke:#5ACDE6;fill:#ffffff" stroke-width="0.25pt" />
          </svg:svg>
        </fo:instream-foreign-object>
      </xsl:when>
      <xsl:when test="$COM_noOfStars_ToFill = 5">
        <!-- Draws the stars with Five Filled -->
        <fo:instream-foreign-object>
          <svg:svg height="0.1in" width="0.487in">
            <svg:polygon
              points="0,2.5 2.5,2.5 3.25,0 4,2.5 6.5,2.5 4.5,4 5.25,6.5 3.25,5 1.25,6.5 2,4"
              style="stroke:#5ACDE6;fill:#5ACDE6" stroke-width="0.25pt" />
            <svg:polygon
              points="7,2.5 9.5,2.5 10.25,0 11,2.5 13.5,2.5 11.5,4 12.25,6.5 10.25,5 8.25,6.5 9,4"
              style="stroke:#5ACDE6;fill:#5ACDE6" stroke-width="0.25pt" />
            <svg:polygon
              points="14,2.5 16.5,2.5 17.25,0 18,2.5 20.5,2.5 18.5,4 19.25,6.5 17.25,5 15.25,6.5 16,4"
              style="stroke:#5ACDE6;fill:#5ACDE6" stroke-width="0.25pt" />
            <svg:polygon
              points="21,2.5 23.5,2.5 24.25,0 25,2.5 27.5,2.5 25.5,4 26.25,6.5 24.25,5 22.25,6.5 23,4"
              style="stroke:#5ACDE6;fill:#5ACDE6" stroke-width="0.25pt" />
            <svg:polygon
              points="28,2.5 30.5,2.5 31.25,0 32,2.5 34.5,2.5 32.5,4 33.25,6.5 31.25,5 29.25,6.5 30,4"
              style="stroke:#5ACDE6;fill:#5ACDE6" stroke-width="0.25pt" />
          </svg:svg>
        </fo:instream-foreign-object>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>-</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:template name="COMMONSVG_CIRCLE">
    <xsl:param name="COM_Fill_Color" />
    <fo:instream-foreign-object>
      <svg:svg height="0.08in" width="0.1in" viewBox="0 0 5.5 5.5">
        <svg:circle r="0.025in" cx="0.03in" cy="0.03in"
          stroke-width="0.5" stroke="{$COM_Fill_Color}" color="white"
          fill="white" />
      </svg:svg>
    </fo:instream-foreign-object>
  </xsl:template>

  <xsl:template name="COMMONSVG_RHOMBUS">
    <xsl:param name="COM_Fill_Color" />
    <fo:instream-foreign-object>
      <svg:svg height="0.08in" width="0.1in" viewBox="0 0 6 6">
        <svg:path d="M 1 3 L 3 0 L5 3 L 3 6 Z" stroke="{$COM_Fill_Color}"
          stroke-width="0.25pt" fill="#FFFFFF" shape-rendering="crispEdges" />
      </svg:svg>
    </fo:instream-foreign-object>
  </xsl:template>

  <xsl:template name="COMMONSVG_SQUARE">
    <xsl:param name="COM_Fill_Color" />
    <fo:instream-foreign-object>
      <svg:svg height="0.08in" width="0.1in" viewBox="0 0 6 6">
        <svg:rect width="3" height="3" x="1" y="1"
          stroke="{$COM_Fill_Color}" stroke-width="0.25pt" fill="#FFFFFF"
          shape-rendering="crispEdges" />
      </svg:svg>
    </fo:instream-foreign-object>
  </xsl:template>

  <xsl:template name="COMMONSVG_CIRCLE_V_SMALL">
    <fo:instream-foreign-object>
      <svg:svg width=".075in" height=".075in">
        <svg:circle r="0.033in" cx="0.033in" cy="0.033in" />
        <svg:path d="M2.18 2.75 L2.18 .75" style="fill:#ffffff;stroke:#ffffff"
          stroke-width=".015in" />
        <svg:path d="M2.18 2.75 L4.25 1.96" style="fill:#ffffff;stroke:#ffffff"
          stroke-width=".015in" />
        <svg:circle r="0.002in" cx="0.03in" cy="0.038in"
          style="fill:#ffffff;stroke:#ffffff" stroke-width=".010in" />
        <svg:circle r="0.002in" cx="0.03in" cy="0.01in"
          style="fill:#ffffff;stroke:#ffffff" stroke-width=".010in" />
        <svg:circle r="0.002in" cx="0.057in" cy="0.028in"
          style="fill:#ffffff;stroke:#ffffff" stroke-width=".010in" />
      </svg:svg>
    </fo:instream-foreign-object>
  </xsl:template>

  <xsl:template name="COMMONSVG_CIRCLE_V_BIG">
    <fo:instream-foreign-object>
      <svg:svg width=".141in" height=".141in">
        <svg:circle r="0.068in" cx="0.068in" cy="0.068in" />
        <!-- <svg:path d="M5 5 L5 1.5 Q 5.25,1 5.5,1.5 L5.5 5 L8 3.5 Q 8.75,3.25 
          8.25,3.8 L5.75 5.25 Q 5,5.75 5,5" style="fill:#ffffff;stroke:#ffffff"/> -->
        <svg:path
          d="M4.5 5 L4.5 1.5 Q 4.75,1 5,1.5 L5 5 L7.85 3.5 Q 8.5,3.40 8.15,3.90 L5 5.5 Q 4.5,5.65 4.5,5"
          style="fill:#ffffff;stroke:#ffffff" />
      </svg:svg>
    </fo:instream-foreign-object>
  </xsl:template>

  <xsl:template name="COMMONSVG_DIAMONDSYMBOL_FOR_RATING">
    <!-- Parameter to decide Number of Diamonds to Fill. User Needs to Pass 
      this Parameter -->
    <xsl:param name="COM_noOfDiamond_ToFill" />
    <!-- Check the Parameter value and decide how many diamonds are to be 
      filled -->
    <xsl:choose>
      <xsl:when test=" $COM_noOfDiamond_ToFill = 0 ">
        <!-- Draws the Diamonds with Zero Filled -->
        <fo:instream-foreign-object>
          <svg:svg height="0.097in" width="0.468in">
            <svg:path d="M 1 3 L 3 0 L5 3 L 3 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="none" shape-rendering="crispEdges" />
            <svg:path d="M 7 3 L 9 0 L 11 3 L 9 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="none" shape-rendering="crispEdges" />
            <svg:path d="M 13 3 L 15 0 L 17 3 L 15 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="none" shape-rendering="crispEdges" />
            <svg:path d="M 19 3 L 21 0 L 23 3 L 21 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="none" shape-rendering="crispEdges" />
            <svg:path d="M 25 3 L 27 0 L 29 3 L 27 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="none" shape-rendering="crispEdges" />
          </svg:svg>
        </fo:instream-foreign-object>
      </xsl:when>
      <xsl:when test=" $COM_noOfDiamond_ToFill = 1 ">
        <!-- Draws the Diamonds with one Filled -->
        <fo:instream-foreign-object>
          <svg:svg height="0.097in" width="0.468in">
            <svg:path d="M 1 3 L 3 0 L5 3 L 3 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="black" shape-rendering="crispEdges" />
            <svg:path d="M 7 3 L 9 0 L 11 3 L 9 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="none" shape-rendering="crispEdges" />
            <svg:path d="M 13 3 L 15 0 L 17 3 L 15 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="none" shape-rendering="crispEdges" />
            <svg:path d="M 19 3 L 21 0 L 23 3 L 21 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="none" shape-rendering="crispEdges" />
            <svg:path d="M 25 3 L 27 0 L 29 3 L 27 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="none" shape-rendering="crispEdges" />
          </svg:svg>
        </fo:instream-foreign-object>
      </xsl:when>
      <xsl:when test=" $COM_noOfDiamond_ToFill = 2 ">
        <!-- Draws the Diamonds with two Filled -->
        <fo:instream-foreign-object>
          <svg:svg height="0.097in" width="0.468in">
            <svg:path d="M 1 3 L 3 0 L5 3 L 3 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="#000000" shape-rendering="crispEdges" />
            <svg:path d="M 7 3 L 9 0 L 11 3 L 9 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="#000000" shape-rendering="crispEdges" />
            <svg:path d="M 13 3 L 15 0 L 17 3 L 15 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="none" shape-rendering="crispEdges" />
            <svg:path d="M 19 3 L 21 0 L 23 3 L 21 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="none" shape-rendering="crispEdges" />
            <svg:path d="M 25 3 L 27 0 L 29 3 L 27 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="none" shape-rendering="crispEdges" />
          </svg:svg>
        </fo:instream-foreign-object>
      </xsl:when>
      <xsl:when test=" $COM_noOfDiamond_ToFill = 3 ">
        <!-- Draws the Diamonds with three Filled -->
        <fo:instream-foreign-object>
          <svg:svg height="0.097in" width="0.468in">
            <svg:path d="M 1 3 L 3 0 L5 3 L 3 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="#000000" shape-rendering="crispEdges" />
            <svg:path d="M 7 3 L 9 0 L 11 3 L 9 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="#000000" shape-rendering="crispEdges" />
            <svg:path d="M 13 3 L 15 0 L 17 3 L 15 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="#000000" shape-rendering="crispEdges" />
            <svg:path d="M 19 3 L 21 0 L 23 3 L 21 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="none" shape-rendering="crispEdges" />
            <svg:path d="M 25 3 L 27 0 L 29 3 L 27 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="none" shape-rendering="crispEdges" />
          </svg:svg>
        </fo:instream-foreign-object>
      </xsl:when>
      <xsl:when test=" $COM_noOfDiamond_ToFill = 4 ">
        <!-- Draws the Diamonds with four Filled -->
        <fo:instream-foreign-object>
          <svg:svg height="0.097in" width="0.468in">
            <svg:path d="M 1 3 L 3 0 L5 3 L 3 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="#000000" shape-rendering="crispEdges" />
            <svg:path d="M 7 3 L 9 0 L 11 3 L 9 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="#000000" shape-rendering="crispEdges" />
            <svg:path d="M 13 3 L 15 0 L 17 3 L 15 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="#000000" shape-rendering="crispEdges" />
            <svg:path d="M 19 3 L 21 0 L 23 3 L 21 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="#000000" shape-rendering="crispEdges" />
            <svg:path d="M 25 3 L 27 0 L 29 3 L 27 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="none" shape-rendering="crispEdges" />
          </svg:svg>
        </fo:instream-foreign-object>
      </xsl:when>
      <xsl:when test=" $COM_noOfDiamond_ToFill = 5 ">
        <!-- Draws the Diamonds with five Filled -->
        <fo:instream-foreign-object>
          <svg:svg height="0.097in" width="0.468in">
            <svg:path d="M 1 3 L 3 0 L5 3 L 3 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="#000000" shape-rendering="crispEdges" />
            <svg:path d="M 7 3 L 9 0 L 11 3 L 9 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="#000000" shape-rendering="crispEdges" />
            <svg:path d="M 13 3 L 15 0 L 17 3 L 15 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="#000000" shape-rendering="crispEdges" />
            <svg:path d="M 19 3 L 21 0 L 23 3 L 21 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="#000000" shape-rendering="crispEdges" />
            <svg:path d="M 25 3 L 27 0 L 29 3 L 27 6 Z" stroke="#000000"
              stroke-width="0.25pt" fill="#000000" shape-rendering="crispEdges" />
          </svg:svg>
        </fo:instream-foreign-object>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>-</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="COMMONSVG_DIAMOND_FOR_SYMBOLTICKER">
    <fo:instream-foreign-object>
      <svg:svg height="0.08in" width="0.1in" viewBox="0 0 3.5 3.5">
        <svg:path d="M 1 1 L 2 2 L1 3 L 0 2 Z" style="stroke:#000000;fill:#000000"
          stroke-width="0.25pt" shape-rendering="crispEdges" />
      </svg:svg>
    </fo:instream-foreign-object>
  </xsl:template>
</xsl:stylesheet>