# Assign strings to variables
$strA = "Go east young man!"
$strB = $strA -replace "east", "west"

# Print examples
Write-Host $strB
$strB

# Math
$x = 10 * 2 / 5 * 2 + 5 * 5
$x

# operator example
$x++
$x

# Assign Type
[int]$y = 11
$y

$error
$error.Count
$error[0].Exception
$error[0] | gm
