# Clean User Profiles
# Makes WMI call to list profiles, excluding system accounts
# Deletes profiles whose LastUseTime is older than a 30 days



$ProfilePaths = @(Get-ChildItem -Path "C:\Users\") | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } | Select @{Expression={"C:\Users\" + $_.Name }; Label="Name"}

# Get list of all profiles; excludes system accounts, as well as the ulcshd, machineadmin, and profile accounts
$TargetedProfiles = Get-WmiObject Win32_UserProfile | Where-Object{ $_.LocalPath -notlike ("*\Windows\*") -and ($_.LocalPath -in $ProfilePaths.Name) }

# Target profiles for removal
Write-Host $TargetedProfiles.Count


# If there are profiles that meet the criteria, delete them
if ($TargetedProfiles.count -ne 0) {
    Foreach ($Profile in $TargetedProfiles) {
        $OldProfile = Get-WmiObject Win32_UserProfile | Where-Object {$_.LocalPath -eq $Profile.LocalPath}
        $OldProfile.Delete()
        Write-Host $OldProfile.LocalPath -ForegroundColor Magenta
    }
}