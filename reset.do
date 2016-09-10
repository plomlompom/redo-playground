#!/bin/sh

# This script is run with "redo reset" and (re-)creates the example html files
# that should be deleted by "redo all" in absence of their source files, and
# also deletes the once that should be created by it.

rm -f foo.html
rm -f bar.html
rm -f baz/foo.html
rm -f baz/bar.html
rm -f baz/all.do
touch quux.html
touch baz/quux.html
rm -rf .redo
rm -rf baz/.redo
