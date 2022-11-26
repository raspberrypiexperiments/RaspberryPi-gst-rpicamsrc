# MIT License
#
# Copyright (c) 2022 Marcin Sielski <marcin.sielski@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


dependencies:
	sudo apt update
	sudo apt upgrade -y
	sudo apt install libgstreamer*-dev libgstrtspserver-1.0-dev python3-gst-1.0 autoconf libtool -y

install: dependencies
	wget https://raw.githubusercontent.com/raspberrypiexperiments/RaspberryPi-GStreamer-1.0/main/0006_RaspiCapture.c.patch -o gst-rpicamsrc/src/0006_RaspiCapture.c.patch
	wget https://raw.githubusercontent.com/raspberrypiexperiments/RaspberryPi-GStreamer-1.0/main/0007_gstrpicamsrc.c.patch -o gst-rpicamsrc/src/0007_gstrpicamsrc.c.patch
	wget https://raw.githubusercontent.com/raspberrypiexperiments/RaspberryPi-GStreamer-1.0/main/0010_RaspiCapture.h.patch -o gst-rpicamsrc/src/0010_RaspiCapture.h.patch
	cd gst-rpicamsrc/src && if ! patch -R -p7 -s -f --dry-run < 0006_RaspiCapture.c.patch; then patch -p7 < 0006_RaspiCapture.c.patch; fi
	cd gst-rpicamsrc/src && if ! patch -R -p7 -s -f --dry-run < 0007_gstrpicamsrc.c.patch; then patch -p7 < 0007_gstrpicamsrc.c.patch; fi
	cd gst-rpicamsrc/src && if ! patch -R -p7 -s -f --dry-run < 0010_RaspiCapture.h.patch; then patch -p7 < 0010_RaspiCapture.h.patch; fi
	cd gst-rpicamsrc && ./autogen.sh --prefix=/usr --libdir=/usr/lib/arm-linux-gnueabihf/ && make && sudo make install

uninstall:
	cd gst-rpicamsrc && sudo make uninstall