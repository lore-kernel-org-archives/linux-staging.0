Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D5629CA
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 23:22:34 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id n11so218925wmd.2
        for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 16:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MCSbChxyE8rJMEeNPnpnAM4mEhUbcSjbGScnv/os4ek=;
        b=et8dhZ4OQrViahv4LVEQ0W/E/nqll5TmM/luXcooZNFZtiHB0eHE7dszfXNUYhwvVs
         G75HQ0goLH6Narv7DOX+R08hn2ouZ2VKfULHyHqAQXCgiylGyHcC5YT5sYnxhhhMWq+D
         vPeHc/zyrvuaF+DvBK2vMy/4A0nCQOxk3TMJpJm1NMl/dEvaFJ+JLAUTMZr1oNM7gp6R
         jxOzpcuH0/3SZFXnHVy/KHlI8KQDAA+QziEBwjhsyQNvLAA4TN+xsySi2fFg04l36Hwr
         e7iuIQWxVhKR0XQNF8FizdR8/YbMLgf7gh+CzhEgeb3DS/68+4VsQ5O52KLYWOXvKAKS
         sVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MCSbChxyE8rJMEeNPnpnAM4mEhUbcSjbGScnv/os4ek=;
        b=mQV8TPpyfggOpxEex4F7naegB5WJGbR2N7irdHkS2wXNznfwnwESGMO4s3oFC73xz8
         lGpNjJdif7zmTQ3/dDekH0ZaZtTDIOaed/5rdZSFeL9N/a5OV3sai/N6tlWwPQPK+4Ex
         P6NBLLCa0uZLMslCOWydHVVV5nBlE/k0xWgOHgyRMhdJHVLeJufWuJET7/VeGEQ2FPKr
         /wkxhBbtCn+97zAi710GdKDDjjbg4Fq9/b2XlxFxXOgvccZIg3oPl8xdiygFMMMLTii6
         9DcR0kyc3tpxEGQBt6ZsjTQN59rcPx42JbBeNfqrbDec12q5OoYmVllfsMNFUbLITqh3
         cwrg==
X-Gm-Message-State: AOAM532I6ApoN9dTw8WDrfZa59J4RWtk32JbhkOHzUCNJi8nAox2qcmR
	RTK6jRB8OtQ9JKyC//peXQ0SFg==
X-Google-Smtp-Source: ABdhPJyWyoJCarff6Q6ybEys8FoeXuN5lWshrH5mal1e1Nv8fS+gS8CGMShhseBt4Vb1Qx4BYYaCqw==
X-Received: by 2002:a05:600c:350b:: with SMTP id h11mr6235379wmq.20.1627428152742;
        Tue, 27 Jul 2021 16:22:32 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id m7sm3848367wmq.20.2021.07.27.16.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 16:22:32 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	fabioaiuto83@gmail.com,
	martin@kaiser.cx
Subject: [PATCH v4 5/6] staging: r8188eu: introduce new supporting files for RTL8188eu driver
Date: Wed, 28 Jul 2021 00:22:18 +0100
Message-Id: <20210727232219.2948-6-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727232219.2948-1-phil@philpotter.co.uk>
References: <20210727232219.2948-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset is split in order to keep the file sizes down. These
supporting files are part of the newer/better driver from GitHub modified by
Larry Finger. Import this as the basis for all future work going
forward. Also, modify Makefile so that driver has same module filename
as original rtl8188eu driver from staging, and rename config params to
fit the Kconfig file taken from the old driver. Finally, reword Kconfig
description to make it clear this is a newer driver.

Suggested-by: Larry Finger <Larry.Finger@lwfinger.net>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/Kconfig  |  25 ++++++
 drivers/staging/r8188eu/Makefile | 129 +++++++++++++++++++++++++++++++
 2 files changed, 154 insertions(+)
 create mode 100644 drivers/staging/r8188eu/Kconfig
 create mode 100644 drivers/staging/r8188eu/Makefile

