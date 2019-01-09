#Installer for TSxRnD
Write-Host "Installing TSxRnD 1.1"

#Install Module for Plaster
Write-Host "Checking for Plaster"
If((Get-Module -ListAvailable | Where-Object Name -EQ Plaster).count -eq 0){
    Write-Host "Plaster not found, installing"
    Install-Module -Name Plaster -SkipPublisherCheck -Force -ErrorAction Stop
}
Get-Module -ListAvailable -Name Plaster

#Install Module for Pester
Install-Module -Name Pester -SkipPublisherCheck -Force -ErrorAction Stop
Get-Module -ListAvailable -Name Pester
