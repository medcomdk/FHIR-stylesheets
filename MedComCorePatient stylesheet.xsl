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
                
                <!-- Anden del: Available Non-Must Support Information and Narrative Content -->
                <h1>All Available Information</h1>
                <p>This section includes both the must support information and any additional content that may not be part of the standard. It ensures that all data provided in the XML file is displayed, regardless of its inclusion in the must support section.</p>
                <xsl:apply-templates select="fhir:Patient" mode="showAll"/>
            </body>
        </html>
    </xsl:template>
    
    <!-- Template til ID -->
    <xsl:template match="fhir:id">
        <p><strong>ID:</strong> <xsl:value-of select="@value"/></p>
    </xsl:template>
    
    <!-- Template til Must Support indhold -->
    <xsl:template match="fhir:Patient">
        <h2>Identifier</h2>
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
                <strong>Family:</strong> <xsl:value-of select="fhir:family/@value"/><br/>
                <strong>Given:</strong>
                <xsl:for-each select="fhir:given">
                    <xsl:value-of select="@value"/> <xsl:text> </xsl:text>
                </xsl:for-each>
            </p>
        </xsl:for-each>
        
        <h2>Telecom</h2>
        <xsl:for-each select="fhir:telecom">
            <p>
                <strong>System:</strong>
                <xsl:value-of select="fhir:system/@value"/><br/>
                <strong>Value:</strong> <xsl:value-of select="fhir:value/@value"/><br/>
                <strong>Use:</strong> <xsl:value-of select="fhir:use/@value"/>
            </p>
        </xsl:for-each>
        
        <h2>DeceasedBoolean</h2>
        <p>
            <strong>Deceased:</strong> 
            <xsl:value-of select="fhir:deceasedBoolean/@value"/>
        </p>
        
        <h2>Address</h2>
        <xsl:for-each select="fhir:address">
            <p>
                <strong>Use:</strong> <xsl:value-of select="fhir:use/@value"/><br/>
                <strong>Line:</strong>
                <xsl:for-each select="fhir:line">
                    <xsl:value-of select="@value"/><br/>
                </xsl:for-each>
                <strong>City:</strong> <xsl:value-of select="fhir:city/@value"/><br/>
                <strong>Postal Code:</strong> <xsl:value-of select="fhir:postalCode/@value"/>
            </p>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Template til at vise alt indhold i del 2 -->
    <xsl:template match="fhir:Patient/*" mode="showAll">
        <h2><xsl:value-of select="name()"/></h2>
        <xsl:apply-templates select="@* | *"/>
    </xsl:template>
    
    <!-- Template til at vise attributter og underordnede elementer med indryk -->
    <xsl:template match="*">
        <div style="margin-left:20px;">
            <strong><xsl:value-of select="name()"/>:</strong>
            
            <!-- Vis attributter -->
            <xsl:for-each select="@*">
                <div style="margin-left:20px;">
                    <strong><xsl:value-of select="name()"/>:</strong> 
                    <xsl:value-of select="."/>
                </div>
            </xsl:for-each>
            
            <!-- Vis tekstindhold, hvis tilstede -->
            <xsl:if test="normalize-space(.)">
                <div style="margin-left:20px;">
                    <xsl:value-of select="normalize-space(.)"/>
                </div>
            </xsl:if>
            
            <!-- Rekursivt anvend skabeloner på underordnede elementer -->
            <xsl:apply-templates select="*"/>
        </div>
    </xsl:template>
    
</xsl:stylesheet>
