redo-playground
---------------

This is an example setup of a directory tree managed by the redo build system.

There are source files with the extensions .md and .rst which are to be
translated into .html files via the ./htmlify script.

There are also files (./quux.html and ./baz/quux.html) which lack source files.
This setup wants .html files without source files deleted.

In cases where the same .html file could be built from different source files
(i.e. there is both a foo.md and a foo.rst), preference should by default be
given to the .rst source file. But a special rule affects the bar.html target:
Here, preference is to be given to a .md source file.

Run "redo" to trigger the all.do script that enforces the above rules (using
the default.html.do and the bar.html.do build scripts).

Run "redo reset" to (by way of the reset.do script) reset the initial directory
state after it has been changed that way.
