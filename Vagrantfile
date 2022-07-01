Vagrant.configure("2") do |config|
  config.vm.box = "senglin/win-10-enterprise-vs2015community"
  config.vm.box_version = "1.0.0"
  config.vm.provision "shell",
    inline: "ls; choco install flutter"
  config.ssh.forward_agent = true
end