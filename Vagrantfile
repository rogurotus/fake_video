
Vagrant.configure("2") do |config|
  config.vm.box = "senglin/win-10-enterprise-vs2015community"
  config.vm.box_version = "1.0.0"
  config.vm.provision "shell", 
    inline: '$cur_path = (Get-Item .).FullName;$url = "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.0.4-stable.zip";Invoke-WebRequest -Uri $url -OutFile "flutter.zip";Expand-Archive flutter.zip -DestinationPath ".\";$Env:PATH += ";" + $cur_path+"\flutter\bin";flutter doctor'
end