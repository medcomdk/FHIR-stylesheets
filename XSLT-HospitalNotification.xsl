
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fhir="http://hl7.org/fhir"
    version="1.0" exclude-result-prefixes="fhir">
    <xsl:output media-type="text/html"/>  
    
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

<xsl:template name="ShowPatientIDNr">
    <xsl:param name="cpr"/>
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
    
 <xsl:template name="getPos">
    <xsl:param name="pos"/>
    <xsl:value-of select="position()"/>
</xsl:template>  

<xsl:template  name="ShowSenderSORID">
    
    <xsl:param name="Id"/>
    <!-- Finding SorId for receiver organization -->
    <xsl:variable name="sorID">
        <xsl:value-of select="substring($Id,30,44)"/>
    </xsl:variable>  

   <!-- Priniting Sor id -->
    <xsl:value-of select="$sorID"/>
    

</xsl:template>
    
<xsl:template name="ShowSenderName">
    <!-- Finding Organisation id for the receiver organization -->
    <xsl:variable name="OrgID" >
        <xsl:value-of select="substring(fhir:entry/fhir:resource/fhir:MessageHeader/fhir:sender/fhir:reference/@value,14,49)"/>
    </xsl:variable>
    
    <!-- Finding name of the organisation -->
   <xsl:choose>
       <xsl:when test="fhir:entry/fhir:resource/fhir:Organization/fhir:name=true()">
           <xsl:for-each select="fhir:entry/fhir:resource/fhir:Organization">
               <xsl:if test="fhir:id/@value=$OrgID">
                   <xsl:value-of select="fhir:name/@value"/>
               </xsl:if>
           </xsl:for-each>
       </xsl:when>
       <xsl:otherwise>
           <xsl:value-of select="'Organisationsnavn er ukendt slå op i SOR'"/>
       </xsl:otherwise>
   </xsl:choose>
</xsl:template>
    
 <xsl:template name="ShowSenderAddressField">
     <xsl:variable name="OrgID" >
         <xsl:value-of select="substring(fhir:entry/fhir:resource/fhir:MessageHeader/fhir:sender/fhir:reference/@value,14,49)"/>
     </xsl:variable>
     
       <xsl:choose>
           <xsl:when test="fhir:entry/fhir:resource/fhir:Organization/fhir:address=true()">
               <xsl:for-each select="fhir:entry/fhir:resource/fhir:Organization">
                   <xsl:if test="fhir:id/@value=$OrgID">
                    <xsl:value-of select="'Afsenders addresse:'"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:when>
    </xsl:choose> 
 </xsl:template>
 
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