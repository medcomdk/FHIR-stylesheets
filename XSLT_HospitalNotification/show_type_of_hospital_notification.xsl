<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fhir="http://hl7.org/fhir"
    version="1.0" exclude-result-prefixes="fhir">
    <xsl:output media-type="text/html"/>  
    
    <!-- Template for showing type of the HospitalNotification Message -->
    <xsl:template name="ShowTypeOfHN">
        <xsl:param name="MessageType">
            <xsl:value-of select="fhir:entry/fhir:resource/fhir:Provenance/fhir:activity/fhir:coding/fhir:code/@value"/>
        </xsl:param>
        <xsl:choose>
            <xsl:when test="$MessageType='new-message'">Ny meddelelse er blevet sendt</xsl:when>
            <xsl:when test="$MessageType='forward-message'"> En meddelelse er blevet viddersendt</xsl:when>
            <xsl:when test="$MessageType='reply-message'">En meddelelse er blevet besvaret</xsl:when>
            <xsl:when test="$MessageType='retract-message'">En meddelelse er blevet trukket tilbage/annulleret</xsl:when>
            <xsl:when test="$MessageType='modified-message'">En meddelelse er blevet ændret</xsl:when>
            <xsl:when test="$MessageType='carboncopy-message'">En nøjagtig kopi af en meddelelse er blevet sendt til en kopimodtager </xsl:when>
            <xsl:when test="$MessageType='admit-emergency'">Start sygehusophold - akut ambulant</xsl:when>
            <xsl:when test="$MessageType='revise-admit-emergency'">Rettelse Start sygehusophold - akut ambulant</xsl:when>
            <xsl:when test="$MessageType='cancel-admit-emergency'">Annullering Start sygehusophold - akut ambulant</xsl:when>
            <xsl:when test="$MessageType='admit-inpatient'">Start sygehusophold - indlagt</xsl:when>
            <xsl:when test="$MessageType='revise-admit-inpatient'">Rettelse Start sygehusophold - indlagt</xsl:when>
            <xsl:when test="$MessageType='cancel-admit-inpatient'">Annullering Start sygehusophold - indlagt</xsl:when>
            <xsl:when test="$MessageType='start-leave-inpatient'">Start orlov</xsl:when>
            <xsl:when test="$MessageType='revise-start-leave-inpatient'">Rettelse Start orlov</xsl:when>
            <xsl:when test="$MessageType='cancel-start-leave-inpatient'">Annullering Start orlov</xsl:when>
            <xsl:when test="$MessageType='end-leave-inpatient'">Slut orlov</xsl:when>
            <xsl:when test="$MessageType='revise-end-leave-inpatient'">Rettelse Slut orlov</xsl:when>
            <xsl:when test="$MessageType='cancel-end-leave-inpatient'">Annullering Slut orlov</xsl:when>
            <xsl:when test="$MessageType='discharge-emergency-home'">Slut sygehusophold - afsluttet til hjemmet/primær sektor</xsl:when>
            <xsl:when test="$MessageType='discharge-inpatient-home'">Slut sygehusophold - afsluttet til hjemmet/primær sektor</xsl:when>
            <xsl:when test="$MessageType='revise-discharge-emergency-home'">Rettelse Slut sygehusophold - afsluttet til hjemmet/primær sektor</xsl:when>
            <xsl:when test="$MessageType='cancel-discharge-emergency-home'">Annullering Slut sygehusophold - afsluttet til hjemmet/primær sektor</xsl:when>
            <xsl:when test="$MessageType='cancel-discharge-inpatient-home'"> Annullering Slut sygehusophold - afsluttet til hjemmet/primær sektor</xsl:when>
            <xsl:when test="$MessageType='acknowledgement'">Kvittering er blevet afsendt</xsl:when>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>