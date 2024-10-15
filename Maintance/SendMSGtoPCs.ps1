$PCs = (Get-ADComputer -Filter * -SearchBase "OU=Computers,OU=DomainUsers,DC=domain,dc=name").name + (Get-ADComputer -Filter * -SearchBase "OU=Terminal Servers,OU=FDomainUsers,DC=domain,dc=name").name
foreach ( $i in $PCs )
{
echo $i
msg * /server:$i "Message here"
Start-Sleep -Seconds 15
}
