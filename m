Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BD671
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:22 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id o21-20020a1c4d150000b029012e52898006so2420748wmh.0
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gr+K/KD3N327fp7eZydf22I4/DF15PNcSVC+sZKAZL8=;
        b=O9klKUKNlRIXZRIZHzMBqxii3KZjwa5mmYjWhvA2ki2mfuH+Faeeexi7aHbJB5VMCj
         C4+PCRJbwcWO6+M+xrQYuFtoQe/vml7f/MsaaHIDo1QSNAkWpLVEB//K6YidB3ci852i
         DachZvJwlHQfmpOmfzHi3tGhNpo51YU03ryw5/OmKtxqyKGfujhePmNSHk2Y+lBQ1yjZ
         Jwjrt3Ss5m0ZCoLs07jAQy1Kwby517efoBiOjozn4GDL24Xnx0PT7BVGQ6Eob9pSoq5X
         aIXGt39lAGf4L/NvPKQ1JXvS/t13772dpGzVMJ95kl9JehxQ3eBm9P9xsyRgmUi4WUI4
         LJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gr+K/KD3N327fp7eZydf22I4/DF15PNcSVC+sZKAZL8=;
        b=RUd8Gg9y8wfgNOkKtRpythOdkC2IkN6BYsJhTb91K3n/7Z3JfXT5joiMQjizc2MbdZ
         AIWGqDoKMtz6vsFN/djHMoMjXoAb2JrIcylmjytceoYFxOgQdHjZQxz8nD0QGEbnea0J
         oMLm3foMOQQC9DccGkqovHJZ4QfQNscJlNgwGgf6Ad1Rs3OPNEFqwSa1elMm/mcZvgOr
         R/vCtvFOQ8SYeYF1BGcxMnaDflXGEBTGPKGFkLIc7PQTZ+VuM6+ewwfhs+76pN8F/O2V
         4IIViOZz8zLckWc3Uq+xgrJPxzBmyeXtuOl2Mxpv70YsiuRHcxFB8iLAY6mL9S80C4XE
         7zOQ==
X-Gm-Message-State: AOAM532+eizzbI1sI+UIDtSHQSXyDBmdAvhUtu10Xg7Hltj689N5MrIP
	ZNSrCcYDSicgq3b2WD66BgA=
X-Google-Smtp-Source: ABdhPJxQMtBGDhgEs3OBogZ13RSgKB8bgogBYA2mvgzykBKJV4sfYuygirWv0R1WzBVTRh8kW2w0fw==
X-Received: by 2002:a05:600c:228a:: with SMTP id 10mr8633692wmf.115.1619255000631;
        Sat, 24 Apr 2021 02:03:20 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id l25sm10377238wmi.17.2021.04.24.02.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:20 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 27/50] staging: rtl8723bs: remove debug macros related to os_dep/os_intfs.c tracing
Date: Sat, 24 Apr 2021 11:02:10 +0200
Message-Id: <53110c205451e641f8e24c07d36fe6cc5d087e60.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macro definitions related to os_dep/os_intfs.c
obsolete tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 2 --
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 470edb0b655b..f7c2d9ac3a61 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_os_intfs_c_			BIT(11)
 #define _module_rtl871x_security_c_		BIT(12)
 #define _module_rtl871x_eeprom_c_			BIT(13)
 #define _module_hal_init_c_		BIT(14)
@@ -32,9 +31,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _OS_INTFS_C_
-	#define	_MODULE_DEFINE_	_module_os_intfs_c_
-#elif defined _RTW_SECURITY_C_
+#if defined _RTW_SECURITY_C_
 	#define	_MODULE_DEFINE_	_module_rtl871x_security_c_
 #elif defined _RTW_EEPROM_C_
 	#define	_MODULE_DEFINE_	_module_rtl871x_eeprom_c_
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 160f624612c7..6ac78a9ae615 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-#define _OS_INTFS_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 #include <hal_data.h>
-- 
2.20.1

