<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fhir="http://hl7.org/fhir"
    version="1.0" exclude-result-prefixes="fhir">
    <xsl:output media-type="text/html"/>
    
    <xsl:template name ="ShowMessageText">
        <!-- lav en regl der siger at det skal være den nyesete meddelelses segment som bliver vist  -->
        <xsl:variable name="time" select="fhir:timestamp/@value"/>
        
        
        <xsl:for-each select="fhir:entry/fhir:resource/fhir:Communication/fhir:payload">
            <xsl:if test="fhir:extension/fhir:valueDateTime/@value=$time">
                <xsl:value-of select="fhir:contentString/@value"/>
                
            </xsl:if>
        </xsl:for-each>
        
    </xsl:template>
    
</xsl:stylesheet>