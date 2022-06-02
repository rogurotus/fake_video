

deps:
	sudo apt update 
	sudo apt -y install v4l2loopback-dkms v4l2loopback-utils

create:
	sudo mokutil --disable-validation 
	sudo modprobe v4l2loopback card_label="My Fake Webcam" exclusive_caps=1