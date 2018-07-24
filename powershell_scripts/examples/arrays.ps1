# Create an empty array:
$myFirstArray = @()
$myFirstArray
$myFirstArray.gettype()

# can have multiple data types inside
$myMultiTypeArray = @("strings", 3)
$myMultiTypeArray

$myIntArray = (1..7)
$myIntArray

# Here Strongly typed Array:
[int[]] $myTypedArray = 12,64,8,64,12
$myTypedArray
Write-Host "here" $myTypedArray.length

# Append an element
$myTypedArray += 32
$myTypedArray[0] = 88
$myTypedArray

# Array start at 0
$myTypedArray[1]

# get last element
$myTypedArray[-1]

# Loop through the elements in an array:
foreach ($element in $myTypedArray) {$element}

# Add one array to another. This creates a new array containing all the values from the first two arrays:
$firstFive=@(2, 3, 4, 5, 6)
$secondFive=@(7, 8, 9, 10, 11, 12)
$all = $firstFive + $secondFive
$all
