##############################################################################################
# Load PowerShell Profile .profile.ps1 - https://github.com/ntwb/dotfiles
# Called from C:\Users\Stephen\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 
##############################################################################################

$env:Path = $env:Path + ";C:\Users\Stephen\AppData\Local\GitHub\PortableGit_8810fd5c2c79c73adcc73fd0825f3b32fdb816e7\cmd"
$env:Path = $env:Path + ";C:\Users\Stephen\AppData\Local\GitHub\PortableGit_8810fd5c2c79c73adcc73fd0825f3b32fdb816e7\bin"
$env:Path = $env:Path + ";C:\Program Files\nodejs"
$env:Path = $env:Path + ";C:\Users\Stephen\AppData\Roaming\npm"
$env:Path = $env:Path + ";C:\PHP"


# Load posh-git example profile
. 'H:\dev\_git\posh-git\profile.example.ps1'
