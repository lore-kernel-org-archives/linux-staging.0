Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A452F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:45:19 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id zg3so24044507ejb.8
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EOZa0FsLTNmXREG+LfKtNmgMKRo0KsphLPysLx3lCcw=;
        b=hEofMGmdZrd6ahnvksswvP74ViSKmqLIZUQEPa1lnDlTNHLt2F2/IpT3qeeloq7yg3
         GsoqK/sVI3fu0IB1o13hNDcranl27tRlylmxvvumxI2OwnTPuhzWFCq/WPDqnVZBno/9
         Tzz9bawSNT9FGrvgbGLYDKRZsDwxZppzQbr9ckwSv/9YI0Vn/l+65Iyqa1B4ojUoHj7y
         Dp3DAlW8HdcV3R/ni5Ni0NXmQO91b26JfKTkDse9gefcn7Bcys2t/+zrJ9OylswWkpdR
         6KcHsB3Xicae/zyHPW9r4A2Ch0mKcNxcqzWoIGQ8+w3l9JIkHUHPieHez8AciaphzDEZ
         nImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EOZa0FsLTNmXREG+LfKtNmgMKRo0KsphLPysLx3lCcw=;
        b=Z7B25zLoS7HqGTM+KphfKTY2fKYUhAQzCUb56/V5zRmk8Xgpbdzors8LtMOlXWjyKX
         dM5zTICoBKW14Dc+U44EDS0Eq11kjrmqQpL9NTEe0zwUDyKMMqt0CtUDm6QK89lYEoRH
         NLiJpWz1XkVPig5R0HCDj6ytGZNKuyJaqWYbpJ3Wlng0S8wE4w+bQZXXadxGmsIKU61D
         u8zMsuogrpz+6yqzo1OYR4pDj/VTbbgs/Sx0ptNay2zebDJxVks4PVSb7lVN4x5joffJ
         hFnzdXLI1r66zj5MxB3p8uwFPox/17JTc+pFVAE2Z3/iegDzXnoBFh9ltqxVxTmsMAoS
         gO5g==
X-Gm-Message-State: AOAM530EDt0n85I17HBFBnu3DSwyTGFB2QV1SzdTnp0lG5pEshjO+0to
	ITeX+c9oUZUm8VjJt656GVg=
X-Google-Smtp-Source: ABdhPJwJdWmv9QFkTlhzM9QtED5UDQEjnkOfmuYZ0kr3sHMoggCl6Lqo+pfHx7lMj/o4jADjl3TxDQ==
X-Received: by 2002:a17:906:2b97:: with SMTP id m23mr4756961ejg.498.1619793918371;
        Fri, 30 Apr 2021 07:45:18 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id d1sm2138272eje.26.2021.04.30.07.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:45:18 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 43/43] staging: rtl8723bs: remove odm_debug.h header file
Date: Fri, 30 Apr 2021 16:44:13 +0200
Message-Id: <94762f39159cf25b15cb3c44641de5be6aca35ab.1619793406.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove obsolete odm_debug.h header file.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h   | 88 ---------------------
 drivers/staging/rtl8723bs/hal/odm_precomp.h |  1 -
 2 files changed, 89 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_debug.h

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
deleted file mode 100644
index 94011343f7e7..000000000000
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ /dev/null
@@ -1,88 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-
-#ifndef __ODM_DBG_H__
-#define __ODM_DBG_H__
-
-
-/*  */
-/* Define the debug levels */
-/*  */
-/* 1.	DBG_TRACE and DBG_LOUD are used for normal cases. */
-/* So that, they can help SW engineer to developed or trace states changed */
-/* and also help HW enginner to trace every operation to and from HW, */
-/* e.g IO, Tx, Rx. */
-/*  */
-/* 2.	DBG_WARNNING and DBG_SERIOUS are used for unusual or error cases, */
-/* which help us to debug SW or HW. */
-/*  */
-/*  */
-/*  */
-/* Never used in a call to ODM_RT_TRACE()! */
-/*  */
-#define ODM_DBG_OFF					1
-
-/*  */
-/* Fatal bug. */
-/* For example, Tx/Rx/IO locked up, OS hangs, memory access violation, */
-/* resource allocation failed, unexpected HW behavior, HW BUG and so on. */
-/*  */
-#define ODM_DBG_SERIOUS				2
-
-/*  */
-/* Abnormal, rare, or unexpected cases. */
-/* For example, */
-/* IRP/Packet/OID canceled, */
-/* device suprisely unremoved and so on. */
-/*  */
-#define ODM_DBG_WARNING				3
-
-/*  */
-/* Normal case with useful information about current SW or HW state. */
-/* For example, Tx/Rx descriptor to fill, Tx/Rx descriptor completed status, */
-/* SW protocol state change, dynamic mechanism state change and so on. */
-/*  */
-#define ODM_DBG_LOUD				4
-
-/*  */
-/* Normal case with detail execution flow or information. */
-/*  */
-#define ODM_DBG_TRACE				5
-
-/*  */
-/*  Define the tracing components */
-/*  */
-/*  */
-/* BB Functions */
-#define ODM_COMP_DIG				BIT0
-#define ODM_COMP_RA_MASK			BIT1
-#define ODM_COMP_DYNAMIC_TXPWR		BIT2
-#define ODM_COMP_FA_CNT				BIT3
-#define ODM_COMP_RSSI_MONITOR		BIT4
-#define ODM_COMP_CCK_PD				BIT5
-#define ODM_COMP_ANT_DIV			BIT6
-#define ODM_COMP_PWR_SAVE			BIT7
-#define ODM_COMP_PWR_TRAIN			BIT8
-#define ODM_COMP_RATE_ADAPTIVE		BIT9
-#define ODM_COMP_PATH_DIV			BIT10
-#define ODM_COMP_PSD				BIT11
-#define ODM_COMP_DYNAMIC_PRICCA		BIT12
-#define ODM_COMP_RXHP				BIT13
-#define ODM_COMP_MP					BIT14
-#define ODM_COMP_CFO_TRACKING		BIT15
-/* MAC Functions */
-#define ODM_COMP_EDCA_TURBO			BIT16
-#define ODM_COMP_EARLY_MODE			BIT17
-/* RF Functions */
-#define ODM_COMP_TX_PWR_TRACK		BIT24
-#define ODM_COMP_RX_GAIN_TRACK		BIT25
-#define ODM_COMP_CALIBRATION		BIT26
-/* Common Functions */
-#define ODM_COMP_COMMON				BIT30
-#define ODM_COMP_INIT				BIT31
-
-#endif	/*  __ODM_DBG_H__ */
diff --git a/drivers/staging/rtl8723bs/hal/odm_precomp.h b/drivers/staging/rtl8723bs/hal/odm_precomp.h
index 440a549bffc7..5041c9535e9a 100644
--- a/drivers/staging/rtl8723bs/hal/odm_precomp.h
+++ b/drivers/staging/rtl8723bs/hal/odm_precomp.h
@@ -27,7 +27,6 @@
 
 #include "odm.h"
 #include "odm_HWConfig.h"
-#include "odm_debug.h"
 #include "odm_RegDefine11N.h"
 #include "odm_EdcaTurboCheck.h"
 #include "odm_DIG.h"
-- 
2.20.1

