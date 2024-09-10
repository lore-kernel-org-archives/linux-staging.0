Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C22171088
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 05:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725947876; cv=none; b=KIeit4fFjmMWor1RLZq1/AbG1a6fVWnovzISn8eNhYcXFHNeQ7tBedzbDREs0ImRkHhjG5E5ZMTYjroCYIIsp7Mal+VrZvGCpVKptaYrInkK0fbhC6fqh6zyiTJkUnvr61vFNtf338SQkhRegYJLAUvngzogbzFpKVLw42zf7wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725947876; c=relaxed/simple;
	bh=7SeuylvnB8sTpCCvm96/XWU5R0krPVHlpXSp5SF0zEI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gj1n8It0UjFqkeOTN2qDMd64mvPsaBVC9vEst/zMTFAIvecYk4f3V/4jnKvm41sP7+1L3NaWybOmUyeNbak6eBqZFOvWayD5h04Rb6w9OF/4l3L74KrBWNYxF/RuwEKZLk3rrRbCV/yxFssHsf0hWXv20/YYf0uCclseiKIS0Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdzJWvjH; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdzJWvjH"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8d0d82e76aso362666066b.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 22:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725947872; x=1726552672; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UnCBvYewLoi8x5TNHncL+CzIh6+v3PhoZfJuPVAvTvc=;
        b=BdzJWvjH2uZ0/bzhZlG5NIv9B5jBLiwZDee5cGn9XA5nYvSj0qkqdPZRCVEEjdIdB+
         guEFivNTqV9fp0XlCOZ6PKq5C/67+dyoqH9c459bJ80yfu3gUu5smX8KtL4e1Pih5A85
         Z1YluOE68b/XjWrSsvLYu7rmpR5k/6EW2+o9PQZE3s7pLvKVmRaF0g6x6KoWh1J6m7wf
         e50XGd5gAYzlcIBj1Yg1f++ymXJqG081Os/BfBDoHm7iyCPyvda9kCBvbotfsYaRV81d
         Ayo4L3KHC6lkX1vXeWtKLc5dGCNIu3bCjDHV2vH6LzOyWlWS/fB47qLAR+n3JImJegPb
         FsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725947872; x=1726552672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnCBvYewLoi8x5TNHncL+CzIh6+v3PhoZfJuPVAvTvc=;
        b=ISu8P1ZYDWoNehmC1NpLsAL5CvfoaEYJl62LxgCczTO8n435T/wQq1y32OVG6mGXRA
         RQ3MfYxdsg/FkaqPdMzrBbtEZv/S9Wz6XsnVrGDdWDhU7ENgFA+A+VgyOJ3y1Dx34+FN
         0yPbUXHEvRlInln1RqApuGHKNmXsSWvAzqc8ZOxvrplajFGbWCfYtT56YNcaCBIXbuv9
         uG7i6gJLn3x0Dy1Rm32oLMIFBkvYSMQ8RBrYXWTrxpDlwWj51ju/4fvKTF7SWv465MlR
         pLbMnUtl5iRIfdzUrzfWYH55v1qcFeQFbRLI92xJamnO2VNEXaN+aSbwgfiSB2njFMn2
         Lfsg==
X-Forwarded-Encrypted: i=1; AJvYcCW4Cv3dIgfxjWeyCylrEi1FQXPM3HWV3Kv1TQWiwFO3v9hEMsGjKGfTCnn2qgWs6SNQLR+z6hicO4EWRdhr@lists.linux.dev
X-Gm-Message-State: AOJu0YxROnnALfVzkY/4STj12mFyVgryParPoYPO63ICZnTV/ESerZPU
	SxtllqsPu5BcZ4SdWS3IqEEn+4ZFM+X1bv8ng5TRcGFvpwy8wKY8
X-Google-Smtp-Source: AGHT+IEdUxv93rTToB5+YLMCQKasbQlmD4p+XFGey2bD3WWof4xToykv+crM0wLmTR1gd8etKvR3qg==
X-Received: by 2002:a17:907:7fa1:b0:a86:a866:9e26 with SMTP id a640c23a62f3a-a8d1bf75e94mr1123247066b.3.1725947872029;
        Mon, 09 Sep 2024 22:57:52 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p200300c78f2a8598b80c2d4e9a813f29.dip0.t-ipconnect.de. [2003:c7:8f2a:8598:b80c:2d4e:9a81:3f29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c72ed3sm431099066b.135.2024.09.09.22.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 22:57:51 -0700 (PDT)
Date: Tue, 10 Sep 2024 07:57:50 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] staging: rtl8723bs: Remove unused files rtw_debug.c
 and rtw_debug.h
