# p2-Add-ManagedIdentity-Permission.ps1
# Use this script for adding a permission to a Managed Identity
# atwork.at, Christoph Wilfing, Toni Pohl, Martina Grom, Sept. 2022

#requires -module Microsoft.Graph.Applications
Import-Module Microsoft.Graph.Applications

# Connect to the Microsoft Graph
Connect-MgGraph -ContextScope Process

#-----------------------------------------
# Repeat this for every permission to add
#-----------------------------------------
# objectID of the Managed Identnity you want to give permission
$SpObjectID = '<Your-Managed-Identity-Id>'
$GraphPermission = 'User.Read.All'
<#
Mail.Send
AuditLog.Read.All
Directory.Read.All
User.Read.All
#>

# Find your Service Principal
$SP = Get-MgServicePrincipal -ServicePrincipalId $SpObjectID
$SP | fl

# find the SP for the Graph API: Get all service principals from the directory filtered
$GraphApi = Get-MgServicePrincipal -Filter "AppID eq '00000003-0000-0000-c000-000000000000'"
$GraphApi | fl

# find the permission to add to our ServicePrincipal
$Approle = $GraphApi | `
    Select-Object -ExpandProperty approles | `
    Where-Object { $_.value -like $GraphPermission }
$Approle

# create a new permission object
$params = @{
    PrincipalId = $SpObjectID
    ResourceId  = $GraphApi.Id
    AppRoleId   = $Approle.Id
}
$params

# add the role
New-MgServicePrincipalAppRoleAssignment -ServicePrincipalId $SpObjectID -BodyParameter $params

# done.
Disconnect-MgGraph
