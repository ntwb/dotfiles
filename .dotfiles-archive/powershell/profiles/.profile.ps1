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
$env:Path         = $env:Path         + ";C:\Users\Stephen\.dotfiles\powershell\profiles;C:\Users\Stephen\.dotfiles\bin"
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

# Load posh-npm profile https://github.com/MSOpenTech/posh-npm
. 'C:\Users\Stephen\dev\posh-npm\profile.example.ps1'
Write-Host -ForegroundColor DarkRed "--> [posh-npm]"

# check for OneGet
# $oneget = scoop which oneget
# if($lastexitcode -ne 0) { 'OneGet isn''t installed. run ''scoop install OneGet'''; return }
Import-Module C:\Users\Stephen\AppData\Local\scoop\apps\OneGet\nightly\oneget
Write-Host -ForegroundColor DarkRed "--> [OneGet] "
# Write-Host  -ForegroundColor DarkMagenta "     --> OneGet              -> $oneget "

# Setup Developer Frameworks
Write-Host -ForegroundColor DarkGreen "--> Setup Developer Frameworks..."

# check for Nginx
$nginx = scoop which nginx
if($lastexitcode -ne 0) { 'Nginx isn''t installed. run ''scoop install nginx'''; return }
Write-Host -nonewline -ForegroundColor DarkRed "--> [Nginx] "
Write-Host  -ForegroundColor DarkMagenta "             --> Nginx              -> $nginx "

# PHP for Windows http://php.net/
    Write-Host -nonewline -ForegroundColor DarkRed "--> [PHP]    "

    if (Test-Path "C:\PHP") {
        $PHPPath = "C:\PHP"
    }

    else {
        Write-Host -ForegroundColor Red " Not found"
    }

    $env:Path = $env:Path + ";C:\xampp\php"
    Write-Host -ForegroundColor DarkMagenta "            --> $PHPPath"

$env:PHPPath = "C:\xampp\php"
# Write-Host -nonewline -ForegroundColor DarkRed "--> [PHP] "
# Write-Host -ForegroundColor DarkMagenta "             --> PHP -> PHPPath   = $env:PHPPath"

# Composer ~/.composer/vendor/bin/
$env:COMPOSER_HOME = "C:\Users\Stephen\.composer"
Write-Host -nonewline -ForegroundColor DarkRed "--> [Composer] "
Write-Host -ForegroundColor DarkMagenta "          --> Composer           -> COMPOSER_HOME      = $env:COMPOSER_HOME"
$env:Path = $env:Path         + ";C:\Users\Stephen\.composer\vendor\bin"
# $env:Path = $env:Path         + ";C:\Users\Stephen\AppData\Roaming\Composer\vendor\bin"

# Go ~/.gopath
$env:GOPATH = "C:\Users\Stephen\.gopath"
$env:GOARCH = "amd64"
Write-Host -nonewline -ForegroundColor DarkRed "--> [Go] "
Write-Host -ForegroundColor DarkMagenta "                --> Go                 -> GOPATH             = $env:GOPATH"
$env:Path = $env:Path         + ";C:\Users\Stephen\.gopath"

# OpenSSL
$env:OPENSSL_CONF = "C:\Users\Stephen\AppData\Local\scoop\apps\openssl\1.0.1i\bin\openssl.cfg"
Write-Host -nonewline -ForegroundColor DarkRed "--> [OpenSSL ] "
Write-Host -ForegroundColor DarkMagenta "          --> OpenSSL            -> OPENSSL_CONF       = $env:OPENSSL_CONF"

# check for Python
$python = scoop which python
if($lastexitcode -ne 0) {
    Write-Host -nonewline -ForegroundColor DarkRed "--> [Python] "
    Write-Host  -ForegroundColor DarkMagenta "Python isn''t installed. run scoop install python"
}
Write-Host -nonewline -ForegroundColor DarkRed "--> [Python] "
Write-Host  -ForegroundColor DarkMagenta "            --> Python             -> $python "

# Python scripts inside same PowerShell window http://mycomputeradventures.blogspot.com.au/2012/09/python-scripts-inside-powershell-window.html
$env:PATHEXT += ";.py"


