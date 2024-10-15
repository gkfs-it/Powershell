$PCs = (Get-ADComputer -Filter * -SearchBase "OU=DomainUsers,DC=domain,dc=name").name|Select-String "VM"
foreach ( $i in $PCs )
{
    # Reboot all VM's
    echo $i
    # ping -n 1 $i
    $Target = "\\$i\c$\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\beebeep.lnk"
    if (Test-Path -Path $Target) {
        del $Target
    }
}
