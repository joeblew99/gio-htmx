# todo

VERY IMPORTANT !

fix go.mk

- cmd/release-crush/example creates a binary outside the .bin.
- so it does not do this, so we do not screw up our git repo.

fix gio.mk for windows

- so that for windows build the .syso files are deleted after build.
- It screws everything the 2nd time you build.

Packaging: Get an installable build out

- this is high priority because e need to see ANY bugs that the current basic code has now.
- For Client and Server as one install.
- Server is a Service on Desktops always running.
- For Mac and Windows is partially done in gio.mk, as GIO does not do it.
- Signing for Mac
- Publishing as pkg ( mac ) and msi ( windows )
  - This looks perfect and can be started in "exp" to test it out.
  - https://github.com/gohugoio/hugoreleaser
- Publish to s3:
  - https://github.com/bep/s3deploy
- mkcert embed to our Server, so that users on desktop don't need it as a separate binary.
  - https://github.com/bep/mclib

---

GUI

- add Panes, like explained in the README.md
  - add Left Pane as tree view
  - add mid pane as Webview ( load the markdown plugin for now)
    - https://github.com/gioui-plugins/gio-plugins/tree/main/webviewer can do it.
  - add Right Pane as tree view
- add Nav
  - suggest looking at https://github.com/g45t345rt/g45w because he has GIO nav working on Desktop, Mobile and web nicely and we will need a decent nav system.


plugins

- Make 2 plugins to get going
  - deck
  - markdown ( first one )

deck plugin

- add makefile for deck builder that supports fork syncing.

aqua

- all document types as wasm plugins (see plugin folder ), and so we need to get aqua integrated.
- Its best if we wrap aqua because its code is really confusing.

appicon.png

- just add some default one.
- gio.mk wants it

GUI - deeplinks

- https://github.com/gioui/gio/pull/117
- add gio deep link support, so that the Desktop reacts to when a user clicks on a .ext. WTF do we use for a file extension ? .gio maybe.
- Check that Web works, so that if you have the desktop client it uses that, and if not it users the web version.
- add "Create Project" like explained in the "doc/README.md"
  - this will test the deep link.

GUI - hyperlinks

- https://github.com/gioui/gio-x/pull/17 so that hyperlinks work on all platforms.


versioning

- add git version to makefile
- add version.go, and have gio.mk set LDFLags.

CI

- add git tag support to makefile.
- add github workflow that uses the makefile itself to build.
- add signing. needed for Mac Notary. Need to buy a freaking Apple dev subscription. dam you apple !!

CD

- add update.go, so that the client can check for software update from caddy hosted binaries.

GUI - scaffold out 3 pane gui.

- at the moment i just dropped in a GUI markdown demo to get the architecture joined up.
- Add gio-canvas to, but we need a fork of it to add our stuff.

FS Watcher

- Documents can be chnaged by the OS or the user, and not just via the GUI, so we need a FS Watacher, that can also do the diff, as if the GUI did the change.
- https://github.com/adhocteam/pushup has this !


Embedding

- Caddy can embed NATS Leaf so we have both HTTP and NATS transports.
- Cloud can also use this embedding, as NATS Cluster can link to NATS Leaf.
- Be aware that anything that is deployed to Desktop MUST be signed, and so embedding means that we only need to sign one thing.
- that why i am trying to leverage NATS for as many things as possible.
- for example: https://github.com/sandstorm/caddy-nats-bridge might work well ?

weaver
- k8 for goang projects: https://serviceweaver.dev/
- if we embed out code inside this we get Desktop and Cloud from one code base.

secrets

- At the moment on desktop we store secretes in .env
- But we can use NATS KV for secrets storage. NATS encrypts at rest.
- When we boot up, we can ask nats for any secrets by user.
- So for release, we need to only make sure NATS uses a Data path that is designed for Desktop Services ( for mac, windows ) and Server ( for cloud )

- https://github.com/k3s-io/kine is an etcd that can use NATS for storage. So local and cloud can use it.
  - local needs to be embedded

- https://github.com/heikkilamarko/todo-app has really good integration using SOPS and AGE with caddy, nats etc. It even has async api schema. VERY good basis !!

- secrets for caddy can be stored in nats: https://github.com/HeavyHorst/certmagic-nats/tree/main

Minio

- For document storage on cloud.
- So it allows Desktop users to publish to the Cloud and we use Minio
- Minio has NATS Notifications to tell use when any document changes.
- Minio is ONLY for cloud so we dont need to embed. We need to make sure all our code talking to the FS is agnostic to use both.
  - https://github.com/zeroshade/icegopher/issues/1 does this.

NATS

- scaffold out basic nats

- embed nats server using https://github.com/maxpert/marmot

- add nats services
  - https://github.com/nats-io/nats.go/tree/main/jetstream IS the new API
  - "github.com/nats-io/nats.go/jetstream"

- GUI publishes and consumes
- Server also publishes and consumes. It runs a NATS Leaf service.
- Cloud can run a NATS Cluster to connect all users together

Diff

- add unified git diff lib, so that we can send deltas between client and server and merge them over nats
  - https://github.com/aymanbagabas/go-udiff


multi-window

- gio skel gives OS native tabs, so that you can work on many projects from one app. It does not work currently on Web or Mobile though, so maybe later.

search

- Zinc is perfect as it can use local and s3.
- This is so that users can search for any text in or across their projects.

auth and authourisation

- https://github.com/zitadel/zitadel has what we need
- tie to togthr with NATS
- use cockroachDB cluster to run it.

