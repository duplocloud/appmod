route DELETE 169.254.169.254
route ADD 169.254.169.254 MASK 255.255.255.255 172.31.192.1

@PowerShell "(GC c:\jobserver\app.exe.config)|%%{$_ -Replace '#DB_HOST#',$env:DB_HOST}|SC c:\jobserver\app.exe.config"
@PowerShell "(GC c:\jobserver\app.exe.config)|%%{$_ -Replace '#DB_USER#',$env:DB_USER}|SC c:\jobserver\app.exe.config"
@PowerShell "(GC c:\jobserver\app.exe.config)|%%{$_ -Replace '#DB_PASSWORD#',$env:DB_PASSWORD}|SC c:\jobserver\app.exe.config"
@PowerShell "(GC c:\jobserver\NLog.config)|%%{$_ -Replace '#DB_HOST#',$env:DB_HOST}|SC c:\jobserver\NLog.config"
@PowerShell "(GC c:\jobserver\NLog.config)|%%{$_ -Replace '#DB_USER#',$env:DB_USER}|SC c:\jobserver\NLog.config"
@PowerShell "(GC c:\jobserver\NLog.config)|%%{$_ -Replace '#DB_PASSWORD#',$env:DB_PASSWORD}|SC c:\jobserver\NLog.config"

c:\jobserver\app.exe

ping 127.0.0.1 -t