# a4-Connection-Get-User.ps1
# Azure Automation Account script. Use the connection and get all users with Graph PS
# Get Automation Connection: https://docs.microsoft.com/en-us/azure/automation/automation-connections?tabs=azure-powershell

$Conn = Get-AutomationConnection -Name "MyCompanyConnection"

Write-Output $Conn.ApplicationID

Connect-MgGraph -ClientId $Conn.ApplicationID `
                -CertificateThumbprint $Conn.CertificateThumbprint `
                -TenantId $Conn.TenantID

# Note that we can only access data, the application provides...
Get-MgUser | ft 
