route DELETE 169.254.169.254
route ADD 169.254.169.254 MASK 255.255.255.255 172.31.192.1

@PowerShell "(GC c:\inetpub\wwwroot\webapp\web.config)|%%{$_ -Replace '#DB_HOST#',$env:DB_HOST}|SC c:\inetpub\wwwroot\webapp\web.config"
@PowerShell "(GC c:\inetpub\wwwroot\webapp\web.config)|%%{$_ -Replace '#DB_USER#',$env:DB_USER}|SC c:\inetpub\wwwroot\webapp\web.config"
@PowerShell "(GC c:\inetpub\wwwroot\webapp\web.config)|%%{$_ -Replace '#DB_PASSWORD#',$env:DB_PASSWORD}|SC c:\inetpub\wwwroot\webapp\web.config"
@PowerShell "Import-Module WebAdministration; Remove-Website -Name 'Default Web Site'; New-Website -Name 'webapp' -Port 80 -PhysicalPath 'C:\inetpub\wwwroot\webapp'; Start-Website -Name webapp; Get-ChildItem -Path IIS:\Sites"

C:\ServiceMonitor.exe w3svc