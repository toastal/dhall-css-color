#!/usr/bin/env dash
set -euf

dir=$(readlink -f "$(dirname $(readlink -f "$0"))/../Webmanifest")

license_banner=$(cat << EOF
-- SPDX-License-Identifier: BSD-3-Clause
-- Copyright © 2020 toastal dhall-css-color
EOF
)

for filepath in $(find $dir -name *.dhall); do
  file=$(basename $filepath)

  echo -n "$file … "

  dhall_license_banner="$(head -n2 $filepath)"

  if [ "$dhall_license_banner" = "$license_banner" ]; then
    echo "passed."
  else
    echo "FAILED."
    echo
    echo "Expected license banner:"
    echo ${license_banner}
    echo
    echo "But got:"
    echo "${dhall_license_banner}"
    exit 1
  fi
done

exit 0
