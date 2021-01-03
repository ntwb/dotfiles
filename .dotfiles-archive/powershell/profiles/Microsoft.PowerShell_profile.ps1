##############################################################################################
# Load PowerShell Profile .profile.ps1 - https://github.com/ntwb/dotfiles
# Called from C:\Users\Stephen\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
##############################################################################################
# red background if running elevated
& {
 $wid=[System.Security.Principal.WindowsIdentity]::GetCurrent()
 $prp=new-object System.Security.Principal.WindowsPrincipal($wid)
 $adm=[System.Security.Principal.WindowsBuiltInRole]::Administrator
 $IsAdmin=$prp.IsInRole($adm)
 if ($IsAdmin)
 {
  (get-host).UI.RawUI.Backgroundcolor="DarkRed"
  clear-host
 }
}
. '~\.dotfiles\powershell\profiles\.profile.ps1'
