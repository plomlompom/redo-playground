#!/bin/sh

# This script is run to build the bar.html file. It takes precedence over the
# default.html.do script that's run by default to build .html files.

redo-ifchange ./htmlify

# The difference to the default.html.do behavior is a change in precedence of
# source file formats.

mdfile="${2%.html}.md"
rstfile="${2%.html}.rst"

if [ -f "$rstfile" ]; then
  redo-ifchange "$rstfile"
  ./htmlify "$rstfile" > "$3"
fi

if [ -f "$mdfile" ]; then
  redo-ifchange "$mdfile"
  ./htmlify "$mdfile" > "$3"
fi
