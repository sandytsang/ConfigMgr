<#
.SYNOPSIS
    This scripts gets Azure AD registration status

.DESCRIPTION
    This script will output Azure AD registration status, can be deploy from ConfigMgr


.NOTES
    File name: Get-DsRegCmdStatus.ps1
    VERSION: 1.0.0
    AUTHOR: Sandy Zeng
    Created:  2020-11-13
    COPYRIGHT:
    Sandy Zeng / https://www.sandyzeng.com
    Licensed under the MIT license.
    Please credit me if you fint this script useful and do some cool things with it.

.VERSION HISTORY
    1.0.0 - (2020-11-13) Script created 
#>

$command = (dsregcmd.exe /status) | Select-String (" : ")

$dsregcmdobj = New-Object -TypeName psobject
foreach ( $line in $command ) {
    $output = $line.ToString().trim() -split " : "
    $dsregcmdobj| Add-Member -MemberType NoteProperty -Name $output[0].Replace(" :","") -Value $output[1]

}
$dsregcmdobj