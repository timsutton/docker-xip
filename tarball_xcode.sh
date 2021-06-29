#!/bin/bash

# put your Xcode.app bundle into a dir called 'pkgroot' in the cwd
tar -v -c -f - -C /tmp/pkgroot . | pigz > /tmp/Xcode.tar.gz
