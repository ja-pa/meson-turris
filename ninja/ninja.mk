ifneq ($(__ninja_mk_inc),1)
__ninja_mk_inc=1

HOST_NINJA_DIR:=$(STAGING_DIR_HOST)
HOST_NINJA_BIN:=$(HOST_NINJA_DIR)/usr/bin/ninja

CMAKE_INSTALL_PREFIX=$(PKG_BUILD_DIR)/ipkg-install/usr
CMAKE_GENERATOR="Ninja"

# add ninja to host dependecies for package
PKG_BUILD_DEPENDS += ninja/host #ninja/host/install

define Build/Compile/Ninja
	cd $(PKG_BUILD_DIR) && $(HOST_NINJA_BIN)
endef

define Build/Install/Ninja
ifndef DESTDIR
	cd $(PKG_BUILD_DIR) && $(HOST_NINJA_BIN) install
else

	cd $(PKG_BUILD_DIR) && DESTDIR=$(DESTDIR) $(HOST_NINJA_BIN) install
endif
endef

define Build/Compile
	$(call Build/Compile/Ninja)
endef

define Build/Install
	$(call Build/Install/Ninja)
endef

endif
