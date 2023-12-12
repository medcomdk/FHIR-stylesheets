<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fhir="http://hl7.org/fhir"
    version="1.0" exclude-result-prefixes="fhir">
    <xsl:output media-type="text/html"/>
    
    <xsl:template name ="ShowCathegory">
        <xsl:variable name="category" select="fhir:entry/fhir:resource/fhir:Communication/fhir:category/fhir:coding/fhir:code/@value"/>
        <xsl:choose>
            <xsl:when test="$category='alcohol-and-drug-treatment'">Rusmiddelbehandling</xsl:when>
            <xsl:when test="$category='assistive-devices'">Hjælpemidler</xsl:when>
            <xsl:when test="$category='carecoordination'">Forløbskoordinering</xsl:when>
            <xsl:when test="$category='decease'">Dødsfald</xsl:when>
            <xsl:when test="$category='discharge'">Udskrivelse</xsl:when>
            <xsl:when test="$category='examination-results'">Undersøgelsessvar</xsl:when>
            <xsl:when test="$category='healthcare'">Sundhedspleje</xsl:when>
            <xsl:when test="$category='home-care-assessment'">Visitation</xsl:when>
            <xsl:when test="$category='medicine'">Medicin</xsl:when>
            <xsl:when test="$category='nursing'">Sygepleje</xsl:when>
            <xsl:when test="$category='outpatient'">Ambulant</xsl:when>
            <xsl:when test="$category='psychiatry-social-disability'">Psykiatri,social, handicap</xsl:when>
            <xsl:when test="$category='regarding-referreal'">Vedr. henvisning</xsl:when>
            <xsl:when test="$category='telemedicine'">Telemedicin</xsl:when>
            <xsl:when test="$category='traning'">Træning</xsl:when>
            <xsl:when test="$category='other'">Andets</xsl:when>
        </xsl:choose>
    </xsl:template>
    
    
  
</xsl:stylesheet>