# switch (expression) { (test) {code block} value {code block} default {code block} }
$x = 5
switch ($x) {
  2 { Write-Host "its a 2" }
  5 { Write-Host "its a five" }
  Default { Write-Host "no match" }
}

switch (10)
{
  (1 + 9) {Write-Host "Congratulations, you applied addition correctly"}
  (1 + 10) {Write-Host "This script block better not run"}
  (11 - 1) {Write-Host "Congratulations, you found the difference correctly"}
  (1 - 11) {Write-Host "This script block better not run"}
}
