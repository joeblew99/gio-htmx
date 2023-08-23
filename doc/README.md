# docs

## GUI layout

Left pane:

Tree view of what’s on the file system in terms of folders and files.

Middle pane:

The deck gio canvas Renderer.

Right pane: 

Tree view with the properties of the decksh. You can change properties like sone text t is sent via nats to the backend as a decksh change and changes the decksh and then calculates the diff and publishes it to the nats decksh changed Event which the middle pane gets and it mergers the diff in 
So the gui above is using nats to edit the decks


## event system

Nats is a pub sub system that allows the GUI and the Backend "collaborate" over the documents changes.


We don’t need a http router because NATS topics and their subjects are a router.

NATS topic: Events
NATS Subjects withing a topic: The Project ID, and the file system namespace.
Event Payload: ProjectID, Data ( that represent the intent of the event)

Sequence is like:

- GUI: User changed a property

So if the frontend publishes an x-data event to the x-data topic using a subject that targets where the DeckSh files lives.

Then there is a nats consumer listening to x-data topic and the decksh project it controls.This consumer is a singleton per project. It just started up and lost s for any events that match it’s namespace.
So you could have 3 projects running on your laptop and they will all interoperate !!!
So a consumer gets an event and then reaches onto the correct decksh file ( based on the x-data message payload and then makes the changes based on our htmx logic and publishes that xml onto a nats frontend topic with the same subject namespace.
The frontend gui is subscribing to the frontend topic and then magres the xml I to its xml and renders it based on our htmx logic.
I know you want to know next what is the manipulation but it’s still too early to know. We both know the concepts of htmx, but I am laying out the events system here first.
The main thing is that nats.Go being used by the gui and the backend will makes things way way easier because it’s a virtual router and we can use the subject space to target decksh documents that live on the file system. Way way less plumbing work
 I have a makefile that gets nats setup locally so we can use that to get going.
—-
