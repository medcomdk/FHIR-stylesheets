<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fhir="http://hl7.org/fhir"
    version="1.0" exclude-result-prefixes="fhir">
    <xsl:output media-type="text/html"/>  

    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_Core_profiles/Patient/show_subject_identifier.xsl"/>
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_Core_profiles/Message/format_date.xsl"/>
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_Core_profiles/Sender_Organization/show_sender_sor_id.xsl"/>
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_Core_profiles/Sender_Organization/show_sender_name.xsl"/>
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_Core_profiles/Sender_Organization/Show_sender_addres_field.xsl"/>
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_Core_profiles/Sender_Organization/show_sender_addres.xsl"/>
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_Core_profiles/Patient/Show_patient_name.xsl"/>
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_Core_profiles/Patient/Show_patient_adress.xsl"/>
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_Core_profiles/Patient/Show_patient_phone.xsl"/>
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_CareCommunication/Show_Author_Name.xsl"/>
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_CareCommunication/Show_ContactPhone.xsl"/>
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_CareCommunication/Show_author_role.xsl"/>
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_CareCommunication/Show_category.xsl"/>
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_CareCommunication/Show_message_segement.xsl"/>
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_CareCommunication/Show_topic.xsl"/>

<xsl:template match="/">
    <html>
        <head>
            <h1>Korrespondance Meddelelse</h1>
        </head>
        <body>
            <table border ="0"
                padding= "1px 0"
                margin-left="0"
                margin-top="1 px"
                margin-bottom="0px"                             
                bgcolor ="#5093d6">
                <xsl:apply-templates/>
                </table>
            <footer>
                <p> OBS! Dette er et simpel eksempel på en Korrespondance meddelelse.</p>
            </footer>
        </body> 
        
    </html>
</xsl:template>
    
    <xsl:template match="*" name="ShowMessageInfo">
        <table border="0" bordercolor="#5093d6" cellspacing="2" width="100%" bgcolor="#ffffff">
            <tr>
                <th rowspan="3">Borger:</th>
                <td><xsl:call-template name="ShowPatientIDNr"></xsl:call-template> </td>
              </tr>
            <tr>
                <td><xsl:call-template name="ShowPatientName"></xsl:call-template></td>

            </tr>
            <tr>
                <td><xsl:call-template name="ShowPatientAdress"/></td>
               
            </tr>
            <tr>
                <td><xsl:call-template name="ShowPatientPhone"/></td>    
            </tr>
            <tr>
                <th>Dato og tidspunkt for afsendelse:</th> 
                <td><xsl:call-template name="FormatDate"><xsl:with-param name="DateTime" select="fhir:timestamp/@value"></xsl:with-param></xsl:call-template></td>
                <!--<td><xsl:value-of select=""/></td>-->
            </tr>
            <tr>
                <th> Afsender Organisation: </th>
                <td><xsl:call-template name="ShowSenderName"/> </td>
                
            </tr>
            <tr>
                <th>Afsenders SOR ID: </th>    
                <td><xsl:call-template name="ShowSenderSORID"><xsl:with-param name="Id" select="fhir:entry/fhir:resource/fhir:MessageHeader/fhir:source/fhir:endpoint/@value"></xsl:with-param></xsl:call-template></td>
            </tr>
            <tr>
                <th>Afsenders addresse:</th>
                <!--<th><xsl:call-template name="ShowSenderAddressField"/> </th>  -->
                <td><xsl:call-template name="ShowSenderAddress"/> </td>
            </tr>
            <tr>
                <th> Emne:</th>
                <td><xsl:call-template name="ShowTopic"></xsl:call-template> </td>
            </tr>
            <tr>
                <th>Kategori</th>
                <td><xsl:call-template name="ShowCathegory"/></td>
            </tr>
         </table>
        <table border ="2"
            padding= "1px 0"
            margin-left="0"
            margin-top="1 px"
            margin-bottom="0px"                             
            bgcolor ="#ffffff">
           <tr>
               <th>Meddelelsestekst: </th>
            </tr>
            <tr> <xsl:call-template name="ShowMessageText"/></tr>
            <table border ="1"
                padding= "1px 0"
                margin-left="0"
                margin-top="1 px"
                margin-bottom="0px"                             
                bgcolor ="#ffffff"
                style="width:100%"> 
            <tr>
                <th colspan="2">Signatur</th>
            </tr>
            <tr> 
                <th>Dato og tidspunk:</th>
                <td> <xsl:call-template name="FormatDate"><xsl:with-param name="DateTime" select="fhir:entry/fhir:resource/fhir:Communication/fhir:payload/fhir:extension/fhir:valueDateTime/@value"/></xsl:call-template></td>
            </tr>
            <tr>
                <th>Forfatters navn:</th>
                <td> <xsl:call-template name="ShowAuthorName"/></td>
            </tr>
            <tr>
                <th>Stillingsbetegnelse :</th>
                <td> <xsl:call-template name="ShowAuthorRole"/></td>
            </tr>
            <tr>
                <th>Relevant telefonnummer.:</th>
                <td> <xsl:call-template name="ShowContactPhone"/></td>
            </tr>    
            </table>
           </table>
        
    </xsl:template>
    
    

    
    
    
    
</xsl:stylesheet>
