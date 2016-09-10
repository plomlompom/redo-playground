#!/bin/sh

# The all.do script is run by default when the redo command is used without
# arguments.

# Remove target (html) files for which no sources files can be found.
IFS=$(echo -en "\n\b")
for file in `find . -name "*.html"`; do
  if   test -f "$file" &&
     ! test -f "${file%.html}.rst" &&
     ! test -f "${file%.html}.md"; then
    rm "$file"
  fi
done

# Determine target files from the sources files present, declare dependencies
# of the all.do script on them / build them if necessary.
for file in `find . -name "*.rst"`; do
  redo-ifchange "${file%.rst}.html"
done
for file in `find . -name "*.md"`; do
  redo-ifchange "${file%.md}.html"
done
