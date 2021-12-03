clear
#switch
$values = "Start","MoveNext","NotEvaluated","Reset","End"
$stopInfinite = $false
switch($values){
    "MoveNext"{
        "`tMoveNext"
        $switch.MoveNext()  | Out-Null
        "`tAfter MoveNext: $($switch.Current)"
    }
    "NotEvaluated"{
        "`t2AfterMoveNext: $($switch.Current)"
    }
    "Reset"{
        if(!$stopInfinite){
            "`tReset"
            $switch.Reset()
            $stopInfinite = $true
        }
    }
    default{
        "Default (Current): $($switch.Current)"
    }
}
exit

#foreach 와 reset()
$stopLoop = 0
foreach ($num in ("one","two","three")){
    ("`t" * $stopLoop) + "Current: $($foreach.Current)"
    if($num -eq "two" -and $stopLoop -lt 2){
        $foreach.reset() | Out-Null
        ("`t" * $stopLoop) + "Reset Loop: $stopLoop"
        $stopLoop++
    }
}
exit

#foreach 와 foreach.current
$i = 0
foreach($num in ("one","two","three")){
    "Iteration: $i"
    $i++
    "`tNum: $num"
    "`tCurrent: $($foreach.Current)"
    if($foreach.Current -eq "two"){
        "Before MoveNext (Current): $($foreach.Current)"
        $foreach.MoveNext()| Out-Null
        "After MoveNext (Current): $($foreach.Current)"
        "Num has not changed: $num"
    }
}
exit


#$input Current 속성 사용하기
function Current{
    begin{
        $i = 0
    }
    process{
        "Iteration: $i"
        $i++
        "`tBefore MoveNext:$($input.Current)"
        $input.MoveNext() | Out-Null
        "`tAfter MoveNext: $($input.Current)"
        "`tAccess Again: $($input.Current)"
    }
}
"one","two" | Current
exit
function All{
    "All values: $input"
    "Access again: $input"
    $input.reset()
    "After reset: $input"
    $input.MoveNext() | Out-Null
    "After MoveNext: $input"
}
"one","two","three" | All
exit



#$input $skip
$skip = $true
function Skip{
    begin{
        $i = 0
    }
    process{
        "Iteration: $i"
        $i++
        if($skip){
            "`tSkipping"
            $skip=$false
        }
        else{
            "`tInput: $input"
        }
    }
}
"one","two","three" | Skip
exit

function Test{
    Begin{
        $i = 0
    }
    process{
        "Iteration: $i"
        $i++
        "`tInput: $input"
        "`tAccess Again: $input"
        $input.Reset()
        "`tAfter Reset: $input"
    }
}
"one","two" | Test
exit






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
