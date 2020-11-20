<#
.SYNOPSIS
    This script for get ConfigMgr script output results

.DESCRIPTION
    This script will gets ConfigMgr Script reports for Azure AD register device status

.PARAMETER

    The following switches are available:
    -SiteServer
    -SiteCode   
    -ClientOperationID

.NOTES
    File name: Get-CMScriptReport.ps1
    VERSION: 1.0.0
    AUTHOR: Sandy Zeng
    Created:  2020-11-13
    COPYRIGHT:
    Sandy Zeng / https://www.sandyzeng.com
    Licensed under the MIT license.
    Please credit me if you fint this script useful and do some cool things with it.

.EXAMPLE
    -Example
    -Example

.VERSION HISTORY:
    1.0.0 - (2020-07-23) Script created
    1.0.1 - 
#>

Function Get-CMScriptOutputResult {
    Param (
    [Parameter(Mandatory=$true)]
    [string]$SiteServer,

    [Parameter(Mandatory=$true)]
    [string]$SiteCode,

    [Parameter(Mandatory=$true)]
    [string]$ClientOperationID
    )
    
    #Query WMI on the Primary Site Server for script execution results
    $WMIQuery = "Select * from SMS_ScriptsExecutionStatus where ClientOperationID = '$ClientOperationID'"
    $WMIResult = Get-WmiObject -Query $WMIQuery -ComputerName $SiteServer -Namespace "root\SMS\Site_$SiteCode"
    
    $OutputObj = @()
    Foreach ($result in $WMIResult) {
        Try {
            $ScriptOutput = $result.ScriptOutput | ConvertFrom-Json
            $OutputObj += $ScriptOutput
        } 
        Catch {
            Write-Output  "$_.Exception.Message"
            Exit 1
        }
    }
    
    return $OutputObj
    
}
    
$Report = Get-CMScriptOutputResult -SiteServer  "cm02.zit.local" -SiteCode "CBX" -ClientOperationID "16778225"
$Report

#Without using sort object with TenantName, exported CSV is missing lots of informations
$Report | Sort-Object TenantName | Export-Csv C:\temp\AzureADRegistyReport.csv