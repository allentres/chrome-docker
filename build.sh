#!/usr/bin/env bash
docker build -t google-chrome:latest .
docker save -o /tmp/google-chrome.tar google-chrome:latest
echo "Chrome Docker images save to /tmp/google-chrome.tar"

