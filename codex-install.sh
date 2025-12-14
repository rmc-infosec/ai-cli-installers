#!/bin/bash
PACKAGE="@openai/codex"
PREFIX="$HOME/.local"

get_version() {
  npm list -g "$PACKAGE" --prefix="$PREFIX" --depth=0 2>/dev/null | grep "$PACKAGE" | awk -F@ '{print $NF}'
}

OLD_VER=$(get_version)

if [ -z "$OLD_VER" ]; then
  echo "Installing $PACKAGE..."
else
  echo "Found version: $OLD_VER. Checking for updates..."
fi

npm install -g "$PACKAGE" --prefix="$PREFIX"

NEW_VER=$(get_version)

if [ -z "$OLD_VER" ]; then
  echo "Installed $PACKAGE version: $NEW_VER"
elif [ "$OLD_VER" != "$NEW_VER" ]; then
  echo "Updated $PACKAGE from $OLD_VER to $NEW_VER"
else
  echo "$PACKAGE is already up to date ($NEW_VER)"
fi