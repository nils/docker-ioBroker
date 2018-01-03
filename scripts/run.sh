#!/usr/bin/env sh

UPLOAD_FLAG=uploadDone

IOBROKER_CMD="node node_modules/iobroker.js-controller/controller.js $*"

echo "Execute setup"
./iobroker setup

if [ ! -f $UPLOAD_FLAG ]; then
    echo "First boot after update detected"
    echo "Uploading adapter files"
    ./iobroker start
    ./iobroker upload all
    date > $UPLOAD_FLAG
    ./iobroker stop
    echo "First Boot pre-init done!"
fi

if [ n$1 == nbash ]; then
  echo "Starting shell"
  $*
  exit $?
fi

#Start with PID 1
echo "$IOBROKER_CMD"
exec $IOBROKER_CMD
