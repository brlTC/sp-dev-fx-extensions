# Change these variables to enable the extension
$tenantUrl = Read-Host 'Input yout server url: https://<tenant>.sharepoint.com/<more>'

# Get credentials
$credentials = Get-Credential
Connect-PnPOnline $tenantUrl -Credentials $credentials

Add-PnPApp -path .\sharepoint\solution\react-application-injectcss.sppkg -Publish -SkipFeatureDeployment -Overwrite
