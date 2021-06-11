Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E7D2FB9
	for <linux-staging@lists.linux.dev>; Fri, 11 Jun 2021 00:25:15 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id m18so4135106wrv.2
        for <linux-staging@lists.linux.dev>; Thu, 10 Jun 2021 17:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Uj6zxxcZkeKHjtwD505V5xcj+v/aiATR1kOB3b2LnBg=;
        b=VIu2LfcUjC8C1LxXZi86Eu5CKW9N7IckFWoLszBNNbSMgCtLsJOdWKwhi0JauOh9gu
         nj/xNqrWu5tzmCzYlkEEW6I5kWngBEl1Juei9zRNDgm4GyzCAVCJNuiBKWZLZNUfKMcD
         1f+xJl4P+5ZPrRbbF0CTO2xtRrPutj/zAhNZ5YaIL8G53UQOtXCX70zgGm7GKtVa0RiX
         WTk8EWXPYm272a3yrgIEgt4PxB45pfceN4DOqnqLI7ujj3CmFPWmUCsWfqD77dNaWRtP
         ZaDtSm55Wbz2Auv3FFerpYRJ9NlFbUm9w3D3gHV5HnknZC0si0rP3rw6tmJpnSpICE3E
         S1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uj6zxxcZkeKHjtwD505V5xcj+v/aiATR1kOB3b2LnBg=;
        b=i1W2yScrX0s+8PExLWs5Vtzgx+4LyAQb2AlWXxykANjdOtJp3eoDcrjl+Ag6Y81m9A
         4DL+CdaGTXnUtcUWBFGyWnCV2ibN9AQKyz+8qecZjqBH5rpPCv+kvaN5ZkyACyAXorxI
         sfTxHOqZAXsuLXtzsNRnxxEnXcRsuDfbUd+ez/fEOyLGZTvVPe9DQgTbKFFEFf+N9Y7X
         rd5OvPaxKYWUpFU9tlnzDDGD9Ph1aaEpUBqOwUpHwLqt8I9ndaFO9g9cWzZpyDUKkiE+
         O+OQOPH7LfRNcZcvYQr0IVikUL14wwYDuZn0JTizG2eE/WtOyxeo2HSn9gLmcCiO3uRV
         14lQ==
X-Gm-Message-State: AOAM531Z1ncaju93gv+HP3DTJLlHZmGzVV7Dig7TZ35+mhROnMi0tL3R
	PhGkN55mc8DYj4pcufUmtVvf6JcOchSgySvl
X-Google-Smtp-Source: ABdhPJwNbmivXMjTHNVauHu69n+AjQ1nnDItlkNu55v/tCRdpdypOwIWgQo/Vs/E3pfnmwVKbZoxXA==
X-Received: by 2002:adf:ed8d:: with SMTP id c13mr985563wro.164.1623371114479;
        Thu, 10 Jun 2021 17:25:14 -0700 (PDT)
Received: from localhost.localdomain (2.0.5.1.1.6.3.8.5.c.c.3.f.b.d.3.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16:0:3dbf:3cc5:8361:1502])
        by smtp.gmail.com with ESMTPSA id c2sm11386189wmf.24.2021.06.10.17.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 17:25:14 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	kaixuxia@tencent.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	liushixin2@huawei.com,
	unixbhaskar@gmail.com,
	gustavoars@kernel.org,
	martin@kaiser.cx,
	bkkarthik@pesu.pes.edu,
	dan.carpenter@oracle.com
Subject: [PATCH 6/6] staging: rtl8188eu: remove include/odm_debug.h
Date: Fri, 11 Jun 2021 01:25:04 +0100
Message-Id: <20210611002504.166405-7-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210611002504.166405-6-phil@philpotter.co.uk>
References: <20210611002504.166405-1-phil@philpotter.co.uk>
 <20210611002504.166405-2-phil@philpotter.co.uk>
 <20210611002504.166405-3-phil@philpotter.co.uk>
 <20210611002504.166405-4-phil@philpotter.co.uk>
 <20210611002504.166405-5-phil@philpotter.co.uk>
 <20210611002504.166405-6-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove include/odm_debug.h header, and its inclusion within
include/odm_precomp.h, as there are now no users of it.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/include/odm_debug.h | 83 -------------------
 .../staging/rtl8188eu/include/odm_precomp.h   |  1 -
 2 files changed, 84 deletions(-)
 delete mode 100644 drivers/staging/rtl8188eu/include/odm_debug.h

