Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C87168
	for <linux-staging@lists.linux.dev>; Mon, 12 Jul 2021 23:09:32 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id v5so27848928wrt.3
        for <linux-staging@lists.linux.dev>; Mon, 12 Jul 2021 16:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9Xdhpm2k+PKRkOIMYXDY5v+obTyo9rMVta8zQ2xLsEM=;
        b=LRZ4pIfVQNhzO8j8z2cEGVZJSb/PzLVQFh0JK+gwR9WlTY8rkZjDfTSbsY4osLWZpG
         BP5Hyo/U6O/oLwFIC31LlQG/l6I6gEeD9/boLKrXAmYPVpBzkuAXy/lWv/d/TdwQUzxO
         50Xj30NItIfbm35fZyNdvUVW6Obvli/3iQZmeKTLhXhIO6KJQMh74upz4lyt4pUWVef6
         DReNN6dZsD2MvNezmR0qPpD0mtgjMufbB8p5Q4woJOts2k7Os1AGxtFCkoZpZ0gcXALx
         qEgCHljbPRI5XkAAB3//pRohbxeTlAJtf731ZkEeLpcKApnINtmiAE5TuY2hbAPWJGMt
         CnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9Xdhpm2k+PKRkOIMYXDY5v+obTyo9rMVta8zQ2xLsEM=;
        b=LjKk/kmvYoxbBZQ8GDyPy28imlfTsyHvaAVWu7ZpSYPSxIaD3rMp+nohnaLPZ4akyk
         Zy6l6p5aJmNUoufegJ7++0wXtJRZY0TCs7jIaMGXBzz3Ih9WRCpb8klgs0TkqsDz9tce
         aXEPZ7Zm4hxMyuw4mt7eGGnB4oqb2BgppU+OewRSoNj2sPnIWwiUfRGcK+ZxsdvjkQLo
         4Ku1v6L9agn4EU8CyjHyXMCmFlTTl1mEzL56hkM/AD+CXLZAo5fbrok5OCnHdHDdomAY
         QsCYUVI78ag3nM6tWdBxl1f25AKPONXgIzxUyrStVteAQbAWzcknOyGTdmMxpRCrBCeb
         2tBg==
X-Gm-Message-State: AOAM530vm6XFqKJhR+zXEaruw3aP0Fye4FfNgLflsKBgrrZSIFUs9GPl
	BeJN4BlR2Y4GfzsSRzykNbb94g==
X-Google-Smtp-Source: ABdhPJzIiD9WPsehSCMUgX5KJ0YdnCtcsN51Kt+0ATroWJPkyNbRsaJljzE1MpYunlb5xDWuliAgiw==
X-Received: by 2002:a05:6000:18c8:: with SMTP id w8mr1676533wrq.90.1626131371374;
        Mon, 12 Jul 2021 16:09:31 -0700 (PDT)
Received: from localhost.localdomain (30.34.155.90.in-addr.arpa. [90.155.34.30])
        by smtp.gmail.com with ESMTPSA id b8sm657939wmb.20.2021.07.12.16.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 16:09:30 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: rtl8188eu: move all source files from core subdirectory
