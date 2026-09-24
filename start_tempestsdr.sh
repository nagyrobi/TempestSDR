#!/bin/bash
java -jar ~/TempestSDR/JavaGUI/JTempestSDR.jar --maximized --source "USRP (via UHD)" --source-args "driver=lime,soapy=0,nchan=1" --autostart &
