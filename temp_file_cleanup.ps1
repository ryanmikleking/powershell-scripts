$tempfolders = @("C:\Windows\Temp\*", "C:\Windows\Prefetch\*", "C:\Documents and Settings\*\Local Settings\temp\*", "C:\Users\*\Application Data\Local\Temp\*")

Remove-Item $tempfolders -force -recurse -ErrorAction SilentlyContinue