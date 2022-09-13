# a7-User-ManagedIdentity-KeyVault.ps1
# Get the value of a secret in a Key Vault
# https://docs.microsoft.com/en-us/azure/automation/enable-managed-identity-for-automation#authenticate-access-with-system-assigned-managed-identity

Write-Output "Connecting to Azure with a User Managed Identity of the Automation Account" 

$clientid = "<userclientid>"
Connect-AzAccount -Identity -AccountId $clientid

Write-Output "Successfully connected with Automation account's Managed Identity" 
Write-Output "Trying to fetch value from key vault using MI. Make sure you have given correct access to Managed Identity" 

$secretkey = '<Mykey>' 
Write-Output "Getting key: $secretkey"

$secret = Get-AzKeyVaultSecret -VaultName '<MyKeyVault>' -Name $secretkey

$ssPtr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($secret.SecretValue) 
try { 
  $secretValueText = [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR($ssPtr) 
    Write-Output "This is the secret value read from the Key Vault:"
    Write-Output $secretValueText 
} finally { 
    [System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ssPtr) 
}

Write-Output "End."
