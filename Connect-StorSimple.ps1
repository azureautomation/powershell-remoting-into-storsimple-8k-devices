#Requires -Version 4

<#
Script to connect to StorSimple 8k series via Powershell from a computer on the local LAN
For more information see https://superwidgets.wordpress.com/2015/04/24/connecting-to-storsimple-8k-using-powershell/
Author:  Sam Boutros
    24 April 2015 - v1.0
    12 September 2016 - v1.1
#>

#region Input
[CmdletBinding(ConfirmImpact='Low')] 
    Param(
        [Parameter(Mandatory=$false,Position=0)]
            [ValidateNotNullOrEmpty()] 
            [String]$StorSimpleIP = '10.4.12.70' # Your StorSimple device data0 interface IPv4 here
    )
#endregion

# Add StorSimple device to list of trusted hosts on this management computer
Set-Item wsman:\localhost\Client\TrustedHosts $StorSimpleIP -Concatenate -Force


# Get pwd for SSAdmin, store in encrypted local file for future automation
$PwdFile = "$env:TEMP\$($StorSimpleIP.Replace('.','_')).txt"
if (!(Test-Path -Path $PwdFile)) {
    Read-Host 'Enter the pwd for your StorSimple administration' -AsSecureString | 
        ConvertFrom-SecureString | Out-File $PwdFile
}
$Pwd    = Get-Content $PwdFile | ConvertTo-SecureString 
$SSCred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList "$StorSimpleIP\ssadmin", $Pwd

# Open PS session if one is not open already
$StorSimpleSession = Get-PSSession | where { $_.ComputerName -eq $StorSimpleIP }
if (! $StorSimpleSession) { $StorSimpleSession = New-PSSession -ComputerName $StorSimpleIP -Credential $SSCred -ConfigurationName SSAdminConsole }
$StorSimpleSession

<# 
Example of using the session:
Invoke-Command -Session $StorSimpleSession { Get-Command }  | sort name | FT -a

When done, close session:
Remove-PSSession -Session $StorSimpleSession
#>