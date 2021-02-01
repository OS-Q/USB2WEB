# [S12](https://github.com/Qful/S12)

### [简介](https://github.com/Qful/S12/wiki) 

[webusb](https://github.com/Qful/webusb) 工程用于打通WEB端和设备端的直接通信，实现无网络设备的通信连接，也便于实现更强大的交互控制


`go get github.com/OS-Q/S12`

`go build github.com/OS-Q/S12`

`./webusb -e 21324`

disable all USB in order to run on some virtuaized environments

`./webusb -e 21324 -u=false`

support an emulator with debug link

`./webusb -ed 21324:21325 -u=false`



