# gio-htmx

Its a basic GUI using gioui to allow document interaction using htmx pattern.

## Run

```sh

make all

make start-caddy
make start-nats

```

## Docs

See the [Doc](doc/README.md) folder to see how it works.

## Contribute

We use ssh signing for github. Steps:

- fork this repo on github
- then locally ...
- clone your repo
- copy env-template --> .env
- put your git details in .env
- ```make env-print``` to check them
- ```make git-init``` to configure git to use them
- ```make git-upstream-set``` to configure where you will pull upstream changes from
- make some change and commit with a message in vscode, etc
- ```make git-pull``` to catch up to upstream
- ```make git-push``` to push your changes to you repo, and then PR

