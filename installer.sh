#!/usr/bin/env bash

askInstall() {
  read -p "Would you like to install Translate [Y/n]" -r answer
  if [[ "$answer" = [Yy] ]]; then
    echo "Installing Translate"
    chmod a+x translate/translate
    cp translate/translate /usr/local/bin >/dev/null 2>&1 || echo "Error, try running as sudo."
    exit 0
  elif [[ "$answer" != [Nn] ]]; then
    echo "Unknown answer, please try again."
    askInstall
  fi
}

askInstall