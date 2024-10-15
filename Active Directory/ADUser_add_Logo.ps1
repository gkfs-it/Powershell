$ADphoto = [byte[]](Get-Content -Path \\domain.name\NETLOGON\logo\logo.png -Encoding byte)

$userslist = (Get-ADUser -Filter * -SearchBase "OU=DomainUsers,DC=domain,DC=name").SamAccountName
foreach ($users in $userslist) {
# echo "Username is $users"
 
Set-ADUser -Identity $users -Replace @{thumbnailPhoto=$ADphoto}
}
