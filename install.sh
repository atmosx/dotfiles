#!/usr/bin/env bash

set -e

vrc_s=~/.vimrc
vrc_c="vimrc"

if [ -f "$vrc_s" ]; then
  n=$(date +'%Y.%m.%d')
  old="${vrc_s}.${n}-orig"
  mv $vrc_s $old
  echo "Moved existing $vrc_s to ${old}"
fi

cat ${vrc_c} | envsubst > ~/.vimrc
