requires go >= 1.6

`./go -e 21324`

disable all USB in order to run on some virtuaized environments

`./go -e 21324 -u=false`

support an emulator with debug link

`./go -ed 21324:21325 -u=false`


## API documentation

`trezord-go` starts a HTTP server on `http://localhost:21325`. AJAX calls are only enabled from trezor.io subdomains.

Server supports following API calls:

| url <br> method | parameters | result type | description |
|-------------|------------|-------------|-------------|
| `/` <br> POST | | {`version`:&nbsp;string} | Returns current version of bridge |
| `/enumerate` <br> POST | | Array&lt;{`path`:&nbsp;string, <br>`session`:&nbsp;string&nbsp;&#124;&nbsp;null}&gt; | Lists devices.<br>`path` uniquely defines device between more connected devices. Two different devices (or device connected and disconnected) will return different paths.<br>If `session` is null, nobody else is using the device; if it's string, it identifies who is using it. |
| `/listen` <br> POST | request body: previous, as JSON | like `enumerate` | Listen to changes and returns either on change or after 30 second timeout. Compares change from `previous` that is sent as a parameter. "Change" is both connecting/disconnecting and session change. |
| `/acquire/PATH/PREVIOUS` <br> POST | `PATH`: path of device<br>`PREVIOUS`: previous session (or string "null") | {`session`:&nbsp;string} | Acquires the device at `PATH`. By "acquiring" the device, you are claiming the device for yourself.<br>Before acquiring, checks that the current session is `PREVIOUS`.<br>If two applications call `acquire` on a newly connected device at the same time, only one of them succeed. |
| `/release/SESSION`<br>POST | `SESSION`: session to release | {} | Releases the device with the given session.<br>By "releasing" the device, you claim that you don't want to use the device anymore. |
| `/call/SESSION`<br>POST | `SESSION`: session to call<br><br>request body: hexadecimal string | hexadecimal string | Both input and output are hexadecimal, encoded in following way:<br>first 2 bytes (4 characters in the hexadecimal) is the message type<br>next 4 bytes (8 in hex) is length of the data<br>the rest is the actual encoded protobuf data.<br>Protobuf messages are defined in [this protobuf file](https://github.com/trezor/trezor-common/blob/master/protob/messages.proto) and the app, calling trezord, should encode/decode it itself. |
| `/post/SESSION`<br>POST | `SESSION`: session to call<br><br>request body: hexadecimal string | 0 | Similar to `call`, just doesn't read response back. Usable mainly for debug link. |
| `/read/SESSION`<br>POST | `SESSION`: session to call | 0 | Similar to `call`, just doesn't post, only reads. Usable mainly for debug link. |




