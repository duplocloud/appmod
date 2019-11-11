FROM mcr.microsoft.com/dotnet/framework/runtime:4.7.2
WORKDIR /jobserver
COPY bin/Release/ /jobserver
SHELL ["powershell", "-command"]
ADD runapp.bat /runapp.bat
ENTRYPOINT ["C:\\runapp.bat"]