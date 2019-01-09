#Installer for TSxRnD
Write-Host "Installing TSxRnD 1.1"

#Install Module for Plaster
Write-Host "Checking for Plaster"
If((Get-Module -ListAvailable | Where-Object Name -EQ Plaster).count -eq 0){
    Write-Host "Plaster not found, installing"
    Install-Module -Name Plaster -SkipPublisherCheck -Force -ErrorAction Stop
}
Write-Host "Plaster is installed"
Get-Module -ListAvailable -Name Plaster

#Install Module for Pester
Write-Host "Installing Pester"
Install-Module -Name Pester -SkipPublisherCheck -Force -ErrorAction Stop
Write-Host "Plaster is installed"
Get-Module -ListAvailable -Name Pester

#Install Module TSxRnD
Write-Host "Installing TSxRnD"
$ModuleFolder = "$env:ProgramFiles\WindowsPowerShell\Modules\TSxRnD"
New-Item -Path $ModuleFolder -ItemType Directory -Force
New-Item -Path $ModuleFolder\Templates -ItemType Directory -Force
$Files = "TSxRnD.psd1","TSxRnD.psm1"

foreach($File in $files){
    Invoke-WebRequest "https://raw.githubusercontent.com/TrueSec-Infra/Templates/master/$File" -OutFile $env:TEMP\$File
    Copy-Item -Path $env:TEMP\$File -Destination $ModuleFolder -Force
}
Import-Module TSxRnD
Get-Module -ListAvailable -Name TSxRnD
