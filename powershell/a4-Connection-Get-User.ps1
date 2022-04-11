# a4-Connection-Get-User.ps1
# Azure Automation Account script that uses an existing connection to get all users with Graph PS
# Requires the Microsoft Graph Authentication and Graph Users modules
# Get Automation Connection: https://docs.microsoft.com/en-us/azure/automation/automation-connections?tabs=azure-powershell

$Conn = Get-AutomationConnection -Name "MyCompanyConnection"

Connect-MgGraph -ClientId $Conn.ApplicationID `
                -CertificateThumbprint $Conn.CertificateThumbprint `
                -TenantId $Conn.TenantID

# Note that we can only access data, the application provides. Otherwise an error will occur.
Get-MgUser | ft 
