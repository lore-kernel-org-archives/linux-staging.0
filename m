Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A1570
	for <linux-staging@lists.linux.dev>; Tue, 20 Jul 2021 22:58:29 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id l7so110371wrv.7
        for <linux-staging@lists.linux.dev>; Tue, 20 Jul 2021 15:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TNPEMMUgoiehFtzKXEoJ63hPg6Ju+Bf/SAUPrXK8URU=;
        b=Cs7v4oCkpaQVlNpFvJz/H4CatVDhrRD/txMcHw+Ggu3rnfnZm5ioTVTuzoJr6w3QDD
         34cdVg46l5mADjlN+8D/h/GYDOA7xjt6NtD5/e0aYb3ti5RpIHPDOTmNCo+W97W11Hs9
         NyXArsKruE88y6y8srWfOp4q/hu95q8wMHSuv2xCl2wB658G2SP+mVT6Zp5ziet/U40c
         5DTy9IrQI9lPltIZ5Yi2cEaYmbIl5mS6XxmDW5acgZuk/6rC2+KOq7+ngM9ju/WOmn/5
         9fholoH9jNhQjQlrKK4/ciixttMy7+/hwh5J0gTB4lwYgpb1FuttPFYflvlp4zA/OH3d
         PN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TNPEMMUgoiehFtzKXEoJ63hPg6Ju+Bf/SAUPrXK8URU=;
        b=TUSNZ/+zURPkmnr8s5dXcpqJdWEkNEKOmhmzRe9EUnltCZiokEJuUK4/OwLE1kcB7q
         FqMrBYDZy3zdzrFHsFwxuJBcO4iHhDHIzvs6zDsHZ425YL+MJIsOwFmBNvbRpqiWtPAk
         C+oYh1U8w9Al9tZ6UgtZyLzsUBNFVU3nxzJprNGL4h8aB5MI1FA0bbnFpWkfoVFywasJ
         YCK/Pb717mmbWH5fYs4YBg/VZ6gAa/SdBAY+mVHFWKdPj9djAZtHNQFcGjyuvnEDaeBl
         ICpuntQIYO+fwTzX9UZcuZaQrSzeWqyhWXo0fdWNfUQxUjbI0+Gy5hmKioGkh4B/nsbd
         zbRw==
X-Gm-Message-State: AOAM533g7xpNbpw5s/VuBihez4764hkVPgHvhlBTX8fTLLIT7nm39NtN
	usLLjuuv7RQljjlG8evCZvC5cg==
X-Google-Smtp-Source: ABdhPJwWaA4jL2qnQ/MSpRxdH5K35wL4UQ4HDISUQ873rKnIipmE5PgkAA77m1UIfcQXYgPWX4+FQQ==
X-Received: by 2002:a5d:5606:: with SMTP id l6mr38647106wrv.190.1626821907738;
        Tue, 20 Jul 2021 15:58:27 -0700 (PDT)
