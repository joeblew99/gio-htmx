# docs

Using Markup documents for gio with htmx pattern...using x-data.

## GUI

Left pane:

- Tree view of what’s on the file system in terms of folders and files.

Middle pane:

- The canvas Renderer.

Right pane:

- Tree view with the properties of the document.

## Workflows

Open a Project

- Via the GUI or the CLI. The CLI and GUI are the same binary. The main.go will for the first arg as path to your project folder. If empty it just opens the GUI.

- If you did not use the CLI, The GUI, shows a list of recently used projects. These are stored in the XDG folder. https://git.sr.ht/~eliasnaur/gio/tree/v0.2.0/app/app.go#L51

Edit a Project

- Edit the document properties in the Right Pane.
- Its will fire the Property Change event...

## Events

NATS is a pub sub system that allows the GUI and the Backend "collaborate" over the documents changes.

There is no need for typical router setup because NATS is a virtual router, and so allowing use to do Per Project File based routing, which is exactly what we want.

An event holds:

- NATS topic: "Events"
- NATS Subject: "Project ID: document XMLPath"
- NATS Event Payload: "data of the event"

Sequence is like:

- GUI
  - Registers to Consume all Changed event for its Subject Namespace.
  - User changes a property
  - Publishes a Change event to NATS

- Service
  - Consumes Change event
  - Carries out the change to the document mutating a new document.
  - Diffs the old and new document.
  - Publishes a "Changed" event with the subject so the right consumer gets it. You could have 3 GUI open and they each are in change of only one Subject namespace.

- GUI
  - Consumes the Changed event.
  - Patches its document with the diff.
  - Renders.