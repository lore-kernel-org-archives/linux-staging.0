Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2292A2DCBF8
	for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 22:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179905; cv=none; b=gxztwnOdfETumvL7FwN6gaOozq9DBvtg9oj3r8Yxx2zcIXeypsZVOTTF1uVdOuVeTwQk6H8CFZ1e/cltzqJ1mDmULYfT4x6BhgWYOIxBAxtg4zNdgHz7bGcMHqyTonu8SBl70eeZq/ItyyZzoOwMm+opisHAmkdSvInBu8Q+7Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179905; c=relaxed/simple;
	bh=irRS0E0WNpV0JJa4KmvA6GS2V1l8IcIewGxGelaGXw4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k2HwTQb4+ZURK/j2MwRmL5EJuF7lVw7KU9yWsewddGqQs5EgD3+/Y4+GPzIgAo24JA/pcpe8SGesrIsRAC6qR+T3bgVQdDkO6ua7hZBVrBOEC4WN+0JhXl7ws61Bk4ICNNPiMs34AxUFtwpcZOvjXoyFO0WXd+tuaJElh/dp9OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cd4iJqsT; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cd4iJqsT"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-1378943cd4aso5820936c88.0
        for <linux-staging@lists.linux.dev>; Sat, 30 May 2026 15:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780179902; x=1780784702; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=16XrvrNvVvEtWVpkr/gib/lTKnAIl2lm3W0ZrZwaDCw=;
        b=cd4iJqsTo5bG0feVTM0VObLz7bLun0CSEOv8H+oROpYV74pLdwi/W+QUtt1sfLkATB
         rm0ktHpXNrDkRfXs29c3S8KPl2Or6rb2VAY1uajnjUpgnuOC+D3vVnGkI9FJvP0xL8aV
         FShx15sKOfAWM5sS+m3kAIg2WxdptDT+vnfkURVwmU6WyT83rG0KP3GrKZB/sV98bAHf
         OUR/SPK8gPI2aWaY3Ynf9noeoQHu9dE8Y/4sB5qpHydGHcw6TsHRdkTRJcz4fXDWIntf
         XxRhZT1r4EaM6UzTQlEMBrq4Y4li0XbUxPGgIED4IEiMWZKNkmDAJ0VJPOqRRrdX+Wm5
         gRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179902; x=1780784702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16XrvrNvVvEtWVpkr/gib/lTKnAIl2lm3W0ZrZwaDCw=;
        b=TweGK9gMjD0vFfap9ACk9XwM2mTKQdJ0sKhHxvBUfz4fMvY+i2pHa6R9fwB3gXGuin
         jXKaRJEqxOp2H8HJY7sDKdo2fVEzQCLADsO50ljlGIK8HPsv3I2Myg5/pBsqkFHn7KuF
         89S/r9/BWoDUwxKimQQlZudJgM8X8GWPwZxpNtBFt0Ayo17NFjqou4nbOdzDd50u8IuC
         I1KbyPLxRPSIsXToKHgWKhB7SMbqVYK2lypReuwtmCJOKyYym/Dd+1VN9X9uEfEWn4Fw
         8GLnXiPEMBNVn1A743Vlhto4nOlZj6wd103hx9CwT+WSRT7nax2m77SHSamK+lK8u2pf
         zGoA==
X-Forwarded-Encrypted: i=1; AFNElJ9cRYjN+twUIRbVIGrKv5pg+4/nxMNoidKmIuvQimWa9cSFAGeQWUxnpLyk0M1Zx28Dir9KTMVbJ//6broO@lists.linux.dev
X-Gm-Message-State: AOJu0YzrsBXpXx51zwFS7nbOBs+6ajazSlRzazEhQfoZjSN4oFzxe9Qx
	Ok6GiGKXiarEGvMU0r/dC1fPiHgU6zVCRVsyKBodJWbD/m3isZ3k3BfT
