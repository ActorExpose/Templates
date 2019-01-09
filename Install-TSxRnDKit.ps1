#Installer for TSxRnD
Write-Host "Installing TSxRnD 1.1"

#Install Module for Plaster
Install-Module -Name Plaster -SkipPublisherCheck -ErrorAction Stop

#Install Module for Plaster
Install-Module -Name Pester -SkipPublisherCheck -Force -ErrorAction Stop
