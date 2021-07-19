Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FA970
	for <linux-staging@lists.linux.dev>; Mon, 19 Jul 2021 22:46:04 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id t5so23849499wrw.12
        for <linux-staging@lists.linux.dev>; Mon, 19 Jul 2021 15:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9Xdhpm2k+PKRkOIMYXDY5v+obTyo9rMVta8zQ2xLsEM=;
        b=vVUAywRyhSi0ve4UwHU/2A5NltsR81o/zKn31xuu70XIZQ7PB5lQL7yLaptb87Fl61
         B/RZ4hkRsM/dhR7JTKwPJ6T8d71glObR9UmC6XDahl0UZZPbR0U7oeI0boGbUR69gLt/
         7hXkUVSJ2THgvyyaNtTXkHkbsRA2oVWuPA1Tod8b7tJVG3MyHXvDtDsYOOGLv0JdGd+Z
         LFzqZFFDX4h7DsGmjb1U28FuWU9fWOasqy+elvkGV6AR2qJd+COSRskhvzI+IZgPj+Yf
         GEFRw4KpmulLvbj8o4IJ8pZfKR61K8hayKCjNUM73ThgRfWxUMJJm0/Wcm1r1cRMAENG
         MMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9Xdhpm2k+PKRkOIMYXDY5v+obTyo9rMVta8zQ2xLsEM=;
        b=hjuDH+CjvszLb4OkSkyHFiXn/PH1bkSZxwgRCPqph9rf5aKdb4X2uyXgf6pv4Z7J3j
         gG1qdgOZDeazCfKoDIbFuEg/QE7Jx8Y2uGVNBN+EGrB9UNJTsZlZYCS0YL1FaB+390wy
         tnahV0czEoc5HT62MiKrvVLvQFJ4h5wq2h0VWO0fZk0Uk8toiW8eTJ4EuRtbSLZ+M8Sq
         Hv149bAIhlvurZadc9h9cGmOIXocSC6R/bmGTLxmWZoP1MPNZDCAAMxiWMWSsLgVl4Ew
         uixWge5rpZ4yiPpcrXPXAV4r9z9sCC3/zqCTGIOJ1Yb1PtjM3UipnMA53NnDYD5P6E//
         r+VA==
X-Gm-Message-State: AOAM531SfDlqvA9reQsLd1SfNOygANsaQ8ILi4iUWoCn54+6F++9EDtE
	N2ORZjo0tgFPs8/q0tYxtU+92A==
X-Google-Smtp-Source: ABdhPJyWrJ8/aw0IR8ZaKLCccjMcoWnkdlNznoFrfdnOQMcA+zd7+KuK+SITFtHmM/YabISkQa9QFw==
X-Received: by 2002:a5d:6851:: with SMTP id o17mr10645087wrw.346.1626734763100;
        Mon, 19 Jul 2021 15:46:03 -0700 (PDT)
Received: from localhost.localdomain (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id z6sm8423608wrw.9.2021.07.19.15.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 15:46:02 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH resend] staging: rtl8188eu: move all source files from core subdirectory
Date: Mon, 19 Jul 2021 23:46:01 +0100
Message-Id: <20210719224601.255364-1-phil@philpotter.co.uk>
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

