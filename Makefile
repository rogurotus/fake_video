

deps:
	apt update
	apt install -y apt-utils
	apt install sudo
	sudo su root -
	apt-get install -y module-assistant
	m-a prepare
	m-a update
	m-a a-i v4l2loopback
	exit 

	cp /usr/src/v4l2loopback.tar.bz2 .

	tar -xvf v4l2loopback.tar.bz2
	cd modules/v4l2loopback
	make
	make install
	apt-get install -y kmod
	apt install -y ffmpeg
	sudo modprobe v4l2loopback

create:
	sudo modprobe v4l2loopback card_label="My Fake Webcam" exclusive_caps=1