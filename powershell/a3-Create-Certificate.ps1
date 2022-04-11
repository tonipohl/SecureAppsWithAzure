# a3-Create-Certificate.ps1
# Create a self-signed certificate to secure access to an API or service
# >>> Run this script locally on your computer! <<<

# Number of years of certificate validity
$certYears = 5

# Create a new certificate in the current user certificate store
$cert = New-SelfSignedCertificate `
    -NotAfter $(Get-Date).AddYears($certYears) `
    -Type SSLServerAuthentication `
    -FriendlyName 'MyAuthCert' `
    -Subject 'CN=MyM365conf' `
    -CertStoreLocation 'Cert:\CurrentUser\My' `
    -KeySpec KeyExchange

Write-Output $cert

# We need the certificate thumbprint later.
Write-Output $cert.Thumbprint

# Next steps:
# Open mmc with the certificate snapin on the local computer.
# Export the certificate as .pfx file with a strong password (and don´t give that away).
# Import that pfx certificate into the Automation Account Certificates.
# Create a connection, and use the connection (instead of the certificate).
