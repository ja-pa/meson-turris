ifneq ($(__meson_mk_inc),1)
__meson_mk_inc=1

include $(TOPDIR)/package/ninja/ninja.mk

CROSS_CONF_FILE=$(STAGING_DIR)/cross_conf.txt
HOST_PYTHON3_BIN ?= $(STAGING_DIR_HOST)/bin/python3
HOST_MESON_BIN=$(STAGING_DIR_HOST)/meson/meson.py
MESON_BUILD_DIR=$(PKG_BUILD_DIR)

PKG_BUILD_DEPENDS += meson/host

define Build/Meson/Configure
	echo Configure
	echo $(PKG_CONFIG_PATH)
	cd $(PKG_BUILD_DIR) && PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) $(HOST_PYTHON3_BIN) $(HOST_MESON_BIN) . --cross-file $(CROSS_CONF_FILE) $(MESON_ARGS)
endef

define Build/Meson/Compile
	$(call Build/Compile/Ninja)
endef

endif
