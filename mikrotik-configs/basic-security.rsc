# Basic MikroTik Security Configuration
/interface bridge
add name=local-bridge

/ip service
set telnet disabled=yes
set www-ssl disabled=yes
set ssh port=2222

/ip firewall filter
add chain=input action=drop in-interface=ether1 comment="Block WAN Access"
add chain=input action=accept protocol=tcp dst-port=2222 comment="Allow SSH"
add chain=forward action=drop connection-state=invalid comment="Drop Invalid"
