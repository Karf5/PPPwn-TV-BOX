#!/bin/bash

# Offline Installer & C++ Version Of PPPwn


echo -e '\033[35mPPPwn PS4 Exploit   : Offline Installer\033[0m'
echo -e '\033[35mPPPwn By            : TheFlow\033[0m'
echo -e '\033[35mGoldHEN By          : SiSTR0\033[0m'
echo -e '\033[35mOriginal Script     : Stooged\033[0m'
echo -e '\033[35mC++ Port            : xfangfang\033[0m'
echo -e '\033[35mTV BOX Port By      : Karf5\033[0m'
echo -e '\033[35mGoldHEN Support     : FW 9.00 , 10.00 , 10.01 , 11.00\033[0m'
echo -e '\033[35mPPPwn Supported Firmwares  : FW 9.00 to 11.00\033[0m'
echo -e '\033[35mSpecial Thanks To All The Developers Who Contributed To The Success Of This Project #_#\033[0m'

while true; do
read -p "$(printf '\r\n\r\n\033[36mDo You Want The Device To Shutdown After PPPwn Exoploit Success\r\n\r\n\033[36m(Y|N)?: \033[0m')" pisht
case $pisht in
[Yy]* ) 
SHTDN="true"
echo -e '\033[32mThe device will shutdown\033[0m'
break;;
[Nn]* ) 
echo -e '\033[35mThe device will not shutdown\033[0m'
SHTDN="false"
break;;
* ) echo -e '\033[31mPlease answer Y or N\033[0m';;
esac
done

while true; do
read -p "$(printf '\r\n\r\n\033[36mAre you using a usb to ethernet adapter for the console connection\r\n\r\n\033[36m(Y|N)?: \033[0m')" usbeth
case $usbeth in
[Yy]* ) 
USBE="true"
echo -e '\033[32mUsb to ethernet is being used\033[0m'
break;;
[Nn]* ) 
echo -e '\033[35mUsb to ethernet is NOT being used\033[0m'
USBE="false"
break;;
* ) echo -e '\033[31mPlease answer Y or N\033[0m';;
esac
done

echo -e ''
echo -e '\033[31mInput [10.50] for FW 10.50, 10.70, 10.71\033[0m'
echo -e '\033[31mInput [10.00] for FW 10.00, 10.01\033[0m'
echo -e '\033[31mInput [9.60]  for FW 9.50, 9.51, 9.60\033[0m'
echo -e '\033[31mInput [9.03]  for FW 9.03, 9.04\033[0m'

while true; do
read -p "$(printf '\r\n\r\n\033[36mWould you like to change the firmware version being used, the default is 11.00\r\n\r\n\033[36m(Y|N)?: \033[0m')" fwset
case $fwset in
[Yy]* ) 
while true; do
read -p  "$(printf '\033[33mEnter the firmware version [11.00 | 10.50 | 10.00 | 9.60 | 9.03 | 9.00]: \033[0m')" FWV
case $FWV in
"" ) 
 echo -e '\033[31mCannot be empty!\033[0m';;
 * )  
if grep -q '^[0-9.]*$' <<<$FWV ; then 

if [[ ! "$FWV" =~ ^("11.00"|"10.50"|"10.00"|"9.60"|"9.03"|"9.00")$ ]]  ; then
echo -e '\033[31mThe version must be 11.00, 10.50, 10.00, 9.60, 9.03 or 9.00\033[0m';
else 
break;
fi
else 
echo -e '\033[31mThe version must only contain alphanumeric characters\033[0m';
fi
esac
done
echo -e '\033[32mYou are using '$FWV'\033[0m'
break;;
[Nn]* ) 
echo -e '\033[35mUsing the default setting: 11.00\033[0m'
FWV="11.00"
break;;
* ) echo -e '\033[31mPlease answer Y or N\033[0m';;
esac
done 

ip link

while true; do
read -p "$(printf '\r\n\r\n\033[36mWould you like to change the lan interface, the default is eth0\r\n\r\n\033[36m(Y|N)?: \033[0m')" ifset
case $ifset in
[Yy]* ) 
while true; do
read -p  "$(printf '\033[33mEnter the interface value: \033[0m')" IFCE
case $IFCE in
"" ) 
 echo -e '\033[31mCannot be empty!\033[0m';;
 * )  
if grep -q '^[0-9a-zA-Z_ -]*$' <<<$IFCE ; then 
if [ ${#IFCE} -le 1 ]  || [ ${#IFCE} -ge 17 ] ; then
echo -e '\033[31mThe interface must be between 2 and 16 characters long\033[0m';
else 
break;
fi
else 
echo -e '\033[31mThe interface must only contain alphanumeric characters\033[0m';
fi
esac
done
echo -e '\033[32mYou are using '$IFCE'\033[0m'
break;;
[Nn]* ) 
echo -e '\033[35mUsing the default setting: eth0\033[0m'
IFCE="eth0"
break;;
* ) echo -e '\033[31mPlease answer Y or N\033[0m';;
esac
done

# write config
echo '#!/bin/bash
INTERFACE="'$IFCE'" 
FIRMWAREVERSION="'$FWV'" 
SHUTDOWN='$SHTDN'
USBETHERNET='$USBE'' | sudo tee /boot/firmware/PPPwn/config.sh

sudo rm /usr/lib/systemd/system/bluetooth.target
sudo rm /usr/lib/systemd/system/network-online.target
sudo sed -i 's^sudo bash /boot/firmware/PPPwn/run.sh \&^^g' /etc/rc.local
echo '[Service]
WorkingDirectory=/boot/firmware/PPPwn
ExecStart=/boot/firmware/PPPwn/run.sh
Restart=never
User=root
Group=root
Environment=NODE_ENV=production
[Install]
WantedBy=multi-user.target' | sudo tee /etc/systemd/system/pipwn.service
sudo chmod u+rwx /etc/systemd/system/pipwn.service
sudo systemctl enable pipwn
sudo systemctl start pipwn
echo -e '\033[35mInstall complete\033[0m'
#sudo reboot
