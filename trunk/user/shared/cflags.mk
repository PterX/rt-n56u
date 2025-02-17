
##################################################################
# Linux kernel .config related params
##################################################################

CFLAGS += $(if $(CONFIG_IPV6),-DUSE_IPV6,)
CFLAGS += $(if $(CONFIG_RAETH_GMAC2),,-DUSE_SINGLE_MAC)
CFLAGS += $(if $(CONFIG_RT2860V2_AP),-DUSE_RT2860V2_AP,)
CFLAGS += $(if $(CONFIG_RT3090_AP),-DUSE_RT3090_AP,)
CFLAGS += $(if $(CONFIG_RT5392_AP),-DUSE_RT5392_AP,)
CFLAGS += $(if $(CONFIG_RT5592_AP),-DUSE_RT5592_AP,)
CFLAGS += $(if $(CONFIG_RT3593_AP),-DUSE_RT3593_AP,)
CFLAGS += $(if $(CONFIG_MT7610_AP),-DUSE_MT7610_AP,)
CFLAGS += $(if $(CONFIG_MT76X2_AP),-DUSE_MT76X2_AP,)
CFLAGS += $(if $(CONFIG_MT76X3_AP),-DUSE_MT76X3_AP,)
CFLAGS += $(if $(CONFIG_RT3352_INIC_MII),-DUSE_RT3352_MII,)
CFLAGS += $(if $(CONFIG_RT2860V2_AP_WSC),-DUSE_WSC_WPS,)
CFLAGS += $(if $(CONFIG_RA_HW_NAT),-DUSE_HW_NAT,)
CFLAGS += $(if $(CONFIG_RA_HW_NAT_IPV6),-DUSE_IPV6_HW_NAT,)
CFLAGS += $(if $(CONFIG_RA_HW_NAT_PCI),-DUSE_WWAN_HW_NAT,)
CFLAGS += $(if $(CONFIG_HNAT_V2),-DUSE_HW_NAT_V2,)
CFLAGS += $(if $(CONFIG_MTD_NAND_MTK)$(CONFIG_MTD_NAND_RALINK),-DUSE_NAND_FLASH,)
CFLAGS += $(if $(CONFIG_USB_XHCI_HCD),-DUSE_USB_XHCI,)
CFLAGS += $(if $(CONFIG_RTC_HCTOSYS),-DUSE_RTC_HCTOSYS,)
CFLAGS += $(if $(CONFIG_NETFILTER_XT_MATCH_STATE),,-DUSE_MATCH_CONNTRACK)

CFLAGS += -DBOARD_RAM_SIZE=$(CONFIG_RALINK_RAM_SIZE)

ifdef CONFIG_RALINK_RT3883
CFLAGS += -DCONFIG_RALINK_RT3883
endif
ifdef CONFIG_RALINK_MT7620
CFLAGS += -DCONFIG_RALINK_MT7620
CFLAGS += -DAP_MODE_LAN_TAGGED
endif
ifdef CONFIG_RALINK_MT7621
CFLAGS += -DCONFIG_RALINK_MT7621
endif
ifdef CONFIG_RALINK_MT7628
CFLAGS += -DCONFIG_RALINK_MT7628
CFLAGS += -DAP_MODE_LAN_TAGGED
endif

ifdef CONFIG_RTL8367
CFLAGS += -DUSE_RTL8367
CFLAGS += $(if $(CONFIG_RTL8367_CIF_SMI),-DRSTATS_SKIP_ESW,)
CFLAGS += $(if $(CONFIG_RTL8367_API_8367B),-DUSE_RTL8367_API_8367B,)
CFLAGS += $(if $(CONFIG_RTL8367_IGMP_SNOOPING),-DUSE_RTL8367_IGMP_SNOOPING,)
else
ifdef CONFIG_MT7530_GSW
CFLAGS += -DUSE_MTK_GSW
else
ifdef CONFIG_RAETH_ESW
CFLAGS += -DUSE_MTK_ESW
endif
endif
endif

CFLAGS += -DCONFIG_RT_MAX_CLIENTS=$(CONFIG_RT_MAX_CLIENTS)

