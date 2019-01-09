Param(
    [string]$TSxPlasterTemplatePath
)
#Installer for TSxRnD
Write-Host "Installing TSxRnD 1.0"

#Creating Folder for PlasterTemplates
New-Item -Path $TSxPlasterTemplatePath -ItemType Directory -ErrorAction Stop -Force

#Adding RegValue for Template Path
New-Item -Path HKCU:\TSx -Force
New-ItemProperty -Path HKCU:\TSx -Name PlatserTemplatePath -PropertyType String -Value $TSxPlasterTemplatePath -Force -ErrorAction Stop

#Install Module for Plaster
Install-Module -Name Plaster -SkipPublisherCheck -ErrorAction Stop

#Install Module for Plaster
Install-Module -Name Pester -SkipPublisherCheck -Force -ErrorAction Stop

