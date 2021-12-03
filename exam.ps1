clear
$PSScriptRoot

Select-String -Pattern "Test" -Path .\exam.ps1
$PSCulture
Get-Culture
function Test1 {
    param($a, $b) 
            $PSBoundParameters      
}

function test2 {
    param (
        $a,$b
    )
    Test1 @PSBoundParameters
}
Test2 -a Power -b Shell
$PSCommandPath
Exit



Test-Path $profile
$PID
"======================="
$a = "one", $null, "three"
$a.Count
$a | ForEach-Object { "Hello" + $_}

$calendar = @($null, $null, "Meeting", $null, $null, "Team Lunch", $null)
$days = "Sunday","Monday","Wednesday","Thursday","Friday","Saturday"
#$calendar
#$days
$currentDay = 0
foreach($day in $calendar){
    if($day -ne $null){
        "Appointment on $($days[$currentDay]): $day"
    }
    $currentDay++
}
