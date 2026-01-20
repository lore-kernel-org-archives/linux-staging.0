Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2813E8C68
	for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 14:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768918329; cv=none; b=Dg/HsNvGvYNNvKk+qVmqMnMlZMCA3VXZReoKVP1yo355nNErLKe+1LEwUJPAxMl1N+wPbL3R2zNUVk26qjL7TbdHcfxNGKcwDZOJojREcCxuzy4ZrqbHtzdHqE7v1x1cl6kO+NbM71MGMG90Mwp+H+2F0BMsBCV+/gp7ja5XKro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768918329; c=relaxed/simple;
	bh=JsCLXbi9z3bW07w+zHQkQ6sY8jjsdd7dOywzATL7gIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MAM23peCCi/ggcw758VhjbocN9nR113x8xZsuUv/kXKBUNI7z/a2bWMvCiTmH4nJwkEB5+wD2IWllsObB8aClnyw7zylQU3mCRr9ghQxKS4ceMb+mr4D/yenL0DNGZGlukaZHzCsBtZDvjV3kTjnlpHO5CI5tnQ6zIOMu5xMf8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn; spf=pass smtp.mailfrom=ycu.edu.cn; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ycu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ycu.edu.cn
X-QQ-mid: zesmtpgz8t1768918296tf0dbef98
X-QQ-Originating-IP: fdm7tH1DHXpgAOmg4cnaG8A953am6zwALvZcqb4vwhY=
Received: from cjz-VMware-Virtual-Platform.loc ( [36.143.144.25])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 Jan 2026 22:11:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18357767665242967253
EX-QQ-RecipientCnt: 6
From: 2023060904@ycu.edu.cn
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	2023060904@ycu.edu.cn,
	guagua210311@qq.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] rtl8723bs: Replace atomic ops with normal vars
Date: Tue, 20 Jan 2026 22:11:26 +0800
Message-ID: <4C2859A044ED908F+20260120141129.8262-2-2023060904@ycu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120141129.8262-1-2023060904@ycu.edu.cn>
References: <2026011937-snugness-movie-9e32@gregkh>
 <20260120141129.8262-1-2023060904@ycu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:ycu.edu.cn:qybglogicsvrgz:qybglogicsvrgz7b-one-0
X-QQ-XMAILINFO: NV9lVvsB36OpajxTHp8yTta1RNavRGmenKHT8b2T0uKyEaKb5EkT4od9
	s//NuOva7Ay+0tvJrCevQDNkig4/oiY4bl553v4N0CGAT7oUHlGC9J4bVCmlAAQtjxhp3UT
	HqFB8xvbEcGmktyAGDTkEppQsG8jKFXAr0L0W9oIR90yO+FVlWA184SN32dChQhKbeKsgOy
	Uo8bijlARP7ZbkKH5uZ7JrvkzdCUKn+nR62MJlE68yIubEa+/NNeNxg2yW5mjK5Rfr+c2rc
	bRzVjA6nOhyE6Po9B3lsgFO4E5ExiSAnInDJhtVV807BewLbHFT8bHgTqGXhmG0brcrxkQo
	Oz4O/+kjgTTFhcp+mSqUuBFJju6/0pmgllgYCenSpSAYeO5UULPzbmPyyD2nHqgnUHE8gg0
	rc3SPnXV1RLVroRsWw/jQwRyMUC+3XPdCKfKEzwl0ht7xold/MujfTu7/azJk3OEzTVf6t/
	xqrBQEwc5unOSUCqsorVnWSykBH/t1NFY5shCFmWY0qi+W9C6JnJQGET+KxM+e6TvWEk3jE
	zdQ4wOX4K9rpXYibw62dCi/eezElHpXN+gRXWAHmqUS2/WRBX4HUokPFX7BVDJLACtE4Cvh
	IgVmIV9hFQFlZgGB7FA53JO5jVhAh5PwggFGGDHFd/g5Q0hLyL4f49KbgesooMsNreUWyLB
	FE8STePRAab212lW0DY8k/R+Ki7/pME0+FAiCzC8v+qUkiTihL5gwMQFW2bqpdq+T2JF1H+
	6zOdcuMf18Ew7vt1gU8HQ/9ixTqiZZjVaL7sYLM4IUp/2ZrrqtHrximwg7L1Ge1OoC24fvs
	x+XLI2ZRUZO3Ui8ui931PKXebGn2GK9CYcOU5AbABByE1DA0sxZF7w2RpekwV9p6OvbFiLl
	TJnA/ODvNge20APK5a3c15Nvq19g8HbDw666VJDxCtu591eQQ4tPUCeZ6vL0L+YxgiYShiV
	cgMeFAwHAR1Ha9FfFuaQbT7yJJJubgDMPOl2dXRDWxwkBRQ==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

