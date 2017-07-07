all: bzip2 zlib freetype libmodplug libogg libtheora libvorbis luajit openal physfs love

bzip2:
	cd bzip2* && \
		make

zlib:
	cd zlib* && \
		sh ./configure --static && \
		make

freetype:
	cd freetype* && \
		env CPPFLAGS='-I../bzip2-1.0.6 -I../zlib-1.2.8' \
		LDFLAGS='-L../bzip2-1.0.6 -L../zlib-1.2.8' sh ./configure --without-png && \
		make

libmodplug:
	cd libmodplug* && \
		ln -s src libmodplug && \
		mkdir build && cd build && \
		cmake -D CMAKE_C_FLAGS='-include stdint.h -DHAVE_SINF' -D CMAKE_CXX_FLAGS='-include stdint.h -DHAVE_SINF' .. && \
		make

libogg:
	cd libogg* && \
		sh ./configure --disable-shared && \
		make

libtheora: libogg
	cd libtheora* && \
		env CPPFLAGS='-I../libogg-1.3.1/include' LDFLAGS='-L../libogg-1.3.1/src/.libs' sh ./configure --disable-shared && \
		make

libvorbis: libogg
	cd libvorbis* && \
		env CPPFLAGS='-I../libogg-1.3.1/include' LDFLAGS='-L../libogg-1.3.1/src/.libs' sh ./configure --disable-shared && \
		make

luajit:
	cd LuaJIT* && \
		make && \
		rm -rf src/libluajit.so

openal:
	cd openal* && \
		mkdir build && cd build && \
		cmake .. && \
		make && \
		rm -f libOpenAL.a &&\
		find CMakeFiles/openal.dir -name '*.o' | xargs ar rc libOpenAL.a

physfs:
	cd physfs* && \
		mkdir build && cd build && \
		cmake -D ZLIB_INCLUDE_DIR=../zlib-1.2.8 -D ZLIB_LIBRARY=../zlib-1.2.8 -D PHYSFS_ARCHIVE_7Z=OFF -D PHYSFS_ARCHIVE_GRP=OFF -D PHYSFS_ARCHIVE_HOG=OFF -D PHYSFS_ARCHIVE_MVL=OFF -D PHYSFS_ARCHIVE_QPAK=OFF -D PHYSFS_ARCHIVE_WAD=OFF -D PHYSFS_BUILD_SHARED=OFF .. && \
		make

love:
	cd love* && \
		env lua_CFLAGS='-I../luajit-2.0.3/src' lua_LIBS='-L../luajit-2.0.3/src' freetype2_CFLAGS='-I../freetype-2.5.0.1/include' freetype2_LIBS='-L../freetype-2.5.0.1/objs/.libs' openal_CFLAGS='-I../openal-soft-1.16.0/include' openal_LIBS='-L../openal-soft-1.16.0/build' libmodplug_CFLAGS='-I../libmodplug-0.8.8.5' libmodplug_LIBS='-L../libmodplug-0.8.8.5/build' vorbisfile_CFLAGS='-I../libogg-1.3.1/include -I../libvorbis-1.3.3/include' vorbisfile_LIBS='-L../libogg-1.3.1/src/.libs -L../libvorbis-1.3.3/lib/.libs' zlib_CFLAGS='-I../zlib-1.2.8' zlib_LIBS='-L../zlib-1.2.8' theora_CFLAGS='-I../libtheora-1.1beta3/include' theora_LIBS='-L../libtheora-1.1beta3/lib/.libs' CPPFLAGS='-I../physfs-2.0.3' LDFLAGS='-L../physfs-2.0.3/build' sh ./configure --disable-shared --disable-mpg123 && \
		make LIBS='-lfreetype -lOpenAL -lcommon -lmodplug -logg -lvorbis -lvorbisfile -ltheora -ldl -lpthread -lluajit -lz' && \
		g++ -o love love.o  -L../libvorbis-1.3.3/lib/.libs -L../physfs-2.0.3/build ./.libs/liblove.a -L../freetype-2.5.0.1/objs/.libs -L../luajit-2.0.3/src -L../openal-soft-1.16.0/build -L../zlib-1.2.8 -L../libmodplug-0.8.8.5/build -L../libogg-1.3.1/src/.libs -L../libtheora-1.1beta3/lib/.libs -lSDL2 -lphysfs -L../bzip2-1.0.6 -L../zlib-1.2.8 -lOpenAL -lcommon -lmodplug -lm ../libtheora-1.1beta3/lib/.libs/libtheora.a -ldl -lpthread -lluajit -lz -Wl,-rpath -Wl,../freetype-2.5.0.1/objs/.libs/.libs -Wl,-rpath -Wl,../libvorbis-1.3.3/lib/.libs/.libs -Wl,-rpath -Wl,../libvorbis-1.3.3/lib/.libs -Wl,-rpath -Wl,../libogg-1.3.1/src/.libs/.libs
