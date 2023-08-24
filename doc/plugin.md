# plugins

To allow the system to be extend with new document types.

Anything that can compile to wasm can be a plugin.

You have security via the WASM sandbox, which is the same one that browsers use.

## Registry

All plugins are in the public Registry at : ??

Plugin Developers can upload their wasm to github releases, and the Registry will watch for them.

## Versioning

All plugins use the standard git tag as a version.

This is very important because users will have different versions across different projects.



## Using

From the GUI or CLI, you can search for Plugins and pick what you want.

## Late loading

If you open a project that uses plugins you don't have installed the system will auto install them.