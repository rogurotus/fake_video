Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco install git.install
git clone https://github.com/flutter/flutter.git -b stable
$path_ = (Get-Item .).FullName + "\flutter\bin\"
$env:Path += ";" + $path_
flutter doctor