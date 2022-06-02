

deps:
	sudo apt update 
	sudo apt install -y dkms
	sudo apt install -y ffmpeg
	sudo apt -y install v4l2loopback-dkms v4l2loopback-utils
	sudo modprobe v4l2loopback exclusive_caps=1 video_nr=1,2

create:
	sudo modprobe v4l2loopback card_label="My Fake Webcam" exclusive_caps=1