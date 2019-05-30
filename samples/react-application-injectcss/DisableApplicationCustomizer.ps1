# Change these variables to enable the extension
$tenantUrl = Read-Host 'Input yout server url: https://<tenant>.sharepoint.com/<more>'

# Get credentials
$credentials = Get-Credential
Connect-PnPOnline $tenantUrl -Credentials $credentials

# Connect to tenant
Get-PnPCustomAction | ? Name -eq "InjectCssApplicationCustomizer" | Remove-PnPCustomAction