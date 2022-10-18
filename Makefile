# If KERNELRELEASE is defined, we've been invoked from the
# kernel build system and can use its language.
ifneq ($(KERNELRELEASE),)
	obj-m := interrupt.o
# Otherwise we were called directly from the command
# line; invoke the kernel build system.
else
	KERNELDIR ?= /lib/modules/5.10.0-1008-oem/build
	PWD := $(shell pwd)
default:
	sudo make -C $(KERNELDIR) M=$(PWD) modules
endif
