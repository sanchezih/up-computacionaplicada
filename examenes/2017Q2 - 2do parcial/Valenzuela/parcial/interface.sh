# The loopback network interface
auto lo
iface lo inet loopback

# allow-hotplug eth0
# iface eth0 inet dhcp

# Static IP address
auto eth0
iface eth0 inet static
        address 192.168.20.8
        netmask 255.255.255.0
        network 192.168.20.0
        broadcast 192.168.20.255
        gateway 192.168.20.1