X-Gm-Gg: Acq92OFt9btSNKniBdezbT6EDh/GhGZP6IP6TbPEBFECc6SkTw7UmA9xsr7q7oyn6iZ
	jUMFWiglee8bTLGaWvEJl8RmFuA8PaIhQSKj76pj8foJ/ExrgxZRrdeeR5nX97ENwi1aiaqR5lt
	uQuIWQGekjfGBqky3b68KyA7JNDGpjqDJs/EDEZy41kHe8wiyLwRshQeuBqyiJE2uFRY6HbPPUZ
	i/pRWQU36pFChRBm4iiJR4YbCwANgXojDthwwAXeW3MPiUbg+GVSWJ618Hob25enwShvBpjSGNf
	tjDkehmlGUVN99W/gI+NIuGFxkJ6M6YDQot+3IJ4RuXenEt/d14mwbwYV3pCYdod3HaUWua0Hlw
	n4Cz/2hVywtrBLAwvdcKUOQju+Vwtx1IlMVEx2mcGTvL1+zm1R8eKJmDv6u6ui4nN4xTNVh+2YQ
	mQtCYT8ymeROzdVg7GKagl0OLeJywKLkQVza2VA1NrfhHmu55S5OTlTCHuj50wZlZJLg==
X-Received: by 2002:a05:7022:11f:b0:134:d708:1a24 with SMTP id a92af1059eb24-137d412366amr2418768c88.17.1780179902065;
        Sat, 30 May 2026 15:25:02 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3d8f839sm3558661c88.15.2026.05.30.15.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:25:01 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: sm750fb: remove duplicate init_status structure
Date: Sat, 30 May 2026 22:24:32 +0000
Message-Id: <20260530222432.4303-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct init_status duplicates struct initchip_param and is only used
within the sm750fb driver.

Replace the remaining users of struct init_status with
struct initchip_param, remove the duplicate structure and eliminate
the unnecessary cast in hw_sm750_inithw().

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    |  8 ++++----
 drivers/staging/sm750fb/sm750.h    | 12 ++----------
 drivers/staging/sm750fb/sm750_hw.c | 16 ++++++++--------
 3 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c..5986dbef67c0 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -844,11 +844,11 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 
 	swap = 0;
 
-	sm750_dev->init_parm.chip_clk = 0;
-	sm750_dev->init_parm.mem_clk = 0;
-	sm750_dev->init_parm.master_clk = 0;
+	sm750_dev->init_parm.chip_clock = 0;
+	sm750_dev->init_parm.mem_clock = 0;
+	sm750_dev->init_parm.master_clock = 0;
 	sm750_dev->init_parm.power_mode = 0;
-	sm750_dev->init_parm.setAllEngOff = 0;
+	sm750_dev->init_parm.set_all_eng_off = 0;
 	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index d2c522e67f26..81fbf32865c3 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef LYNXDRV_H_
 #define LYNXDRV_H_
+#include "ddk750_chip.h"
 
 #define FB_ACCEL_SMI 0xab
 
@@ -38,15 +39,6 @@ enum sm750_path {
 	sm750_pnc = 3,	/* panel and crt */
 };
 
-struct init_status {
-	ushort power_mode;
-	/* below three clocks are in unit of MHZ*/
-	ushort chip_clk;
-	ushort mem_clk;
-	ushort master_clk;
-	ushort setAllEngOff;
-	ushort reset_memory;
-};
 
 struct lynx_accel {
 	/* base virtual address of DPR registers */
@@ -102,7 +94,7 @@ struct sm750_dev {
 	/* locks*/
 	spinlock_t slock;
 
-	struct init_status init_parm;
+	struct initchip_param init_parm;
 	enum sm750_pnltype pnltype;
 	enum sm750_dataflow dataflow;
 	int nocrt;
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 34a837fb4b64..54c1b241ae6e 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -66,20 +66,20 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 
 int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 {
-	struct init_status *parm;
+	struct initchip_param *parm;
 
 	parm = &sm750_dev->init_parm;
-	if (parm->chip_clk == 0)
-		parm->chip_clk = (sm750_get_chip_type() == SM750LE) ?
+	if (parm->chip_clock == 0)
+		parm->chip_clock = (sm750_get_chip_type() == SM750LE) ?
 					       DEFAULT_SM750LE_CHIP_CLOCK :
 					       DEFAULT_SM750_CHIP_CLOCK;
 
-	if (parm->mem_clk == 0)
-		parm->mem_clk = parm->chip_clk;
-	if (parm->master_clk == 0)
-		parm->master_clk = parm->chip_clk / 3;
+	if (parm->mem_clock == 0)
+		parm->mem_clock = parm->chip_clock;
+	if (parm->master_clock == 0)
+		parm->master_clock = parm->chip_clock / 3;
 
-	ddk750_init_hw((struct initchip_param *)&sm750_dev->init_parm);
+	ddk750_init_hw(&sm750_dev->init_parm);
 	/* for sm718, open pci burst */
 	if (sm750_dev->devid == 0x718) {
 		poke32(SYSTEM_CTRL,
-- 
2.34.1

