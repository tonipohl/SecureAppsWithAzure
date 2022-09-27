# p3-Export-User-LastLogon.ps1
# Use this script to export users with their last login
# atwork.at, Christoph Wilfing, Toni Pohl, Martina Grom, Sept. 2022

#Requires -Module Microsoft.Graph

# Connect to the Microsoft Graph
Select-MgProfile -Name beta
Connect-MgGraph -ContextScope Process
#Connect-MgGraph -Scopes $Scopes -ForceRefresh -ContextScope Process -UseDeviceAuthentication

$Scopes = @(
    'User.Read.All',
    'UserAuthenticationMethod.Read',
    'AuditLog.Read.All'
)

$ExportList = New-Object -TypeName System.Collections.ArrayList

$UserList = Get-MgUser -All -Property 'displayName','userPrincipalName','signInActivity'
#$UserList = Get-MgUser -Filter "Userprincipalname eq 'user1@mycompany.org'" -Property 'displayName','userPrincipalName','signInActivity'

foreach ($User in $UserList) {
    [void]$ExportList.Add([PSCustomObject]@{
        UserPrincipalName = $user.UserPrincipalName
        LastSignInDateTime = $User.SignInActivity.LastSignInDateTime
        LastSignInRequestId = $User.SignInActivity.LastSignInRequestId
        LastNonInteractiveSignInDateTime = $User.SignInActivity.LastNonInteractiveSignInDateTime
        LastNonInteractiveSignInRequestId = $User.SignInActivity.LastNonInteractiveSignInRequestId
    })
}

$ExportList | Export-Csv -Path .\UserSignInReport.csv -NoClobber -NoTypeInformation -Force -Encoding UTF8

Disconnect-MgGraph
