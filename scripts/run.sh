#!/usr/bin/env sh

IOBROKER_CMD="node node_modules/iobroker.js-controller/controller.js $*"

echo "Set timezone"
cp -av /etc/timezone_host /etc/timezone
#Line for Alpine (no glibc)
cp /usr/share/zoneinfo/$(cat /etc/timezone) /etc/localtime
# Line for Ubuntu
# timedatectl set-timezone $(cat /etc/timezone)

echo "Execute setup"
./iobroker setup

if [ n$1 == nbash ]; then
  echo "Starting shell"
  $*
  exit $?
fi

#Upload files in background
upload.sh &

#Start with PID 1
echo "$IOBROKER_CMD"
exec $IOBROKER_CMD
