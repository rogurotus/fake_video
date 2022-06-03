

deps:
	sudo apt update 
	sudo apt install -y dkms
	sudo apt install -y linux-modules-extra-$(shell uname -r)
	sudo apt install -y ffmpeg
	sudo apt -y install v4l2loopback-dkms v4l2loopback-utils
	sudo apt install v4l-utils
	sudo apt install pulseaudio
	sudo apt install pulseaudio-utils
	pulseaudio -D

create:
	sudo modprobe v4l2loopback card_label="My Fake Webcam" exclusive_caps=1

	pactl load-module module-null-sink sink_name=Virtual2 sink_properties=device.description="MyFakeMicro"
	pactl load-module module-loopback sink=Virtual2


deps.windows:
	git clone https://github.com/webcamoid/akvirtualcamera.git
	mkdir build
	cmake -G "Visual Studio 16 2019" -S ./akvirtualcamera -B ./build
	cmake --build ./build