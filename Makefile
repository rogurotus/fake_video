

deps:
	sudo apt-get update
	sudo apt -y install v4l2loopback-dkms v4l2loopback-utils
	sudo modprobe v4l2loopback


create:
	sudo modprobe v4l2loopback card_label="My Fake Webcam" exclusive_caps=1