$scope = "https://ConfigMgrServiceCB/user_impersonation" #Change this to your own Azur cloud service app Scope
$TenantName = "smsboot.onmicrosoft.com" #change this to your own tenat name
$authority = "https://login.microsoftonline.com/$($TenantName)/oauth2/v2.0/token" 
$clientId = "402daf63-7115-4a87-883e-2ad83c000000" #Change this to your cloud service native app ID
$Username = "username@mycompany.com" #Change this to your username
$Password = "MyPassword" #Change this to your password


$authHeader = @{
	'Content-Type'  = 'application/x-www-form-urlencoded'
}

$authBody = @{
    'client_id'=$clientId        
    'grant_type'="password"
    'username'= $Username
    'password'= $Password
    'scope'= $scope 
}

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

#Auth to API to get Token
$auth = Invoke-RestMethod -Headers $authHeader -Uri $authority -Body $authBody -Method POST -Verbose 

$authHeader = @{
	'Content-Type'  = 'application/json'
	'Authorization' = "Bearer " + $auth.access_token
}

$url = "HTTPS://YOURCMG001.SMSBOOT.COM/CCM_Proxy_ServerAuth/72057594037927941/AdminService/wmi/SMS_Package?`$filter=Name eq 'BIOS Update - Lenovo ThinkPad P1'"

$Result = Invoke-RestMethod -Method Get -Uri $url -Headers $authHeader
$PackageList = $Result.value
$PackageList