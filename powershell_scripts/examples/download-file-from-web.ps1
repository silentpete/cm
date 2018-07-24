$url = "https://dl.google.com/go/go1.10.3.windows-amd64.msi"
$output = "$PSScriptRoot\go1.10.3.windows-amd64.msi"
$start_time = Get-Date

$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)

# OR (New-Object System.Net.WebClient).DownloadFile($url, $output)

Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

# Reference
# - https://blog.jourdant.me/post/3-ways-to-download-files-with-powershell
