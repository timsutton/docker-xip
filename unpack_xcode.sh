#!/bin/bash

cd /tmp
xar -x -f xcode.xip
pbzx -n Content | cpio -i
