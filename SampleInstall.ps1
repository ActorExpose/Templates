#Install Plaster, Pester and TSxRnD
Invoke-WebRequest "https://raw.githubusercontent.com/TrueSec-Infra/Templates/master/Install-TSxRnDKit.ps1" -OutFile $env:TEMP\Install-TSxRnDKit.ps1
& $env:TEMP\Install-TSxRnDKit.ps1

#Set/update config for PowerShellscripts
Import-Module TSxRnD -Force -Verbose
Set-TSxDefaultUserData -Author "First Last" -Twitter "@Handle" -EMail "first.last@company.com" -Blog "https://blog.com" -Company "Company" -CompanyWeb "https://www.company.com"

#Download the templates from our GitHub Repo
Update-TSxTemplates

#Create Scripts for Community
New-TSxPowerShellScript -Path C:\Temp -ScriptName Test1.ps1 -TemplateName Default -Class Community

#Create Scripts for Company
New-TSxPowerShellScript -Path C:\Temp -ScriptName Test1.ps1 -TemplateName Default -Class Company

#Get-PlasterTemplate
Invoke-Plaster -TemplatePath "C:\Program Files\WindowsPowerShell\Modules\Plaster\1.1.3\Templates\NewPowerShellScriptModule" -DestinationPath C:\Temp -Force
