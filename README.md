TempestSDR
=============

This project is a software toolkit for remotely eavesdropping video monitors using a Software Defined Radio (SDR) receiver. It exploits compromising emanations from cables carrying video signals.

Raster video is usually transmitted one line of pixels at a time, encoded as a varying current. This generates an electromagnetic wave that can be picked up by an SDR receiver. The software maps the received field strength of a pixel to a gray-scale shade in real-time. This forms a false colour estimate of the original video signal.

The toolkit uses unmodified off-the-shelf hardware which lowers the costs and increases mobility compared to existing solutions. It allows for additional post-processing which improves the signal-to-noise ratio. The attacker does not need to have prior knowledge about the target video display. All parameters such as resolution and refresh rate are estimated with the aid of the software. 

The software consists of a library written in C, a collection of plug-ins for various Software Define Radio (SDR) front-ends and a Java based Graphical User Interface (GUI). It is a multi-platform application, with all native libraries pre-compiled and packed into a single Java jar file.

Linux
-----

#### Install tools, compilers and libraries
```
sudo apt update
sudo apt install git build-essential
sudo apt install -y wget apt-transport-https gpg
wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | sudo gpg --dearmor -o /usr/share/keyrings/adoptium.gpg
echo "deb [signed-by=/usr/share/keyrings/adoptium.gpg] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | sudo tee /etc/apt/sources.list.d/adoptium.list
sudo apt install temurin-8-jdk
ls /usr/lib/jvm/
```

#### Clone git and build
```
mkdir ~/development
cd ~/development
git clone https://github.com/tanpc/TempestSDR.git
cd TempestSDR/
make clean
make all JAVA_HOME=/usr/lib/jvm/temurin-8-jdk-amd64
```

#### Run Application
```
java -jar ~/development/TempestSDR/JavaGUI/JTempestSDR.jar 
```

#### Run Application maximized
```
java -jar ~/development/TempestSDR/JavaGUI/JTempestSDR.jar --maximized
```

#### Run Application with preselected source
```
java -jar ~/development/TempestSDR/JavaGUI/JTempestSDR.jar --source "USRP (via UHD)" --source-args "driver=lime,soapy=0,nchan=1"
```

For Lime SDR
------------

#### Install the LimeSDR software stack
```
sudo apt install limesuite liblimesuite-dev limesuite-udev soapysdr-tools soapysdr-module-lms7 libuhd-dev uhd-host uhd-soapysdr

LimeUtil --find
SoapySDRUtil --find="driver=lime"
SoapySDRUtil --probe="driver=lime"
```
In the GUI, pick the "USRP (via UHD)" source, and in the text field it exposes, enter:
```
driver=lime,soapy=0,nchan=1
```
