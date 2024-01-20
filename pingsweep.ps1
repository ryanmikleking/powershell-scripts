#Ping Sweep script
Import-Module Microsoft.PowerShell.Management

$ips = 1..254 | % { "192.168.1.$_" } 

$ips | ForEach-Object {
   
   $result = Test-Connection -Count 1 -ComputerName $_ -Quiet
   if ($result) {
        "$($_) $result"
    }
}
echo "Ping Sweep Finished!"