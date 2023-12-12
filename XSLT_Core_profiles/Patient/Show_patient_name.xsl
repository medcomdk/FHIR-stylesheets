<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fhir="http://hl7.org/fhir"
    version="1.0" exclude-result-prefixes="fhir">
    <xsl:output media-type="text/html"/>
    <xsl:template name="ShowPatientName">
        <xsl:variable name="FamillyName" select="fhir:entry/fhir:resource/fhir:Patient/fhir:name/fhir:family/@value"/>
        <xsl:variable name="GivenName" select="fhir:entry/fhir:resource/fhir:Patient/fhir:name/fhir:given/@value"/> 
        <xsl:value-of select="$FamillyName"/>
        <xsl:value-of select="$GivenName"/>
        
    </xsl:template>
</xsl:stylesheet>