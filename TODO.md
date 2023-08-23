# todo

basic GUI scaffolds is done.

- just to get the architecture building.

deck

- add makefile for deck builder that supports fork syncing.

fix gio.mk for windows

- so that for windows buidl the .syso files are deleted after build. 
- It screws up the 2nd time you build.

appicon.png

- just add some default one.
- gio.mk wants it

caddy and nats.mk bins must go to .bin

- change it to build to the .bin folder, rather than the goapth/bin
- later change to use aqua registry, but that later.

deeplinks

- https://github.com/gioui/gio/pull/117/commits
- add gio deep link support, so that the Desktop reacts to when a user clicks on a .ext. WTF do we use for a file extension ? .gio maybe.
- Check that Web works, so that if you have the desktop client it usrs that, and if not it users the web version.

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
- Add gio-canvas, but we need a fork of it to add our stuff.

NATS - scaffold out basic nats

- just to get data flowing between client and server
-https://github.com/ebubekiryigit/go-nats-jetstream-example/tree/main looks good.

Diff

- add unified git diff lib, so that we can send deltas between client and server over nats.
