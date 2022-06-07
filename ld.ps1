

Get-VM WinContainerHost | Set-VMProcessor -ExposeVirtualizationExtensions $true
Install-Module DockerProvider
Install-Package Docker -ProviderName DockerProvider -RequiredVersion preview
[Environment]::SetEnvironmentVariable("LCOW_SUPPORTED", "1", "Machine")
Restart-Service docker