Write-Host "Script Starting ... "
Write-Host "Finding Profiles ... "
$AllProfiles = Get-WmiObject Win32_UserProfile | Where-Object {$_.LocalPath -notlike "*\Windows*"} | Select SID, LocalPath, @{Expression={$_.ConvertToDateTime($_.LastUseTime)}; Label="LastUseTime" }

if ($AllProfiles.count -ne 0) {
	Foreach ($Profile in $AllProfiles) {
		$OldProfile = Get-WmiObject win32_userprofile | Where-object {$_.LocalPath -eq $Profile.LocalPath}
		Write-Host $Profile.LocalPath "Is being deleted ..."
		$OldProfile.Delete()
		Write-Host $Profile.LocalPath "Deleted!"
	}	
}
