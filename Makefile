CC            = gcc
CFLAGS        =
TARGET_VER    = 325.15# just set to a valid ver eg. one of:  325.08 325.15 319.32 319.23
TARGET_MAJOR := $(shell echo ${TARGET_VER} | cut -d . --f=1)
TARGET        = libnvidia-ml.so.1
DESTDIR       = /
PREFIX        = $(DESTDIR)usr
libdir        = $(PREFIX)/lib/x86_64-linux-gnu/
INSTALL       = /usr/bin/install -D

all: $(TARGET)

${TARGET:1=${TARGET_VER}}: empty.c 
	${CC} ${CFLAGS} -shared -fPIC $(<) -o $(@) 

$(TARGET): ${TARGET:1=${TARGET_VER}}
	${CC} ${CFLAGS} -shared -fPIC -o $(@) -DNVML_PATCH_${TARGET_MAJOR} -DNVML_VERSION=\"$(TARGET_VER)\" $< nvml_fix.c


clean: 
	rm -f $(TARGET)
	rm -f ${TARGET:1=${TARGET_VER}}

install: libnvidia-ml.so.1
	$(INSTALL) -Dm755 $(^) $(libdir)/$(^)

.PHONY: clean install all
