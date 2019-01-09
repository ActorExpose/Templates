﻿#Module for TSxRnD

Function Update-TSxTemplates{
    #Download Template folder as ZIP from GitHub
    Import-Module -Name Plaster -ErrorAction Stop
    $TemplatePath = "$((Get-Module -Name Plaster).ModuleBase)\Templates"
    Invoke-WebRequest -Uri "https://github.com/TrueSec-Infra/Templates/archive/master.zip" -OutFile $env:TEMP\TSxTemplates.zip
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
Function New-TSxPowerShellScript{
    [CmdletBinding(SupportsShouldProcess=$true, 
                  PositionalBinding=$false)]
    [Alias("New-TSxPSS")]
    Param(
        $Path,
        $ScriptName,
        $TemplateName = "Default",
        $Class
    )
    $RootFolder = "$((Get-Module -Name TSxRnD).ModuleBase)\Templates"
    $CSVdata = Import-Csv -Path $RootFolder\data.csv

    If($TemplateName -eq "Default"){
        Copy-Item -Path $RootFolder\Source\$TemplateName.ps1 -Destination $Path\$ScriptName -ErrorAction Stop
    }

    If ($Class -eq "Company"){
        (Get-Content $Path\$ScriptName) -replace ('#DATA1#',"    ScriptName: $ScriptName") | Out-File $Path\$ScriptName
        (Get-Content $Path\$ScriptName) -replace ('#DATA2#',"    Author:     $($CSVdata.Author)") | Out-File $Path\$ScriptName
        (Get-Content $Path\$ScriptName) -replace ('#DATA3#',"    Twitter:    $($CSVdata.Twitter)") | Out-File $Path\$ScriptName
        (Get-Content $Path\$ScriptName) -replace ('#DATA4#',"    Email:      $($CSVdata.Email)") | Out-File $Path\$ScriptName
        (Get-Content $Path\$ScriptName) -replace ('#DATA5#',"    Web:        $($CSVdata.CompanyWeb)") | Out-File $Path\$ScriptName
        (Get-Content $Path\$ScriptName) -replace ('#DATA6#',"$(Get-Date)") | Out-File $Path\$ScriptName
        (Get-Content $Path\$ScriptName) -replace ('#DATA7#',"$((Get-Date).Year)") | Out-File $Path\$ScriptName
        (Get-Content $Path\$ScriptName) -replace ('#DATA8#',"$($CSVdata.Company)") | Out-File $Path\$ScriptName
    }

    If ($Class -eq "Community"){
        (Get-Content $Path\$ScriptName) -replace ('#DATA1#',"    ScriptName: $ScriptName") | Out-File $Path\$ScriptName
        (Get-Content $Path\$ScriptName) -replace ('#DATA2#',"    Author:     $($CSVdata.Author)") | Out-File $Path\$ScriptName
        (Get-Content $Path\$ScriptName) -replace ('#DATA3#',"    Twitter:    $($CSVdata.Twitter)") | Out-File $Path\$ScriptName
        (Get-Content $Path\$ScriptName) -replace ('#DATA4#',"    Email:      $($CSVdata.Email)") | Out-File $Path\$ScriptName
        (Get-Content $Path\$ScriptName) -replace ('#DATA5#',"    Blog:       $($CSVdata.Blog)") | Out-File $Path\$ScriptName
        (Get-Content $Path\$ScriptName) -replace ('#DATA6#',"$(Get-Date)") | Out-File $Path\$ScriptName
        (Get-Content $Path\$ScriptName) -replace ('#DATA7#',"$((Get-Date).Year)") | Out-File $Path\$ScriptName
        (Get-Content $Path\$ScriptName) -replace ('#DATA8#',"$($CSVdata.Author)") | Out-File $Path\$ScriptName

    }
}
Function Set-TSxDefaultUserData{
    Param(
       $Author,
       $Twitter,
       $EMail,
       $Blog,
       $Company,
       $CompanyWeb
    )
    $RootFolder = "$((Get-Module -Name TSxRnD).ModuleBase)\Templates"
    Set-Content -Path "$RootFolder\data.csv" -Value "Author,Twitter,Email,Blog,Company,CompanyWeb" -Force
    Add-Content -Path "$RootFolder\data.csv" -Value "$Author,$Twitter,$Email,$Blog,$Company,$CompanyWeb" -Force
}
