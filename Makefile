PATH_TO_STAGE := /home/ggallagher/devel/emb_linux/xeno3_zynq_stage
XENO_CONFIG := $(PATH_TO_STAGE)/usr/xenomai/bin/xeno-config
CFLAGS := $(shell DESTDIR=$(PATH_TO_STAGE) $(XENO_CONFIG) --native --cflags)
LDFLAGS := $(shell DESTDIR=$(PATH_TO_STAGE) $(XENO_CONFIG) --native --ldflags)
CC := $(shell DESTDIR=$(PATH_TO_STAGE) $(XENO_CONFIG) --cc)

EXECUTABLE := hello_xeno_world

all: $(EXECUTABLE)

%: %.cpp
	$(CC) -o $@ $< $(CFLAGS) $(LDFLAGS)


