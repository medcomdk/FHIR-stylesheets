<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fhir="http://hl7.org/fhir"
    version="1.0" exclude-result-prefixes="fhir">
    <xsl:output media-type="text/html"/>  
    
    <xsl:template name="ShowPatientIDNr">
        <xsl:param name="cpr" select="fhir:entry/fhir:resource/fhir:Patient/fhir:identifier/fhir:value/@value"/>
        <xsl:variable name="Bday">
            <xsl:value-of select="substring($cpr,1,6)"></xsl:value-of>
        </xsl:variable>
        <xsl:variable name="CodeNr">
            <xsl:value-of select="substring($cpr,7,10)"></xsl:value-of>
        </xsl:variable>
        <xsl:value-of select="$Bday"/>
        <xsl:value-of select="'-'"/>
        <xsl:value-of select="$CodeNr"/>
    </xsl:template>
    
</xsl:stylesheet>