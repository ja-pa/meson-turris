#
# Copyright (C) 2015-2019 CZ.NIC, z. s. p. o. (https://www.nic.cz/)
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

PKG_RELRO_FULL:=0

include $(TOPDIR)/rules.mk

PKG_NAME:=knot-resolver
PKG_RELEASE:=1

PKG_VERSION:=bb0bf54aada28a2ffe1c77bd6124b71fb04293e2
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://gitlab.labs.nic.cz/knot/knot-resolver.git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

PKG_MAINTAINER:=Knot DNS <knot-dns@labs.nic.cz>
PKG_LICENSE:=GPL-3.0

PKG_INSTALL:=1

include $(TOPDIR)/package/meson/meson.mk
include $(INCLUDE_DIR)/package.mk

define Package/knot-resolver
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=IP Addresses and Names
	TITLE:=Knot DNS Resolver
	URL:=https://gitlab.labs.nic.cz/knot/resolver
	DEPENDS=+knot-libs +knot-libzscanner +libuv +luajit +dnssec-rootkey +resolver-conf +luasec +luasocket +libstdcpp
	PROVIDES:=dns-resolver
endef

define Package/knot-resolver/description
  The Knot DNS Resolver is a minimalistic caching resolver implementation.
endef

MAKE_FLAGS += \
	PREFIX=/usr \
	ETCDIR=/etc/kresd

define Build/Patch
	$(Build/Patch/Default)
	cd $(PKG_BUILD_DIR) && \
	sed -i -e 's/\(.*find_lib,hiredis.*\)/HAS_hiredis := no/' \
	       -e 's/\(.*find_lib,libmemcached.*\)/HAS_libmemcached := no/' Makefile
endef

define Build/Configure
	$(call Meson/Configure)
	$(call Build/Configure/Default)
endef

define Build/Compile
	echo aaaaaaaaaaaaaaa
	$(call Meson/Compile)
	#$(call Build/Compile/Default)
endef

define Build/Install
	echo install
endef

define Package/knot-resolver/install

	$(INSTALL_DIR) $(1)/usr/bin
	#$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/*bin/kresd $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/lib
	#$(CP) $(PKG_INSTALL_DIR)/usr/lib/libkres.so* $(1)/usr/lib
	#$(CP) $(PKG_INSTALL_DIR)/usr/lib/kdns_modules $(1)/usr/lib

	$(INSTALL_DIR) $(1)/etc/init.d
	#$(INSTALL_BIN) ./files/kresd.init $(1)/etc/init.d/kresd

	$(INSTALL_DIR) $(1)/etc/kresd
	#$(CP) $(PKG_BUILD_DIR)/etc/icann-ca.pem $(1)/etc/kresd
	#$(CP) $(PKG_BUILD_DIR)/etc/root.hints $(1)/etc/kresd
	#$(INSTALL_BIN) ./files/kresd.postinst $(1)/etc/kresd/kresd.postinst.sh
	#$(INSTALL_BIN) ./files/convert_config.sh $(1)/etc/kresd/convert_config.sh
endef



$(eval $(call BuildPackage,knot-resolver))
