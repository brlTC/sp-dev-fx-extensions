# Change these variables to enable the extension
$customCSSUrl = "/Style%20Library/custominject.css"
$tenantUrl = Read-Host 'Input yout server url: https://<tenant>.sharepoint.com/<more>'

# Get credentials
$credentials = Get-Credential
Connect-PnPOnline $tenantUrl -Credentials $credentials

# Enable PnPFeature Web and Site
Enable-PnPFeature -Identity f6924d36-2fa8-4f0b-b16d-06b7250180fa -Scope Site
Enable-PnPFeature -Identity 94c94ca6-b32f-4da9-a9e3-1f3d343d7ecb -Scope Web

# Connect to tenant
$context = Get-PnPContext
$web = Get-PnPWeb
$context.Load($web)
Invoke-PnPQuery

# Deploy custom action
$ca = $web.UserCustomActions.Add()
$ca.ClientSideComponentId = "5a1fcffd-dfeb-4844-b478-1feb4325a5a7"
$ca.ClientSideComponentProperties = "{""cssurl"":""$customCSSUrl""}"
$ca.Location = "ClientSideExtension.ApplicationCustomizer"
$ca.Name = "InjectCssApplicationCustomizer"
$ca.Title = "Inject CSS Application Extension"
$ca.Description = "Injects custom CSS to make minor style modifications to SharePoint Online"
$ca.Update()

$context.Load($web.UserCustomActions)
Invoke-PnPQuery

