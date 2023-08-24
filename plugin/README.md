# plugin

We want to support many document types and so hence plugins.

We use WASM, because then its easy to distribute them at runtime.

We will extend aqua or use nats to act as a Registry and Proxy runner.

https://github.com/tetratelabs/wazero is the WASM runner that runs on Desktops and Cloud.

https://github.com/brendandburns/caddy-wasm is a WebAssembly (WASM) extension for the caddy2 web server.

- this looks perfect since we wrap everything with Caddy.

https://github.com/bots-garden/capsule is another runner, hich will get NATS integration too. Its still a bit raw though


