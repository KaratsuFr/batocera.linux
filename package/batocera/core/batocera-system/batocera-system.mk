################################################################################
#
# batocera.linux System
#
################################################################################

BATOCERA_SYSTEM_SOURCE=

BATOCERA_SYSTEM_VERSION=1.0
BATOCERA_SYSTEM_DEPENDENCIES = tzdata

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI3),y)
	BATOCERA_SYSTEM_VERSION=rpi3
	BATOCERA_SYSTEM_BATOCERA_CONF=rpi3
	BATOCERA_SYSTEM_SUBDIR=rpi-firmware
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_XU4),y)
	BATOCERA_SYSTEM_VERSION=odroidxu4
	BATOCERA_SYSTEM_BATOCERA_CONF=xu4
	BATOCERA_SYSTEM_SUBDIR=
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_LEGACYXU4),y)
	BATOCERA_SYSTEM_VERSION=odroidxu4
	BATOCERA_SYSTEM_BATOCERA_CONF=xu4
	BATOCERA_SYSTEM_SUBDIR=
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_C2),y)
	BATOCERA_SYSTEM_VERSION=odroidc2
	BATOCERA_SYSTEM_BATOCERA_CONF=c2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S905),y)
	BATOCERA_SYSTEM_VERSION=s905
	BATOCERA_SYSTEM_BATOCERA_CONF=s905
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S912),y)
        BATOCERA_SYSTEM_VERSION=s912
        BATOCERA_SYSTEM_BATOCERA_CONF=s912
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86),y)
	BATOCERA_SYSTEM_VERSION=x86
	BATOCERA_SYSTEM_BATOCERA_CONF=x86
	BATOCERA_SYSTEM_SUBDIR=
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64),y)
	BATOCERA_SYSTEM_VERSION=x86_64
	BATOCERA_SYSTEM_BATOCERA_CONF=x86_64
	BATOCERA_SYSTEM_SUBDIR=
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI2),y)
	BATOCERA_SYSTEM_VERSION=rpi2
	BATOCERA_SYSTEM_BATOCERA_CONF=rpi2
	BATOCERA_SYSTEM_SUBDIR=rpi-firmware
else
	BATOCERA_SYSTEM_VERSION=rpi1
	BATOCERA_SYSTEM_BATOCERA_CONF=rpi1
	BATOCERA_SYSTEM_SUBDIR=rpi-firmware
endif

define BATOCERA_SYSTEM_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/recalbox/
	echo -n "$(BATOCERA_SYSTEM_VERSION)" > $(TARGET_DIR)/recalbox/recalbox.arch
	mkdir -p $(TARGET_DIR)/recalbox/share_init/system
	cp package/batocera/core/batocera-system/$(BATOCERA_SYSTEM_BATOCERA_CONF)/recalbox.conf $(TARGET_DIR)/recalbox/share_init/system
	cp package/batocera/core/batocera-system/$(BATOCERA_SYSTEM_BATOCERA_CONF)/recalbox.conf $(TARGET_DIR)/recalbox/share_init/system/recalbox.conf.template
	# recalbox-boot.conf
        $(INSTALL) -D -m 0644 package/batocera/core/batocera-system/recalbox-boot.conf $(BINARIES_DIR)/$(BATOCERA_SYSTEM_SUBDIR)/recalbox-boot.conf
endef

$(eval $(generic-package))
