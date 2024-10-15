Import-Module activedirectory
Import-Csv "C:\parh\to\new_ad_users.csv" | ForEach-Object {
$upn = $_.SamAccountName + "@domain.name"
$fullname = $_.LastN + " " + $_.Initials
New-ADUser -Name $fullname -AccountPassword (ConvertTo-SecureString A123456z -AsPlainText -Force) -ChangePasswordAtLogon $true -Company $_.Company -Description $_.JobTitle -DisplayName $fullname -Enabled $true -GivenName $_.FirstN -Initials $_.Initials -Path $_.OU -SamAccountName $_.samAccountName -Surname $_.LastN -Title $_.JobTitle -UserPrincipalName $upn
Add-AdGroupMember -Identity $_.Group -Members $_.samAccountName
}
