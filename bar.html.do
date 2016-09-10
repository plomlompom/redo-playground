#!/bin/sh

# This script is run to build the bar.html file. It takes precedence over the
# default.html.do script that's run by default to build .html files.

# For reasons of simplicity of the example, the "building" of the target file
# from the source files consists of mere source code copying.

# The difference to the default.html.do behavior is a change in precedence of
# source file formats.

mdfile="${2%.html}.md"
rstfile="${2%.html}.rst"

if [ -f "$rstfile" ]; then
  redo-ifchange "$rstfile"
  cp "$rstfile" "$3"
fi

if [ -f "$mdfile" ]; then
  redo-ifchange "$mdfile"
  cp "$mdfile" "$3"
fi
