################################################################################
#
# sja1105-tool
#
################################################################################

SJA1105_TOOL_VERSION = master
SJA1105_TOOL_SITE =ssh://git@sw-stash.freescale.net/dnind/sja1105-tool.git 
SJA1105_TOOL_SITE_METHOD = git
SJA1105_TOOL_INSTALL_STAGING = YES
SJA1105_TOOL_LICENSE = BSD-3c
SJA1105_TOOL_LICENSE_FILES = COPYING
SJA1105_TOOL_DEPENDENCIES = libxml2

define SJA1105_TOOL_BUILD_CMDS
	cd $(@D); $(TARGET_CONFIGURE_ARGS) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(TARGET_MAKE_OPTS) -C $(@D);
endef

define SJA1105_TOOL_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/sja1105-tool $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 0755 $(@D)/sja1105-netconf $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))