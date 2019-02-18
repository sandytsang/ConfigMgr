$ApplicationName = "7-zip" #Name of the application
$SiteServer = "CM01.ZIT.local" #Your site server name
$SiteCode ="T01" #Your site code

#Get SMS_ApplicationLatest WMI object
$Application = Get-WmiObject -Namespace "root\SMS\site_$($SiteCode)" -Class "SMS_ApplicationLatest" -ComputerName $SiteServer -Filter "LocalizedDisplayName='$ApplicationName' and IsExpired='False' "

Write-host "------------------------------------------------------" -ForegroundColor Green
Write-host "Application name: $($Application.LocalizedDisplayName)"  -ForegroundColor Green

#Get Application Model Names
$ApplicationModelName = $Application.ModelName

#Get SMS_TaskSequenceAppReferencesInfo WMI Object
$TaskSequencePackageIDs = (Get-WmiObject -Namespace "root\SMS\site_$($SiteCode)" -Class "SMS_TaskSequenceAppReferencesInfo" -ComputerName $SiteServer -Filter "RefAppModelName Like '$ApplicationModelName'").PackageID
Foreach ($TaskSequencePackageId in $TaskSequencePackageIds) 
{
    # Get SMS_TaskSequencePackage WMI object
    $TaskSequencePackage = Get-WmiObject -Namespace "root\SMS\site_$($SiteCode)" -Class SMS_TaskSequencePackage -ComputerName $SiteServer -Filter "PackageID like '$TaskSequencePackageId'"
    $TaskSequencePackage.Get()
            
    #Get Task SequenceName
    $TaskSquenceName = $TaskSequencePackage.Name
    Write-host "-----" -ForegroundColor Green 
    Write-host "Dependent TaskSequence is: $TaskSquenceName" -ForegroundColor Green    
    
    # Get SMS_TaskSequence WMI object from TaskSequencePackage
    $TaskSequence = Invoke-WmiMethod -Namespace "root\SMS\site_$($SiteCode)" -Class SMS_TaskSequencePackage -ComputerName $SiteServer -Name "GetSequence" -ArgumentList $TaskSequencePackage
    
    # Convert WMI object to XML
    $TaskSequenceResult = Invoke-WmiMethod -Namespace "root\SMS\site_$($SiteCode)" -Class SMS_TaskSequence -ComputerName $SiteServer -Name "SaveToXml" -ArgumentList $TaskSequence.TaskSequence
    $TaskSequenceXML = [xml]$TaskSequenceResult.ReturnValue 

    # Amend command line for Install other applications, only remove those applications that we don't want
    $InstallApplicationCommandLineNodes = Select-Xml -Xml $TaskSequenceXML -XPath "//step[contains(@type,'SMS_TaskSequence_InstallApplicationAction')]"
    foreach ($InstallApplicationCommandLineNode in $InstallApplicationCommandLineNodes)
    {
        if ($InstallApplicationCommandLineNode.Node.action -match $ApplicationModelName) {
            Write-host "Step name is: $($InstallApplicationCommandLineNode.Node.name) " -ForegroundColor Green
        }
    }
}