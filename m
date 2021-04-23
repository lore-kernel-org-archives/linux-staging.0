Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CB72FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:27 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id i21-20020a05600c3555b029012eae2af5d4so1396638wmq.4
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tBXgom8pS+5mm5WMa0UlEBGsguBg4pdjqj4B4/2efgY=;
        b=o1ELdjLkxB0K+1MEa5ylb/8OmIKzDiujaVFlDr0VWM5o7BKeJZmqmrMacQm+f/6IMU
         a5f3O/MYf6MlmzKcKV2KbILfBjDjzl68m0Ih9TUt77a/ACSLlY/pxyW+MS4MnyoUI3L2
         usQ/riggv0CPr/rUKf29zlQX8NJSPztqqdsEzwxAa17EhBCoiisrwy4bn77Jh+dxfhp8
         HVMsVyGzCKrUfWXDO/kdmCGay69G+gQTNopekqxkjJdkNRLxGulDcyO1Z+HpP9Ns6aOk
         J8zB/P8ehtw5oNGucfX/0hBoZKYfI5VMw6hvOrftZqcuy+IDfmqmQdOn+HG4k0X4lnvl
         zCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tBXgom8pS+5mm5WMa0UlEBGsguBg4pdjqj4B4/2efgY=;
        b=USGN2dBEZM1dFYQqqhWQmEu0KLlmFN7P6r0D7IC5XrO/NryDC5uM+XEGfWWtBY2vJS
         UApsE5tCcQ3wlY6Xv7KIgPOPBPz3zkficfrqhsimJ/Ojh8/PMZ5eHa+aBkElo921EqJt
         lcYwqEsvc6AU5ZC9pqHoMEF70QDEcz1h9Fah2Ph3o+RkSiCw9NDXnqHJzYxt/XA4t/qM
         peW3O/ylHwv9CxLiXhThyZrvfglK0xA1iPPuk97jEFH76ValBm6Xb6WXVPMqRhMgsCFX
         hpZb+RrZd1mMmOqT7ew9XsswSIdIbDvZwj6WBbyLUYK5MFMOaPumKSC1dPk1ktBXfrvh
         KTFA==
X-Gm-Message-State: AOAM531eeAQs8ou71QNWx/KHd99E4DeK9FIV3TP9l+l1Ao5czkA4/C32
	UnG/fO0vLNAXFBww1MAXl5c=
X-Google-Smtp-Source: ABdhPJypgvPAgl87/yKUbKzFDh17oBiT8a2mmYa1S796aH8FOq8t1yz87D2lyAwDh9m7SDg472PAew==
X-Received: by 2002:a7b:c2fa:: with SMTP id e26mr6110033wmk.118.1619189966405;
        Fri, 23 Apr 2021 07:59:26 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id h63sm8275068wmh.13.2021.04.23.07.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:25 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 27/49] staging: rtl8723bs: remove debug macros related to core/rtw_security.c tracing
Date: Fri, 23 Apr 2021 16:58:18 +0200
Message-Id: <519837f8c81715e28cfb5e82981fa069dae4b10a.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macro definitions related to core/rtw_security.c
obsolete tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 --
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 7823055ed32d..43422e8ad578 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-#define  _RTW_SECURITY_C_
-
 #include <linux/crc32poly.h>
 #include <drv_types.h>
 #include <rtw_debug.h>
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index f7c2d9ac3a61..70bfe24d9e0c 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_rtl871x_security_c_		BIT(12)
 #define _module_rtl871x_eeprom_c_			BIT(13)
 #define _module_hal_init_c_		BIT(14)
 #define _module_hci_hal_init_c_		BIT(15)
@@ -31,9 +30,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTW_SECURITY_C_
-	#define	_MODULE_DEFINE_	_module_rtl871x_security_c_
-#elif defined _RTW_EEPROM_C_
+#if defined _RTW_EEPROM_C_
 	#define	_MODULE_DEFINE_	_module_rtl871x_eeprom_c_
 #elif defined _HAL_INTF_C_
 	#define	_MODULE_DEFINE_	_module_hal_init_c_
-- 
2.20.1

