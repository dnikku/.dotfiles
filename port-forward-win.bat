
netsh interface portproxy delete v4tov4 listenport=22 listenaddress=192.168.0.15

netsh interface portproxy add v4tov4 listenport=22 listenaddress=192.168.0.15 connectport=22 connectaddress=192.168.136.132