Received: from localhost.localdomain (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id t15sm24354653wrx.17.2021.07.20.15.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 15:58:27 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: fabioaiuto83@gmail.com,
	Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: rtl8188eu: move hal/mac_cfg.c and rename function and array
Date: Tue, 20 Jul 2021 23:58:26 +0100
Message-Id: <20210720225826.454516-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move source file hal/mac_cfg.c to the 'core' driver directory, and also
rename its array from array_MAC_REG_8188E to array_MAC_REG, as well as
renaming the function rtl88eu_phy_mac_config to phy_mac_config. Also
modify single call-site for this function to reflect new name.

This file contains no code which touches the adapter's HalData structure,
and is a good candidate for therefore moving out of 'hal'. Also, no
need for these signatures to include the model number as this driver
only supports RTL8188eu.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/Makefile                | 2 +-
 drivers/staging/rtl8188eu/{hal => core}/mac_cfg.c | 8 ++++----
 drivers/staging/rtl8188eu/hal/usb_halinit.c       | 2 +-
 drivers/staging/rtl8188eu/include/phy.h           | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename drivers/staging/rtl8188eu/{hal => core}/mac_cfg.c (93%)

diff --git a/drivers/staging/rtl8188eu/Makefile b/drivers/staging/rtl8188eu/Makefile
index 28b936e8be0a..2799ec5a7fda 100644
--- a/drivers/staging/rtl8188eu/Makefile
+++ b/drivers/staging/rtl8188eu/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 r8188eu-y :=				\
+		core/mac_cfg.o		\
 		core/rtw_ap.o		\
 		core/rtw_cmd.o		\
 		core/rtw_efuse.o	\
@@ -18,7 +19,6 @@ r8188eu-y :=				\
 		core/rtw_wlan_util.o	\
 		core/rtw_xmit.o		\
 		hal/fw.o	\
-		hal/mac_cfg.o \
 		hal/bb_cfg.o \
 		hal/rf_cfg.o \
 		hal/pwrseqcmd.o \
diff --git a/drivers/staging/rtl8188eu/hal/mac_cfg.c b/drivers/staging/rtl8188eu/core/mac_cfg.c
similarity index 93%
rename from drivers/staging/rtl8188eu/hal/mac_cfg.c
rename to drivers/staging/rtl8188eu/core/mac_cfg.c
index 370aa5cc55a7..a94c6ad472c5 100644
--- a/drivers/staging/rtl8188eu/hal/mac_cfg.c
+++ b/drivers/staging/rtl8188eu/core/mac_cfg.c
@@ -10,7 +10,7 @@
 
 /* MAC_REG.TXT */
 
-static u32 array_MAC_REG_8188E[] = {
+static u32 array_MAC_REG[] = {
 		0x026, 0x00000041,
 		0x027, 0x00000035,
 		0x428, 0x0000000A,
@@ -103,14 +103,14 @@ static u32 array_MAC_REG_8188E[] = {
 		0x70B, 0x00000087,
 };
 
-bool rtl88eu_phy_mac_config(struct adapter *adapt)
+bool phy_mac_config(struct adapter *adapt)
 {
 	u32 i;
 	u32 arraylength;
 	u32 *ptrarray;
 
-	arraylength = ARRAY_SIZE(array_MAC_REG_8188E);
-	ptrarray = array_MAC_REG_8188E;
+	arraylength = ARRAY_SIZE(array_MAC_REG);
+	ptrarray = array_MAC_REG;
 
 	for (i = 0; i < arraylength; i += 2)
 		usb_write8(adapt, ptrarray[i], (u8)ptrarray[i + 1]);
diff --git a/drivers/staging/rtl8188eu/hal/usb_halinit.c b/drivers/staging/rtl8188eu/hal/usb_halinit.c
index 05c67e7d23ad..2a47e9b444d5 100644
--- a/drivers/staging/rtl8188eu/hal/usb_halinit.c
+++ b/drivers/staging/rtl8188eu/hal/usb_halinit.c
@@ -684,7 +684,7 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
 	}
 	rtl8188e_InitializeFirmwareVars(Adapter);
 
-	rtl88eu_phy_mac_config(Adapter);
+	phy_mac_config(Adapter);
 
 	rtl88eu_phy_bb_config(Adapter);
 
diff --git a/drivers/staging/rtl8188eu/include/phy.h b/drivers/staging/rtl8188eu/include/phy.h
index 40901d6dcaf5..8ee13eb68a5a 100644
--- a/drivers/staging/rtl8188eu/include/phy.h
+++ b/drivers/staging/rtl8188eu/include/phy.h
@@ -5,7 +5,7 @@
 #define index_mapping_NUM_88E	    15
 #define AVG_THERMAL_NUM_88E	    4
 
-bool rtl88eu_phy_mac_config(struct adapter *adapt);
+bool phy_mac_config(struct adapter *adapt);
 bool rtl88eu_phy_rf_config(struct adapter *adapt);
 bool rtl88eu_phy_bb_config(struct adapter *adapt);
 
-- 
2.31.1

