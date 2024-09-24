#!/usr/bin/env bash

current=$(cd $(dirname "$0") && pwd)

cat "$current/vscode-extensions.txt" | while read extension || [[ -n $extension ]]; do
  code --install-extension $extension --force
done
