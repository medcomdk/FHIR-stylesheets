<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fhir="http://hl7.org/fhir"
    version="1.0" exclude-result-prefixes="fhir">
    <xsl:output media-type="text/html"/>
    
    <xsl:template name="ShowAuthorName">
        <xsl:variable name="AuthotFamilyname" select="fhir:entry/fhir:resource/fhir:Practitioner/fhir:name/fhir:family/@value"/>
        <xsl:variable name="AuthotGivenname" select="fhir:entry/fhir:resource/fhir:Practitioner/fhir:name/fhir:given/@value"/>
        
        <xsl:value-of select="$AuthotFamilyname"/>
        <xsl:value-of select="' '"/>
        <xsl:value-of select="$AuthotGivenname"/>
        
    </xsl:template>
</xsl:stylesheet>