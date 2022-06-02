

deps:
	sudo apt update 
	sudo apt install -y dkms
	sudo apt install -y ffmpeg
	sudo apt -y install v4l2loopback-dkms v4l2loopback-utils

create:
	sudo modprobe v4l2loopback card_label="My Fake Webcam" exclusive_caps=
	
error:
	sudo dmesg