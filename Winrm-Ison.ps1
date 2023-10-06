# Rainbow colors for text
$colors = "Red", "Yellow", "Green", "Cyan", "Blue", "Magenta"
$text = "Made By @N1NJ10"

# Loop through the text and apply rainbow colors
for ($i = 0; $i -lt $text.Length; $i++) {
    $color = $colors[$i % $colors.Length]
    $char = $text[$i]
    Write-Host -NoNewline -ForegroundColor $color $char
}
Write-Host

# Check if WinRM service is running
$winrmStatus = (Get-Service -Name "WinRM").Status

# Check if WinRM service is not running (Stopped)
if ($winrmStatus -ne "Running") {
    Write-Output "WinRM service is not running. Turning it on..."
    
    # Set WinRM service startup type to Automatic and start the service
    Set-Service -Name "WinRM" -StartupType Automatic
    Start-Service -Name "WinRM"
    
    # Check WinRM service status again
    $winrmStatusAfter = (Get-Service -Name "WinRM").Status
    
    # If WinRM service is still not running, display an error message
    if ($winrmStatusAfter -ne "Running") {
        Write-Output "WinRM service could not be started. This requires administrator access."
    } else {
        Write-Output "WinRM service has been started."
    }
} else {
    Write-Output "WinRM service is already running."
}
