$fname = Read-Host -Prompt 'what is your first name?'
$lname = Read-Host -Prompt 'what is your last name?'
$Date = Get-Date
Write-Host "Hello $fname $lname, it is '$Date'"
