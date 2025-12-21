# start-adk-web.ps1 - the customized ADK web server 

# Set the console window title
$host.ui.RawUI.WindowTitle = "ADK Web 4200"

# Activate the virtual environment for ChatLKK
Set-Location -Path "$env:USERPROFILE\venvs\adks"
# Activate the virtual environment
& .\Scripts\Activate.ps1

# Define the directory for the ADK web project and the backend URL
$adkWebDir = "$env:USERPROFILE\Documents\GitHub\adk-web"
$backendUrl = "http://localhost:8000"

# Check if the ADK web directory exists
if (-Not (Test-Path $adkWebDir)) {
    Write-Host "The directory $adkWebDir does not exist. Please check the path."
    exit 1
}

# Change to the ADK web directory and start the ADK web server
Set-Location -Path $adkWebDir
npm run serve --backend=$backendUrl