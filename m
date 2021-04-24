Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A1371
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:28 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id d200-20020a1c1dd10000b02901384767d4a5so2423747wmd.3
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tWR3xIwcvAYs30wacpInm8yfy/J1zl7gAnK+J7z1umw=;
        b=FrLmIko4u/h4XklYmo7GpfDy74QeZ9NMq7ucSWGXFl3yYSqrHO07E2TtxyeLXE372X
         IR9NfU7UeuwQwFHedydEiU/lYW+PsQpJkqjASupjgdyneUJSn4KT/+C+ESJ4UMHe925V
         WGZA5Sq4cUuNcWk0VgcoYzi0D0W52irE3nNHqYVW9EwuLPfoznsTKQSzdbGi0gtTbzXT
         +kIZ1Y69isJ7pRjP0H6fE/1SHo6mEvMEXhAC7anzAvnPCHEcd+2hnn1QrpQQwFxDX/WQ
         GntA5/s8itpk+yvSxi3lNDJrM14bMsVvKOFGN1bVY1tFKZUtWHlegLc1t3xIkc9FP6/c
         B8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tWR3xIwcvAYs30wacpInm8yfy/J1zl7gAnK+J7z1umw=;
        b=Xm5ZV1CYfEiK9wm95KTJYpCy2RmFUqG8saTllcQ0L9fL/wp8xfr1RFEVSOn1MbUgYO
         fIHEbIAVtFvyoNs3jBfjNjGkLO0wkMUZnejO+GtP3ZlIFGMk6Gx5G8iUDym6TOqSmLvD
         BF3+VgWvR4z3si/FyyYnv0nijWkpyFVpKfuhfJOfAsLgBGlZRCAPXe51RxHteTAWAGZG
         43yqXR/mttqSQNIbIqKWtayqvXzaZQJODWIwEbEyw7pzcOoFJUiYu6xgAAXZphJ8UPxZ
         6HlfzQq0458zT+Gt9OHFdsXhza3w8takOu7njlBvd0bXIyOd2nw/3QRulHIGFwA184po
         AfeA==
X-Gm-Message-State: AOAM531v59uuYdk82ZooFclTggZlCLfNz6CbF3McW70YB8a7fBu9cWyG
	vPqiMAIgguGizRMNEeUB7T4=
X-Google-Smtp-Source: ABdhPJwa3WxpHpOPxjsqiw/ltJ8eaiTjnvTKrQdG4ndsfC2gInsEJfWBlZS5xv4Y0rkQBAOgf+tIQQ==
X-Received: by 2002:a1c:771a:: with SMTP id t26mr8542597wmi.96.1619255007581;
        Sat, 24 Apr 2021 02:03:27 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id s21sm10143173wmc.10.2021.04.24.02.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:27 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 31/50] staging: rtl8723bs: remove debug macros related to hal/sdio_halinit.c tracing
Date: Sat, 24 Apr 2021 11:02:14 +0200
Message-Id: <0de5a9cd0c70f1a5609320e545206376a7cf4498.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macro definitions related to hal/sdio_halinit.c
obsolete tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 2 --
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index abd90026a8c7..7c52c90d1566 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-#define _SDIO_HALINIT_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 #include <rtl8723b_hal.h>
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 4da881e3a0c0..4146acb1cbb2 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_hci_hal_init_c_		BIT(15)
 #define _module_rtl871x_ioctl_c_		BIT(16)
 #define _module_rtl871x_ioctl_set_c_		BIT(17)
 #define _module_rtl871x_ioctl_query_c_	BIT(18)
@@ -28,9 +27,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if (defined _HCI_HAL_INIT_C_) || (defined _SDIO_HALINIT_C_)
-	#define	_MODULE_DEFINE_	_module_hci_hal_init_c_
-#elif defined _RTL871X_IOCTL_C_
+#if defined _RTL871X_IOCTL_C_
 	#define	_MODULE_DEFINE_	_module_rtl871x_ioctl_c_
 #elif defined _RTL871X_IOCTL_SET_C_
 	#define	_MODULE_DEFINE_	_module_rtl871x_ioctl_set_c_
-- 
2.20.1

