$PCs = (Get-ADComputer -Filter * -SearchBase "OU=DomainUsers,DC=domain,dc=name").name|Select-String "VM"
foreach ( $i in $PCs )
{
# Reboot all VM's
#echo $i >> c:\jobs\log.txt
shutdown /m \\$i /f /r /t 0 /c "Reboot VM"
Start-Sleep -Seconds 5
}
