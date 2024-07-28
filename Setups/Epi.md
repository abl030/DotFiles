# When setting up SSH remember. How is this not installed by default?
sudo apt install ssh

# When settinng up WOL. The g flag is the important bit. the D Flag means its disabled.

sudo ethtool -s enp9s0 wol g
# another interesting strategy if you want to monitor WOL packets on an intergace use tcp dump
sudo tcpdump -v -i <interface> ether proto 0x0842 or udp port 9

# you need the two proto types to capture the different way WOL packets can be formulated. https://unix.stackexchange.com/questions/506582/how-to-capture-wol-packets

# OK actually the above doesn't enable WOL after reboots. We'll have to do it in netplan.
sudo nano /etc/netplan/01-network-manager-all.yaml
and the contents of my current netplan yaml:

# Let NetworkManager manage all devices on this system
network:
  version: 2
  renderer: NetworkManager
  ethernets:
     enp9s0:
       wakeonlan: true
# then run

sudo netplan apply

# Remember sudo pro attach. Log in to ubuntu for your login deets.



# Now we are working on remote desktop. There's two flavours. One requiring user log in the other does not!! Amazing.
# However as of time of writing the no user logged in one is bugged out by nvidia drivers and they haven't released 555 to the wider world yet.
# So we wait. But if we leave the system on and sleeping all the time we should be fine.
# Just remember the two different daemons run on different ports. that's what was tricking us up!!




Applist:
VSCode
Firefox - so far so good on the snap? Lets see......
LibreOffice, just install the snap.
sudo snap install libreoffice
then remember to enable autosave and to change the menu bar.



# Gnome shell extensions
Install as a flatpak
https://flathub.org/apps/com.mattjakeman.ExtensionManager

Then I use this list to remind my little brain about what to install
https://www.omgubuntu.co.uk/best-gnome-shell-extensions

There has to be a better way to run the extension manager than:
flatpak run com.mattjakeman.ExtensionManager 

Probably remove some of these? I bet there's going to be conflicts, just starting here to see what I like.

Dash to Panel - tweak your taskbar settings here. can be as windowsy as you like.
ArcMenu
Caffeine (Dont use the indicator just install the extension)
Improved Workspace indicator
WinTile-Beyond
Clipboard Indicator
Vitals
Tailscale

