# plugin

We want to support many document types and so hence plugins.

We use WASM, because then its easy to distribute them at runtime.

We will extend aqua or use NATS to act as a Registry and Proxy runner.

## Runner

https://github.com/tetratelabs/wazero is the WASM runner that runs on Desktops and Cloud.

https://github.com/brendandburns/caddy-wasm is a WebAssembly (WASM) extension for the caddy2 web server, that makes it easy to host Wazero.

- this looks perfect since we wrap everything with Caddy.

https://github.com/bots-garden/capsule is another runner

- which will get NATS integration soon.
- will also get workflows i suspect too.
