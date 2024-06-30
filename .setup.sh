#!/bin/sh

set -eou pipefail

is_bin_locally_available() {
  crate="$1"
  ! [ -x "$(command -v ".cargo/bin/$crate")" ]
}

install_local() {
  crate="$1"
  cargo install --root .cargo "$crate"
}

maybe_install_local() {
  crate="$1"
  if is_bin_locally_available "$crate"; then
    install_local "$crate"
  else
    echo "$crate already installed locally. Skipping."
  fi
}

main() {
  crates="dprint nextest"

  for crate in $crates; do
    maybe_install_local "$crate"
  done
}

main