Message-ID: <ab3d501e2ef0bb3980d8d271fb667ce20ed8dca5.1725826273.git.philipp.g.hortmann@gmail.com>
References: <cover.1725826273.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1725826273.git.philipp.g.hortmann@gmail.com>

Remove unused files rtw_debug.c and rtw_debug.h.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/Makefile                |  1 -
 drivers/staging/rtl8723bs/core/rtw_ap.c           |  1 -
 drivers/staging/rtl8723bs/core/rtw_btcoex.c       |  1 -
 drivers/staging/rtl8723bs/core/rtw_cmd.c          |  1 -
 drivers/staging/rtl8723bs/core/rtw_debug.c        | 12 ------------
 drivers/staging/rtl8723bs/core/rtw_efuse.c        |  1 -
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c    |  1 -
 drivers/staging/rtl8723bs/core/rtw_io.c           |  1 -
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c    |  1 -
 drivers/staging/rtl8723bs/core/rtw_mlme.c         |  1 -
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     |  1 -
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c      |  1 -
 drivers/staging/rtl8723bs/core/rtw_recv.c         |  1 -
 drivers/staging/rtl8723bs/core/rtw_security.c     |  1 -
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c      |  1 -
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c    |  1 -
 drivers/staging/rtl8723bs/core/rtw_xmit.c         |  1 -
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c    |  1 -
 drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c      |  1 -
 drivers/staging/rtl8723bs/hal/hal_btcoex.c        |  1 -
 drivers/staging/rtl8723bs/hal/hal_com.c           |  1 -
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c    |  1 -
 drivers/staging/rtl8723bs/hal/hal_intf.c          |  1 -
 drivers/staging/rtl8723bs/hal/hal_sdio.c          |  1 -
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c      |  1 -
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c       |  1 -
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c |  1 -
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  1 -
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c    |  1 -
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  1 -
 drivers/staging/rtl8723bs/hal/sdio_halinit.c      |  1 -
 drivers/staging/rtl8723bs/hal/sdio_ops.c          |  1 -
 drivers/staging/rtl8723bs/include/rtw_debug.h     | 10 ----------
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  1 -
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c    |  1 -
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c     |  1 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c       |  1 -
 drivers/staging/rtl8723bs/os_dep/osdep_service.c  |  1 -
 drivers/staging/rtl8723bs/os_dep/recv_linux.c     |  1 -
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c      |  1 -
 drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c |  1 -
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c      |  1 -
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c     |  1 -
 43 files changed, 63 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/core/rtw_debug.c
 delete mode 100644 drivers/staging/rtl8723bs/include/rtw_debug.h

diff --git a/drivers/staging/rtl8723bs/Makefile b/drivers/staging/rtl8723bs/Makefile
index 7f5067e89295..dbe6ed3b9f0c 100644
--- a/drivers/staging/rtl8723bs/Makefile
+++ b/drivers/staging/rtl8723bs/Makefile
@@ -3,7 +3,6 @@ r8723bs-y = \
 		core/rtw_ap.o \
 		core/rtw_btcoex.o \
 	 	core/rtw_cmd.o \
-		core/rtw_debug.o \
 		core/rtw_efuse.o \
 		core/rtw_io.o \
 		core/rtw_ioctl_set.o \
diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 23268ec502a7..e55b4f7e0aef 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -6,7 +6,6 @@
  ******************************************************************************/
 
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <asm/unaligned.h>
 
 void init_mlme_ap_info(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index 62cbf84b079a..d54095f50113 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -5,7 +5,6 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <rtw_btcoex.h>
 #include <hal_btcoex.h>
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index d3f10a3cf972..6c49bfa00578 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -5,7 +5,6 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <hal_btcoex.h>
 #include <linux/jiffies.h>
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
deleted file mode 100644
index fb6cc1d18bba..000000000000
--- a/drivers/staging/rtl8723bs/core/rtw_debug.c
+++ /dev/null
@@ -1,12 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-
-#include <drv_types.h>
-#include <rtw_debug.h>
-#include <hal_btcoex.h>
-
-#include <rtw_version.h>
diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 89acb6f290cc..6419638c6e20 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -5,7 +5,6 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <hal_data.h>
 #include <linux/jiffies.h>
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 0cc5142a90e0..5a76069a8222 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -6,7 +6,6 @@
  ******************************************************************************/
 
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <linux/of.h>
 #include <asm/unaligned.h>
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 4d3c30ec93b5..fcda9db6ebb5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -26,7 +26,6 @@ jackson@realtek.com.tw
 */
 
 #include <drv_types.h>
-#include <rtw_debug.h>
 
 u8 rtw_read8(struct adapter *adapter, u32 addr)
 {
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 3b44f0dd5b0a..587a87fbffeb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -6,7 +6,6 @@
  ******************************************************************************/
 
 #include <drv_types.h>
-#include <rtw_debug.h>
 
 u8 rtw_validate_bssid(u8 *bssid)
 {
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 8c487b7b7a40..cbdb134278d3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -6,7 +6,6 @@
  ******************************************************************************/
 #include <linux/etherdevice.h>
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <hal_btcoex.h>
 #include <linux/jiffies.h>
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 834b53c0ee1d..bbdd5fce28a1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5,7 +5,6 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <rtw_wifi_regd.h>
 #include <hal_btcoex.h>
 #include <linux/kernel.h>
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index e9763eab16f6..a95092129748 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -5,7 +5,6 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <hal_data.h>
 #include <linux/jiffies.h>
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 0eadc23a7d54..7a95e15e641f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -5,7 +5,6 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <linux/jiffies.h>
 #include <rtw_recv.h>
 #include <net/cfg80211.h>
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 7ecdaa2eeaf3..1e9eff01b1aa 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -6,7 +6,6 @@
  ******************************************************************************/
 #include <linux/crc32.h>
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <crypto/aes.h>
 
 static const char * const _security_type_str[] = {
diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 0145c4da5ac0..1b72f2196a1c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -5,7 +5,6 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
-#include <rtw_debug.h>
 
 void _rtw_init_stainfo(struct sta_info *psta);
 void _rtw_init_stainfo(struct sta_info *psta)
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 87ce4a9b3aad..f37fec1efaf9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -6,7 +6,6 @@
  ******************************************************************************/
 
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <hal_com_h2c.h>
 
 static unsigned char ARTHEROS_OUI1[] = {0x00, 0x03, 0x7f};
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index b1965ec0181f..7d7d0abae576 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -5,7 +5,6 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
-#include <rtw_debug.h>
 
 static u8 P802_1H_OUI[P80211_OUI_LEN] = { 0x00, 0x00, 0xf8 };
 static u8 RFC1042_OUI[P80211_OUI_LEN] = { 0x00, 0x00, 0x00 };
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 22e33b97800d..81149ab81904 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -6,7 +6,6 @@
  ******************************************************************************/
 
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include "odm_precomp.h"
 
 /*  MACRO definition for pRFCalibrateInfo->TxIQC_8723B[0] */
diff --git a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
index 5f9e94a7e6ad..86404b5e6c52 100644
--- a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
+++ b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
@@ -21,7 +21,6 @@ Major Change History:
 
 --*/
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <HalPwrSeqCmd.h>
 
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index e26b789b9cdd..b72cf520d576 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -6,7 +6,6 @@
  ******************************************************************************/
 
 #include <hal_data.h>
-#include <rtw_debug.h>
 #include <hal_btcoex.h>
 #include <Mp_Precomp.h>
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 852232102433..719dd116d807 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -7,7 +7,6 @@
 
 #include <linux/kernel.h>
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include "hal_com_h2c.h"
 
 #include "odm_precomp.h"
diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 3e814a15e893..d5649e7d8f99 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -6,7 +6,6 @@
  ******************************************************************************/
 
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <hal_data.h>
 #include <linux/kernel.h>
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index b66c02cd1c82..0a3900548fd2 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -5,7 +5,6 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <hal_data.h>
 
 void rtw_hal_chip_configure(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/hal_sdio.c b/drivers/staging/rtl8723bs/hal/hal_sdio.c
index 9de62a0f5d35..665c85eccbdf 100644
--- a/drivers/staging/rtl8723bs/hal/hal_sdio.c
+++ b/drivers/staging/rtl8723bs/hal/hal_sdio.c
@@ -6,7 +6,6 @@
  ******************************************************************************/
 
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <hal_data.h>
 
 u8 rtw_hal_sdio_max_txoqt_free_space(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index d1ac2f44939c..56526056dd1d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -6,7 +6,6 @@
  ******************************************************************************/
 
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <rtl8723b_hal.h>
 #include "hal_com_h2c.h"
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 2028791988e7..d1c875cf8e6d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -8,7 +8,6 @@
 /*  This file is for 92CE/92CU dynamic mechanism only */
 
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <rtl8723b_hal.h>
 
 /*  Global var */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 7a5c3a98183b..37ebbbf408ec 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -8,7 +8,6 @@
 #include <linux/firmware.h>
 #include <linux/slab.h>
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <rtl8723b_hal.h>
 #include "hal_com_h2c.h"
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 7764896a04ea..4ff092b7c9c9 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -6,7 +6,6 @@
  ******************************************************************************/
 
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <rtl8723b_hal.h>
 
 /**
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 74e75dc970f7..28c914ec2604 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -6,7 +6,6 @@
  ******************************************************************************/
 
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <rtl8723b_hal.h>
 
 static void initrecvbuf(struct recv_buf *precvbuf, struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 15810438a472..78298e63edce 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -6,7 +6,6 @@
  ******************************************************************************/
 
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <rtl8723b_hal.h>
 
 static u8 rtw_sdio_wait_enough_TxOQT_space(struct adapter *padapter, u8 agg_num)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 535cd439121d..d3aae413fc0f 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -5,7 +5,6 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <rtl8723b_hal.h>
 
 #include "hal_com_h2c.h"
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 107f427ee4aa..21e9f1858745 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -5,7 +5,6 @@
  *
  *******************************************************************************/
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <rtl8723b_hal.h>
 
 /*  */
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
deleted file mode 100644
index c417a26de166..000000000000
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-#ifndef __RTW_DEBUG_H__
-#define __RTW_DEBUG_H__
-
-#endif	/* __RTW_DEBUG_H__ */
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index eb3c73cc2662..b63a74e669bc 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -7,7 +7,6 @@
 
 #include <linux/etherdevice.h>
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <linux/jiffies.h>
 
 #include <rtw_wifi_regd.h>
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index c81b30f1f1b0..a9e481e182ad 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -7,7 +7,6 @@
 
 #include <linux/etherdevice.h>
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <rtw_mp.h>
 #include <hal_btcoex.h>
 #include <linux/jiffies.h>
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index 1341801e5c21..1904e82a24b5 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -5,7 +5,6 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
-#include <rtw_debug.h>
 
 static void _dynamic_check_timer_handler(struct timer_list *t)
 {
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 55d0140cd543..fc9b9c5efb50 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -5,7 +5,6 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <hal_data.h>
 
 MODULE_LICENSE("GPL");
diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index f09c1324c39c..a00f9f0c85c5 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -5,7 +5,6 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
-#include <rtw_debug.h>
 
 /*
 * Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
diff --git a/drivers/staging/rtl8723bs/os_dep/recv_linux.c b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
index 4d28b300b235..746f45cf9aac 100644
--- a/drivers/staging/rtl8723bs/os_dep/recv_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
@@ -5,7 +5,6 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <linux/jiffies.h>
 #include <net/cfg80211.h>
 #include <asm/unaligned.h>
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 490431484524..d18fde4e5d6c 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -5,7 +5,6 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
-#include <rtw_debug.h>
 #include <hal_btcoex.h>
 #include <linux/jiffies.h>
 
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
index 0a0b04088e66..4a7c0c9cc7ef 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
@@ -6,7 +6,6 @@
  *******************************************************************************/
 
 #include <drv_types.h>
-#include <rtw_debug.h>
 
 static bool rtw_sdio_claim_host_needed(struct sdio_func *func)
 {
diff --git a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
index 5eef1d68c6f0..dbd4bf531339 100644
--- a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
+++ b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
@@ -6,7 +6,6 @@
  *****************************************************************************/
 
 #include <drv_types.h>
-#include <rtw_debug.h>
 
 #include <rtw_wifi_regd.h>
 
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index e0736707a211..944b9c724b32 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -5,7 +5,6 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
-#include <rtw_debug.h>
 
 
 uint rtw_remainder_len(struct pkt_file *pfile)
-- 
2.46.0

