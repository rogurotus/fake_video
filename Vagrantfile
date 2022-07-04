
Vagrant.configure("2") do |config|
  config.vm.box = "peru/windows-server-2022-standard-x64-eval"
  config.vm.box_version = "20220701.01"
  config.vm.provision "shell", 
    path: "ld.ps1"
end