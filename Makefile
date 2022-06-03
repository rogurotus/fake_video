

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
	git clone --depth 1 --branch "9.1.0" https://github.com/webcamoid/akvirtualcamera.git
	mkdir build
	cmake -G "MSYS Makefiles" -S ./akvirtualcamera -B ./build
	make -C ./build

deps.windows.vs:
	git clone --depth 1 --branch "9.1.0" https://github.com/webcamoid/akvirtualcamera.git
	mkdir build
	cmake -G "Visual Studio 16 2019" -S ./akvirtualcamera -B ./build
	cmake --build ./build

deps.b2:
	git clone https://github.com/webcamoid/webcamoid.git
	cd ./webcamoid && cmake -S . -B webcamoid-build && cmake --build webcamoid-build --parallel 4 && cmake --install webcamoid-build

deps.b:
	git clone --depth 1 --branch "9.1.0" https://github.com/webcamoid/akvirtualcamera.git
	cd ./akvirtualcamera && ./ports/ci/windows-vs/build.bat

build.b: 
	git clone --depth 1 --branch "9.1.0" https://github.com/webcamoid/akvirtualcamera.git
	mkdir build
	cmake -G "Visual Studio 16 2019" -S ./akvirtualcamera -B ./build
	cmake --build ./build
	cd ./build/x64 && ls
	cd ./build/build/x64 && ls


try.b:
	curl https://github.com/webcamoid/akvirtualcamera/releases/download/9.1.0/akvirtualcamera-windows-9.1.0.exe
	./akvirtualcamera-windows-9.1.0.exe