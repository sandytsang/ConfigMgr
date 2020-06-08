param ([Parameter(Mandatory = $False)]
	[string]$SoftwareMW,
	[Parameter(Mandatory = $False)]
	[string]$AllProgramsMW,
	[Parameter(Mandatory = $False)]
	[String]$ProgramsMW)

$Computername = $ENV:COMPUTERNAME

if ($AllProgramsMW -eq 'Yes') #If the All Programs MW is selected find the next available ALL PROGRAMS maintenance window. 
{
	try
	{
		Write-Verbose -Message "Attempting to connect to $ComputerName and retrieve next available ALL PROGRAMS MAINTENANCE WINDOW"
		$Window = Get-WmiObject -ComputerName $ComputerName -ErrorACtion Stop -Namespace root\ccm\clientsdk -ClassName CCM_ServiceWindow | Where-Object{ $_.type -eq 1 } | ForEach-Object{ [Management.ManagementDateTimeConverter]::ToDateTime($_.StartTime) } | Sort $_.StartTime | Select-Object -First 1
		#Gets the Maintenance Window time from WMI And converts it to a date time object. 
		$Message = "Next available ALL PROGRAMS window for $ComputerName is " + $Window
		#Returns and displays the window information to the screen. 
		$Message
		
	}
	catch #catches and throws a terminating error if the remote WMI call fails. 
	{
		throw "An Error has occured retriving window information"
	}
}
if ($SoftwareMW -eq "Yes") #if the SoftwareMW is selected finds the next available software maintenance window for the device. 
{
	try
	{
		Write-Verbose -Message "Attempting to connect to $ComputerName and retrieve next available SOFTWARE UPDATES MAINTENANCE WINDOW"
		$Window = Get-WmiObject -ComputerName $ComputerName -Namespace root\ccm\clientsdk -ClassName CCM_ServiceWindow | Where-Object{ $_.type -eq 4 } | ForEach-Object{ [Management.ManagementDateTimeConverter]::ToDateTime($_.StartTime) } | Sort $_.StartTime | Select-Object -First 1
		#Gets the next available maintenance window from WMI of type Software Update and converts it to a datetime object 
		$Message = "Next available SOFTWARE UPDATES MAINTENANCE window for $ComputerName is:  $Window"
		#Returns and displays the window information to the screen. 
		$Message
	}
	catch #catches and throws a terminating error if the remote WMI call fails. 
	{
		throw "An Error has occured retriving window information"
	}
}
if ($ProgramsMW -eq "Yes")
#if the ProgramsMW is selected finds the next available Programs window for the device. 
{
	try
	{
		Write-Verbose -Message "Attempting to connect to $ComputerName and retrieve next available PROGRAMS MAINTENANCE WINDOW"
		$window = Get-WmiObject -ComputerName $ComputerName -Namespace root\ccm\clientsdk -ClassName CCM_ServiceWindow | Where-Object{ $_.type -eq 2 } | ForEach-Object{ [Management.ManagementDateTimeConverter]::ToDateTime($_.StartTime) } | Sort $_.StartTime | Select-Object -First 1
		$Message = "Next available PROGRAMS MAINTENANCE window for $ComputerName is $Window"
		#Returns and displays the window information to the screen. 
		$Message
	}
	catch { throw "An Error has occured retriving window information" }
}
if ($SoftwareMW -eq "No" -and $AllProgramsMW -eq "No" -and $ProgramsMW -eq "No")
{
	try
	{
		Write-Verbose -Message "Attempting to connect to $ComputerName and retrieve next available MAINTENANCE WINDOW OF ANY TYPE"
		$Window = Get-WmiObject -ComputerName $ComputerName -Namespace root\ccm\clientsdk -ClassName CCM_ServiceWindow | Where-Object{ $_.type -eq 2 -or $_.Type -eq 1 -or $_.Type -eq 4 } | ForEach-Object{ [Management.ManagementDateTimeConverter]::ToDateTime($_.StartTime) } | Sort $_.StartTime | Select-Object -First 1
		#Gets the next available Programs Maintenance window from WMI and converts it to a datetime object 
		$Message = "Next available MAINTEANNCE window of any type for $ComputerName is: $Window"
		#Returns and displays the window information to the screen. 
		$Message
	}
	catch #catches and throws a terminating error if the remote WMI call fails.
	{
		throw "An Error has occured retriving window information"
	}
}