Date: Tue, 13 Jul 2021 00:09:30 +0100
Message-Id: <20210712230930.6975-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move all C source files from the core subdirectory to the root
folder of the driver, and adjust Makefile accordingly. The ultmate
goal is to remove hal layer and fold its functionalty into the main
sources. At this point, the distinction between hal and core will be
meaningless, so this is the first step towards simplifying the file
layout.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/Makefile            | 34 +++++++++----------
 drivers/staging/rtl8188eu/{core => }/rtw_ap.c |  0
 .../staging/rtl8188eu/{core => }/rtw_cmd.c    |  0
 .../staging/rtl8188eu/{core => }/rtw_efuse.c  |  0
 .../rtl8188eu/{core => }/rtw_ieee80211.c      |  0
 .../rtl8188eu/{core => }/rtw_ioctl_set.c      |  0
 .../staging/rtl8188eu/{core => }/rtw_iol.c    |  0
 .../staging/rtl8188eu/{core => }/rtw_led.c    |  0
 .../staging/rtl8188eu/{core => }/rtw_mlme.c   |  0
 .../rtl8188eu/{core => }/rtw_mlme_ext.c       |  0
 .../rtl8188eu/{core => }/rtw_pwrctrl.c        |  0
 .../staging/rtl8188eu/{core => }/rtw_recv.c   |  0
 drivers/staging/rtl8188eu/{core => }/rtw_rf.c |  0
 .../rtl8188eu/{core => }/rtw_security.c       |  0
 .../staging/rtl8188eu/{core => }/rtw_sreset.c |  0
 .../rtl8188eu/{core => }/rtw_sta_mgt.c        |  0
 .../rtl8188eu/{core => }/rtw_wlan_util.c      |  0
 .../staging/rtl8188eu/{core => }/rtw_xmit.c   |  0
 18 files changed, 17 insertions(+), 17 deletions(-)
 rename drivers/staging/rtl8188eu/{core => }/rtw_ap.c (100%)
 rename drivers/staging/rtl8188eu/{core => }/rtw_cmd.c (100%)
 rename drivers/staging/rtl8188eu/{core => }/rtw_efuse.c (100%)
 rename drivers/staging/rtl8188eu/{core => }/rtw_ieee80211.c (100%)
 rename drivers/staging/rtl8188eu/{core => }/rtw_ioctl_set.c (100%)
 rename drivers/staging/rtl8188eu/{core => }/rtw_iol.c (100%)
 rename drivers/staging/rtl8188eu/{core => }/rtw_led.c (100%)
 rename drivers/staging/rtl8188eu/{core => }/rtw_mlme.c (100%)
 rename drivers/staging/rtl8188eu/{core => }/rtw_mlme_ext.c (100%)
 rename drivers/staging/rtl8188eu/{core => }/rtw_pwrctrl.c (100%)
 rename drivers/staging/rtl8188eu/{core => }/rtw_recv.c (100%)
 rename drivers/staging/rtl8188eu/{core => }/rtw_rf.c (100%)
 rename drivers/staging/rtl8188eu/{core => }/rtw_security.c (100%)
 rename drivers/staging/rtl8188eu/{core => }/rtw_sreset.c (100%)
 rename drivers/staging/rtl8188eu/{core => }/rtw_sta_mgt.c (100%)
 rename drivers/staging/rtl8188eu/{core => }/rtw_wlan_util.c (100%)
 rename drivers/staging/rtl8188eu/{core => }/rtw_xmit.c (100%)

diff --git a/drivers/staging/rtl8188eu/Makefile b/drivers/staging/rtl8188eu/Makefile
index 28b936e8be0a..2dad13bdbdeb 100644
--- a/drivers/staging/rtl8188eu/Makefile
+++ b/drivers/staging/rtl8188eu/Makefile
@@ -1,22 +1,22 @@
 # SPDX-License-Identifier: GPL-2.0
 r8188eu-y :=				\
-		core/rtw_ap.o		\
-		core/rtw_cmd.o		\
-		core/rtw_efuse.o	\
-		core/rtw_ieee80211.o	\
-		core/rtw_ioctl_set.o	\
-		core/rtw_iol.o		\
-		core/rtw_led.o		\
-		core/rtw_mlme.o		\
-		core/rtw_mlme_ext.o	\
-		core/rtw_pwrctrl.o	\
-		core/rtw_recv.o		\
-		core/rtw_rf.o		\
-		core/rtw_security.o	\
-		core/rtw_sreset.o	\
-		core/rtw_sta_mgt.o	\
-		core/rtw_wlan_util.o	\
-		core/rtw_xmit.o		\
+		rtw_ap.o		\
+		rtw_cmd.o		\
+		rtw_efuse.o		\
+		rtw_ieee80211.o		\
+		rtw_ioctl_set.o		\
+		rtw_iol.o		\
+		rtw_led.o		\
+		rtw_mlme.o		\
+		rtw_mlme_ext.o		\
+		rtw_pwrctrl.o		\
+		rtw_recv.o		\
+		rtw_rf.o		\
+		rtw_security.o		\
+		rtw_sreset.o		\
+		rtw_sta_mgt.o		\
+		rtw_wlan_util.o		\
+		rtw_xmit.o		\
 		hal/fw.o	\
 		hal/mac_cfg.o \
 		hal/bb_cfg.o \
