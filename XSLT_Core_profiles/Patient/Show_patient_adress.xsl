<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fhir="http://hl7.org/fhir"
    version="1.0" exclude-result-prefixes="fhir">
    <xsl:output media-type="text/html"/>
    
    <xsl:template name="ShowPatientAdress">
        <xsl:variable name="street" select="fhir:entry/fhir:resource/fhir:Patient/fhir:address/fhir:line/@value"/>
        <xsl:variable name="city" select="fhir:entry/fhir:resource/fhir:Patient/fhir:address/fhir:city/@value"/>
        <xsl:variable name="postalcode" select="fhir:entry/fhir:resource/fhir:Patient/fhir:address/fhir:postalCode/@value"/>
        <xsl:value-of select="$street"/>
        <xsl:value-of select="$city"/>
        <xsl:value-of select="$postalcode"/>
    </xsl:template>
    
    
</xsl:stylesheet>