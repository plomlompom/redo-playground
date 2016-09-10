#!/bin/sh

# The all.do script is run by default when the redo command is used without
# arguments.

# Remove target (html) files for which no sources files can be found.
for file in *.html; do
  if   test -f "$file" &&
     ! test -f "${file%.html}.rst" &&
     ! test -f "${file%.html}.md"; then
    rm "$file"
  fi
done

# Determine target files from the sources files present, declare dependencies
# of the all.do script on them / build them if necessary.
for file in *.rst; do
  if test -f "$file"; then
    redo-ifchange "${file%.rst}.html"
  fi
done
for file in *.md; do
  if test -f "$file"; then
    redo-ifchange "${file%.md}.html"
  fi
done

# Run redo in subdirectories, and copy current all.do there if none exists.
for d in *; do
  if test -d "$d"; then
    if ! test -f "$d"/all.do; then
      cp $0 "$d"/all.do
    fi
    redo "$d"/all
  fi
done
