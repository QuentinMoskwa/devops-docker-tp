#!/bin/sh
# This script is used to create a timestamp file and write the current date and time into it.

set -eux
# Setting shell options for better error handling and debugging.
# 'e' option will cause the shell to exit if any invoked command fails.
# 'u' option treats unset variables and parameters as an error.
# 'x' option prints each command that gets executed to the terminal, useful for debugging.

TMP_DIR="/tmp/appTP"
mkdir -p "$TMP_DIR"
# create a variable for the directory to create it and stock it for the next part.

TIMESTAMP_FILE="$TMP_DIR/started.time"
# create another variable to add the file name.

touch "$TIMESTAMP_FILE"
# Create the timestamp file.

if [ $? -ne 0 ]; then
    exit 1
fi

date > "$TIMESTAMP_FILE"
# Write the current date and time to the timestamp file.

exec "$@"
# Pass control to another command or process.
# The "$@" is a special variable that holds all the arguments passed to the script.
