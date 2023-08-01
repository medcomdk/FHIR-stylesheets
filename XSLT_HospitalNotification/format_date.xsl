<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fhir="http://hl7.org/fhir"
    version="1.0" exclude-result-prefixes="fhir">
    <xsl:output media-type="text/html"/>  
    
    <!-- Template for showing date and time-->
    <xsl:template name="FormatDate">
        <xsl:param name="DateTime"/>
        <xsl:variable name="Date">
            <xsl:value-of select="substring($DateTime,1,10)"/>
        </xsl:variable>
        <xsl:variable name="Time">
            <xsl:value-of select="substring($DateTime,12,8)"/>
        </xsl:variable>
        <xsl:value-of select="'Dato: '"/>
        <xsl:value-of select="$Date"/>
        <xsl:value-of select="' Tidspunkt: '"/>
        <xsl:value-of select="$Time"/>
    </xsl:template>
    
</xsl:stylesheet>