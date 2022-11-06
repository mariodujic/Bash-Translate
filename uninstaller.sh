#!/usr/bin/env bash

askUninstall() {
  file="/usr/local/bin/translate"
  read -p "Would you like to uninstall Translate [Y/n]" -r answer
  if [[ "$answer" = [Yy] ]]; then
    if [ -f "$file" ]; then
      chmod 400 "$file" || { echo "Try running uninstall script as sudo"; exit 1; }
      echo -n "Uninstalling Translate: "
      rm -f "$file" >/dev/null 2>&1 || { echo "Failure" ; echo "Error removing file, try running uninstall script as sudo"; exit 1; }
      echo "Success"
    else
      echo "Script not installed."
    fi
  elif [[ "$answer" != [Nn] ]]; then
    echo "Unknown answer, please try again."
    askInstall
  fi
}

askUninstall