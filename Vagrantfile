Vagrant.configure("2") do |config|
  config.vm.box = "my-test"

  config.vm.guest = :windows
  config.vm.communicator = "winrm"
  # 3389 RDP
  config.vm.network "forwarded_port", guest: 3389, host: 3389

  config.vm.synced_folder  ".", "C:\\Windows\\system32\\vagrant", disabled: false
  config.vm.provision "shell", path: "./run_test.ps1"
end