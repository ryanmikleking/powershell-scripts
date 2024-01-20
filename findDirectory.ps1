$serverName = Read-Host -Prompt 'Enter Path'
if ($serverName) {
    Write-Host "Success"
    Get-ChildItem $serverName -Recurse -ErrorAction SilentlyContinue

    } else {
    Write-Warning -Message "No path has been input"
    }