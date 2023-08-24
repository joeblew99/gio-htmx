# deck

We use Deck as one type of document.

We need to add some things to it:

- so we will need to fork it and extend it slightly.
- so make sure we have git commands for making forks easily.

We need it cleaned and cross compiled, ready to be used.

- use go.mk as its designed for this and supports wasm.
- use gio.mk to build the GUI that will be in the middle pane running as a Webview.

We need the examples sucked out of the deck repo and put into this repo or another. Maybe for now just suck out 5 good examples that w can use. Later we can suck them all out and put into S3, so then users can get them easily when we have Cloud with minio running.
