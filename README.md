# TrueSec Templates

The following instructions will install the Pester, Plaster and TSxRNd modules. The TSxRnD module contains functions to download and update templates. Plaster is currently used for creating Modules and TSxRnD is used for regular PowerShell scripts in any editor.

## Installation

### Download the bootstrap
```sh
Invoke-WebRequest "https://raw.githubusercontent.com/TrueSec-Infra/Templates/master/Install-TSxRnDKit.ps1" -OutFile $env:TEMP\Install-TSxRnDKit.ps1
```
### Run the installer
```sh
& $env:TEMP\Install-TSxRnDKit.ps1
```
### Set/update config for PowerShellscripts
```sh
Import-Module TSxRnD -Force -Verbose
```
```sh
Set-TSxDefaultUserData -Author "Your Name" -Twitter "@YourHandle" -EMail "your.email@internet.com" -Blog "https://bestblog.com" -Company "Company" -CompanyWeb "https://www.company.com"
```
### Download/Update templates
```sh
Update-TSxTemplates
```
### Create Scripts
For Community
```sh
New-TSxPowerShellScript -Path C:\Temp -ScriptName Test1.ps1 -TemplateName Default -Class Community
```
For Company
```sh
New-TSxPowerShellScript -Path C:\Temp -ScriptName Test2.ps1 -TemplateName Default -Class Company
```
### Create new PowerShell Module using Plaster
To see your templates (and paths)
```sh
Get-PlasterTemplate
```
To create a powershell module
```sh
Invoke-Plaster -TemplatePath "C:\Program Files\WindowsPowerShell\Modules\Plaster\1.1.3\Templates\NewPowerShellScriptModule" -DestinationPath C:\Temp -Force
```
