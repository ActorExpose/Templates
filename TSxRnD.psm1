#Module for TSxRnD

Function Update-TSxTemplates{
    #Download Template folder as ZIP from GitHub
    Import-Module -Name Plaster -ErrorAction Stop
    $TemplatePath = "$((Get-Module -Name Plaster).ModuleBase)\Templates"
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest "https://github.com/TrueSec-Infra/Templates/archive/master.zip" -OutFile $env:TEMP\TSxTemplates.zip
    If((Test-Path $env:TEMP\TSxTemplates.zip) -eq $true){
        Write-Host "Download was successful"
        Expand-Archive -Path $env:TEMP\TSxTemplates.zip -DestinationPath $env:TEMP -Force
        $TemplateFolders = Get-ChildItem -Path $env:TEMP\templates-master -Directory
        foreach($TemplateFolder in $TemplateFolders){
            Copy-Item -Path $TemplateFolder.FullName -Destination $TemplatePath -Recurse -Force
        }
        Remove-Item -Path $env:TEMP\TSxTemplates.zip
        Remove-Item -Path $env:TEMP\templates-master -Recurse
    }
}
