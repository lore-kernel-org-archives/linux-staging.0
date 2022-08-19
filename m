Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D04517FC
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 09:36:12 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id j21so2387464ejs.0
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 02:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=K+ACVRr2qvbdZdGfEXZ+98M4lRWQBPuEkPQm+EeZJtg=;
        b=LwVnULL9Zw+7/f4NjGNrJPgPmXg5EMZQSLAUtMwTeF3K0EeepVg7vrEWoUT+wLNTBm
         FHGNN4cgDIiGNvPzGXyCpFnZ8ldql2xJpapYpdZqDwDzwUMFdxwqzqMgcJpfFVlRkrSc
         C+hfRxS14IyWZLOHcoASR/0kBZnta/tNu1ksb5CAPaB4NkY62RWhNQ1jkUdGyA/qaR/7
         DvFznZyKBA7SxKU0mIgXXy7HSBl7sV/l2L5H9vVrX3Rwgl/kkFVZ+7+eem31hlTnrICk
         /twQ/tZta0RHxNerlPdHJgcbnFs8L3CvxDWocSa0hG8I7j+cVN3hUgU9fg3+3kAP5ITb
         BqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=K+ACVRr2qvbdZdGfEXZ+98M4lRWQBPuEkPQm+EeZJtg=;
        b=guxqTz70B0fiIHAB/HYXLudk4bqwboXP9pL3GvSAP0ZkOmTbMs0K2v23O/2KqeIS3u
         GeH0UJUxQeW8jPPEuU04aYfi0PuwP0t57L5xy6rS4sAVyybS64es0Q9zPc0bmY0Xv8Xp
         OWUZ6hGLKMLFMAs1zyBligkzw3uhZvnYn6uOLa9B9X5+B4Emg0wOhDUxYnAxtr9C4kpY
         M/J66eVAno/sznaLt882B9QQFUlVxbM4hnMJIkGxmxx3LP14diBqIEsX3s/5nlvzDmCS
         ftQc+UgfYv/Q/9FpB9z433xE/W25+Pv3ZoSKkguRN2a71lpBQlnszP/sfD/9cUwxgNOh
         rYVw==
X-Gm-Message-State: ACgBeo1xQwGGo+BZiwz0i72SwHMpVz2hEhTuql0n94YZmH2Xob4dcavR
	GUmGGLxFmSYGN3IvLy+Y0J0=
X-Google-Smtp-Source: AA6agR7s0/Ybnt1j6xiplIaxwHDBlDO8fVRJfTLpngqKGhjhhWMJGEHS0bQ0Gg3ba/fox3SUSc48jg==
X-Received: by 2002:a17:907:28d6:b0:731:10ff:86a6 with SMTP id en22-20020a17090728d600b0073110ff86a6mr4442173ejc.128.1660901770621;
        Fri, 19 Aug 2022 02:36:10 -0700 (PDT)
Received: from nam-dell.ucebne.fiit.stuba.sk ([147.175.148.17])
        by smtp.gmail.com with ESMTPSA id q24-20020a170906941800b00734d4bd1792sm2055929ejx.162.2022.08.19.02.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 02:36:10 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 3/3] staging: rtl8723bs: remove odm_NoiseMonitor.h and odm_NoiseMonitor.c
Date: Fri, 19 Aug 2022 11:35:37 +0200
Message-Id: <3d6124867c546368b961a30f85b56ee6c2600441.1660901124.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660901124.git.namcaov@gmail.com>
References: <cover.1660901124.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

because the content of these files is not used.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h           |  1 -
 .../staging/rtl8723bs/hal/odm_NoiseMonitor.c  | 19 -----------
 .../staging/rtl8723bs/hal/odm_NoiseMonitor.h  | 32 -------------------
 drivers/staging/rtl8723bs/hal/odm_precomp.h   |  1 -
 4 files changed, 53 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.h

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 033f22b0f394..fe9782d2d4fd 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -14,7 +14,6 @@
 #include "odm_DynamicBBPowerSaving.h"
 #include "odm_DynamicTxPower.h"
 #include "odm_CfoTracking.h"
-#include "odm_NoiseMonitor.h"
 
 #define	TP_MODE		0
 #define	RSSI_MODE		1
diff --git a/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c b/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
deleted file mode 100644
index b85b323cf5bd..000000000000
--- a/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
+++ /dev/null
@@ -1,19 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-
-#include "odm_precomp.h"
-
-/*  This function is for inband noise test utility only */
-/*  To obtain the inband noise level(dbm), do the following. */
-/*  1. disable DIG and Power Saving */
-/*  2. Set initial gain = 0x1a */
-/*  3. Stop updating idle time pwer report (for driver read) */
-/* - 0x80c[25] */
-
-#define Valid_Min				-35
-#define Valid_Max			10
-#define ValidCnt				5
diff --git a/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.h b/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.h
deleted file mode 100644
index 01c5c524d4e0..000000000000
--- a/drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.h
+++ /dev/null
@@ -1,32 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- *****************************************************************************/
-#ifndef	__ODMNOISEMONITOR_H__
-#define __ODMNOISEMONITOR_H__
-
-#define	ODM_MAX_CHANNEL_NUM					38/* 14+24 */
-struct noise_level {
-	/* u8 value_a, value_b; */
-	u8 value[MAX_RF_PATH];
-	/* s8 sval_a, sval_b; */
-	s8 sval[MAX_RF_PATH];
-
-	/* s32 noise_a = 0, noise_b = 0, sum_a = 0, sum_b = 0; */
-	/* s32 noise[ODM_RF_PATH_MAX]; */
-	s32 sum[MAX_RF_PATH];
-	/* u8 valid_cnt_a = 0, valid_cnt_b = 0, */
-	u8 valid[MAX_RF_PATH];
-	u8 valid_cnt[MAX_RF_PATH];
-
-};
-
-
-struct odm_noise_monitor {
-	s8 noise[MAX_RF_PATH];
-	s16 noise_all;
-};
-
-#endif
diff --git a/drivers/staging/rtl8723bs/hal/odm_precomp.h b/drivers/staging/rtl8723bs/hal/odm_precomp.h
index edce506022a5..2987857a8761 100644
--- a/drivers/staging/rtl8723bs/hal/odm_precomp.h
+++ b/drivers/staging/rtl8723bs/hal/odm_precomp.h
@@ -33,7 +33,6 @@
 #include "odm_DynamicBBPowerSaving.h"
 #include "odm_DynamicTxPower.h"
 #include "odm_CfoTracking.h"
-#include "odm_NoiseMonitor.h"
 #include "HalPhyRf.h"
 #include "HalPhyRf_8723B.h"/* for IQK, LCK, Power-tracking */
 #include "rtl8723b_hal.h"
-- 
2.25.1

