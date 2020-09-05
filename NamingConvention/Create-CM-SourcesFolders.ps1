Set-Location D:\ConfigMgr

New-Item -ItemType 'directory' -Path '01.Medialib'
New-Item -ItemType 'directory' -Path '01.Medialib\Applications'
New-Item -ItemType 'directory' -Path '01.Medialib\Applications\Adobe'
New-Item -ItemType 'directory' -Path '01.Medialib\Applications\IBM'
New-Item -ItemType 'directory' -Path '01.Medialib\Applications\In-House'
New-Item -ItemType 'directory' -Path '01.Medialib\Applications\Microsoft' 
New-Item -ItemType 'directory' -Path '01.Medialib\Applications\Other'

New-Item -ItemType 'directory' -Path '01.Medialib\Packages'
New-Item -ItemType 'directory' -Path '01.Medialib\Packages\Adobe'
New-Item -ItemType 'directory' -Path '01.Medialib\Packages\IBM'
New-Item -ItemType 'directory' -Path '01.Medialib\Packages\In-House'
New-Item -ItemType 'directory' -Path '01.Medialib\Packages\Microsoft' 
New-Item -ItemType 'directory' -Path '01.Medialib\Packages\Other'
New-Item -ItemType 'directory' -Path '01.Medialib\Packages\Drivers'

New-Item -ItemType 'directory' -Path '01.Medialib\OSD'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\BootImages'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\Branding'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\Captures'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\DriverBiosMgmt'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\OSImages'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\OSDShare'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\OSUpgradePackages'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\TaskSequenceMedia'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\Scripts'


New-Item -ItemType 'directory' -Path '01.Medialib\OSD\OSImages\Windows10'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\OSImages\WindowsServer2016'


New-Item -ItemType 'directory' -Path '01.Medialib\OSD\OSUpgradePackages\Windows10'
New-Item -ItemType 'directory' -Path '01.Medialib\OSD\OSUpgradePackages\WindowsServer2016'

New-Item -ItemType 'directory' -Path '01.Medialib\Scripts'
New-Item -ItemType 'directory' -Path '01.Medialib\Scripts\Production'
New-Item -ItemType 'directory' -Path '01.Medialib\Scripts\Dev'

New-Item -ItemType 'directory' -Path '01.Medialib\SoftwareUpdates'
New-Item -ItemType 'directory' -Path '01.Medialib\SoftwareUpdates\Defender'
New-Item -ItemType 'directory' -Path '01.Medialib\SoftwareUpdates\Windows10'
New-Item -ItemType 'directory' -Path '01.Medialib\SoftwareUpdates\Server'
New-Item -ItemType 'directory' -Path '01.Medialib\SoftwareUpdates\M365Apps'

New-Item -ItemType 'directory' -Path '02.ComplianceSettings'


New-Item -ItemType 'directory' -Path '03.Logs'
New-Item -ItemType 'directory' -Path '03.Logs\ArchivedLogs'
New-Item -ItemType 'directory' -Path '03.Logs\TaskSequenceErrorLogs'

New-Item -ItemType 'directory' -Path '04.Resources'
New-Item -ItemType 'directory' -Path '04.Resources\Tools'
New-Item -ItemType 'directory' -Path '04.Resources\Scripts'
New-Item -ItemType 'directory' -Path '04.Resources\Hotfixes'
New-Item -ItemType 'directory' -Path '04.Resources\CMUpdates'



New-Item -ItemType 'directory' -Path '05.Export'
New-Item -ItemType 'directory' -Path '05.Export\TaskSequencesMonitor'

New-Item -ItemType 'directory' -Path '06.Import'
New-Item -ItemType 'directory' -Path '06.Import\Applications'
New-Item -ItemType 'directory' -Path '06.Import\Baselines'
New-Item -ItemType 'directory' -Path '06.Import\HardwareInventoryMOFs'
New-Item -ItemType 'directory' -Path '06.Import\ReportDefinitions'
New-Item -ItemType 'directory' -Path '06.Import\Tasksequences'

New-Item -ItemType 'directory' -Path '07.Reports'