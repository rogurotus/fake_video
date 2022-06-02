

deps:
	sudo apt update 
	sudo apt install -y dkms
	sudo apt install -y linux-modules-extra-$(shell uname -r)
	sudo apt install -y ffmpeg
	sudo apt -y install v4l2loopback-dkms v4l2loopback-utils
	sudo apt install v4l-utils
	sudo apt install pulseaudio
	sudo apt install pulseaudio-utils
	sudo pulseaudio -D

create:
	sudo modprobe v4l2loopback card_label="My Fake Webcam" exclusive_caps=1

	pactl load-module module-null-sink sink_name=Virtual1 sink_properties=device.description="My Fake Micro"
	pactl load-module module-loopback sink=Virtual1

	sudo v4l2-ctl --list-devices
	LANG=C pactl list | grep -A2 'Source #' | grep 'Name: ' | cut -d" " -f2