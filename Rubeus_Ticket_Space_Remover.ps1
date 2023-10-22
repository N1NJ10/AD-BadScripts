param (
    [string]$FilePath = $(Read-Host "Enter the path to the file containing the string with -f argument")
)

# Rainbow colors for text
$colors = "Red", "Yellow", "Green", "Cyan", "Blue", "Magenta"
$text = "Made By @N1NJ10"

# Loop through the text and apply rainbow colors
for ($i = 0; $i -lt $text.Length; $i++) {
    $color = $colors[$i % $colors.Length]
    $char = $text[$i]
    Write-Host -NoNewline -ForegroundColor $color $char
}


# Check if the specified file exists
if (Test-Path -Path $FilePath -PathType Leaf) {
    try {
        # Read the content of the file
        $fileContent = Get-Content -Path $FilePath -Raw

        # Remove spaces and padding from the string
        $cleanedString = $fileContent -replace '\s', ''


        Write-Host "`nCleaned String:`n"
        Write-Host $cleanedString

        # Prompt the user to save the cleaned string to a file
        $saveToFile = Read-Host "`nDo you want to save the cleaned string to a file? (yes/no)"

        if ($saveToFile -eq "yes") {
            $outputFileName = Read-Host "Enter the name for the output file (without extension it will be kirbi automatic) "
            $outputFileName = $outputFileName + ".kirbi"
            $outputFilePath = Join-Path -Path $PSScriptRoot -ChildPath $outputFileName
            $cleanedString | Set-Content -Path $outputFilePath
            Write-Host "The cleaned string has been saved to '$outputFilePath'"
        }
    } catch {
        Write-Host "An error occurred while processing the file."
    }
} else {
    Write-Host "The specified file does not exist."
}
