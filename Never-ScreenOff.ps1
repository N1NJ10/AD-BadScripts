# Rainbow colors for text
$colors = "Red", "Yellow", "Green", "Cyan", "Blue", "Magenta"
$text = "Made By @N1NJ10"

# Loop through the text and apply rainbow colors
for ($i = 0; $i -lt $text.Length; $i++) {
    $color = $colors[$i % $colors.Length]
    $char = $text[$i]
    Write-Host -NoNewline -ForegroundColor $color $char
}


# Disable screen timeout
powercfg -change -monitor-timeout-ac 0
powercfg -change -monitor-timeout-dc 0
