# hash test
clear
$hash = @{}
$hash = @{Number=1; Shape="Square";Color="Blue"}
$hash
"="*100
#Error 
#[ordered]$hash = @{}
# $hash = [ordered]@{Number=1; Shape="Square";Color="Blue"}
[hashtable]$hash2 = [ordered]@{Number=1; Shape="Square";Color="Blue"}
$hash2
"="*100
$hash2.Keys
"="*50
$hash2.Values
"="*50
$hash2.Number
$hash2.Shape
$hash.Color
"="*10
$hash.Count
$hash2.Count
$hash["Number"]
$hash["Time"]="now"
$hash
$hash2.Add("Time", "now")
"="*20
$hash2
$t = "Today"
$now = (Get-Date)
$hash.Add($t, $now); "="*10
$hash; "="*10
$hash.Remove("time")
$hash
clear

# $p = @{"PowerShell" = (Get-Process PowerShell); "Notepad" = (Get-Process notepad)}

$p = @{(Get-Service WinRM) = ((Get-Service WinRM).Status)}
$p.Keys | foreach {$_.name, $_.Status, $_.displayname}
$p = $p + @{"Hash2" = @{a=1; b=2; c=3}}
"="*10;$p;  "="*10;   $p.Hash2;  $p.Hash2.b
clear; $p.GetEnumerator() | Sort-Object -Property Key
$p.GetEnumerator() | Sort-Object -Property Key -Descending

clear
# here-string and ConvertFrom-StringData
$string = @"
Msg1 = Type "Windows".
Msg2 = She said, "Hello, World."
Msg3 = Enter an alias (or "nick name")
"@

ConvertFrom-StringData $string





