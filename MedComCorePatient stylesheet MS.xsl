<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fhir="http://hl7.org/fhir">
    <xsl:output method="html" indent="yes"/>
    
    <!-- Match på patientressource -->
    <xsl:template match="fhir:Patient">
        <html>
            <head>
                <title>Patient Information</title>
            </head>
            <body>
                <h1>Patient Information</h1>
                <p><strong>Patient ID:</strong> <xsl:value-of select="fhir:id/@value"/></p>
                
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
                        <strong>Family Name:</strong> <xsl:value-of select="fhir:family/@value"/>
                        <br/>
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
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
