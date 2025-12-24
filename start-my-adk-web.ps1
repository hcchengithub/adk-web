# start-adk-web.ps1 - the customized ADK web server

# Set the console window title
$host.ui.RawUI.WindowTitle = "ADK Web 4200"

# Determine paths based on computer name
$computerName = $env:COMPUTERNAME
if ($computerName -eq "TPEA90107673") {
    # LBB2
    $venvPath = "$env:USERPROFILE\venvs\adks"
    $adkWebDir = "$env:USERPROFILE\Documents\GitHub\adk-web"
} elseif ($computerName -eq "TPEA90169344") {
    # LCH3
    $venvPath = "D:\uv\venvs\adks"
    $adkWebDir = "D:\GitHub\adk-web"
} else {
    Write-Host "Unknown computer: $computerName. Please configure paths for this machine."
    exit 1
}

# Activate the virtual environment
Set-Location -Path $venvPath
& .\Scripts\Activate.ps1

# Define the backend URL
$backendUrl = "http://localhost:8000"

# Check if the ADK web directory exists
if (-Not (Test-Path $adkWebDir)) {
    Write-Host "The directory $adkWebDir does not exist. Please check the path."
    exit 1
}

# Change to the ADK web directory and start the ADK web server
Set-Location -Path $adkWebDir
npm run serve --backend=$backendUrl