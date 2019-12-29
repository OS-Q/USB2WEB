# [WEBUSB](https://github.com/OS-Q/WEBUSB)
[![sites](http://182.61.61.133/link/resources/OSQ.png)](http://www.OS-Q.com)

#### 关于系统架构：[OS-Q](https://github.com/OS-Q)
#### 归属系统交互：[UI-Q](https://github.com/OS-Q/UI-Q)

### [WEBUSB描述](https://github.com/OS-Q/WEBUSB/wiki) 

WEBUSB工程用于打通WEB端和设备端的直接通信，实现无网络设备的通信连接，也便于实现更强大的交互控制


`go get github.com/OS-Q/WEBUSB`

`go build github.com/OS-Q/WEBUSB`

`go build .`

`./WEBUSB -h `

requires go >= 1.6

`./WEBUSB -e 21324`

disable all USB in order to run on some virtuaized environments

`./WEBUSB -e 21324 -u=false`

support an emulator with debug link

`./WEBUSB -ed 21324:21325 -u=false`

### EMU 

https://github.com/Qitas/emu


`make build`

`make emu`

### [OS-Q = Open Solutions | Open Source |  Operating System ](http://www.OS-Q.com/N01)
####  2019-5-10

