##When setting up SSH remember. How is this not installed by default?
sudo apt install ssh

##When settinng up WOL. The g flag is the important bit. the D Flag means its disabled.
sudo ethtool -s enp9s0 wol g
##another interesting strategy if you want to monitor WOL packets on an intergace use tcp dump
sudo tcpdump -v -i <interface> ether proto 0x0842 or udp port 9
#you need the two proto types to capture the different way WOL packets can be formulated. https://unix.stackexchange.com/questions/506582/how-to-capture-wol-packets

#Remember sudo pro attach. Log in to ubuntu for your login deets.

