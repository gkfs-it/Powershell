$PCs = (Get-ADComputer -Filter * -SearchBase "OU=Computers,DC=domain,dc=name").name
foreach ( $i in $PCs )
{
echo $i
shutdown /m \\$i /f /s /t 0 /c "Shutdown PC"
}
