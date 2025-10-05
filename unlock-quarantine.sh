#!/bin/zsh

if [ -z "$1" ]; then
  echo "Please provide the application name as a parameter."
  exit 1
fi
APP_NAME="$1"
APP_PATH="/Applications/$APP_NAME.app"
if [ ! -d "$APP_PATH" ]; then
  echo "Application $APP_NAME not found in /Applications."
  exit 1
fi
sudo xattr -dr com.apple.quarantine "$APP_PATH"
echo "Quarantine attribute removed from $APP_NAME."
