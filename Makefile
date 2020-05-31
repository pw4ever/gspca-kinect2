EXTRA_CFLAGS += -Wall -Wno-unused-variable

KVER := $(shell uname -r)
KDIR := /lib/modules/$(KVER)/build

obj-m += gspca_kinect2.o
gspca_kinect2-objs += kinect2.o

obj-m += gspca_main.o
gspca_main-objs += gspca.o

.PHONY: all clean

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	rm -f *.o *~ .depend .*.cmd *.ko *.mod.c *.mod .tmp_versions modules.order Module.symvers
