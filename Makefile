#PATH_TO_STAGE - put the path the the rootfs for the reference image
#Example: PATH_TO_STAGE := /home/ggallagher/devel/xeno_images_test/ubuntu_16_04_armhf_rootfs
PATH_TO_STAGE := 
XENO_CONFIG := $(PATH_TO_STAGE)/usr/xenomai/bin/xeno-config
CFLAGS := $(shell DESTDIR=$(PATH_TO_STAGE) $(XENO_CONFIG) --posix --cflags)
LDFLAGS := $(shell DESTDIR=$(PATH_TO_STAGE) $(XENO_CONFIG) --posix --ldflags)
CC := $(shell DESTDIR=$(PATH_TO_STAGE) $(XENO_CONFIG) --cc)

EXECUTABLE := simple_rt_app

all: $(EXECUTABLE)

%: %.c
	$(PATH_TO_STAGE)/usr/xenomai/bin/wrap-link.sh -v $(CC) -o $@ $< $(CFLAGS) $(LDFLAGS)
clean:
	rm $(EXECUTABLE)
