<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fhir="http://hl7.org/fhir"
    version="1.0" exclude-result-prefixes="fhir">
    <xsl:output media-type="text/html"/>
    <xsl:template name="ShowSenderAddress">
        <xsl:variable name="OrgID" >
            <xsl:value-of select="substring(fhir:entry/fhir:resource/fhir:MessageHeader/fhir:sender/fhir:reference/@value,14,49)"/>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="fhir:entry/fhir:resource/fhir:Organization/fhir:address=true()">
                <xsl:for-each select="fhir:entry/fhir:resource/fhir:Organization">
                    <xsl:if test="fhir:id/@value=$OrgID">
                        <xsl:value-of select="fhir:address/@value"/>
                    </xsl:if>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose> 
    </xsl:template>
</xsl:stylesheet>