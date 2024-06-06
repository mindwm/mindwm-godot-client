# WIP Project
This is a PoC implementation of a MindWM client using Godot 4.x. You will need a patched version of Godot engine which is integrated with X11 server to fetch current active windows list and capture a window pixmat and put it as a texture into Godot internals.

# Godot version
Right now you can get the Godot from the https://github.com/omgbebebe/godot/tree/capture_xcomposite branch. Compile it as usual via `scons platform=linuxbsd`. Then you can load this project into editor.
