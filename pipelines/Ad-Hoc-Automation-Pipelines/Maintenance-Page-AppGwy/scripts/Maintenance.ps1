param(
    [string] $resourceGroupName, # = "USEDEYC003RSG04",
    [string] $gatewayName, # = "USEDEYC003AAG04",
    [string] $pathMapName, # = "HTTPs",
    [string] $pathRuleName, # = "devKaasCluster",
    [string] $backendPoolName, #= "dev-backendpool",
    [string] $backendHttpSettingsName # = "dev-backendsettings",
)

Write-Host " Resource-group: $resourceGroupName"
Write-Host " gatewayName: $gatewayName"
Write-Host "pathMapName : $pathMapName"
Write-Host "pathRuleName : $pathRuleName"
Write-Host "backendPoolName : $backendPoolName"
Write-Host "backendHttpSettingsName : $backendHttpSettingsName"
# Get the existing Application Gateway
$gateway = Get-AzApplicationGateway -Name $gatewayName -ResourceGroupName $resourceGroupName

# Find the specific URL path map
$pathMap = $gateway.UrlPathMaps | Where-Object { $_.Name -eq $pathMapName }

# Find the specific path rule
$pathRule = $pathMap.PathRules | Where-Object { $_.Name -eq $pathRuleName }

# Get the new backend pool and backend HTTP settings
$newBackendPool = Get-AzApplicationGatewayBackendAddressPool -Name $backendPoolName -ApplicationGateway $gateway
$newBackendHttpSettings = Get-AzApplicationGatewayBackendHttpSettings -Name $backendHttpSettingsName -ApplicationGateway $gateway

# Update the backend settings and backend pool for the path rule
$pathRule.BackendAddressPool = $newBackendPool
$pathRule.BackendHttpSettings = $newBackendHttpSettings

# Update the Application Gateway
Set-AzApplicationGateway -ApplicationGateway $gateway

