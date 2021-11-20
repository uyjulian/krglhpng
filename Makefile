
LIBZ_SOURCES += external/zlib/adler32.c external/zlib/compress.c external/zlib/crc32.c external/zlib/deflate.c external/zlib/gzclose.c external/zlib/gzlib.c external/zlib/gzread.c external/zlib/gzwrite.c external/zlib/infback.c external/zlib/inffast.c external/zlib/inflate.c external/zlib/inftrees.c external/zlib/trees.c external/zlib/uncompr.c external/zlib/zutil.c
LIBPNG_SOURCES += external/libpng/png.c external/libpng/pngerror.c external/libpng/pngget.c external/libpng/pngmem.c external/libpng/pngpread.c external/libpng/pngread.c external/libpng/pngrio.c external/libpng/pngrtran.c external/libpng/pngrutil.c external/libpng/pngset.c external/libpng/pngtrans.c external/libpng/pngwio.c external/libpng/pngwrite.c external/libpng/pngwtran.c external/libpng/pngwutil.c

SOURCES += dllmain.cpp dllmain.cpp $(LIBZ_SOURCES) $(LIBPNG_SOURCES)

INCFLAGS += -Iexternal/zlib -Iexternal/libpng

PROJECT_BASENAME = krglhpng

include external/tp_stubz/Rules.lib.make
