##############################################################################################
# Load PowerShell Profile .profile.ps1 - https://github.com/ntwb/dotfiles
# Called from C:\Users\Stephen\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
##############################################################################################

# Start Loading message
Write-Host -ForegroundColor DarkGreen "--> Begin all the things..."

# Environment Loading message
Write-Host -ForegroundColor DarkGreen "--> Setup PowerShell Environment..."

# Output the current colors
Write-Host -nonewline -ForegroundColor DarkRed "--> [Colours] "
Write-Host -nonewline -ForegroundColor Black       "Black       " -BackgroundColor Black
Write-Host -nonewline -ForegroundColor DarkBlue    "DarkBlue    " -BackgroundColor Black
Write-Host -nonewline -ForegroundColor DarkGreen   "DarkGreen   " -BackgroundColor Black
Write-Host -nonewline -ForegroundColor DarkCyan    "DarkCyan    " -BackgroundColor Black
Write-Host -nonewline -ForegroundColor DarkRed     "DarkRed     " -BackgroundColor Black
Write-Host -nonewline -ForegroundColor DarkMagenta "DarkMagenta " -BackgroundColor Black
Write-Host -nonewline -ForegroundColor DarkYellow  "DarkYellow  " -BackgroundColor Black
Write-Host -ForegroundColor Gray                   "Gray        " -BackgroundColor Black
Write-Host -nonewline -ForegroundColor DarkRed "--> [Colours] "
Write-Host -nonewline -ForegroundColor DarkGray    "DarkGray    " -BackgroundColor Black
Write-Host -nonewline -ForegroundColor Blue        "Blue        " -BackgroundColor Black
Write-Host -nonewline -ForegroundColor Green       "Green       " -BackgroundColor Black
Write-Host -nonewline -ForegroundColor Cyan        "Cyan        " -BackgroundColor Black
Write-Host -nonewline -ForegroundColor Red         "Red         " -BackgroundColor Black
Write-Host -nonewline -ForegroundColor Magenta     "Magenta     " -BackgroundColor Black
Write-Host -nonewline -ForegroundColor Yellow      "Yellow      " -BackgroundColor Black
Write-Host -ForegroundColor White                  "White       " -BackgroundColor Black

# Setup local envionment paths
$env:PSModulePath = $env:PSModulePath + ";C:\Users\Stephen\.dotfiles\powershell\modules\"
$env:Path         = $env:Path         + ";C:\Users\Stephen\.dotfiles\powershell\profiles"
Write-Host -nonewline -ForegroundColor DarkRed "--> [dofiles] "
Write-Host -ForegroundColor DarkMagenta "PowerShell profiles & modules... Done."

# Setup Sublime Text 3 alias & path
Set-Alias subl "$HOME \.sublimetext\sublime_text.exe"
$env:EDITOR = "subl -w"
Write-Host -nonewline -ForegroundColor DarkRed "--> [Sublime Text 3] "
Write-Host -ForegroundColor DarkMagenta "--> Sublime Text 3 'subl' alias, env:editor variable... Done."

# Import PowerShell Modules
Write-Host -ForegroundColor DarkGreen "--> Import PowerShell Modules..."

# GitHub for Windows https://windows.github.com/
. (Resolve-Path "$env:LOCALAPPDATA\GitHub\shell.ps1")
Write-Host -ForegroundColor DarkRed "--> [GitHub]"

# Load posh-git example profile
. 'C:\Users\Stephen\dev\posh-git\profile.example.ps1'
Write-Host -ForegroundColor DarkRed "--> [PoSh-Git]"

# Load posh-svn example profile
. 'C:\Users\Stephen\dev\posh-svn\profile.example.ps1'
Write-Host -ForegroundColor DarkRed "--> [PoSh-Svn]"

# Load PowerShell Community Extension 3.0 Module
Import-Module Pscx -arg "C:\Users\Stephen\.dotfiles\powershell\modules\Pscx\Pscx.UserPreferences.ps1"
Write-Host -ForegroundColor DarkRed "--> [Pscx]"

# Load PsGet Module https://github.com/psget/psget/
Import-Module PsGet
Write-Host -ForegroundColor DarkRed "--> [PsGet]"

# Load posh-npm profile https://github.com/MSOpenTech/posh-npm
. 'C:\Users\Stephen\dev\posh-npm\profile.example.ps1'
Write-Host -ForegroundColor DarkRed "--> [posh-npm]"

# Setup Developer Frameworks
Write-Host -ForegroundColor DarkGreen "--> Setup Developer Frameworks..."

# check for Nginx
$nginx = scoop which nginx
if($lastexitcode -ne 0) { 'Nginx isn''t installed. run ''scoop install nginx'''; return }
Write-Host -nonewline -ForegroundColor DarkRed "--> [Nginx] "
Write-Host  -ForegroundColor DarkMagenta "     --> Nginx              -> $nginx "

# PHP for Windows http://php.net/
    Write-Host -nonewline -ForegroundColor DarkRed "--> [PHP]    "

    if (Test-Path "C:\PHP") {
        $PHPPath = "C:\PHP"
    }

    else {
        Write-Host -ForegroundColor Red " Not found"
    }

    $env:Path = $env:Path + ";$PHPPath"
    Write-Host -ForegroundColor DarkMagenta "    --> $PHPPath"

# Python scripts inside same PowerShell window http://mycomputeradventures.blogspot.com.au/2012/09/python-scripts-inside-powershell-window.html
    $env:PATHEXT += ";.py"
# Setup WordPress Environment
Write-Host -ForegroundColor DarkGreen "--> Setup WordPress Environment..."

# Setup WordPress PHPUnit tests
$env:WP_TESTS_DIR = "C:\xampp\htdocs\develop.wp.nw"
Write-Host -nonewline -ForegroundColor DarkRed "--> [WordPress] "
Write-Host -ForegroundColor DarkMagenta " --> WordPress PHPUnit  -> WP_TESTS_DIR   = $env:WP_TESTS_DIR"

$env:WP_DEVELOP_DIR = "C:\xampp\htdocs\develop.wp.nw\"
Write-Host -nonewline -ForegroundColor DarkRed "--> [WordPress] "
Write-Host -ForegroundColor DarkMagenta " --> WordPress PHPUnit  -> WP_DEVELOP_DIR = $env:WP_DEVELOP_DIR"

$env:BP_TESTS_DIR = "F:\buddypress\tests"
Write-Host -nonewline -ForegroundColor DarkRed "--> [BuddyPress] "
Write-Host -ForegroundColor DarkMagenta "--> BuddyPress PHPUnit -> BP_TESTS_DIR   = $env:BP_TESTS_DIR"

$env:BBP_TESTS_DIR = "F:\bbPress\tests"
Write-Host -nonewline -ForegroundColor DarkRed "--> [bbPress] "
Write-Host -ForegroundColor DarkMagenta "   --> bbPress PHPUnit    -> BBP_TESTS_DIR  = $env:BBP_TESTS_DIR"

# Finish loading message
Write-Host -ForegroundColor DarkGreen "--> Finish all the things..."
