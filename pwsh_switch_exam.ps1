switch(5){
    1 {"It is one"}
    2 {"It is two"; break}
    3{"It is three"; break}
    4{"It is four"}
    3{"Three again"}
    default{"default"}
}

# -Exact
$test = @{
    Test='test' 
    Test2='test2' 
}
$test
$test.tostring()
switch -Exact ($test){
    'System.Collections.Hashtable' {
        'Hashtable string coercion'
    }
    'test' {
        'Hashtable value'
    }
}

# -Wildcard
switch -Wildcard ("fourteen"){
    1{"It is one";break}
    2{"It is tow";break}
    "fo*"{"That's too many"}
    default{"No match"}
}

"="*20
# -Regx
$target = 'http://bing.com'
switch -Regex ($target){
    '^ftp\://.*$' {"$_ is an ftp address"; break}
    '^\w+@\w+\.com|edu|org$' {"$_ is an email address"; break}
    '^(http[s]?)\://.*$' { "$_ is a web address that uses $($matches[1])"; break}

}

# _$
switch ("Test"){
    {$_ -is [string]}{
        "Found a string"
    }
    "Test" {
        "This $_ executes as well"
    }
}

# continue
switch (1,4,-1,3,"Hello",2,1) {
    {$_ -lt 0} { continue  }
    {$_ -isnot [int32]} {break}
    {$_ % 2}{
        "$_ is Odd"
    }
    { -not ($_ % 2)}{
        "$_ is Even"
    }
    Default {}
}