Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804732FA4
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:17 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id s7so48627001wru.6
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iUF9VHzbVOwedrHS/nllSjnFr9sMj9nVtpSdM/jLSwQ=;
        b=ZNFnBbt+uKWhgxr370dwwOTk385HJbpmeBbTrx7JfXT9L5unIKAI6eN9QGIW8/W/Vq
         /26i36WkQOcBBpz/rIsyMYbo297bQEKgjhV6DbeLqkuMqtP3JyKHiOggVZCqZW3uWNO7
         IxdDa30GrEjdd4I/rkFVXSMscfv53kzy1zDELu045mBomixVGV5jo4EGlFluX9jn16LY
         EYI+/Tw9D4EY1Hc7igSg5k365KiPekppuAxNinvQTFD1v6my+jmVA3cQj9/744r2RLH5
         LgrzB9dMdUsrlsmxFjtChDS3fpo7CnZ9u6u+VREz4jQzCo0xTtZ1syEkfInP/Iq59Vdg
         9EtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iUF9VHzbVOwedrHS/nllSjnFr9sMj9nVtpSdM/jLSwQ=;
        b=TdIuzbIBXynVP0C8a15hAoWQu46EDcMlgdFtkSZnnvEMtlVb4+syvf37yPEXFmoN7b
         pRsQaVftFCi9B85Bjm96oII4vLG9Mh8DT+fSo36weVWLQQiWz+Xv3DwixyDUo2UUWVCd
         vh60Xy+nx6oelgSTzenvfNP1shNw+pdZ5ArMluOYOfjTv8iNuFLmIYLd/2KxcmXjtAki
         4okLkpRyCKMuM6KScf+ku9HrRhBwwMIvIqSPFb08/YlHLfqfuywwTUt/J9T1vcPkS2zP
         dx5MsWx13zvMos983sCSwrpvfqYEh4YNg07Jcp44Mx5V/Spaik95RtQBirNEDHfY7JLs
         M1Xg==
X-Gm-Message-State: AOAM532lEWBAEIBGaJ5zTJOYFu4IPgcIVp2P2GcVe1ZaWuekz5Bbne8c
	5+2LmggcUDPVFtcIhxw08xw=
X-Google-Smtp-Source: ABdhPJylMZVwmZNoykj2Py/sgjTmmcL6pkpXihDsqwBzT85Kr6KV6QZA0SUsM0Pup0TQoFjewkzWPA==
X-Received: by 2002:a5d:400d:: with SMTP id n13mr5196237wrp.372.1619189956200;
        Fri, 23 Apr 2021 07:59:16 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id i15sm9888868wru.12.2021.04.23.07.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:15 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 21/49] staging: rtl8723bs: remove debug macros related to core/rtw_sta_mgt.c tracing
Date: Fri, 23 Apr 2021 16:58:12 +0200
Message-Id: <28234444bf984c87bd2f4c535687f5d277fc6c4b.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macro definitions related to core/rtw_sta_mgt.c
obsolete tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  | 2 --
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 85663182b388..c056a0ada060 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-#define _RTW_STA_MGT_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index d51e22ee1328..76756f6aac99 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_rtl871x_sta_mgt_c_		BIT(6)
 #define _module_rtl871x_cmd_c_			BIT(7)
 #define _module_cmd_osdep_c_		BIT(8)
 #define _module_rtl871x_io_c_				BIT(9)
@@ -37,9 +36,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTW_STA_MGT_C_
-	#define _MODULE_DEFINE_	_module_rtl871x_sta_mgt_c_
-#elif defined _RTW_CMD_C_
+#if defined _RTW_CMD_C_
 	#define _MODULE_DEFINE_	_module_rtl871x_cmd_c_
 #elif defined _CMD_OSDEP_C_
 	#define _MODULE_DEFINE_	_module_cmd_osdep_c_
-- 
2.20.1

