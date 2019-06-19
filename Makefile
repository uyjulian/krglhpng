
CC = i686-w64-mingw32-gcc
CXX = i686-w64-mingw32-g++
#CFLAGS += -O0 -g
GIT_TAG := $(shell git describe --abbrev=0 --tags)
CFLAGS += -Ofast -march=ivybridge -flto
CFLAGS += -Wall -Wno-unused-value -Wno-format -I. -I.. -Izlib -Ilibpng -DGIT_TAG=L\"$(GIT_TAG)\" -DNDEBUG -DWIN32 -D_WIN32 -D_WINDOWS 
CFLAGS += -D_USRDLL -DMINGW_HAS_SECURE_API -DUNICODE -D_UNICODE -DNO_STRICT
LDFLAGS += -static -static-libstdc++ -static-libgcc -shared -Wl,--kill-at
LDLIBS += 

%.o: %.c
	@echo -e "\tCC  $<"
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: %.cpp
	@echo -e "\tCXX  $<"
	$(CXX) -c $(CFLAGS) -o $@ $<

LIBZ_SOURCES += zlib/adler32.c zlib/compress.c zlib/crc32.c zlib/deflate.c zlib/gzclose.c zlib/gzlib.c zlib/gzread.c zlib/gzwrite.c zlib/infback.c zlib/inffast.c zlib/inflate.c zlib/inftrees.c zlib/trees.c zlib/uncompr.c zlib/zutil.c
LIBPNG_SOURCES += libpng/png.c libpng/pngerror.c libpng/pngget.c libpng/pngmem.c libpng/pngpread.c libpng/pngread.c libpng/pngrio.c libpng/pngrtran.c libpng/pngrutil.c libpng/pngset.c libpng/pngtrans.c libpng/pngwio.c libpng/pngwrite.c libpng/pngwtran.c libpng/pngwutil.c

SOURCES := ../tp_stub.cpp dllmain.cpp $(LIBZ_SOURCES) $(LIBPNG_SOURCES)
OBJECTS := $(SOURCES:.c=.o)
OBJECTS := $(OBJECTS:.cpp=.o)

BINARY ?= krglhpng.dll
ARCHIVE ?= krglhpng.$(GIT_TAG).7z

all: $(BINARY)

archive: $(ARCHIVE)

clean:
	rm -f $(OBJECTS) $(BINARY) $(ARCHIVE)

$(ARCHIVE): $(BINARY) 
	rm -f $(ARCHIVE)
	7z a $@ $^

$(BINARY): $(OBJECTS) 
	@echo -e "\tLNK $@"
	$(CXX) $(CFLAGS) $(LDFLAGS)  -o $@ $^  $(LDLIBS)
