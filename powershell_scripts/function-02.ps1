#Function(keyword) FunctionName (parameters) {script block}

Function Hello ([string] $name) {
  return "hello $name"
}

$toss = Hello("peter")

$test = Hello("test")
Write-Host "my variable" $test
