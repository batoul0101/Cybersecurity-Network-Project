# Advanced MikroTik Security Configuration
/interface bridge
add name=secure-bridge

# SSH Security
/ip service
set ssh port=2222
set www-ssl disabled=yes

# Firewall Rules
/ip firewall filter
add chain=input action=drop in-interface=ether1 protocol=tcp dst-port=23 comment="Block Telnet"
add chain=input action=accept protocol=tcp dst-port=2222 comment="Allow Custom SSH"
add chain=forward action=drop connection-state=invalid comment="Drop Invalid Connections"

# STP Protection
/interface bridge settings
set use-ip-firewall=yes
set allow-fast-path=no
