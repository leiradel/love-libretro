all:
	cd bzip2-1.0.6/build && make -f Makefile.$(platform)
	cd freetype-2.5.0.1/build && make -f Makefile.$(platform)
	cd libmodplug-0.8.8.4/build && make -f Makefile.$(platform)
	cd libogg-1.3.1/build && make -f Makefile.$(platform)
	cd libtheora-1.1/build && make -f Makefile.$(platform)
	cd libvorbis-1.3.3/build && make -f Makefile.$(platform)
	cd luajit-2.0.3/build && make -f Makefile.$(platform)
	cd physfs-2.0.3/build && make -f Makefile.$(platform)
	cd zlib-1.2.8/build && make -f Makefile.$(platform)
	cd openal-soft-1.16.0/build && make -f Makefile.$(platform)
	cd love-6370a05c13c2/build && make -f Makefile.$(platform)

clean:
	cd bzip2-1.0.6/build && make -f Makefile.$(platform) clean
	cd freetype-2.5.0.1/build && make -f Makefile.$(platform) clean
	cd libmodplug-0.8.8.4/build && make -f Makefile.$(platform) clean
	cd libogg-1.3.1/build && make -f Makefile.$(platform) clean
	cd libtheora-1.1/build && make -f Makefile.$(platform) clean
	cd libvorbis-1.3.3/build && make -f Makefile.$(platform) clean
	cd luajit-2.0.3/build && make -f Makefile.$(platform) clean
	cd physfs-2.0.3/build && make -f Makefile.$(platform) clean
	cd zlib-1.2.8/build && make -f Makefile.$(platform) clean
	cd openal-soft-1.16.0/build && make -f Makefile.$(platform) clean
