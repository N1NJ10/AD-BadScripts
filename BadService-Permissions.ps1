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

# Prompt user for service name
$serviceName = Read-Host -Prompt "Enter the service name"

# Prompt user for user account (in the format DOMAIN\Username)
$userAccount = Read-Host -Prompt "Enter the user account"

# Prompt user for service executable path
$serviceExecutablePath = Read-Host -Prompt "Enter the path to the service executable file"

#Create our fake service
sc.exe create $serviceName binPath= $serviceExecutablePath

# Grant necessary privileges to the user for the service executable and associated files
icacls $serviceExecutablePath /grant "${userAccount}:(RX,W)" /inheritance:r /T /C

# Grant service start and stop permissions
sc.exe sdset $serviceName "D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWRPWPDTLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)(A;;RP;;;AU)(A;;RPWP;;;PU)(A;;RPWP;;;WD)"

# Do you wanna to restart me 
if ($restartService -eq "yes") {
    # Restart the service
    Restart-Service $serviceName
    Write-Output "Service '$serviceName' restarted."
} else {
    Write-Output "Service configuration updated. Service was not restarted."
}