diff --git a/drivers/staging/rtl8188eu/core/rtw_ap.c b/drivers/staging/rtl8188eu/rtw_ap.c
similarity index 100%
rename from drivers/staging/rtl8188eu/core/rtw_ap.c
rename to drivers/staging/rtl8188eu/rtw_ap.c
diff --git a/drivers/staging/rtl8188eu/core/rtw_cmd.c b/drivers/staging/rtl8188eu/rtw_cmd.c
similarity index 100%
rename from drivers/staging/rtl8188eu/core/rtw_cmd.c
rename to drivers/staging/rtl8188eu/rtw_cmd.c
diff --git a/drivers/staging/rtl8188eu/core/rtw_efuse.c b/drivers/staging/rtl8188eu/rtw_efuse.c
similarity index 100%
rename from drivers/staging/rtl8188eu/core/rtw_efuse.c
rename to drivers/staging/rtl8188eu/rtw_efuse.c
diff --git a/drivers/staging/rtl8188eu/core/rtw_ieee80211.c b/drivers/staging/rtl8188eu/rtw_ieee80211.c
similarity index 100%
rename from drivers/staging/rtl8188eu/core/rtw_ieee80211.c
rename to drivers/staging/rtl8188eu/rtw_ieee80211.c
diff --git a/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c b/drivers/staging/rtl8188eu/rtw_ioctl_set.c
similarity index 100%
rename from drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
rename to drivers/staging/rtl8188eu/rtw_ioctl_set.c
diff --git a/drivers/staging/rtl8188eu/core/rtw_iol.c b/drivers/staging/rtl8188eu/rtw_iol.c
similarity index 100%
rename from drivers/staging/rtl8188eu/core/rtw_iol.c
rename to drivers/staging/rtl8188eu/rtw_iol.c
diff --git a/drivers/staging/rtl8188eu/core/rtw_led.c b/drivers/staging/rtl8188eu/rtw_led.c
similarity index 100%
rename from drivers/staging/rtl8188eu/core/rtw_led.c
rename to drivers/staging/rtl8188eu/rtw_led.c
diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme.c b/drivers/staging/rtl8188eu/rtw_mlme.c
similarity index 100%
rename from drivers/staging/rtl8188eu/core/rtw_mlme.c
rename to drivers/staging/rtl8188eu/rtw_mlme.c
diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c b/drivers/staging/rtl8188eu/rtw_mlme_ext.c
similarity index 100%
rename from drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
rename to drivers/staging/rtl8188eu/rtw_mlme_ext.c
diff --git a/drivers/staging/rtl8188eu/core/rtw_pwrctrl.c b/drivers/staging/rtl8188eu/rtw_pwrctrl.c
similarity index 100%
rename from drivers/staging/rtl8188eu/core/rtw_pwrctrl.c
rename to drivers/staging/rtl8188eu/rtw_pwrctrl.c
diff --git a/drivers/staging/rtl8188eu/core/rtw_recv.c b/drivers/staging/rtl8188eu/rtw_recv.c
similarity index 100%
rename from drivers/staging/rtl8188eu/core/rtw_recv.c
rename to drivers/staging/rtl8188eu/rtw_recv.c
diff --git a/drivers/staging/rtl8188eu/core/rtw_rf.c b/drivers/staging/rtl8188eu/rtw_rf.c
similarity index 100%
rename from drivers/staging/rtl8188eu/core/rtw_rf.c
rename to drivers/staging/rtl8188eu/rtw_rf.c
diff --git a/drivers/staging/rtl8188eu/core/rtw_security.c b/drivers/staging/rtl8188eu/rtw_security.c
similarity index 100%
rename from drivers/staging/rtl8188eu/core/rtw_security.c
rename to drivers/staging/rtl8188eu/rtw_security.c
diff --git a/drivers/staging/rtl8188eu/core/rtw_sreset.c b/drivers/staging/rtl8188eu/rtw_sreset.c
similarity index 100%
rename from drivers/staging/rtl8188eu/core/rtw_sreset.c
rename to drivers/staging/rtl8188eu/rtw_sreset.c
diff --git a/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c b/drivers/staging/rtl8188eu/rtw_sta_mgt.c
similarity index 100%
rename from drivers/staging/rtl8188eu/core/rtw_sta_mgt.c
rename to drivers/staging/rtl8188eu/rtw_sta_mgt.c
diff --git a/drivers/staging/rtl8188eu/core/rtw_wlan_util.c b/drivers/staging/rtl8188eu/rtw_wlan_util.c
similarity index 100%
rename from drivers/staging/rtl8188eu/core/rtw_wlan_util.c
rename to drivers/staging/rtl8188eu/rtw_wlan_util.c
diff --git a/drivers/staging/rtl8188eu/core/rtw_xmit.c b/drivers/staging/rtl8188eu/rtw_xmit.c
similarity index 100%
rename from drivers/staging/rtl8188eu/core/rtw_xmit.c
rename to drivers/staging/rtl8188eu/rtw_xmit.c
-- 
2.31.1

