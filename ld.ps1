
git clone --recurse-submodules https://github.com/ahoefling/hyper-v-actions-virtual-environment
cd hyper-v-actions-virtual-environment
start.ps1
Get-VM WinContainerHost | Set-VMProcessor -ExposeVirtualizationExtensions $true
[Environment]::SetEnvironmentVariable("LCOW_SUPPORTED", "1", "Machine")
Restart-Service docker