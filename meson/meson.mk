ifneq ($(__meson_mk_inc),1)
__meson_mk_inc=1

include $(TOPDIR)/package/ninja/ninja.mk

CROSS_CONF=$(STAGING_DIR)/cross_conf.txt
PYTHON3_BIN=$(STAGING_DIR_HOST)/bin/python3
MESON_BIN=$(STAGING_DIR_HOST)/meson/meson.py
#NINJA_BIN=$(STAGING_DIR_HOST)/usr/bin/ninja
#MESON_BUILD_DIR=$(PKG_BUILD_DIR)/builddir
MESON_BUILD_DIR=$(PKG_BUILD_DIR)

PKG_BUILD_DEPENDS += meson/host

define Build/Meson/Configure
	echo Configure
	echo $(PKG_CONFIG_PATH)
	#cd $(PKG_BUILD_DIR) && mkdir $(MESON_BUILD_DIR)
	#cd $(PKG_BUILD_DIR) && PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) $(PYTHON3_BIN) $(MESON_BIN) builddir --cross-file $(CROSS_CONF)
	cd $(PKG_BUILD_DIR) && PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) $(PYTHON3_BIN) $(MESON_BIN) . --cross-file $(CROSS_CONF)
	rm $(PKG_BUILD_DIR)/Makefile
endef

define Build/Meson/Compile
	echo Compile
	(cd $(MESON_BUILD_DIR) && $(NINJA_BIN))
endef

#define Meson/Install
#	echo Compile
#	echo $(PKG_BUILD_DIR)
#endef


endif
