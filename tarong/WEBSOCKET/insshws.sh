#!/bin/bash

cd

wget -O /usr/local/bin/ws-dropbear https://raw.githubusercontent.com/JerrySBG/scvps/main/tarong/WEBSOCKET/dropbear-ws.py
wget -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/JerrySBG/scvps/main/tarong/WEBSOCKET/ws-stunnel
wget -O /usr/local/bin/ws-ovpn https://raw.githubusercontent.com/JerrySBG/scvps/main/tarong/OPENVPN/ws-ovpn.py

chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-stunnel
chmod +x /usr/local/bin/ws-ovpn

wget -O /etc/systemd/system/ws-dropbear.service https://raw.githubusercontent.com/JerrySBG/scvps/main/tarong/WEBSOCKET/service-wsdropbear && chmod +x /etc/systemd/system/ws-dropbear.service
wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/JerrySBG/scvps/main/tarong/WEBSOCKET/ws-stunnel.service && chmod +x /etc/systemd/system/ws-stunnel.service
wget -O /etc/systemd/system/ws-ovpn.service https://raw.githubusercontent.com/JerrySBG/scvps/main/tarong/OPENVPN/ws-ovpn.service && chmod +x /etc/systemd/system/ws-ovpn.service

systemctl daemon-reload
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service
systemctl enable ws-ovpn.service
systemctl start ws-ovpn.service
systemctl restart ws-ovpn.service
