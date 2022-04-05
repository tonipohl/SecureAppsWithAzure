# a1-Get-Teams.ps1
# Azure Automation Account script to read all Microsoft Teams with credentials of a user.
# Requires MicrosoftTeams

$cred = Get-AutomationPSCredential -Name 'admin'

Write-Output "Credential : $($cred.UserName)"
Write-Output "Pwd : $($cred.Password)"

# Connect to the Teams module
Connect-MicrosoftTeams -Credential $cred

# Get a list of teams
$teams = Get-Team

# more...
# Get a list of all teams
# Get-Team | ? {$_.DisplayName -like 'My*'}
# Get-Team -Archived $true -Visibility Private
# Get-TeamUser -GroupId 2f162b0e-36d2-4e15-8ba3-ba229cecdccf -Role Owner

Write-Output $teams | ft

Write-Output "Done. $($teams.Count()) Teams."