From: Changjun Zheng <guagua210311@qq.com>

Based on patch v2 1/2 (refactored increment logic to callers), this patch fully replaces atomic operations with normal variable operations for continual_io_error:
1. Change variable type: atomic_t continual_io_error → s32 continual_io_error
2. Replace atomic_read with normal variable access in check function
3. Replace atomic_inc (in sdio_ops_linux.c callers) with normal increment (++)
4. Replace atomic_set (initialization) with normal assignment (= 0)

Single-thread guarantee for no race conditions:
- Linux kernel driver isolation: Each SDIO device has an independent instance, kernel serializes all IO requests for one device.
- Driver code logic: sd_read32()/sd_write8() are called by dedicated IO thread with linear flow (no concurrent calls).

Motivation: Follow kernel best practices - remove unnecessary atomic ops (memory barrier overhead) since no concurrency exists.

Signed-off-by: Changjun Zheng <guagua210311@qq.com>
---
Changes in v2:
Remove redundant atomic-related comments (per Dan Carpenter's feedback)

 drivers/staging/rtl8723bs/core/rtw_io.c           | 4 ++--
 drivers/staging/rtl8723bs/include/drv_types.h     | 3 ++-
 drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 0c450d6cd14b..c21e99b2c01c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -139,7 +139,7 @@ int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapt
  */
 int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
 {
-	int error_count = atomic_read(&dvobj->continual_io_error);
+	int error_count = dvobj->continual_io_error;
 	if (error_count > MAX_CONTINUAL_IO_ERR)
 		return true;
 
@@ -149,5 +149,5 @@ int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
 /* Set the continual_io_error of this @param dvobjprive to 0 */
 void rtw_reset_continual_io_error(struct dvobj_priv *dvobj)
 {
-	atomic_set(&dvobj->continual_io_error, 0);
+	dvobj->continual_io_error = 0;
 }
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index f86180dc350c..2fed4fcedffd 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -1,4 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+on /
 /******************************************************************************
  *
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
@@ -279,7 +280,7 @@ struct dvobj_priv {
 	u8 Queue2Pipe[HW_QUEUE_ENTRY];/* for out pipe mapping */
 
 	u8 irq_alloc;
-	atomic_t continual_io_error;
+	s32 continual_io_error;
 
 	atomic_t disable_func;
 
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
index 026fb4963d06..5501ba64f050 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
@@ -222,7 +222,7 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 			} else {
 				if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
 					padapter->bSurpriseRemoved = true;
-    				atomic_inc(&psdiodev->continual_io_error);
+				psdiodev->continual_io_error++;
 				if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
 					padapter->bSurpriseRemoved = true;
 					break;
@@ -298,7 +298,7 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
 			} else {
 				if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
 					padapter->bSurpriseRemoved = true;
-				atomic_inc(&psdiodev->continual_io_error);
+				psdiodev->continual_io_error++;
 				if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
 					padapter->bSurpriseRemoved = true;
 					break;
-- 
2.43.0

