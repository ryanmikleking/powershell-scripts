# Specify the directory where you want to start the search
$startingDirectory = Read-Host -Prompt 'Enter Starting Path'

# Specify the name of the file you want to find (replace with your file's name)
$fileNameToFind = Read-Host -Prompt 'Enter the filename'

# Recursively search for the file within the directory
$foundFiles = Get-ChildItem -Path $startingDirectory -Recurse -Filter $fileNameToFind -Force -ErrorAction SilentlyContinue

# Check if any matching files were found$
if ($foundFiles.Count -gt 0) {
    Write-Host "Found the following matching file(s):"
    
    # Output the paths of the found files
    foreach ($file in $foundFiles) {
        # Write-Host $file.FullName 
        Out-File $file.FullName -Append
    }
} else {
    Write-Host "No matching files found."
}