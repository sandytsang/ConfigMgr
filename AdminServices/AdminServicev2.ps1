try {
    Write-Verbose -Message "Attempting to locate PSIntuneAuth module on local system"
    $PSIntuneAuthModule = Get-Module -Name "PSIntuneAuth" -ListAvailable -ErrorAction Stop -Verbose:$false
    if ($PSIntuneAuthModule -ne $null) {
        Write-Verbose -Message "PSIntuneAuth module detected, checking for latest version"
        $LatestModuleVersion = (Find-Module -Name PSIntuneAuth -ErrorAction Stop -Verbose:$false).Version
        if ($LatestModuleVersion -gt $PSIntuneAuthModule.Version) {
            Write-Verbose -Message "Latest version of PSIntuneAuth module is not installed, attempting to install: $($LatestModuleVersion.ToString())"
            $UpdateModuleInvocation = Update-Module -Name PSIntuneAuth -Scope AllUsers -Force -ErrorAction Stop -Confirm:$false -Verbose:$false
        }
    }
}
catch [System.Exception] {
    Write-Warning -Message "Unable to detect PSIntuneAuth module, attempting to install from online repository"
    try {
        # Install NuGet package provider
        $PackageProvider = Install-PackageProvider -Name NuGet -Force -Verbose:$false

        # Install PSIntuneAuth module
        Install-Module -Name PSIntuneAuth -Scope AllUsers -Force -ErrorAction Stop -Confirm:$false -Verbose:$false
        Write-Verbose -Message "Successfully installed PSIntuneAuth"
    }
    catch [System.Exception] {
        Write-Warning -Message "An error occurred while attempting to install PSIntuneAuth module. Error message: $($_.Exception.Message)"; break
    }
}

<#
#Ignore self-signed certificate checks
if (-not ([System.Management.Automation.PSTypeName]'ServerCertificateValidationCallback').Type)
{
$certCallback = @"
    using System;
    using System.Net;
    using System.Net.Security;
    using System.Security.Cryptography.X509Certificates;
    public class ServerCertificateValidationCallback
    {
        public static void Ignore()
        {
            if(ServicePointManager.ServerCertificateValidationCallback ==null)
            {
                ServicePointManager.ServerCertificateValidationCallback += 
                    delegate
                    (
                        Object obj, 
                        X509Certificate certificate, 
                        X509Chain chain, 
                        SslPolicyErrors errors
                    )
                    {
                        return true;
                    };
            }
        }
    }
"@
    Add-Type $certCallback
 }
 [ServerCertificateValidationCallback]::Ignore()

 #>

$Data = $null

$authToken = Get-MSIntuneAuthToken -TenantName "smsboot.onmicrosoft.com" -ClientID "6ed98779-af2a-41a2-be63-a7374c611e8b" -Resource "https://ConfigMgrServiceCB" -PromptBehavior Always

#$authToken.Authorization

$url = "https://configmgrcmg001.smsboot.com/CCM_Proxy_ServerAuth/72057594037927941/AdminService/wmi/SMS_R_User"

$Data = Invoke-RestMethod -Method Get -Uri $url -Headers $authToken
$Data.value 