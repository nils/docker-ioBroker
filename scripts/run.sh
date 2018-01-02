#!/bin/sh
FIRST_BOOT_FLAG=firstBootDone
IOBROKER_CMD="node node_modules/iobroker.js-controller/controller.js"
if [ ! -f /tmp/foo.txt ]; then
    echo "First boot detected"
    echo "Uploading adapter files"
    $IOBROKER_CMD upload all
    date > FIRST_BOOT_FLAG
    echo "First Boot pre-init done!"
fi

if [ n$1 == nbash ]; then
  echo "Starting shell"
  $*
else
  #Start with PID 1
  exec $IOBROKER_CMD $*
fi
