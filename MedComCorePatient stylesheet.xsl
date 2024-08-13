<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fhir="http://hl7.org/fhir">
    <xsl:output method="html" indent="yes"/>
    
    <!-- Template for the entire XHTML document -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Patient Information</title>
            </head>
            <body>
                <!-- Heading -->
                <h1>MedComCorePatient</h1>
                
                <!-- ID displayed above Must Support Information -->
                <xsl:apply-templates select="fhir:Patient/fhir:id"/>
                
                <!-- Part One: Must Support content -->
                <h1>Must Support Information</h1>
                <xsl:apply-templates select="fhir:Patient"/>
                
                <!-- Part Two: Available Non-Must Support Information and Narrative Content -->
                <h1>All Available Information</h1>
                <p>This section includes both the must support information and any additional content that may not be part of the standard. It ensures that all data provided in the XML file is displayed, regardless of its inclusion in the must support section.</p>
                <xsl:apply-templates select="fhir:Patient" mode="showAll"/>
            </body>
        </html>
    </xsl:template>
    
    <!-- Template for ID -->
    <xsl:template match="fhir:id">
        <p><strong>id: </strong> <xsl:value-of select="@value"/></p>
    </xsl:template>
    
    <!-- Template for Must Support content -->
    <xsl:template match="fhir:Patient">
        <h2>Identifier</h2>
        <xsl:for-each select="fhir:identifier">
            <p>
                <strong>System: </strong> <xsl:value-of select="fhir:system/@value"/><br/>
                <strong>Value: </strong> <xsl:value-of select="fhir:value/@value"/>
            </p>
        </xsl:for-each>
        
        <h2>Name</h2>
        <xsl:for-each select="fhir:name">
            <p>
                <strong>Use: </strong> <xsl:value-of select="fhir:use/@value"/><br/>
                <strong>Family: </strong> <xsl:value-of select="fhir:family/@value"/><br/>
                <strong>Given: </strong>
                <xsl:for-each select="fhir:given">
                    <xsl:value-of select="@value"/> <xsl:text> </xsl:text>
                </xsl:for-each>
            </p>
        </xsl:for-each>
        
        <h2>Telecom</h2>
        <xsl:for-each select="fhir:telecom">
            <p>
                <strong>System: </strong>
                <xsl:value-of select="fhir:system/@value"/><br/>
                <strong>Value: </strong> <xsl:value-of select="fhir:value/@value"/><br/>
                <strong>Use: </strong> <xsl:value-of select="fhir:use/@value"/>
            </p>
        </xsl:for-each>
        
        <h2>DeceasedBoolean</h2>
        <p>
            <strong>Deceased: </strong> 
            <xsl:value-of select="fhir:deceasedBoolean/@value"/>
        </p>
        
        <h2>Address</h2>
        <xsl:for-each select="fhir:address">
            <p>
                <strong>Use: </strong> <xsl:value-of select="fhir:use/@value"/><br/>
                <strong>Line: </strong>
                <xsl:for-each select="fhir:line">
                    <xsl:value-of select="@value"/><br/>
                </xsl:for-each>
                <strong>City: </strong> <xsl:value-of select="fhir:city/@value"/><br/>
                <strong>Postal Code: </strong> <xsl:value-of select="fhir:postalCode/@value"/>
            </p>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Template to display all content in part two -->
    <xsl:template match="fhir:Patient/*" mode="showAll">
        <h2><xsl:value-of select="name()"/></h2>
        <xsl:apply-templates select="@* | *"/>
    </xsl:template>
    
    <!-- Template to display attributes and child elements -->
    <xsl:template match="*">
        <div style="margin-left:20px;">
            <!-- Handling of elements and value attributes -->
            <xsl:choose>
                <xsl:when test="@value">
                    <strong><xsl:value-of select="name()"/>: </strong> <xsl:value-of select="@value"/>
                </xsl:when>
                <xsl:otherwise>
                    <strong><xsl:value-of select="name()"/>: </strong>
                    <xsl:apply-templates select="@*"/>
                </xsl:otherwise>
            </xsl:choose>
            
            <!-- Display text content -->
            <xsl:if test="normalize-space(.)">
                <div style="margin-left:20px;">
                    <xsl:value-of select="normalize-space(.)"/>
                </div>
            </xsl:if>
            
            <!-- Recursively apply templates to child elements -->
            <xsl:apply-templates select="*"/>
        </div>
    </xsl:template>
    
    <!-- Template to display attributes other than value -->
    <xsl:template match="@*">
        <div style="margin-left:20px;">
            <strong><xsl:value-of select="name()"/>: </strong> <xsl:value-of select="."/>
        </div>
    </xsl:template>
    
</xsl:stylesheet>
