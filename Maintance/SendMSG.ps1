(Get-ADComputer -SearchBase "OU=DomainUsers,DC=domain,dc=name" -Filter *).Name | Foreach-Object {Invoke-Command -ComputerName $_ {msg * "Message here"}}
