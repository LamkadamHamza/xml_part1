<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  
    <xsl:template match="/">
        <html>
            <head>
                <title>Releve</title>
            </head>
            <body>
                <h3>relevé bancaire</h3>
                <xsl:for-each select="/releve">
                    
                    <ul>
                        <li> RIB : <xsl:value-of select="@RIB"></xsl:value-of></li>
                        <li>date  releve  : <xsl:value-of select="dateReleve"></xsl:value-of></li>
                        <li>Votre solde  : <xsl:value-of select="solde"></xsl:value-of></li>
                        <li>date debut  : <xsl:value-of select="operations/@dateFin"></xsl:value-of></li>
                        <li>date fin  : <xsl:value-of select="operations/@dateFin"></xsl:value-of></li>
                    </ul>
                    
                   
                </xsl:for-each>
                <h3>List des operation</h3>
                
                <table border="1" width="75%">
                    <tr>
                        <th>Type </th><th>Date </th> <th>Montant </th> <th>description </th>
                    </tr>
                    <xsl:for-each select="releve/operations/operation">
                        <tr>
                            <td><xsl:value-of select="@type"></xsl:value-of></td>
                            <td><xsl:value-of select="@date"></xsl:value-of></td>
                            <td><xsl:value-of select="@montant"></xsl:value-of></td>
                            <td><xsl:value-of select="@desciption"></xsl:value-of></td>
                        </tr>
                    </xsl:for-each>
                    
                </table>
                <h3>Total :</h3>
                <xsl:for-each select="releve/operations">
                    <ul>
                        <li> Total de debut : <xsl:value-of select="sum(operation[@type='DEBIT']/@montant)"></xsl:value-of></li>
                      
                        <li> Total de credit : <xsl:value-of select="sum(operation[@type='CREDIT']/@montant)"></xsl:value-of></li>
                    </ul>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>