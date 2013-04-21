##############################################################################################
# Load PowerShell Profile .profile.ps1 - https://github.com/ntwb/dotfiles
# Called from C:\Users\Stephen\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
##############################################################################################

# Start Loading message
Write-Host -ForegroundColor Green "--> Begin all the things..."

# Start Loading message
Write-Host -ForegroundColor Green "--> Setup PowerShell Environment..."

# Load posh-monokai https://github.com/ntwb/posh-monokai
Write-Host -ForegroundColor White "--> [posh-monokai] Windows PowerShell Monokai Console Color Scheme"
. 'H:\dev\_git\posh-monokai\posh-monokai.ps1'

# Setup local envionment paths
$env:PSModulePath = $env:PSModulePath + ";C:\Users\Stephen\.dotfiles\powershell\modules\"
$env:Path         = $env:Path         + ";C:\Users\Stephen\.dotfiles\powershell\profiles"
Write-Host -ForegroundColor White "--> PowerShell profiles & modules... Done."

# Setup Sublime Text 2 alias & path
Set-Alias subl "C:\Program Files\Sublime Text 2\sublime_text.exe"
Write-Host -ForegroundColor White "--> Sublime Text 2 'subl' alias... Done."

# GitHub for Windows https://windows.github.com/
. (Resolve-Path "$env:LOCALAPPDATA\GitHub\shell.ps1")
Write-Host -ForegroundColor White "--> GitHub... Done."

# NodeJS x64 for Windows http://nodejs.org/
$env:Path = $env:Path + ";C:\Program Files\nodejs"
$env:Path = $env:Path + ";C:\Users\Stephen\AppData\Roaming\npm"
Write-Host -ForegroundColor White "--> NodeJS... Done."

# Ruby for Windows https://github.com/oneclick/rubyinstaller
    Write-Host -nonewline -ForegroundColor Blue "[Ruby] "

    if (Test-Path "C:\Ruby193") {
        $RubyPath = "C:\Ruby193"
    }

    elseif (Test-Path "C:\Ruby192") {
        $RubyPath = "C:\Ruby192"
    }

    else {
        Write-Host -ForegroundColor Red " Not found"
    }

    $env:Path = $env:Path + ";$RubyPath\bin"
    Write-Host -ForegroundColor Magenta "$RubyPath"

# PHP for Windows http://php.net/
    Write-Host -nonewline -ForegroundColor Blue "[PHP] "

    if (Test-Path "C:\PHP") {
        $PHPPath = "C:\PHP"
    }

    else {
        Write-Host -ForegroundColor Red " Not found"
    }

    $env:Path = $env:Path + ";$PHPPath"
    Write-Host -ForegroundColor Magenta "$PHPPath"

# Python for Windows 2.7.3 http://www.python.org/download/
    Write-Host -nonewline -ForegroundColor Blue "[Python] "

    if (Test-Path "C:\Python33") {
        $env:PythonPath = "C:\Python33;C:\Python33\DLLs;C:\Python33\Lib;C:\Python33\Lib\lib-tk;C:\Python33\Scripts;"
        $env:PythonHome = "C:\Python33"
    }

    elseif (Test-Path "C:\Python32") {
        $env:PythonPath = "C:\Python32;C:\Python32\DLLs;C:\Python32\Lib;C:\Python32\Lib\lib-tk;C:\Python32\Scripts;"
        $env:PythonHome = "C:\Python32"
    }

    elseif (Test-Path "C:\Python27") {
        $env:PythonPath = "C:\Python27;C:\Python27\DLLs;C:\Python27\Lib;C:\Python27\Lib\lib-tk;C:\Python27\Scripts;"
        $env:PythonHome = "C:\Python27"
    }

    elseif (Test-Path "C:\Python26") {
        $env:PythonPath = "C:\Python26;C:\Python26\DLLs;C:\Python26\Lib;C:\Python26\Lib\lib-tk;C:\Python26\Scripts;"
        $env:PythonHome = "C:\Python26"
    }

    else {
        Write-Host -ForegroundColor Red " Not found"
    }

    $env:Path = $env:Path + ";$PythonHome"
    Write-Host -ForegroundColor Magenta "$env:PythonHome"

# Python scripts inside same PowerShell window http://mycomputeradventures.blogspot.com.au/2012/09/python-scripts-inside-powershell-window.html
    $env:PATHEXT += ";.py"

# Load posh-git example profile
. 'H:\dev\_git\posh-git\profile.example.ps1'
Write-Host -ForegroundColor White "--> PoSh-Git... Done."

# Load PowerShell Community Extension 3.0 Module
Import-Module Pscx -arg "C:\Users\Stephen\.dotfiles\powershell\modules\Pscx\Pscx.UserPreferences.ps1"
Write-Host -ForegroundColor White "--> Pscx... Done."

# Load PsGet Module https://github.com/psget/psget/
Import-Module PsGet
Write-Host -ForegroundColor White "--> PsGet... Done."

# Load posh-npm profile https://github.com/MSOpenTech/posh-npm
. 'C:\Users\Stephen\.dotfiles\powershell\modules\posh-npm\profile.example.ps1'
Write-Host -ForegroundColor White "--> posh-npm... Done."

# Finish loading message
Write-Host -ForegroundColor Green "--> Finish all the things..."
