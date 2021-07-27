Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1533F2FAD
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 23:22:35 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id e2so251335wrq.6
        for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 16:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lt6tz3WCbskuIhj74knh1mLCoQoRb6GKvWV2paQEBkA=;
        b=0PNZJ85c6KQSOzAJ6D+nuVZYQJmxACc+1A0gAGL/LB6iwPL4sgHblt9+7Q93lvJ5TE
         aYu5FOLpL187HCBCc+bjTrfzdrh+AoU9c96qBdH8X9z5vHWmGmRN3ZWv+jVNGgKf7wdA
         CDcrUmS0iLL6W78UzM5PnEjHFGgZ6coEvkT70PaKmYAed1X6LQyomcr+NdkJoqh3v4QB
         uhaP8Qa8sut98NQV0eb8DEYmERoW2mpq3ro27oJdXbSlc0i562qTjv5hxeO/QL/eIhX8
         xmcN+UsXk4RxF/FaFfQVnzmILUEFV5JVLGbbdILuMS0OVwoKbDYRrdf6t1FdoDvx2yrj
         MTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lt6tz3WCbskuIhj74knh1mLCoQoRb6GKvWV2paQEBkA=;
        b=sNDsuH14Hnxak7vDCWpb6Yk71i/rfIY9GBvhfwS86HYKUFB6kNjciK/+SnPYa89OI2
         IbcXOWBOly5nObt3nK+udsQEnu9JXWI5xvgq7Y/yxcgJx9ApifPkciFFXZHeBw/cPflV
         Ww48yaDao4MARg6Ey9j0x3aHKi/8WRjNak5eYFmVrghbEkLI6aXTrSDsZfGN2Nlgu7MG
         yWsEToT+OW59iUJ3BitluXTv3JOZ4tdaV4rUkASErgH8lPmwMvGSQ3Ax88iGQvROmDqJ
         CUuublu+GRFjI8khgpDM75CMvfZ3Dgkt2eK0dBpNGHP3hWggckX1xzmxYGJgIIwVfK1u
         SpaA==
X-Gm-Message-State: AOAM532fYmaODwMKaYP3W4lC/BZdOy7nBn6LcU1lamxRaoS869SOeisy
	JAxnvZSWtcwy8uhd/ZRA7RZwFQ==
X-Google-Smtp-Source: ABdhPJw2joNlzvORyW4riV6i7UZfTeD+H10JH6I/iMZ2XEaEDOHiJaL3bd+sXE9O2YlS2CZ4W2khHQ==
X-Received: by 2002:a5d:5384:: with SMTP id d4mr8905981wrv.193.1627428153496;
        Tue, 27 Jul 2021 16:22:33 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id m7sm3848367wmq.20.2021.07.27.16.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 16:22:33 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	fabioaiuto83@gmail.com,
	martin@kaiser.cx
Subject: [PATCH v4 6/6] staging: r8188eu: attach newly imported driver to build system
Date: Wed, 28 Jul 2021 00:22:19 +0100
Message-Id: <20210727232219.2948-7-phil@philpotter.co.uk>
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

Modify Kconfig and Makefile to import new r8188eu driver into build
system, and allow it to build alongside deprecated older driver, by
tweaking build parameters and module name for the older driver at
the same time.

Suggested-by: Larry Finger <Larry.Finger@lwfinger.net>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/Kconfig            | 2 ++
 drivers/staging/Makefile           | 3 ++-
 drivers/staging/rtl8188eu/Kconfig  | 9 +++++----
 drivers/staging/rtl8188eu/Makefile | 4 ++--
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index 03ee99d98945..73fd57bfa95a 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -38,6 +38,8 @@ source "drivers/staging/rtl8712/Kconfig"
 
 source "drivers/staging/rtl8188eu/Kconfig"
 
+source "drivers/staging/r8188eu/Kconfig"
+
 source "drivers/staging/rts5208/Kconfig"
 
 source "drivers/staging/octeon/Kconfig"
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index 9a4c0e6f34d5..47672260293e 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -8,7 +8,8 @@ obj-$(CONFIG_RTL8192U)		+= rtl8192u/
 obj-$(CONFIG_RTL8192E)		+= rtl8192e/
 obj-$(CONFIG_RTL8723BS)		+= rtl8723bs/
 obj-$(CONFIG_R8712U)		+= rtl8712/
-obj-$(CONFIG_R8188EU)		+= rtl8188eu/
+obj-$(CONFIG_R8188EU_OLD)	+= rtl8188eu/
+obj-$(CONFIG_R8188EU)		+= r8188eu/
 obj-$(CONFIG_RTS5208)		+= rts5208/
 obj-$(CONFIG_NETLOGIC_XLR_NET)	+= netlogic/
 obj-$(CONFIG_OCTEON_ETHERNET)	+= octeon/
diff --git a/drivers/staging/rtl8188eu/Kconfig b/drivers/staging/rtl8188eu/Kconfig
index 970d5abd6336..acdf0f9f374c 100644
--- a/drivers/staging/rtl8188eu/Kconfig
+++ b/drivers/staging/rtl8188eu/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-config R8188EU
-	tristate "Realtek RTL8188EU Wireless LAN NIC driver"
+config R8188EU_OLD
+	tristate "Realtek RTL8188EU Wireless LAN NIC driver (DEPRECATED)"
 	depends on WLAN && USB && CFG80211
 	depends on m
 	select WIRELESS_EXT
@@ -10,9 +10,10 @@ config R8188EU
 	select LIB80211_CRYPT_CCMP
 	help
 	This option adds the Realtek RTL8188EU USB device such as TP-Link TL-WN725N.
-	If built as a module, it will be called r8188eu.
+	If built as a module, it will be called rtl8188eu. This driver is now due to
+	be dropped due to the import of a newer version.
 
-if R8188EU
+if R8188EU_OLD
 
 config 88EU_AP_MODE
 	bool "Realtek RTL8188EU AP mode"
diff --git a/drivers/staging/rtl8188eu/Makefile b/drivers/staging/rtl8188eu/Makefile
index 2799ec5a7fda..20d88983f4e2 100644
--- a/drivers/staging/rtl8188eu/Makefile
+++ b/drivers/staging/rtl8188eu/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-r8188eu-y :=				\
+rtl8188eu-y :=				\
 		core/mac_cfg.o		\
 		core/rtw_ap.o		\
 		core/rtw_cmd.o		\
@@ -51,6 +51,6 @@ r8188eu-y :=				\
 		os_dep/usb_ops_linux.o	\
 		os_dep/xmit_linux.o
 
-obj-$(CONFIG_R8188EU)	:= r8188eu.o
+obj-$(CONFIG_R8188EU_OLD)	:= rtl8188eu.o
 
 ccflags-y += -I$(srctree)/$(src)/include
-- 
2.31.1