ifdef CONFIG_RT_FIRST_IF_RANGE_2GHZ
CFLAGS += -DUSE_WID_2G=$(CONFIG_RT_FIRST_CARD)
else
ifdef CONFIG_RT_SECOND_IF_RANGE_2GHZ
CFLAGS += -DUSE_WID_2G=$(CONFIG_RT_SECOND_CARD)
endif
endif

ifdef CONFIG_RT_FIRST_IF_RANGE_5GHZ
CFLAGS += -DUSE_WID_5G=$(CONFIG_RT_FIRST_CARD)
else
ifdef CONFIG_RT_SECOND_IF_RANGE_5GHZ
CFLAGS += -DUSE_WID_5G=$(CONFIG_RT_SECOND_CARD)
endif
endif

##################################################################
# Project .config related params
##################################################################

CFLAGS += $(if $(FIRMWARE_BUILDS_VER),-DFWBLDSTR=\"$(FIRMWARE_BUILDS_VER)\",)

ifneq ($(BOARD_NUM_USB_PORTS),0)
CFLAGS += -DUSE_USB_SUPPORT
ifeq ($(CONFIG_FIRMWARE_INCLUDE_LPRD),y)
CFLAGS += -DSRV_LPRD
endif
ifeq ($(CONFIG_FIRMWARE_INCLUDE_U2EC),y)
CFLAGS += -DSRV_U2EC
endif
ifeq ($(CONFIG_FIRMWARE_INCLUDE_HDPARM),y)
CFLAGS += -DUTL_HDPARM
endif
ifeq ($(CONFIG_FIRMWARE_INCLUDE_MINIDLNA),y)
CFLAGS += -DAPP_MINIDLNA
endif
ifeq ($(CONFIG_FIRMWARE_INCLUDE_FIREFLY),y)
CFLAGS += -DAPP_FIREFLY
endif
ifeq ($(CONFIG_FIRMWARE_INCLUDE_TRANSMISSION),y)
CFLAGS += -DAPP_TRMD
endif
ifeq ($(CONFIG_FIRMWARE_INCLUDE_ARIA),y)
CFLAGS += -DAPP_ARIA
endif
ifeq ($(CONFIG_FIRMWARE_INCLUDE_SMBD),y)
CFLAGS += -DAPP_SMBD
else
ifeq ($(CONFIG_FIRMWARE_INCLUDE_WINS),y)
CFLAGS += -DAPP_NMBD
endif
endif
ifeq ($(CONFIG_FIRMWARE_INCLUDE_FTPD),y)
CFLAGS += -DAPP_FTPD
endif
ifeq ($(CONFIG_FIRMWARE_INCLUDE_NFSD),y)
CFLAGS += -DAPP_NFSD
endif
endif

ifeq ($(CONFIG_FIRMWARE_INCLUDE_OPENVPN),y)
CFLAGS += -DAPP_OPENVPN
endif
ifeq ($(CONFIG_FIRMWARE_INCLUDE_XUPNPD),y)
CFLAGS += -DAPP_XUPNPD
endif

ifneq ($(CONFIG_FIRMWARE_INCLUDE_OPENSSH),y)
ifeq ($(CONFIG_FIRMWARE_INCLUDE_DROPBEAR),y)
CFLAGS += -DAPP_SSHD
endif
else
CFLAGS += -DAPP_SSHD
endif

ifeq ($(CONFIG_FIRMWARE_INCLUDE_DDNS_SSL),y)
CFLAGS += -DSUPPORT_DDNS_SSL
endif

ifeq ($(CONFIG_FIRMWARE_INCLUDE_FTPD_SSL),y)
CFLAGS += -DSUPPORT_FTPD_SSL
endif

ifeq ($(CONFIG_FIRMWARE_INCLUDE_EAP_PEAP),y)
CFLAGS += -DSUPPORT_PEAP_SSL
endif

ifeq ($(CONFIG_FIRMWARE_INCLUDE_HTTPS),y)
CFLAGS += -DSUPPORT_HTTPS
endif
