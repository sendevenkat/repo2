$var = @{
    "type"= "user"
    "MEMBERS"= "$env:email"
  }
  
$var = $var | ConvertTo-Json
$var

#Ansible Tower Service Account Username & Password
$username=$env:ansible_user
$password=$env:ansible_pswd
$templateId='2274'
$towerApiUrl = "https://tower.000ukso.sbp.eyclienthub.com/api/v2";

$jobFolder = "playbook";
$statusFolder = "jobs";
$templateFolder="job_templates"
#Tower URL
$TowerApiUrl = 'https://tower.000ukso.sbp.eyclienthub.com/api/v2'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$Authorization = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$username`:$password"))
$MeUri = $TowerApiUrl + '/me/'
Write-Host $Authorization
$MeResult = Invoke-RestMethod -Uri $MeUri -Headers @{ "Authorization" = "Basic $Authorization" ; "Content-Type" = 'application/json'} -ErrorAction Stop

$MeResult.Results
### Logging in to Tower...
$PATUri = $TowerApiUrl + '/users/' + $($MeResult.Results.id) + '/personal_tokens/'
$Tokens = Invoke-RestMethod -Uri $PATUri -Method POST -Headers @{ "Authorization" = "Basic $Authorization" ; "Content-Type" = 'application/json'} -ContentType "application/json"
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
$tokenId = $Tokens.id
$headers.Add("Authorization", "Bearer " + $Tokens.token);
$body = '{ "extra_vars":' + ${var} + '}';
$body;
echo "done"
Write-Host $Tokens
Write-Host
$uri = "$($towerApiUrl)/$($templateFolder)/$($templateId)/launch/";
$uri
$response = Invoke-RestMethod -Uri $uri -Method "POST" -Body $body -Headers $headers;
echo "final response"
Write-Host $response
$response=$response | ConvertTo-Json
$response=$response | ConvertFrom-Json
Write-Host $response.id

Write-Host "Ansible Tower Job Id: $($response.job)";
Write-Host "Ansible Tower Job URL: https://tower.000ukso.sbp.eyclienthub.com/#/jobs/$($jobFolder)/$($response.id)";



# Check Job
do {
    $uri = "$($towerApiUrl)/$($statusFolder)/$($response.id)/";
    $response = Invoke-RestMethod -Uri $uri -Method "GET" -Headers $headers;
    $uri
    Write-Host
    $response.status;

    Start-Sleep -Seconds 30;
} until($response.status -eq "successful" -OR $response.status -eq "failed");

$response.extra_vars;

if ($response.status -eq "successful") {
    exit 0;
} else {
    exit 1;
}



