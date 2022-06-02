

deps:
	sudo apt update 
	curl http://deb.debian.org/debian/pool/main/v/v4l2loopback/v4l2loopback-dkms_0.12.5-1_all.deb ...
	sudo dpkg -i v4l2loopback-dkms_0.12.5-1_all.deb

create:
	sudo modprobe v4l2loopback card_label="My Fake Webcam" exclusive_caps=1