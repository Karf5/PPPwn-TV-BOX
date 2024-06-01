This is the offline installer for the PPPwn exploit for PS4 With TV BOX Support

TV BOX Devices this installer runs on

 TV BOX With Amlogic Processor Runs Armbain OS
 TV BOX With Arm64 Processor Runs Armbain OS
 TV BOX With Armv7 Processor Runs Armbain OS
 TV BOX With RockChip Processor Runs Armbain OS

This installer also works on 
 
 Raspberry Pi 5
 Raspberry Pi 4 Model B
 Raspberry Pi 400
 Raspberry Pi 3B+
 Raspberry Pi 2 Model B
 Raspberry Pi Zero 2 W with usb to ethernet adapter
 Raspberry Pi Zero W with usb to ethernet adapter

 You need to install Raspberry Pi OS Lite or Armbian Cli / Minimal onto a sd card.

 After burning the appropriate system to the SD CARD Then copy the firmware file that you downloaded to the root of the SD card, insert The SD CARD into your device,
 whether it is a Raspberry Pi or TV BOX, and complete the system installation process

 After the system boots successfully, you do not need to install the entire system

The Steps Of The Install

* You will be asked to enter username and password. Type root in the username field and type 1234 in the password field.

* You will be asked to change your password. Enter any password you want

* When you are asked to enter the device's forename, press the Ctrl + C buttons and the command prompt will open

* At the command prompt, enter the following command : 

 sudo bash /boot/firmware/PPPwn/install.sh

 * The installer will ask you about the installation settings. After the installation is complete, reboot the device and congratulations. Your device has been set up successfully
You can now connect it to the PS4 and activate Jailbreak.

For GoldHen you need to place the goldhen.bin file onto the root of a usb drive and plug it into the console.
Once goldhen has been loaded for the first time it will be copied to the consoles internal hdd and the usb is no longer required.
To update goldhen just repeat the above process and the new version will be copied to the internal hdd

* If you want how to set up the connection on the PS4, see the list below.

* Go to Settings and then Network
* Select Set Up Internet connection and choose Use a LAN Cable
* Choose Custom setup and choose PPPoE for IP Address Settings
* Enter ppp for PPPoE User ID and PPPoE Password
* Choose Automatic for DNS Settings and MTU Settings
* Choose Do Not Use for Proxy Server
* NOTE : if you enable internet access you must match the username and password entered during the install or use the default ppp



* NOTE : that this installer works on Raspberry Pi normally, but this explanation focuses on TV BOX devices more
