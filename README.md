# Websocket Blinky

A "poncho" application designed to run on the Raspberry Pi (3) which allows
users to connect to a UI served by Phoenix to control the Pi's green LED
via websockets.

## Notes

Connnecting to a socket and sending and recieving messages from the browser.

```javascript
// Setup the socket
let socket = new Phoenix.Socket("/socket");
socket.connect();
let channel = socket.channel("led:green", {})
channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) });

// Send data
channel.push('toggle', {active: true});
```
