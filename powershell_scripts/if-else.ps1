# if example
if ("ABC" -eq "Abc") {
  Write-Host "true"
} else {
  Write-Host "false"
}

# if example with case insensitive
if ("ABC" -ieq "Abc") {
  Write-Host "true"
} else {
  Write-Host "false"
}

# if example with case sensitive
if ("ABC" -ceq "Abc") {
  Write-Host "true"
} else {
  Write-Host "false"
}
