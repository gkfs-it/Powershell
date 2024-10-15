#Get-ADUser -filter {Enabled -eq $True -and PasswordNeverExpires -eq $False}
Get-ADUser -filter {Enabled -eq $True} –Properties "DisplayName", "pwdLastSet" |
Select-Object -Property "Displayname",@{Name="SetDate";Expression={[datetime]::FromFileTime($_."pwdLastSet")}}