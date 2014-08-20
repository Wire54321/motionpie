#############################################################
#
# rpi-firmware
#
#############################################################

RPI_FIRMWARE_VERSION = a6fe2977
RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
RPI_FIRMWARE_LICENSE = BSD-3c
RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
BR2_PACKAGE_RPI_FIRMWARE_BOOT = '_x'

define RPI_FIRMWARE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/boot/bootcode.bin
	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/boot/start_x.elf
	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/boot/fixup_x.dat
	$(INSTALL) -D -m 0644 boot/rpi-firmware/config.txt $(BINARIES_DIR)/boot/config.txt
endef

$(eval $(generic-package))