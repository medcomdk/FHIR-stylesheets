<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fhir="http://hl7.org/fhir"
    version="1.0" exclude-result-prefixes="fhir">
    <xsl:output media-type="text/html"/>  
    
    <xsl:template  name="ShowSenderSORID">
        
        <xsl:param name="Id"/>
        <!-- Finding SorId for receiver organization -->
        <xsl:variable name="sorID">
            <xsl:value-of select="substring($Id,30,44)"/>
        </xsl:variable>  
        
        <!-- Priniting Sor id -->
        <xsl:value-of select="$sorID"/>
  
        
    </xsl:template>
</xsl:stylesheet>