diff --git a/drivers/staging/r8188eu/Kconfig b/drivers/staging/r8188eu/Kconfig
new file mode 100644
index 000000000000..6323d63a4a1b
--- /dev/null
+++ b/drivers/staging/r8188eu/Kconfig
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0
+config R8188EU
+	tristate "Realtek RTL8188EU Wireless LAN NIC driver"
+	depends on WLAN && USB && CFG80211
+	select WIRELESS_EXT
+	select WEXT_PRIV
+	select LIB80211
+	select LIB80211_CRYPT_WEP
+	select LIB80211_CRYPT_CCMP
+	help
+	This option adds support for the Realtek RTL8188EU chipset, used in USB
+	devices such as the ASUS USB-N10 Nano. This newer driver is based on GitHub
+	sources for version v4.1.4_6773.20130222, and contains modifications for
+	newer kernel features. If built as a module, it will be called r8188eu.
+
+if R8188EU
+
+config 88EU_AP_MODE
+	bool "Realtek RTL8188EU AP mode"
+	help
+	This option enables Access Point mode. Unless you know that your system
+	will never be used as an AP, or the target system has limited memory,
+	"Y" should be selected.
+
+endif
diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
new file mode 100644
index 000000000000..6db1376e9768
--- /dev/null
+++ b/drivers/staging/r8188eu/Makefile
@@ -0,0 +1,129 @@
+SHELL := /bin/bash
+EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
+EXTRA_CFLAGS += -O1
+
+EXTRA_CFLAGS += -Wno-unused-variable
+EXTRA_CFLAGS += -Wno-unused-value
+EXTRA_CFLAGS += -Wno-unused-label
+EXTRA_CFLAGS += -Wno-unused-parameter
+EXTRA_CFLAGS += -Wno-unused-function
+EXTRA_CFLAGS += -Wno-unused
+
+EXTRA_CFLAGS += -Wno-uninitialized
+
+EXTRA_CFLAGS += -I$(src)/include
+
+ccflags-y += -D__CHECK_ENDIAN__
+
+CONFIG_AUTOCFG_CP = n
+
+CONFIG_R8188EU = m
+
+CONFIG_USB_HCI = y
+
+CONFIG_BT_COEXIST = n
+CONFIG_WOWLAN = n
+
+OUTSRC_FILES :=				\
+		hal/HalHWImg8188E_MAC.o	\
+		hal/HalHWImg8188E_BB.o	\
+		hal/HalHWImg8188E_RF.o	\
+		hal/HalPhyRf.o		\
+		hal/HalPhyRf_8188e.o	\
+		hal/HalPwrSeqCmd.o	\
+		hal/Hal8188EPwrSeq.o	\
+		hal/Hal8188ERateAdaptive.o\
+		hal/hal_intf.o		\
+		hal/hal_com.o		\
+		hal/odm.o		\
+		hal/odm_debug.o		\
+		hal/odm_interface.o	\
+		hal/odm_HWConfig.o	\
+		hal/odm_RegConfig8188E.o\
+		hal/odm_RTL8188E.o	\
+		hal/rtl8188e_cmd.o	\
+		hal/rtl8188e_dm.o	\
+		hal/rtl8188e_hal_init.o	\
+		hal/rtl8188e_mp.o	\
+		hal/rtl8188e_phycfg.o	\
+		hal/rtl8188e_rf6052.o	\
+		hal/rtl8188e_rxdesc.o	\
+		hal/rtl8188e_sreset.o	\
+		hal/rtl8188e_xmit.o	\
+		hal/rtl8188eu_led.o	\
+		hal/rtl8188eu_recv.o	\
+		hal/rtl8188eu_xmit.o	\
+		hal/usb_halinit.o	\
+		hal/usb_ops_linux.o
+
+RTL871X = rtl8188e
+
+HCI_NAME = usb
+
+_OS_INTFS_FILES :=				\
+			os_dep/ioctl_linux.o	\
+			os_dep/mlme_linux.o	\
+			os_dep/os_intfs.o	\
+			os_dep/osdep_service.o	\
+			os_dep/recv_linux.o	\
+			os_dep/rtw_android.o	\
+			os_dep/usb_intf.o	\
+			os_dep/usb_ops_linux.o	\
+			os_dep/xmit_linux.o
+
+_HAL_INTFS_FILES += $(OUTSRC_FILES)
+
+ifeq ($(CONFIG_AUTOCFG_CP), y)
+
+$(shell cp $(TopDIR)/autoconf_rtl8188e_usb_linux.h $(TopDIR)/include/autoconf.h)
+endif
+
+ifeq ($(CONFIG_BT_COEXIST), y)
+EXTRA_CFLAGS += -DCONFIG_BT_COEXIST
+endif
+
+ifeq ($(CONFIG_WOWLAN), y)
+EXTRA_CFLAGS += -DCONFIG_WOWLAN
+endif
+
+SUBARCH := $(shell uname -m | sed -e "s/i.86/i386/; s/ppc.*/powerpc/; s/armv.l/arm/; s/aarch64/arm64/;")
+
+ARCH ?= $(SUBARCH)
+CROSS_COMPILE ?=
+KVER  ?= $(if $(KERNELRELEASE),$(KERNELRELEASE),$(shell uname -r))
+KSRC ?= $(if $(KERNEL_SRC),$(KERNEL_SRC),/lib/modules/$(KVER)/build)
+MODDESTDIR := /lib/modules/$(KVER)/kernel/drivers/net/wireless
+INSTALL_PREFIX :=
+
+rtk_core :=				\
+		core/rtw_ap.o		\
+		core/rtw_br_ext.o	\
+		core/rtw_cmd.o		\
+		core/rtw_debug.o	\
+		core/rtw_efuse.o	\
+		core/rtw_ieee80211.o	\
+		core/rtw_io.o		\
+		core/rtw_ioctl_set.o	\
+		core/rtw_iol.o		\
+		core/rtw_led.o		\
+		core/rtw_mlme.o		\
+		core/rtw_mlme_ext.o	\
+		core/rtw_mp.o		\
+		core/rtw_mp_ioctl.o	\
+		core/rtw_pwrctrl.o	\
+		core/rtw_p2p.o		\
+		core/rtw_recv.o		\
+		core/rtw_rf.o		\
+		core/rtw_security.o	\
+		core/rtw_sreset.o	\
+		core/rtw_sta_mgt.o	\
+		core/rtw_wlan_util.o	\
+		core/rtw_xmit.o
+
+r8188eu-y += $(rtk_core)
+
+r8188eu-y += $(_HAL_INTFS_FILES)
+
+r8188eu-y += $(_OS_INTFS_FILES)
+
+obj-$(CONFIG_R8188EU) := r8188eu.o
-- 
2.31.1

