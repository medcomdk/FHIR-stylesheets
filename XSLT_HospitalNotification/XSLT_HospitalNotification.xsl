
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fhir="http://hl7.org/fhir"
    version="1.0" exclude-result-prefixes="fhir">
    <xsl:output media-type="text/html"/>  
    
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_Core_profiles/Patient/show_subject_identifier.xsl"/>
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_Core_profiles/Message/format_date.xsl"/>
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_HospitalNotification/show_type_of_hospital_notification.xsl"/>
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_Core_profiles/Sender_Organization/show_sender_sor_id.xsl"/>
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_Core_profiles/Sender_Organization/show_sender_name.xsl"/>
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_Core_profiles/Sender_Organization/Show_sender_addres_field.xsl"/>
    <xsl:include href="/Git_hub/FHIR-stylesheets/XSLT_Core_profiles/Sender_Organization/show_sender_addres.xsl"/>
    
 
    
    <xsl:template match="/">
       <html>
           <head>
               <h1>HospitalNotification Message </h1>
           </head>
         <body>
            <table border ="2"
                padding= "3px 0"
                margin-left="0"
                margin-top="1 px"
                margin-bottom="0px"
                border-bottom= "1px solid #778"
                bordercolor="#2c415c">
                    <xsl:apply-templates/>
            </table>
        </body> 
          
       </html>
    </xsl:template>
    
    <xsl:template match="*" name="ShowMessageInfo">
        <table border ="0"
            padding= "1px 0"
            margin-left="0"
            margin-top="1 px"
            margin-bottom="0px"
            border-bottom= "1px solid #778"
            bordercolor="#2c415c"
            bgcolor="#5093d6">
            <tr>
                <th></th>
            </tr>
            <tr>
                <th>CPR.nr.:</th>
                <td><xsl:call-template name="ShowPatientIDNr"><xsl:with-param name="cpr" select="fhir:entry/fhir:resource/fhir:Patient/fhir:identifier/fhir:value/@value"></xsl:with-param></xsl:call-template> </td>
            </tr>
            <tr>
                <th>Status for sygehusophold:</th> 
                <td><xsl:call-template name="ShowTypeOfHN"/> </td>
            </tr>
            <tr>
                <th>Dato og tidspunkt for sygehusophold:</th> 
                <td><xsl:call-template name="FormatDate"><xsl:with-param name="DateTime" select="fhir:entry/fhir:resource/fhir:Encounter/fhir:period/fhir:start/@value"></xsl:with-param></xsl:call-template></td>
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
                <th><xsl:call-template name="ShowSenderAddressField"/> </th>  
                <td><xsl:call-template name="ShowSenderAddress"/> </td>
            </tr>
        </table>
    </xsl:template>
 

    


</xsl:stylesheet>