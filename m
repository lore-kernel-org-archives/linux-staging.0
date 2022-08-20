Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E1F3200
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:35:52 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id u15so5619789ejt.6
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=r+EQNFTk8Lbnc1FR6eRAVAKKKC2AwPwoVIbcVgIDipA=;
        b=d1NgQhPjE7DDQk5QK7c8v09vXAxNCjSXUm7ZxnAtOPuZRssdpjBz1dlgofsjkaSP/2
         GAZomF0SoUQQ+xkujWcneC4H7jCjMb7Joro80b99LalH+/13nedJerK2vqqJMgDJuab3
         1EYzgceQvwDC9V+BUl41mP8KACfSWElk6zFkGvZCKVVIZGE9Bwpqa1VSlnhX/oUTR5nE
         9QAKTc5N+exONlvOUQ6rpjcvpHl7tM0AqzF7bYv64xyL4JGaOvPGfu375jix+XAWD+2F
         /+rXwU0hcw/i6YiFk4J+BanL6YQWl7UKO8W6OhmFFyQalZE693Dv4y6jgihrOZG2LJV1
         2fMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=r+EQNFTk8Lbnc1FR6eRAVAKKKC2AwPwoVIbcVgIDipA=;
        b=tzgaay+1Vt6bM+R1geKkZIaM0sGT6x33iIs6StIGA/0Dgj7WfPYijnwHDXfHz37c32
         jD8YGttlYtBNYwj0qqB0KNqSA72zHJZyCVF3BKDaO+2wVcOsikXD4Ps9sglLA/2+s73E
         NcSlCNdyoNQmhxZ69hGMeBQRMcmicixcxIMFVD+Gey0DRJoUCb179W2E9Sn7KAVWCa1s
         hRyc+eE4+lvF3L9HTWxISBbIEYuMLooywSfXjUfZlGWvrHWuaEy/Zy3kFPw1y1rx9mdC
         S6wZ+mf1Dw/jy5il84RwjG3PdodZqYH/kaCUOckFIIfhph3Y5deKfoOQaYQVQqY0TuXh
         Qt5Q==
X-Gm-Message-State: ACgBeo211k+5fSRxQ6rJ9HAIb264e+n9zd+Ms+QsSmT08DJlwFjgfcyz
	+Toyx0QDNVXYJGoeXLcZqPY=
X-Google-Smtp-Source: AA6agR7oFoYs6H5pHMLGB0k6KNtRUAq+bJ7OsWhy86kfFs/WdVAWq1E/Rm8pqWcV7AY34o6hfNeiWQ==
X-Received: by 2002:a17:907:a068:b0:73d:5d21:7ed3 with SMTP id ia8-20020a170907a06800b0073d5d217ed3mr3503566ejc.685.1661020550482;
        Sat, 20 Aug 2022 11:35:50 -0700 (PDT)
Received: from nam-dell.vm.stuba.sk ([147.175.88.220])
        by smtp.gmail.com with ESMTPSA id b15-20020a1709063f8f00b007336c3f05bdsm3956796ejj.178.2022.08.20.11.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:35:50 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: namcaov@gmail.com
Cc: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	lkp@intel.com
Subject: [PATCH v3 3/3] staging: rtl8723bs: remove odm_NoiseMonitor.h and odm_NoiseMonitor.c
Date: Sat, 20 Aug 2022 20:34:51 +0200
Message-Id: <6f51a3531ffe60650972bd9f288570db55e3e0ec.1661020250.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <46d73e331bae2192a328f6691763f39ea6c18b08.1661020250.git.namcaov@gmail.com>
References: <cover.1661017377.git.namcaov@gmail.com>
 <46d73e331bae2192a328f6691763f39ea6c18b08.1661020250.git.namcaov@gmail.com>
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
 drivers/staging/rtl8723bs/Makefile            |  1 -
 drivers/staging/rtl8723bs/hal/odm.h           |  1 -
 .../staging/rtl8723bs/hal/odm_NoiseMonitor.c  | 19 -----------
 .../staging/rtl8723bs/hal/odm_NoiseMonitor.h  | 32 -------------------
 drivers/staging/rtl8723bs/hal/odm_precomp.h   |  1 -
 5 files changed, 54 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.h

diff --git a/drivers/staging/rtl8723bs/Makefile b/drivers/staging/rtl8723bs/Makefile
index 159ca1b9016b..bc7ff1dd14f9 100644
--- a/drivers/staging/rtl8723bs/Makefile
+++ b/drivers/staging/rtl8723bs/Makefile
@@ -33,7 +33,6 @@ r8723bs-y = \
 		hal/odm_DynamicTxPower.o \
 		hal/odm_EdcaTurboCheck.o \
 		hal/odm_HWConfig.o \
-		hal/odm_NoiseMonitor.o \
 		hal/odm_RegConfig8723B.o \
 		hal/rtl8723b_cmd.o \
 		hal/rtl8723b_dm.o \
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

