
route DELETE 169.254.169.254
route ADD 169.254.169.254 MASK 255.255.255.255 172.31.192.1

@PowerShell "(GC c:\inetpub\wwwroot\samplewebapp\app.dll.config)|%%{$_ -Replace '#DB_HOST#',$env:DB_HOST}|SC c:\inetpub\wwwroot\samplewebapp\app.dll.config"
@PowerShell "(GC c:\inetpub\wwwroot\samplewebapp\app.dll.config)|%%{$_ -Replace '#DB_USER#',$env:DB_USER}|SC c:\inetpub\wwwroot\samplewebapp\app.dll.config"
@PowerShell "(GC c:\inetpub\wwwroot\samplewebapp\app.dll.config)|%%{$_ -Replace '#DB_PASSWORD#',$env:DB_PASSWORD}|SC c:\inetpub\wwwroot\samplewebapp\app.dll.config"

C:\ServiceMonitor.exe w3svc