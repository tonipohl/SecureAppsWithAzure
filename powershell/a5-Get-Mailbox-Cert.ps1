# a5-Get-Mailbox-Cert.ps1
# Azure Automation Account script. Connect to Exchange Online v2 API with App and certificate and get mailboxes.
# Install-Module –Name ExchangeOnlineManagement

$Conn = Get-AutomationConnection -Name "MyCompanyConnection"

Write-Output $Conn.ApplicationID

Connect-ExchangeOnline -CertificateThumbprint $Conn.CertificateThumbprint `
                        -AppId $Conn.ApplicationID `
                        -Organization $Conn.TenantID -showbanner:$false

Get-Mailbox | ft

