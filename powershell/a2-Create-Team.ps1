# a2-Create-Team.ps1
# Azure Automation Account script to create a new Team with credentials of a user.
# Requires the MicrosoftTeams module
# https://docs.microsoft.com/en-us/powershell/module/teams/new-team?view=teams-ps
# https://673fb280-163f-4d79-9a9e-268e56c8e929.webhook.wus2.azure-automation.net/webhooks?token=sGsY%2b5zqxdk%2b2is1n3vY%2bNuPKwVCQcT68eIhNRyCVB8%3d

param
(
	[Parameter (Mandatory=$true)]
	[string] $teamname = "Team1",
	[Parameter (Mandatory=$false)]
	[string] $owner = "myuser@yourtenant.onmicrosoft.com"
)

Write-Output "$(Get-Date) Create Team $teamname..."

$cred = Get-AutomationPSCredential -Name 'admin'

Connect-MicrosoftTeams -Credential $cred
Write-Output "$(Get-Date) connect."

$group = New-Team -MailNickname $teamname -displayname $teamname -Visibility "private"
Write-Output "$(Get-Date) new team $teamname with Id $group.GroupId."

Add-TeamUser -GroupId $group.GroupId -Owner $owner
Add-TeamUser -GroupId $group.GroupId -Owner "admin@yourtenant.OnMicrosoft.com"
Write-Output "$(Get-Date) team $($teamname) owners added."

Add-TeamUser -GroupId $group.GroupId -User $owner
Add-TeamUser -GroupId $group.GroupId -User "AlexW@yourtenant.OnMicrosoft.com"
Add-TeamUser -GroupId $group.GroupId -User "AdeleV@yourtenant.OnMicrosoft.com"
Add-TeamUser -GroupId $group.GroupId -User "martina@yourtenant.OnMicrosoft.com"
Write-Output "$(Get-Date) team $($teamname) members added."

New-TeamChannel -GroupId $group.GroupId -DisplayName "Planning"
New-TeamChannel -GroupId $group.GroupId -DisplayName "Contracts"
Write-Output "$(Get-Date) $($teamname) channels added."


