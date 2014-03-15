##############################################################################################
# Load PowerShell Profile .profile.ps1 - https://github.com/ntwb/dotfiles
# Called from C:\Users\Stephen\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
##############################################################################################

# Start Loading message
Write-Host -ForegroundColor Green "--> Begin all the things..."

# Environment Loading message
Write-Host -ForegroundColor Green "--> Setup PowerShell Environment..."

# Load posh-monokai https://github.com/ntwb/posh-monokai
Write-Host -nonewline -ForegroundColor Cyan "--> [posh-monokai] "
Write-Host -ForegroundColor Magenta "Windows PowerShell Monokai Console Color Scheme"
. 'C:\Users\Stephen\dev\posh-monokai\posh-monokai.ps1'

# Setup local envionment paths
$env:PSModulePath = $env:PSModulePath + ";C:\Users\Stephen\.dotfiles\powershell\modules\"
$env:Path         = $env:Path         + ";C:\Users\Stephen\.dotfiles\powershell\profiles"
Write-Host -nonewline -ForegroundColor Cyan "--> [dofiles] "
Write-Host -ForegroundColor Magenta "PowerShell profiles & modules... Done."

# Setup Sublime Text 3 alias & path
Set-Alias subl "$HOME \.sublimetext\sublime_text.exe"
$env:EDITOR = $HOME + "\.sublimetext\sublime_text.exe"
Write-Host -nonewline -ForegroundColor Cyan "--> [Sublime Text 3] "
Write-Host -ForegroundColor Magenta "--> Sublime Text 3 'subl' alias, env:editor variable... Done."

# Import PowerShell Modules
Write-Host -ForegroundColor Green "--> Import PowerShell Modules..."

# GitHub for Windows https://windows.github.com/
. (Resolve-Path "$env:LOCALAPPDATA\GitHub\shell.ps1")
Write-Host -ForegroundColor Cyan "--> [GitHub]"

# Load posh-git example profile
. 'C:\Users\Stephen\dev\posh-git\profile.example.ps1'
Write-Host -ForegroundColor Cyan "--> [PoSh-Git]"

# Load posh-svn example profile
. 'C:\Users\Stephen\dev\posh-svn\profile.example.ps1'
Write-Host -ForegroundColor Cyan "--> [PoSh-Svn]"

# Load PowerShell Community Extension 3.0 Module
Import-Module Pscx -arg "C:\Users\Stephen\.dotfiles\powershell\modules\Pscx\Pscx.UserPreferences.ps1"
Write-Host -ForegroundColor Cyan "--> [Pscx]"

# Load PsGet Module https://github.com/psget/psget/
Import-Module PsGet
Write-Host -ForegroundColor Cyan "--> [PsGet]"

# Load posh-npm profile https://github.com/MSOpenTech/posh-npm
. 'C:\Users\Stephen\dev\posh-npm\profile.example.ps1'
Write-Host -ForegroundColor Cyan "--> [posh-npm]"

# Setup Developer Frameworks
Write-Host -ForegroundColor Green "--> Setup Developer Frameworks..."

# PHP for Windows http://php.net/
    Write-Host -nonewline -ForegroundColor Cyan "--> [PHP]    "

    if (Test-Path "C:\PHP") {
        $PHPPath = "C:\PHP"
    }

    else {
        Write-Host -ForegroundColor Red " Not found"
    }

    $env:Path = $env:Path + ";$PHPPath"
    Write-Host -ForegroundColor Magenta "$PHPPath"

# Python scripts inside same PowerShell window http://mycomputeradventures.blogspot.com.au/2012/09/python-scripts-inside-powershell-window.html
    $env:PATHEXT += ";.py"

# Finish loading message
Write-Host -ForegroundColor Green "--> Finish all the things..."
