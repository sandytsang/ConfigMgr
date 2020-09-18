<#
.SYNOPSIS
    This script create Content Source folder structures for ConfigMgr

.DESCRIPTION
    This script will automatic create some example folders

.NOTES
    File name: Create-CM-SourcesFolders.ps1
    VERSION: 1.0.2
    AUTHOR: Sandy Zeng
    Created:  2020-07-23
    Updated: 2020-09-18
    COPYRIGHT:
    Sandy Zeng / https://www.sandyzeng.com
    Licensed under the MIT license.
    Please credit me if you fint this script useful and do some cool things with it.

.VERSION HISTORY
    1.0.0 - (2020-07-23) Script created
    1.0.1 - (2020-09-18) Modify Logs folder structures

#>

#Create the parent folder
New-Item -ItemType 'directory' -Path 'D:\ConfigMgr'
Set-Location D:\ConfigMgr

#Create MediaLib
New-Item -ItemType 'directory' -Path '01.Medialib'

#Create Medialib\Applications
New-Item -ItemType 'directory' -Path '01.Medialib\Applications'
New-Item -ItemType 'directory' -Path '01.Medialib\Applications\Adobe'
New-Item -ItemType 'directory' -Path '01.Medialib\Applications\IBM'
New-Item -ItemType 'directory' -Path '01.Medialib\Applications\In-House'
New-Item -ItemType 'directory' -Path '01.Medialib\Applications\Microsoft' 
New-Item -ItemType 'directory' -Path '01.Medialib\Applications\Other'

#Create MediaLib\Packages
New-Item -ItemType 'directory' -Path '01.Medialib\Packages'
New-Item -ItemType 'directory' -Path '01.Medialib\Packages\Adobe'
New-Item -ItemType 'directory' -Path '01.Medialib\Packages\IBM'
New-Item -ItemType 'directory' -Path '01.Medialib\Packages\In-House'
New-Item -ItemType 'directory' -Path '01.Medialib\Packages\Microsoft' 
New-Item -ItemType 'directory' -Path '01.Medialib\Packages\Other'
New-Item -ItemType 'directory' -Path '01.Medialib\Packages\Drivers'

#Create MediaLib\OSD
New-Item -ItemType 'directory' -Path '01.Medialib\OSD'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\BootImages'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\Branding'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\Captures'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\DriverBiosMgmt'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\OSImages'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\OSImages\Windows10'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\OSImages\WindowsServer2016'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\OSDShare'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\OSUpgradePackages'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\OSUpgradePackages\Windows10'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\OSUpgradePackages\WindowsServer2016'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\TaskSequenceMedia'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\Scripts'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\Logs'
New-Item -ItemType 'directory' -Path '03.Medialib\OSD\Logs\TS_DynamicLog'
New-Item -ItemType 'directory' -Path '03.Medialib\OSD\Logs\TS_ErrorLogs'

#Create MediaLib\Scripts
New-Item -ItemType 'directory' -Path '01.Medialib\Scripts'
New-Item -ItemType 'directory' -Path '01.Medialib\Scripts\Production'
New-Item -ItemType 'directory' -Path '01.Medialib\Scripts\Dev'

#Create MediaLib\SoftwareUpdate
New-Item -ItemType 'directory' -Path '01.Medialib\SoftwareUpdates'
New-Item -ItemType 'directory' -Path '01.Medialib\SoftwareUpdates\Defender'
New-Item -ItemType 'directory' -Path '01.Medialib\SoftwareUpdates\Windows10'
New-Item -ItemType 'directory' -Path '01.Medialib\SoftwareUpdates\Server'
New-Item -ItemType 'directory' -Path '01.Medialib\SoftwareUpdates\M365Apps'

#Create ComplianceSettings
New-Item -ItemType 'directory' -Path '02.ComplianceSettings'

#Create Logs
New-Item -ItemType 'directory' -Path '03.Logs'
New-Item -ItemType 'directory' -Path '03.Logs\ArchivedLogs'

#Create Resources
New-Item -ItemType 'directory' -Path '04.Resources'
New-Item -ItemType 'directory' -Path '04.Resources\Tools'
New-Item -ItemType 'directory' -Path '04.Resources\Scripts'
New-Item -ItemType 'directory' -Path '04.Resources\Hotfixes'
New-Item -ItemType 'directory' -Path '04.Resources\CMUpdates'

#Create Export folder
New-Item -ItemType 'directory' -Path '05.Export'
New-Item -ItemType 'directory' -Path '05.Export\TaskSequencesMonitor'

#Create Import folder
New-Item -ItemType 'directory' -Path '06.Import'
New-Item -ItemType 'directory' -Path '06.Import\Applications'
New-Item -ItemType 'directory' -Path '06.Import\Baselines'
New-Item -ItemType 'directory' -Path '06.Import\HardwareInventoryMOFs'
New-Item -ItemType 'directory' -Path '06.Import\ReportDefinitions'
New-Item -ItemType 'directory' -Path '06.Import\Tasksequences'

#Create Reports folder
New-Item -ItemType 'directory' -Path '07.Reports'
