# имя пользователя, историю входов которого нужно получить
$checkuser='*kobec*'
# получаем информацию об истории входов пользователя за последних 2 дня, можете изменить
$startDate = (get-date).AddDays(-1)
$DCs = Get-ADDomainController -Filter *
foreach ($DC in $DCs){
$logonevents = Get-Eventlog -LogName Security -InstanceID 4624 -after $startDate -ComputerName $dc.HostName
foreach ($event in $logonevents){
if (($event.ReplacementStrings[5] -notlike '*$') -and ($event.ReplacementStrings[5] -like $checkuser)) {
# Remote (Logon Type 10)
if ($event.ReplacementStrings[8] -eq 10){
write-host "Type 10: Remote Logon`tDate: "$event.TimeGenerated "`tStatus: Success`tUser: "$event.ReplacementStrings[5] "`tWorkstation: "$event.ReplacementStrings[11] "`tIP Address: "$event.ReplacementStrings[18] "`tDC Name: " $dc.Name
}
# Network(Logon Type 3)
if ($event.ReplacementStrings[8] -eq 3){
write-host "Type 3: Network Logon`tDate: "$event.TimeGenerated "`tStatus: Success`tUser: "$event.ReplacementStrings[5] "`tWorkstation: "$event.ReplacementStrings[11] "`tIP Address: "$event.ReplacementStrings[18] "`tDC Name: " $dc.Name
}
}
}
}