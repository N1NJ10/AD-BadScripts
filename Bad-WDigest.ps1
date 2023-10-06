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

# Check if the registry key exists and set its value to 1 or create it
$registryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest'
$registryValueName = 'UseLogonCredential'

if (Test-Path $registryPath) {
    $currentValue = (Get-ItemProperty -Path $registryPath).$registryValueName
    if ($currentValue -eq 1) {
        Write-Host "WDigest is already set to 1."
    } else {
        Write-Host "Setting WDigest to 1..."
        Set-ItemProperty -Path $registryPath -Name $registryValueName -Value 1
        Write-Host "WDigest has been set to 1."
    }
} else {
    Write-Host "Creating WDigest registry key and setting it to 1..."
    New-ItemProperty -Path $registryPath -Name $registryValueName -Value 1 -PropertyType DWord
    Write-Host "WDigest has been created and set to 1."
}

# Check if the registry key is set properly
$checkValue = (Get-ItemProperty -Path $registryPath).$registryValueName

if ($checkValue -eq 1) {
    Write-Host "WDigest is properly set to 1."
} else {
    Write-Host "WDigest is not set to 1. Try running the script as an administrator."
}