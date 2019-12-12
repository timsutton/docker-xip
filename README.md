# xip-docker

Basic Docker image with tools to be able to decompress .xip (and probably .pkg) files from Apple, with the goal of being able to decompress files packaged in this format, but on Linux instead of macOS.

User experience for this isn't fleshed out, this is a simple POC with a (very) basic helper shell script as an example of decompressing an Xcode .xip file.

For the .xip files, there's no handling of signatures or anything fancy like security assessment policy which can be done on a real macOS system. Decompression is completely single-threaded, and time to decompress Xcode 11.3 on a sample system of an Ivy Bridge Xeon E5-2697 v2 CPU with a spinning disk RAID, is about 10 minutes.

## Usage

Clone this repo locally, then build it from the checked out directory:

```
docker build -t xip .
```

To use the example of decompressing Xcode, copy an Xcode xip file to this directory and name it `xcode.xip`.

Now run a new container with this directory mounted somewhere (like `/tmp` here), and run the sample script:

```
docker run -v $(pwd):/tmp xip /tmp/unpack_xcode.sh
```

You should end up with the Xcode app bundle in the current directory.
