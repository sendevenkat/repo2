# Variables definition
param(
    [string] $repo,
    [string] $kvName, # = "USEPEYC002AKV04",
    [string] $secretNameKey, # = "eycomply-npm-service-account-apikey-jfrogg",
    [string] $secretNamePass, # = "eycomply-npm-service-account-password",
    [string] $jfrogUri, # = "https://eyctpeu.jfrog.io/artifactory",
    [string] $jfrogUser, #= "eycomply-npm-service-account",
    [string] $jfrogRepository, # "https://eyctpeu.jfrog.io/artifactory/eycomply-npm",
    [switch] $dryRun
)
$wrongContextErrorMessage = @"
Failure while retrieving secrets from key vault {0}.
You are currently in the context of subscription {1}.
If this is the wrong subscription, run Set-AzContext -Subscription <subscription_name>.
"@

$notConnectedtoAzErrorMessage = @"
Seems like this powershell session is not authenticated. 
Please run Connect-AzAccount
"@

$failChangePassErrorMessage = @"
Something went wrong while updating the password in jFrog Artifcatory
"@ 


function Get-RandomPassword {
    param (
        [Parameter(Mandatory)]
        [ValidateRange(4,[int]::MaxValue)]
        [int] $length,
        [int] $upper = 1,
        [int] $lower = 1,
        [int] $numeric = 1
        #[int] $special = 1
    )
    if($upper + $lower + $numeric -gt $length) {
        throw "number of upper/lower/numeric char must be lower or equal to length"
    }
    $uCharSet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    $lCharSet = "abcdefghijklmnopqrstuvwxyz"
    $nCharSet = "0123456789"
    #$sCharSet = "/*-+,!?=()@;:._"
    $charSet = ""
    if($upper -gt 0) { $charSet += $uCharSet }
    if($lower -gt 0) { $charSet += $lCharSet }
    if($numeric -gt 0) { $charSet += $nCharSet }
    #if($special -gt 0) { $charSet += $sCharSet }
    
    $charSet = $charSet.ToCharArray()
    $rng = New-Object System.Security.Cryptography.RNGCryptoServiceProvider
    $bytes = New-Object byte[]($length)
    $rng.GetBytes($bytes)
 
    $result = New-Object char[]($length)
    for ($i = 0 ; $i -lt $length ; $i++) {
        $result[$i] = $charSet[$bytes[$i] % $charSet.Length]
    }
    $password = (-join $result)
    $valid = $true
    if($upper   -gt ($password.ToCharArray() | Where-Object {$_ -cin $uCharSet.ToCharArray() }).Count) { $valid = $false }
    if($lower   -gt ($password.ToCharArray() | Where-Object {$_ -cin $lCharSet.ToCharArray() }).Count) { $valid = $false }
    if($numeric -gt ($password.ToCharArray() | Where-Object {$_ -cin $nCharSet.ToCharArray() }).Count) { $valid = $false }
    #if($special -gt ($password.ToCharArray() | Where-Object {$_ -cin $sCharSet.ToCharArray() }).Count) { $valid = $false }
 
    if(!$valid) {
         $password = Get-RandomPassword $length $upper $lower $numeric 
    }
    return $password
}

function Set-jFrogNewPassword {
    param(
        [string]$url,
        [string]$apiKey,
        [String]$jfrogNewPassword,
        [String]$jfrogOldPassword
    )

    $endpoint = "/api/security/users/authorization/changePassword"
    
    $uri = "${url}${endpoint}"
    $method = "POST"
    $headers = @{
        "X-JFrog-Art-Api" = $apiKey
        "Content-type" =  "application/json"
    }
    

    $body = @{
        "userName" = $jfrogUser
        "oldPassword" = $jfrogOldPassword
        "newPassword1" = $jfrogNewPassword
        "newPassword2" = $jfrogNewPassword
    } | ConvertTo-Json

    $result = Invoke-RestMethod -Method $method -Uri $uri -Headers $headers -Body $body -ErrorAction Stop
    Write-Host "Password Successfully Posted by RestAPI"
    Write-Output $result
}

# Get current jFrog API Key and oldPassword
Write-Output "Getting necessary secrets from key vault $kvName"
try {
    $apiKey = Get-AzKeyVaultSecret -VaultName $kvName -Name $secretNameKey -AsPlainText -ErrorAction Stop
    $jfrogOldPassword = Get-AzKeyVaultSecret -VaultName $kvName -Name $secretNamePass -AsPlainText -ErrorAction stop
    
} catch {
    $context = Get-AzContext -ErrorAction SilentlyContinue
    if ($context) {
        Write-Error ($wrongContextErrorMessage -f $kvName, $context.Subscription.Name)
    } else {
        Write-Error $notConnectedtoAzErrorMessage
    }
    exit 1
} 

# Generate new password
$jfrogNewPassword =  $(Get-RandomPassword -length 20 -upper 3 -lower 3 -numeric 3)
Write-Host "New password for $repo will be $jfrogNewPassword"
Write-Host "##vso[task.setvariable variable=generatedPassword-$repo;isoutput=true]$jfrogNewPassword"
# Change username password in jfrog
try {
    $params = @{
        "apiKey" = $apiKey
        "jfrogNewPassword" = $jfrogNewPassword
        "jfrogOldPassword" = $jfrogOldPassword
        "url" = $jfrogUri
    }
    if ( -not $dryRun ){
        Write-Output "Changing jFrog password"
        #Write-Output "new Pasword : $jfrogNewPassword"
        $result = Set-jFrogNewPassword @params
        Write-Output "Password has been changed Successfully"

    } else {
        Write-Output "Skiping jFrog password change as this script is running as dry-run"
    }
} catch {
    Write-Error "$failChangePassErrorMessage `nOriginal error: $($_.errordetails.message)"
    exit 1
}


# Update Secret in KV
  try {
    if ( -not $dryRun ){
        Write-Output "Changing password in Key Vault"
        Set-AzKeyVaultSecret -VaultName $kvName -Name $secretNamePass -SecretValue $(ConvertTo-SecureString $jfrogNewPassword -AsPlainText -Force) | Out-Null
    } else {
        Write-Output "Skiping password change in Key Vault as this script is running as dry-run"
    }
} catch {
    # RollBack password update
    Write-Error "Failed to set the password in key vault. Reverting the jFrog password change."
    $params = @{
        "apiKey" = $apiKey
        "jfrogNewPassword" = $jfrogOldPassword
        "jfrogOldPassword" = $jfrogNewPassword
        "url" = $jfrogUri
    }
    Set-jFrogNewPassword @params
    exit 1
} 

if ( $dryRun ){
    Write-Output "Script running as dry-run. Generated password: $jfrogNewPassword"
} else {
    Write-Output "Setting new password variable with the name 'generatedPassword'"
}

#Write-Host "##vso[task.setvariable variable=generatedPassword]$jfrogNewPassword"
