<#
# Create Portal Desktop Shortcut
.Synopsis
   Add a desktop shortcut to your online portal
## DESCRIPTION
   this script creates a desktop shortcut to the URL of your online portal	

###  FUNCTIONALITY
   PowerShell v3

Please note that the following variables need to be configured in Syncro (see screenshot below):

|  Variable Name | Variable Type |     Value     |
| -------------- | ------------- | ------------- |
| subdomain	     | platform      | your_subdomain|
#>


$subdomain = "your_subdomain"

$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$home\Desktop\VITAL_Tech_SupportPortal.lnk")
$urlpart2 = Get-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\RepairTech\Syncro -Name "UUID"
$urlpart3 = $urlpart2.uuid
$shortcut.IconLocation= "C:\ProgramData\Syncro\Images\logo.ico"
$Shortcut.TargetPath = "https://$subdomain.syncromsp.com/my_profile/v2/index?asset_uuid=$urlpart3"
$Shortcut.Save()