$env:PYTHONHOME = "C:\Users\Stephen\AppData\Local\scoop\apps\python27\2.7.6"
$env:PYTHONPATH = "C:\Users\Stephen\AppData\Local\scoop\apps\python27\2.7.6;C:\Users\Stephen\AppData\Local\scoop\apps\python27\2.7.6\include;C:\Users\Stephen\AppData\Local\scoop\apps\python27\2.7.6\DLLs;C:\Users\Stephen\AppData\Local\scoop\apps\python27\2.7.6\Lib"
#$env:PythonPath = "C:\Users\Stephen\AppData\Local\scoop\apps\python\3.4.0;C:\Users\Stephen\AppData\Local\scoop\apps\python\3.4.0\include;C:\Users\Stephen\AppData\Local\scoop\apps\python\3.4.0\DLLs;C:\Users\Stephen\AppData\Local\scoop\apps\python\3.4.0\Lib"
$env:Path = $env:Path + ";C:\Users\Stephen\AppData\Local\scoop\apps\python27\2.7.6;C:\Users\Stephen\AppData\Local\scoop\apps\python27\2.7.6\include;C:\Users\Stephen\AppData\Local\scoop\apps\python27\2.7.6\DLLs;C:\Users\Stephen\AppData\Local\scoop\apps\python27\2.7.6\Lib"

# Setup WordPress Environment
Write-Host -ForegroundColor DarkGreen "--> Setup WordPress Environment..."

# Setup WordPress PHPUnit tests
$env:WP_TESTS_DIR = "C:\xampp\htdocs\develop.wp.nw\tests\phpunit"
Write-Host -nonewline -ForegroundColor DarkRed "--> [WordPress] "
Write-Host -ForegroundColor DarkMagenta "         --> WordPress PHPUnit  -> WP_TESTS_DIR       = $env:WP_TESTS_DIR"

$env:WP_DEVELOP_DIR = "C:\xampp\htdocs\develop.wp.nw"
Write-Host -nonewline -ForegroundColor DarkRed "--> [WordPress] "
Write-Host -ForegroundColor DarkMagenta "         --> WordPress PHPUnit  -> WP_DEVELOP_DIR     = $env:WP_DEVELOP_DIR"

$env:BP_TESTS_DIR = "F:\buddypress\tests"
Write-Host -nonewline -ForegroundColor DarkRed "--> [BuddyPress] "
Write-Host -ForegroundColor DarkMagenta "        --> BuddyPress PHPUnit -> BP_TESTS_DIR       = $env:BP_TESTS_DIR"

$env:BBP_TESTS_DIR = "F:\bbPress\tests"
Write-Host -nonewline -ForegroundColor DarkRed "--> [bbPress] "
Write-Host -ForegroundColor DarkMagenta "           --> bbPress PHPUnit    -> BBP_TESTS_DIR      = $env:BBP_TESTS_DIR"

# $env:WP_CLI = "C:\xampp\htdocs\wporg-developer\wporg-developer-content\plugins\wp-cli\bin"
Write-Host -nonewline -ForegroundColor DarkRed "--> [WP-CLI] "
Write-Host -ForegroundColor DarkMagenta "            --> WP-CLI             -> WP_CLI             = $env:WP_CLI"

# $env:WP_CLI_PHP = "C:\xampp\php"
Write-Host -nonewline -ForegroundColor DarkRed "--> [WP_CLI_PHP] "
Write-Host -ForegroundColor DarkMagenta "        --> WP_CLI_PHP         -> WP_CLI_PHP         = $env:WP_CLI_PHP"

# $env:WP_CLI_CONFIG_PATH = "C:\Users\Stephen\.wp-cli\config.yml"
Write-Host -nonewline -ForegroundColor DarkRed "--> [WP_CLI_CONFIG_PATH] "
Write-Host -ForegroundColor DarkMagenta "--> WP_CLI_CONFIG_PATH -> WP_CLI_CONFIG_PATH = $env:WP_CLI_CONFIG_PATH"

set-alias which where.exe

# Finish loading message
Write-Host -ForegroundColor DarkGreen "--> Finish all the things..."

try { $null = gcm pshazz -ea stop; pshazz init 'default' } catch { }
