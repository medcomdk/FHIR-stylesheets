<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fhir="http://hl7.org/fhir">
    <xsl:output method="html" indent="yes"/>
    
    <!-- Template to match the root element -->
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>MedComCorePractitioner Overview</title>
            </head>
            <body>
                <h1>MedComCorePractitioner</h1>
                
                <!-- Display Practitioner ID -->
                <div>
                    <strong>id: </strong>
                    <xsl:value-of select="fhir:Practitioner/fhir:id/@value"/>
                </div>
                
                <!-- Part 1: Must Support Information -->
                <h2 style="font-size:1.5em;">Must Support Information</h2>
                <!-- Display name details -->
                <div>
                    <strong style="font-size:1.2em;">Name</strong>
                    <div><strong>Use: </strong> <xsl:value-of select="fhir:Practitioner/fhir:name/fhir:use/@value"/></div>
                    <div><strong>Family: </strong> <xsl:value-of select="fhir:Practitioner/fhir:name/fhir:family/@value"/></div>
                    <div><strong>Given: </strong> 
                        <xsl:for-each select="fhir:Practitioner/fhir:name/fhir:given">
                            <xsl:value-of select="@value"/>
                            <xsl:if test="position() != last()">, </xsl:if>
                        </xsl:for-each>
                    </div>
                    <div><strong>Prefix: </strong> <xsl:value-of select="fhir:Practitioner/fhir:name/fhir:prefix/@value"/></div>
                    <div><strong>Suffix: </strong> <xsl:value-of select="fhir:Practitioner/fhir:name/fhir:suffix/@value"/></div>
                    <div><strong>Period Start: </strong> <xsl:value-of select="fhir:Practitioner/fhir:name/fhir:period/fhir:start/@value"/></div>
                    <div><strong>Period End: </strong> <xsl:value-of select="fhir:Practitioner/fhir:name/fhir:period/fhir:end/@value"/></div>
                </div>
                
                <!-- Part 2: Display all other data -->
                <h2 style="font-size:1.5em;">All Available Information</h2>
                <p>This section includes both the must support information and any additional content that may not be part of the standard. It ensures that all data provided in the XML file is displayed, regardless of its inclusion in the must support section.</p>
                <xsl:apply-templates select="fhir:Practitioner/*"/>
            </body>
        </html>
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
