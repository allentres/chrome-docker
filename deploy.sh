#!/bin/sh
# sample deploy script
TARGET=root@target.host.com
CHROME=$(cat <<EOD
docker run -i --rm -d \
  --name chrome \
  --privileged \
  -e LOCAL_USER_ID=user \
  -e LOCAL_GROUP_ID=user \
  -e DISPLAY=":0" \
  --network=host \
  --uts=host \
  -v /var/run:/var/run \
  -v /dev/shm:/dev/shm \
  -v /etc/localtime:/etc/localtime:ro \
  -v /etc/timezone:/etc/timezone:ro \
  -v /etc/resolv.conf:/etc/resolv.conf:ro \
  -v /etc/hosts:/etc/hosts:ro \
  -v /etc/hostname:/etc/hostname:ro \
  -v /tmp/.X11-unix/:/tmp/.X11-unix \
  google-chrome:latest \
  --overscroll-history-navigation=0 \
  --disable-pinch \
  --disable-translate \
  --no-first-run \
  --disable-usb-keyboard-detect \
  --disable-infobars \
  --disable-session-crashed-bubble \
  --incognito \
  --start-maximized \
  http://localhost:8888
EOD)
ssh ${TARGET} "${CHROME}"

