<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fhir="http://hl7.org/fhir">
    <xsl:output method="html" indent="yes"/>
    
    <!-- Template for hele XHTML-dokumentet -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Patient Information</title>
            </head>
            <body>
                <!-- Overskrift -->
                <h1>MedComCorePatient</h1>
                
                <!-- ID vises ovenover Must Support Information -->
                <xsl:apply-templates select="fhir:Patient/fhir:id"/>
                
                <!-- Første del: Must Support indhold -->
                <h1>Must Support Information</h1>
                <xsl:apply-templates select="fhir:Patient"/>
                
                <!-- Anden del: Øvrigt indhold -->
                <h1>Other Information</h1>
                <xsl:apply-templates select="fhir:Patient" mode="other"/>
            </body>
        </html>
    </xsl:template>
    
    <!-- Template til ID -->
    <xsl:template match="fhir:id">
        <p><strong>ID:</strong> <xsl:value-of select="@value"/></p>
    </xsl:template>
    
    <!-- Template til Must Support indhold -->
    <xsl:template match="fhir:Patient">
        <!-- Identifiers, Names, Telecom, etc. as in the previous section -->
        <h2>Identifiers</h2>
        <xsl:for-each select="fhir:identifier">
            <p>
                <strong>System:</strong> <xsl:value-of select="fhir:system/@value"/><br/>
                <strong>Value:</strong> <xsl:value-of select="fhir:value/@value"/>
            </p>
        </xsl:for-each>
        
        <h2>Name</h2>
        <xsl:for-each select="fhir:name">
            <p>
                <strong>Use:</strong> <xsl:value-of select="fhir:use/@value"/><br/>
                <strong>Family Name:</strong> <xsl:value-of select="fhir:family/@value"/><br/>
                <strong>Given Names:</strong> 
                <xsl:for-each select="fhir:given">
                    <xsl:value-of select="@value"/> <xsl:text> </xsl:text>
                </xsl:for-each>
            </p>
        </xsl:for-each>
        
        <h2>Contact Information</h2>
        <xsl:for-each select="fhir:telecom">
            <p>
                <strong>System:</strong>
                <xsl:choose>
                    <xsl:when test="fhir:system/@value='phone'">Phone</xsl:when>
                    <xsl:when test="fhir:system/@value='fax'">Fax</xsl:when>
                    <xsl:when test="fhir:system/@value='email'">Email</xsl:when>
                    <xsl:when test="fhir:system/@value='pager'">Pager</xsl:when>
                    <xsl:when test="fhir:system/@value='url'">URL</xsl:when>
                    <xsl:when test="fhir:system/@value='sms'">SMS</xsl:when>
                    <xsl:when test="fhir:system/@value='other'">Other</xsl:when>
                </xsl:choose>: 
                <xsl:value-of select="fhir:value/@value"/><br/>
                <strong>Use:</strong> <xsl:value-of select="fhir:use/@value"/>
            </p>
        </xsl:for-each>
        
        <h2>Demographics</h2>
        <p><strong>Deceased:</strong> 
            <xsl:value-of select="fhir:deceasedBoolean/@value"/>
        </p>
        
        <h2>Address</h2>
        <xsl:for-each select="fhir:address">
            <p>
                <strong>Use:</strong> <xsl:value-of select="fhir:use/@value"/><br/>
                <strong>Address:</strong> 
                <xsl:for-each select="fhir:line">
                    <xsl:value-of select="@value"/><xsl:text>, </xsl:text>
                </xsl:for-each>
                <xsl:value-of select="fhir:city/@value"/><xsl:text>, </xsl:text>
                <xsl:value-of select="fhir:postalCode/@value"/><xsl:text>, </xsl:text>
                <xsl:value-of select="fhir:country/@value"/>
            </p>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Template til at fange andet indhold -->
    <xsl:template match="fhir:Patient/*" mode="other">
        <xsl:if test="not(self::fhir:id or self::fhir:identifier or self::fhir:name or self::fhir:telecom or self::fhir:deceasedBoolean or self::fhir:address)">
            <xsl:if test=". != '' or @* != ''">
                <h2><xsl:value-of select="name()"/></h2>
                <p>
                    <xsl:apply-templates select="@* | *"/>
                </p>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
    <!-- Template til at vise attributter og børneelementer -->
    <xsl:template match="@* | *">
        <xsl:if test="normalize-space(.) != ''">
            <strong><xsl:value-of select="name()"/>:</strong> <xsl:value-of select="normalize-space(.)"/><br/>
        </xsl:if>
        <xsl:apply-templates select="@* | *"/>
    </xsl:template>
    
</xsl:stylesheet>
