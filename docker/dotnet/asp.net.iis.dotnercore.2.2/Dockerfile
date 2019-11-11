#FROM duplocloud/iis:dotnetcore2.2.6
FROM microsoft/iis
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'Continue'; $verbosePreference='Continue';"]
ADD https://download.visualstudio.microsoft.com/download/pr/a9bb6d52-5f3f-4f95-90c2-084c499e4e33/eba3019b555bb9327079a0b1142cc5b2/dotnet-hosting-2.2.6-win.exe "C:/setup/dotnet-hosting-2.2.6-win.exe"
RUN start-process -Filepath "C:/setup/dotnet-hosting-2.2.6-win.exe" -ArgumentList @('/install', '/quiet', '/norestart') -Wait 
RUN Remove-Item -Force "C:/setup/dotnet-hosting-2.2.6-win.exe"

#SHELL ["powershell", "-command"]
WORKDIR /inetpub/wwwroot/samplewebapp
RUN Import-Module WebAdministration; Remove-Website -Name 'Default Web Site'; New-WebAppPool -Name 'ap-samplewebapp'; Set-ItemProperty IIS:\AppPools\ap-samplewebapp -Name managedRuntimeVersion -Value ''; Set-ItemProperty IIS:\AppPools\ap-samplewebapp -Name enable32BitAppOnWin64 -Value 0; Set-ItemProperty IIS:\AppPools\ap-samplewebapp -Name processModel.identityType -Value Service; New-Website -Name 'samplewebapp' -Port 80 -PhysicalPath 'C:\inetpub\wwwroot\samplewebapp' -ApplicationPool 'ap-samplewebapp' -force;
COPY out/ /inetpub/wwwroot/samplewebapp/
ADD runapp.bat /runapp.bat
EXPOSE 80
ENTRYPOINT ["C:\\runapp.bat"]