FROM mcr.microsoft.com/windows/servercore:ltsc2019

ADD dotnet-runtime-3.1.3-win-x64.exe /dotnet-runtime-3.1.3-win-x64.exe
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'Continue'; $verbosePreference='Continue';"]
RUN start-process -Filepath "C:/dotnet-runtime-3.1.3-win-x64.exe" -ArgumentList @('/install', '/quiet', '/norestart') -Wait 