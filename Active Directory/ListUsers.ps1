$objSearcher = New-Object System.DirectoryServices.DirectorySearcher
$objSearcher.SearchRoot = "LDAP://ou=DomainUsers,dc=domain,dc=name"
$objSearcher.Filter = "(&(objectCategory=person)(!userAccountControl:1.2.840.113556.1.4.803:=2))"
$users = $objSearcher.FindAll()
$users.Count
$users | ForEach-Object {
   $user = $_.Properties
   New-Object PsObject -Property @{
   ��������� = [string]$user.description
   ����� = [string]$user.department
   ��������� = [string]$user.userprincipalname
   ������� = [string]$user.telephonenumber
   ������� = [string]$user.physicaldeliveryofficename
   ��� = [string]$user.cn
    }
} | Export-Csv -NoClobber -Encoding utf8 -Path  C:\path\to\list_user.csv
