# TrueSec PowerShell Templates

Install Plaster, Pester and TSxRnD
Invoke-WebRequest "https://raw.githubusercontent.com/TrueSec-Infra/Templates/master/Install-TSxRnDKit.ps1" -OutFile $env:TEMP\Install-TSxRnDKit.ps1
& $env:TEMP\Install-TSxRnDKit.ps1

Download the templates from our GitHub Repo
Update-TSxTemplates
