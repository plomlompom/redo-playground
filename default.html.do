#!/bin/sh

# This script is run by default for building target files with the .html
# extension.

redo-ifchange ./htmlify

# Not using $2 here as it strips the directory prefix from the filename and I
# want to track the source file in the sub-directory.

mdfile="${1%.html}.md"
if [ -f "$mdfile" ]; then
  redo-ifchange "$mdfile"
  ./htmlify "$mdfile" > "$3"
fi

rstfile="${1%.html}.rst"
if [ -f "$rstfile" ]; then
  redo-ifchange "$rstfile"
  ./htmlify "$rstfile" > "$3"
fi
