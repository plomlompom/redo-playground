#!/bin/sh

# This script is run by default for building target files with the .html
# extension.

# For reasons of simplicity of the example, the "building" of the target files
# from the source files consists of mere source code copying.

# Not using $2 here as it strips the directory prefix from the filename and I
# want to track the source file in the sub-directory.

mdfile="${1%.html}.md"
if [ -f "$mdfile" ]; then
  redo-ifchange "$mdfile"
  cp "$mdfile" "$3"
fi

rstfile="${1%.html}.rst"
if [ -f "$rstfile" ]; then
  redo-ifchange "$rstfile"
  cp "$rstfile" "$3"
fi
