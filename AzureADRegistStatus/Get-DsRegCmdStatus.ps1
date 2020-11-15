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
    1.0.1 - (2020-11-15) Added results to registry, for better inventory reports
#>

$command = (dsregcmd.exe /status) | Select-String (" : ")
Remove-Item -Path "HKLM:\Software\CustomKeys\DSREGCMDSTATUS" -Force -ErrorAction SilentlyContinue | Out-Null
New-Item -Path "HKLM:\Software" -Name "CustomKeys\DSREGCMDSTATUS" -Force | Out-Null
$registryPath = "HKLM:\Software\CustomKeys\DSREGCMDSTATUS"
$datetime = (Get-date -Format "yyyyMMddHHmm").ToString()
New-ItemProperty -Path $registryPath -Name "ScriptRunDateTime" -Value $datetime -PropertyType String -Force | Out-Null

$dsregcmdobj = New-Object -TypeName psobject
foreach ( $line in $command ) {
    $output = $line.ToString().trim() -split " : "
    $Name = $output[0].Replace(" :","")
    $Value = $output[1]
    $dsregcmdobj| Add-Member -MemberType NoteProperty -Name "$($Name)" -Value "$($Value)"
    New-ItemProperty -Path $registryPath -Name "$($Name)" -Value "$($Value)" -PropertyType String -Force | out-null

}

$dsregcmdobj