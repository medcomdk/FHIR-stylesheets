<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fhir="http://hl7.org/fhir"
    version="1.0" exclude-result-prefixes="fhir">
    <xsl:output media-type="text/html"/>
    
    
    <xsl:template name="ShowContactPhone">
        
        <xsl:variable name="Contactphone" select="fhir:entry/fhir:resource/fhir:Communication/fhir:payload/fhir:extension/fhir:valueContactPoint/fhir:value/@value"/>
        <xsl:value-of select="' '"/>
        <xsl:value-of select="'Telefon nr.: '"/>
        <xsl:value-of select="$Contactphone"/>
        
    </xsl:template>
</xsl:stylesheet>