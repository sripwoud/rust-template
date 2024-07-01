#!/bin/sh
set -eou pipefail

CYAN="\033[36m"
ORANGE="\033[33m"
RESET="\033[0m"

log() {
  printf "%b\n" "$1"
}

is_bin_locally_available() {
  crate="$1"
  [ -x ".cargo/bin/$crate" ]
}

install_local() {
  crate="$1"
  log "Installing $ORANGE$crate$RESET locally..."
  cargo install --root .cargo "$crate"
}

maybe_install_local() {
  crate="$1"
  if ! is_bin_locally_available "$crate"; then
    install_local "$crate"
  else
    log "$ORANGE$crate$RESET already installed locally. Skipping."
  fi
}

install_dev_deps() {
  log "Installing development dependencies..."
  crates="dprint nextest"

  for crate in $crates; do
    maybe_install_local "$crate"
  done
}

end_log() {
  log "\nTo get started, you can run the make tasks defined in the Makefile.\n"
  make help | tail -n +2 | head -n -1
}

main() {
  install_dev_deps
  end_log
}

main
