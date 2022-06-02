
#TEST
deps:
	sudo apt-get update
	sudo apt-get install -y v4l2loopback-dkms

create:
	sudo modprobe v4l2loopback card_label="My Fake Webcam" exclusive_caps=1