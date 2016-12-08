# love-libretro

**love-libretro** is a *work in progress* port of the [LÖVE](https://love2d.org/) to [libretro](http://www.libretro.com/).

## Build

In the instructions below, change `/path/to` for the **absolute** path of the appropriate libraries. Yes, some build tools are braindead like that.

### bzip2

```
$ make
```

### zlib

```
$ sh ./configure --static
$ make
```

### FreeType

```
$ env CPPFLAGS='-I/path/to/bzip2-1.0.6 -I/path/to/zlib-1.2.8' LDFLAGS='-L/path/to/bzip2-1.0.6 -L/path/to/zlib-1.2.8' sh ./configure --without-png
$ make
```

### libmodplug

```
$ ln -s src libmodplug
$ mkdir build && cd build
$ cmake -D CMAKE_C_FLAGS='-include stdint.h -DHAVE_SINF' -D CMAKE_CXX_FLAGS='-include stdint.h -DHAVE_SINF' ..
$ make
```

### libogg

```
$ sh ./configure --disable-shared
$ make
```

### libtheora

```
$ env CPPFLAGS='-I/path/to/libogg-1.3.1/include' LDFLAGS='-L/path/to/libogg-1.3.1/src/.libs' sh ./configure --disable-shared
$ make
```

### libvorbis

```
$ env CPPFLAGS='-I/path/to/libogg-1.3.1/include' LDFLAGS='-L/path/to/libogg-1.3.1/src/.libs' sh ./configure --disable-shared
$ make
```

### luajit

```
$ make
$ rm src/libluajit.so
```

### OpenAL

```
$ mkdir build && cd build
$ cmake ..
$ make
$ rm -f libOpenAL.a
$ find CMakeFiles/openal.dir -name '*.o' | xargs ar rc libOpenAL.a
```

### PhysicsFS

```
$ mkdir build && cd build
$ cmake -D ZLIB_INCLUDE_DIR=/home/leiradel/love-libretro/zlib-1.2.8 -D ZLIB_LIBRARY=/home/leiradel/love-libretro/zlib-1.2.8 -D PHYSFS_ARCHIVE_7Z=OFF -D PHYSFS_ARCHIVE_GRP=OFF -D PHYSFS_ARCHIVE_HOG=OFF -D PHYSFS_ARCHIVE_MVL=OFF -D PHYSFS_ARCHIVE_QPAK=OFF -D PHYSFS_ARCHIVE_WAD=OFF -D PHYSFS_BUILD_SHARED=OFF ..
$ make
```

### LÖVE

```
$ env lua_CFLAGS='-I/home/leiradel/love-libretro/luajit-2.0.3/src' lua_LIBS='-L/home/leiradel/love-libretro/luajit-2.0.3/src' freetype2_CFLAGS='-I/home/leiradel/love-libretro/freetype-2.5.0.1/include' freetype2_LIBS='-L/home/leiradel/love-libretro/freetype-2.5.0.1/objs/.libs' openal_CFLAGS='-I/home/leiradel/love-libretro/openal-soft-1.16.0/include' openal_LIBS='-L/home/leiradel/love-libretro/openal-soft-1.16.0/build' libmodplug_CFLAGS='-I/home/leiradel/love-libretro/libmodplug-0.8.8.5' libmodplug_LIBS='-L/home/leiradel/love-libretro/libmodplug-0.8.8.5/build' vorbisfile_CFLAGS='-I/home/leiradel/love-libretro/libogg-1.3.1/include -I/home/leiradel/love-libretro/libvorbis-1.3.3/include' vorbisfile_LIBS='-L/home/leiradel/love-libretro/libogg-1.3.1/src/.libs -L/home/leiradel/love-libretro/libvorbis-1.3.3/lib/.libs' zlib_CFLAGS='-I/home/leiradel/love-libretro/zlib-1.2.8' zlib_LIBS='-L/home/leiradel/love-libretro/zlib-1.2.8' theora_CFLAGS='-I/home/leiradel/love-libretro/libtheora-1.1beta3/include' theora_LIBS='-L/home/leiradel/love-libretro/libtheora-1.1beta3/lib/.libs' CPPFLAGS='-I/home/leiradel/love-libretro/physfs-2.0.3' LDFLAGS='-L/home/leiradel/love-libretro/physfs-2.0.3/build' sh ./configure --disable-shared --disable-mpg123
$ make LIBS='-lfreetype -lOpenAL -lcommon -lmodplug -logg -lvorbis -lvorbisfile -ltheora -ldl -lpthread -lluajit -lz'

$ g++ -o love love.o  -L/home/leiradel/love-libretro/libvorbis-1.3.3/lib/.libs -L/home/leiradel/love-libretro/physfs-2.0.3/build ./.libs/liblove.a -L/home/leiradel/love-libretro/freetype-2.5.0.1/objs/.libs -L/home/leiradel/love-libretro/luajit-2.0.3/src -L/home/leiradel/love-libretro/openal-soft-1.16.0/build -L/home/leiradel/love-libretro/zlib-1.2.8 -L/home/leiradel/love-libretro/libmodplug-0.8.8.5/build -L/home/leiradel/love-libretro/libogg-1.3.1/src/.libs -L/home/leiradel/love-libretro/libtheora-1.1beta3/lib/.libs -lSDL2 -lphysfs -L../bzip2-1.0.6 -L../zlib-1.2.8 -lOpenAL -lcommon -lmodplug -lm /home/leiradel/love-libretro/libtheora-1.1beta3/lib/.libs/libtheora.a -ldl -lpthread -lluajit -lz -Wl,-rpath -Wl,/home/leiradel/love-libretro/freetype-2.5.0.1/objs/.libs/.libs -Wl,-rpath -Wl,/home/leiradel/love-libretro/libvorbis-1.3.3/lib/.libs/.libs -Wl,-rpath -Wl,/home/leiradel/love-libretro/libvorbis-1.3.3/lib/.libs -Wl,-rpath -Wl,/home/leiradel/love-libretro/libogg-1.3.1/src/.libs/.libs
```





