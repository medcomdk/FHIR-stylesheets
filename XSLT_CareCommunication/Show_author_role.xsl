<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fhir="http://hl7.org/fhir"
    version="1.0" exclude-result-prefixes="fhir">
    <xsl:output media-type="text/html"/>
    
    <xsl:template name="ShowAuthorRole">
        <xsl:variable name="Role" select="fhir:entry/fhir:resource/fhir:PractitionerRole/fhir:code/fhir:coding/fhir:code/@value"/>
        <xsl:value-of select="$Role"/>
    </xsl:template>   
    
</xsl:stylesheet>