

deps:
	sudo apt update
	sudo apt install -y apt-utils
	sudo sudo su root -
	sudo apt-get install -y module-assistant
	sudo m-a prepare
	sudo m-a update
	sudo m-a a-i v4l2loopback

	cp /usr/src/v4l2loopback.tar.bz2 .

	tar -xvf v4l2loopback.tar.bz2
	cd modules/v4l2loopback
	make
	make install
	sudo apt-get install -y kmod
	sudo apt install -y ffmpeg
	sudo modprobe v4l2loopback

create:
	sudo modprobe v4l2loopback card_label="My Fake Webcam" exclusive_caps=1