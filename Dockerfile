FROM mcr.microsoft.com/windows/servercore:ltsc2019

COPY ./Debug ./Debug
WORKDIR ./Debug
ENTRYPOINT test.ps1