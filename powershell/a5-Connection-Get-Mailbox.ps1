# a5-Connection-Get-Mailbox.ps1
# Azure Automation Account script that uses an existing connection and connect to Exchange Online v2 API to get mailboxes.
# Requires ExchangeOnlineManagement module

$Conn = Get-AutomationConnection -Name "MyCompanyConnection"

Connect-ExchangeOnline -CertificateThumbprint $Conn.CertificateThumbprint `
                        -AppId $Conn.ApplicationID `
                        -Organization $Conn.TenantID -showbanner:$false

# Note that we can only access data, the application provides. Otherwise an error will occur.
Get-Mailbox | ft
