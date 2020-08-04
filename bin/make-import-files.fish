#!/usr/bin/env fish

set root_dir (dirname (readlink -m (status --current-filename)/..))

# BROKEN
for filepath in $root_dir/WebAppManifest/*
  set file (basename $filepath)
  if not test $file = "package.dhall"
    set filename (string split -r -m1 . $file)[1]
    set dir (dirname $filepath)
    echo $filename
    set content "-- vim: filetype=dhall"\n$file
    echo $content
    echo $content > $filename
  end
end
