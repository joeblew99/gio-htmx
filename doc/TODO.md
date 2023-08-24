# todo

VERY IMPORTANT !

- cmd/release-crush/example creates a binary outside the .bin.
- fix go.mk so it does not do this, so we do not screw up our git repo.

basic GUI scaffold is done.

- just to get the architecture building.

deck

- add makefile for deck builder that supports fork syncing.

fix gio.mk for windows

- so that for windows build the .syso files are deleted after build. 
- It screws up the 2nd time you build.

appicon.png

- just add some default one.
- gio.mk wants it

deeplinks

- https://github.com/gioui/gio/pull/117
- add gio deep link support, so that the Desktop reacts to when a user clicks on a .ext. WTF do we use for a file extension ? .gio maybe.
- Check that Web works, so that if you have the desktop client it uses that, and if not it users the web version.

hyperlinks

- https://github.com/gioui/gio-x/pull/17 so that hyperlinks work on all platforms.

Packaging

- For Client and Server ...
- For Mac and Windows is partially done in gio.mk, as GIO does not do it.
- Signing for Mac
- Publishing as pkg ( mac ) and msi ( windows )
- We need the Server to be a Service that is always running on the standard port.

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
