#!/bin/sh

# This script is run with "redo reset" and (re-)creates the example html files
# that should be deleted by "redo all" in absence of their source files, and
# also deletes the once that should be created by it.

rm foo.html
rm bar.html
rm baz/foo.html
rm baz/bar.html
touch quux.html
touch baz/quux.html
