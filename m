Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD7E71
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:38 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id m5so486759wmf.1
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WXZjzbZRHK0jBwgvuHcL9uMISPcQ6vFSZC1gma0GKcY=;
        b=m9ejbXoq1pZSwxAy1mGCIAKw+isLFXXWAMLFd7W3QzRjylEdgeST5bhij4N3eKHMQT
         c3thpa0ftjIaDPyOKQZcv+heFI/scMkANkQsNGywWKgerk65Trq0hj5Y3A3dpsmepMJW
         x5VIcJYgtIwaGOeoEDQCqeBSN41sirIfqnTCa8kRk2vHEX1Q/PwdXnHL/0OYMf4yQOdQ
         BH3EWIrTFx3dsMael8kP1K3JKNPHKw3z+IvkxHuiJ3J6JPxnPhcfc0bkx6eZrUIz/ChR
         HtpeQeuNW9xB3xzrsLlv39f4Fq3JYJTGQqnfkQJYFP/3+0IY9hDCR3e9zZsvrwNb3JVo
         KMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WXZjzbZRHK0jBwgvuHcL9uMISPcQ6vFSZC1gma0GKcY=;
        b=QEpWnmqUvMD7Uf0S2OuH1w9kqsvUw5Pe4sfkqi7/IOEdMCWw49q97ub9grs9uWe2pS
         mQ0WIa84HnyqMvQuhJjTsXHbj+uyRhVmsNl00R/kLDo79zATud6pNz61UhsBUSLioEBa
         ZhUfGK0RavmjD99REMb/C7RJ+lHJQBr7LbunJ/k/7vMqQznH2jfN2FjE7D9181k6leYm
         Ikqoz5jCpGg6ysFiiUKw+3g0loi1ihWv6O3WMJipdvygoQ93B670M+6cfvciFJ85qsMB
         ft9ir6GYMFG11B76wssMHXVtD5RY/n0EKpWvov/Rm6Fe0wLXSyOoCo2Vm9lJXF0iBmmC
         55Mw==
X-Gm-Message-State: AOAM53075WI+1z2XIaM88TUfo9YZQ7rZULfFpWPQz0i4lmRnrQ4lvjHr
	ttaz/ZqnCOCTEeWqW71JsWc=
X-Google-Smtp-Source: ABdhPJzZPR/KeuLiEkeh29Yfx4ZhLnT0exnBNP1+ODn7DzoXlg7AaZEma+1kYJqq9lRljT+aZTw/Uw==
X-Received: by 2002:a05:600c:2141:: with SMTP id v1mr8441341wml.22.1619255017605;
        Sat, 24 Apr 2021 02:03:37 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id 3sm189593wms.30.2021.04.24.02.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:37 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 37/50] staging: rtl8723bs: remove unused macros tied to os_dep/sdio_intf.c debug
Date: Sat, 24 Apr 2021 11:02:20 +0200
Message-Id: <c6f3a9d8eb1d868c869b0e37753cf7cfe15bad91.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused macro definitions tied to
os_dep/sdio_intf.c debug.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 7 +------
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  | 2 --
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index a7f6827c282f..130cfe3d2032 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_hci_intfs_c_			BIT(20)
 #define _module_hci_ops_c_			BIT(21)
 #define _module_osdep_service_c_			BIT(22)
 #define _module_mp_			BIT(23)
@@ -23,14 +22,10 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _HCI_INTF_C_
-	#define	_MODULE_DEFINE_	_module_hci_intfs_c_
-#elif defined _HCI_OPS_C_
+#if defined _HCI_OPS_C_
 	#define	_MODULE_DEFINE_	_module_hci_ops_c_
 #elif defined _SDIO_OPS_C_
 	#define	_MODULE_DEFINE_ 1
-#elif defined _OSDEP_HCI_INTF_C_
-	#define	_MODULE_DEFINE_	_module_hci_intfs_c_
 #elif defined _OSDEP_SERVICE_C_
 	#define	_MODULE_DEFINE_	_module_osdep_service_c_
 #elif defined _HCI_OPS_OS_C_
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d2bf444117b8..5e484344e172 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-#define _HCI_INTF_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 #include <hal_btcoex.h>
-- 
2.20.1

