$tempfolders = @("C:\Windows\temp\*", "C:\Documents and Settings\*\Local Settings\temp\*",
"C:\Users\*\Application Data\Local\temp\*")

Remove-Item $tempfolders -force -recurse