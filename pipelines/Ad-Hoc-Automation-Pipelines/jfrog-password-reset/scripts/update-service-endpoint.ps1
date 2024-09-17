param (
    [string]$token,
    [string]$serviceConnectionName,
    [string]$serviceConnectionPasswordMaven,
    [string]$serviceConnectionPasswordGradle,
    [string]$serviceConnectionPasswordDocker,
    [string]$org_name='fso-to',
    [string]$project_name='FSO-Project Fusion'
)

# Set up Service Account Name based on ADO Service Connection Name
if ($serviceConnectionName -eq 'EYC jFrog Artifactory - Maven' )
   { 
     $serviceAccountName = 'eycomply-maven-service-account' 
     $serviceConnectionPassword = $serviceConnectionPasswordMaven
   }
elseif ($serviceConnectionName -eq 'EYC jFrog Artifactory - Gradle' ) 
   { 
     $serviceAccountName = 'eycomply-gradle-service-account'
     $serviceConnectionPassword = $serviceConnectionPasswordGradle
   }
else { 
     $serviceAccountName = 'eycomply-docker-service-account' 
     $serviceConnectionPassword = $serviceConnectionPasswordDocker
     }

$baseUri="https://dev.azure.com/$($org_name)/$($project_name)/_apis/serviceendpoint/endpoints"
$token = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$($token)"))
$headers = @{ 
    "Authorization" = "Basic $token"
    "Content-Type" = "application/json"
}

# Iterates over endpoints to find out the endpoint name and catch the endpoint id
$getEndpoints = Invoke-RestMethod -Uri $($baseUri) -Headers $($headers) -Method GET | Select-Object -ExpandProperty Value

foreach ($endpoint in $getEndpoints){
    if ( $endpoint.name -eq "$serviceConnectionName" ) {
         $serviceConnectionBody = $($endpoint)
         $serviceConnectionId = $($serviceConnectionBody.id)
        }
    }

# Exit script if the serviceConnectionId is null

if ( $null -eq $serviceConnectionId ){
    Write-Error "serviceConnectionId is empty, please check serviceConnectionName"
    exit 1
}

# Debug messages:

Write-Host "$serviceConnectionName id is: $serviceConnectionId"
Write-Host "Current service connection body:"
Write-Host $serviceConnectionBody

# Update endpoint

$uri="https://dev.azure.com/$($org_name)/_apis/serviceendpoint/endpoints/$($serviceConnectionId)?api-version=7.0"
$serviceConnectionType = $serviceConnectionBody.type
$serviceConnectionUrl = $serviceConnectionBody.url
$serviceConnectionAuthorizationScheme = $serviceConnectionBody.authorization.scheme
$serviceConnectionAuthorizationParametersRegistry = $serviceConnectionBody.authorization.parameters.registry
$serviceConnectionIsShared = $serviceConnectionBody.isShared
$serviceConnectionIsReady = $serviceConnectionBody.isReady
$serviceConnectionProjectReferenceId = $serviceConnectionBody.serviceEndpointProjectReferences.projectReference.id
$serviceConnectionProjectReferenceName = $serviceConnectionBody.serviceEndpointProjectReferences.projectReference.name

$jFrogTypeServiceConnectionUpdateBody = @"
{
    "data": {},
    "name": "$serviceConnectionName",
    "type": "$serviceConnectionType",
    "url": "$serviceConnectionUrl",
    "authorization": {
      "parameters": {
        "username": "$serviceAccountName",
        "password": "$serviceConnectionPassword"
      },
      "scheme": "$serviceConnectionAuthorizationScheme"
    },
    "isShared": "$serviceConnectionIsShared",
    "isReady": "$serviceConnectionIsReady",
    "serviceEndpointProjectReferences": [
      {
        "projectReference": {
          "id": "$serviceConnectionProjectReferenceId",
          "name": "$serviceConnectionProjectReferenceName"
        },
        "name": "$serviceConnectionName"
      }
    ]
  }
"@

$dockerTypeServiceConnectionUpdateBody = @"
{
    "data": {
      "registrytype": "Others"
    },
    "name": "$serviceConnectionName",
    "type": "$serviceConnectionType",
    "url": "$serviceConnectionUrl",
    "authorization": {
      "parameters": {
        "registry": "$serviceConnectionAuthorizationParametersRegistry",
        "username": "$serviceAccountName",
        "password": "$serviceConnectionPassword"
      },
      "scheme": "$serviceConnectionAuthorizationScheme"
    },
    "isShared": "$serviceConnectionIsShared",
    "isReady": "$serviceConnectionIsReady",
    "serviceEndpointProjectReferences": [
      {
        "projectReference": {
          "id": "$serviceConnectionProjectReferenceId",
          "name": "$serviceConnectionProjectReferenceName"
        },
        "name": "$serviceConnectionName"
      }
    ]
  }
"@

if ( $serviceConnectionBody.type -match "artifactoryService" ) {
  $updateEndpoint = Invoke-RestMethod -Uri $uri -Headers $($headers) -Method PUT -Body $jFrogTypeServiceConnectionUpdateBody
  Write-Host $updateEndpoint
  }
elseif ( $serviceConnectionBody.type -match "dockerregistry" ) {
  Write-Host "dockerTypeServiceConnectionUpdateBody: $dockerTypeServiceConnectionUpdateBody"
  $updateEndpoint = Invoke-RestMethod -Uri $uri -Headers $($headers) -Method PUT -Body $dockerTypeServiceConnectionUpdateBody
  Write-Host $updateEndpoint
  }
else {
  Write-Error "Provided type of service connection not supported in this pipeline"
  exit 1 
  }

