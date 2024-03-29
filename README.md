# RaspberryPi-gst-rpicamsrc

## Overview

This repository enables to install GStreamer plugin for **rpicamsrc**.

## Known supported Raspberry Pi

* Raspberry Pi 3B,
* Raspberry Pi 3A+.

## Known supported OS

* Bullseye.

## Installation

Installation procedure:

```bash
git clone --recurse-submodules \
    -j$(nproc) https://github.com/raspberrypiexperiments/RaspberryPi-gst-rpicamsrc.git
```
```bash
cd RaspberryPi-gst-rpicamsrc
```
```
make install
```

## Uninstallation

Uninstallation procedure:

```bash
make uninstall
```
```bash
cd ..
```
```bash
rm -rf RaspberryPi-gst-rpicamsrc
```

## License

MIT License

Copyright (c) 2022-2023 Marcin Sielski <marcin.sielski@gmail.com>