diff --git a/drivers/staging/rtl8188eu/include/odm_debug.h b/drivers/staging/rtl8188eu/include/odm_debug.h
deleted file mode 100644
index 3c576a029c94..000000000000
--- a/drivers/staging/rtl8188eu/include/odm_debug.h
+++ /dev/null
@@ -1,83 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-
-#ifndef	__ODM_DBG_H__
-#define __ODM_DBG_H__
-
-/*  */
-/*	Define the debug levels */
-/*  */
-/*	1. DBG_TRACE and DBG_LOUD are used for normal cases. */
-/*	They can help SW engineer to develop or trace states changed */
-/*	and also help HW enginner to trace every operation to and from HW, */
-/*	e.g IO, Tx, Rx. */
-/*  */
-/*	2. DBG_WARNNING and DBG_SERIOUS are used for unusual or error cases, */
-/*	which help us to debug SW or HW. */
-
-/*	Never used in a call to ODM_RT_TRACE()! */
-#define ODM_DBG_OFF				1
-
-/*	Fatal bug. */
-/*	For example, Tx/Rx/IO locked up, OS hangs, memory access violation, */
-/*	resource allocation failed, unexpected HW behavior, HW BUG and so on. */
-#define ODM_DBG_SERIOUS				2
-
-/*	Abnormal, rare, or unexpected cases. */
-/*	For example, IRP/Packet/OID canceled, device suprisely unremoved and so on. */
-#define ODM_DBG_WARNING				3
-
-/*	Normal case with useful information about current SW or HW state. */
-/*	For example, Tx/Rx descriptor to fill, Tx/Rx descr. completed status, */
-/*	SW protocol state change, dynamic mechanism state change and so on. */
-/*  */
-#define ODM_DBG_LOUD					4
-
-/*	Normal case with detail execution flow or information. */
-#define ODM_DBG_TRACE					5
-
-/*  Define the tracing components */
-/* BB Functions */
-#define ODM_COMP_DIG					BIT(0)
-#define ODM_COMP_RA_MASK				BIT(1)
-#define ODM_COMP_DYNAMIC_TXPWR				BIT(2)
-#define ODM_COMP_FA_CNT					BIT(3)
-#define ODM_COMP_RSSI_MONITOR				BIT(4)
-#define ODM_COMP_CCK_PD					BIT(5)
-#define ODM_COMP_ANT_DIV				BIT(6)
-#define ODM_COMP_PWR_SAVE				BIT(7)
-#define ODM_COMP_PWR_TRA				BIT(8)
-#define ODM_COMP_RATE_ADAPTIVE				BIT(9)
-#define ODM_COMP_PATH_DIV				BIT(10)
-#define ODM_COMP_PSD					BIT(11)
-#define ODM_COMP_DYNAMIC_PRICCA				BIT(12)
-#define ODM_COMP_RXHP					BIT(13)
-/* MAC Functions */
-#define ODM_COMP_EDCA_TURBO				BIT(16)
-#define ODM_COMP_EARLY_MODE				BIT(17)
-/* RF Functions */
-#define ODM_COMP_TX_PWR_TRACK				BIT(24)
-#define ODM_COMP_RX_GAIN_TRACK				BIT(25)
-#define ODM_COMP_CALIBRATION				BIT(26)
-/* Common Functions */
-#define ODM_COMP_COMMON					BIT(30)
-#define ODM_COMP_INIT					BIT(31)
-
-/*------------------------Export Marco Definition---------------------------*/
-#define RT_PRINTK(fmt, args...)				\
-	pr_info("%s(): " fmt, __func__, ## args);
-
-#define ODM_RT_TRACE(pDM_Odm, comp, level, fmt)				\
-	if (((comp) & pDM_Odm->DebugComponents) &&			\
-	    (level <= pDM_Odm->DebugLevel)) {				\
-		pr_info("[ODM-8188E] ");				\
-		RT_PRINTK fmt;						\
-	}
-
-void ODM_InitDebugSetting(struct odm_dm_struct *pDM_Odm);
-
-#endif	/*  __ODM_DBG_H__ */
diff --git a/drivers/staging/rtl8188eu/include/odm_precomp.h b/drivers/staging/rtl8188eu/include/odm_precomp.h
index ef1afc83f9ac..eb2b8b613aad 100644
--- a/drivers/staging/rtl8188eu/include/odm_precomp.h
+++ b/drivers/staging/rtl8188eu/include/odm_precomp.h
@@ -23,7 +23,6 @@
 
 #include "odm.h"
 #include "odm_hwconfig.h"
-#include "odm_debug.h"
 #include "phydm_regdefine11n.h"
 
 #include "hal8188e_rate_adaptive.h" /* for RA,Power training */
-- 
2.30.2

