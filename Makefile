

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
	# sudo modprobe v4l2loopback card_label="My Fake Webcam" exclusive_caps=1
	pactl load-module module-null-sink sink_name=FakeSource sink_properties=device.description="FakeSource"
	pactl load-module module-virtual-source source_name=VirtualMic master=FakeSource.monitor


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
	git clone --depth 1 --branch "9.0.0" https://github.com/webcamoid/akvirtualcamera.git
	mkdir build
	cmake -G "Visual Studio 16 2019" -S ./akvirtualcamera -B ./build
	cmake --build ./build
	./build/build/x64/Debug/AkVCamAssistant.exe --install

gg.gg:
	./build/build/x64/Debug/AkVCamManager.exe update
	cd ./build/build/x64/Debug && sc start AkVCamAssistant
	./build/build/x64/Debug/AkVCamManager.exe update
gg.gg2:
	./build/build/x64/Debug/AkVCamManager.exe update
	./build/build/x64/Debug/AkVCamManager.exe devices
	./build/build/x64/Debug/AkVCamManager.exe add-device "Virtual Camera"
	./build/build/x64/Debug/AkVCamManager.exe update
	./build/build/x64/Debug/AkVCamManager.exe devices



try.b:
	curl https://github.com/webcamoid/akvirtualcamera/releases/download/9.1.0/akvirtualcamera-windows-9.1.0.exe
	./akvirtualcamera-windows-9.1.0.exe

obs:
	curl -L https://github.com/obsproject/obs-studio/releases/download/27.2.4/OBS-Studio-27.2.4-Full-Installer-x86.exe > inst.exe
	curl -L https://aka.ms/vs/16/release/vc_redist.x86.exe > vc.exe
	curl -L https://github.com/Fenrirthviti/obs-virtual-cam/releases/download/2.0.5/OBS-Virtualcam-2.0.5-Windows.zip > arch.zip
	7z.exe x .\arch.zip

p: 
	cd C: && ls
	cd C: && cd C:/Program Files && ls