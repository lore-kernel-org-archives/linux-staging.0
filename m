Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71532FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:12 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id e7so39729997wrs.11
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YcuffsLTjuFNEp9yR3yPCxH/1v2srf0L4WVCdD7zdno=;
        b=PL1ktp6WwrVG9BHvzOQtMPTLtKMy9ZtV0lHFaWlDaqd+cZbwrnKaDXMEuJWJKzSS4p
         i9VhsZZEpc4A+auiLWRJ13d5CTRam9YNGVp0RCIZmF3CAaT15mQAuJVXZOWgmXGJBM7D
         bU3N79aqndm/Hnt+izuBQFEb3xVPF5lvgXsyiZag8L4ah3kSwYZizRzXr8vz+y+N+Efe
         uxJ2cL1437YOP3pfahYElcI4aeuHqkdMyOk2T/pSBDL0grGnpaw48DrQzIu29+Y6wHnU
         OUChe5LiRXMChdSHQe2vF2SwFX//tMJzjhFcxtPZZH7Eh4JXUuBYP6PERCyUIMfN62D/
         xIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YcuffsLTjuFNEp9yR3yPCxH/1v2srf0L4WVCdD7zdno=;
        b=OCfPY0YmawYJ01lecV9HuU+bszR6ib8BMsvwW41zHMTi/W5rPEpa8xaCsx1L89/ORc
         T6MjjpknHim6s0ARibaAw5CO0XezQ38mFzivOPdrW30t3GuF9MeSxjgl6L7uFPGnfyjN
         LgWmGAEedb/m1UHidypZdpXFmPy3ssgIRDZCdjsqLOXYSnbkPTw9w9L4Ic2fWuQcmFQv
         ZGqOqXE12KMXvUjzMtBN0ZaTCH0TMU/PKGV4Zno62OPSP61hyhltyPbl+hUpZN0gch8z
         vjkO0Tw3W8FYXLIz+T8IML28AicW6x1goCxcOtPoWuDdnn0JE6VRZZUtehnhMU4G5fty
         VaoQ==
X-Gm-Message-State: AOAM530wnrhirMl93LIaH6Ie+iWEa0GfMKfjp6yQXKBCk0+lNxl1Tr1R
	K8lW00t1jRTrX80u5/Mz0TA=
X-Google-Smtp-Source: ABdhPJyh/vdvhVuSdTnyUrz72NuaKjjUxoExed49o/z2Iw152YPoGpkcyGjmwvowy9nBYvSnkjDN3w==
X-Received: by 2002:a5d:47c1:: with SMTP id o1mr5251729wrc.216.1619189951569;
        Fri, 23 Apr 2021 07:59:11 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id y19sm10938803wmj.28.2021.04.23.07.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:11 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/49] staging: rtl8723bs: remove debug macros related to os_dep/mlme_linux.c tracing
Date: Fri, 23 Apr 2021 16:58:09 +0200
Message-Id: <03280c041f2476619874b281b6b5caf397cd024a.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macro definitions related to os_dep/mlme_linux.c
obsolete tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c | 4 ----
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 01d723268254..7f5b98578d60 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_mlme_osdep_c_		BIT(5)
 #define _module_rtl871x_sta_mgt_c_		BIT(6)
 #define _module_rtl871x_cmd_c_			BIT(7)
 #define _module_cmd_osdep_c_		BIT(8)
@@ -38,9 +37,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _MLME_OSDEP_C_
-	#define _MODULE_DEFINE_	_module_mlme_osdep_c_
-#elif defined _RTW_MLME_EXT_C_
+#if defined _RTW_MLME_EXT_C_
 	#define _MODULE_DEFINE_ 1
 #elif defined _RTW_STA_MGT_C_
 	#define _MODULE_DEFINE_	_module_rtl871x_sta_mgt_c_
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index 0a16752f805b..a4560ba22db1 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -4,10 +4,6 @@
  * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-
-
-#define _MLME_OSDEP_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 
-- 
2.20.1

