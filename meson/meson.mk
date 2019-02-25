CROSS_CONF=$(STAGING_DIR)/cross_conf.txt
PYTHON3_BIN=$(STAGING_DIR_HOST)/bin/python3
MESON_BIN=$(STAGING_DIR_HOST)/meson/meson.py
NINJA_BIN=$(STAGING_DIR_HOST)/usr/bin/ninja
MESON_BUILD_DIR=$(PKG_BUILD_DIR)/builddir

define Meson/Configure
	echo Configure
	echo $(PKG_CONFIG_PATH)
	cd $(PKG_BUILD_DIR) && mkdir $(MESON_BUILD_DIR)
	cd $(PKG_BUILD_DIR) && PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) $(PYTHON3_BIN) $(MESON_BIN) builddir --cross-file $(CROSS_CONF)
	rm $(PKG_BUILD_DIR)/Makefile
endef

define Meson/Compile
	echo Compile
	(cd $(MESON_BUILD_DIR) && $(NINJA_BIN))
endef

define Meson/Install
	echo Compile
	echo $(PKG_BUILD_DIR)
endef



