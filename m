Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7A171
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:23 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id p6so44011459wrn.9
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tBXgom8pS+5mm5WMa0UlEBGsguBg4pdjqj4B4/2efgY=;
        b=Ns8IFQzH3zfS8MIvaVRzdu1UtGetpDx4PKKpJQdjmagKLDXug706UAmonXB64Q1tn5
         92MBMlt/hicXnWS1vmiG13su7FdoP3y4hCiYtiCQe8k8TBuaIGKD5TbUcxT1buY09jYc
         mgzVf9JtkyOVTLQpq+JVEaXe2VBd3BiiakvP0Tabr5d5sEMpDlgb2oG+TUtw9xpLGrXB
         w4/5/c9xhH30LxIAqeKH6y+Myucg71hk13szmxBK/9KZblKd6acLR483bUbgUFP6S3wT
         bZMoyDjVVQZ3GGFM5Fq2KSC/KCL+2wr2AXCzBlKR+sR8TcLDTJ2m6c+0+JIwga+SOZaJ
         Tx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tBXgom8pS+5mm5WMa0UlEBGsguBg4pdjqj4B4/2efgY=;
        b=UG5URceXrpMmibGBHdOqgq+ewuYIvoX+nogRfOarjCqyZl9lrz9dZRI7TDSbhqd4Zp
         /iVy5YhT4jdv4WxHatL9tQ7Hj44xqus3C+iipaYrd61ZTMmDPhA9rYXw5G4aTm59VKLY
         W/0SBtQkT4usW301dkcc3zJcDAHP7C/XZU+4Ed2s5cd2lcef5u9obTUYOux1PdRz5yGC
         Aw8HWzoUDafnu29gqipVNt9HrZxHXTqFPDBLp9K0stiwgSdSWyBDXZPXbTWXJuUSipXh
         Q7gIJNrSUnJdSd8gsOzsy2+wYsAWbCkgcEeqz3fTDwUc8bFDRVzaD/e/7Y0c4N51XS7X
         3hhA==
X-Gm-Message-State: AOAM533RZaXJpMIHk71KB6EF1VBYDFJJa/SKzOcFIuP1+fKCHFhDOIE8
	5E1kACJFaCDwxiSLIVETIe8=
X-Google-Smtp-Source: ABdhPJz0XHWxvhwe+Te80CJ84Qol72esoluEpu/eAbMX9egBnzEOqjW6/Kxq47B+PzjFOICvfIKUjA==
X-Received: by 2002:adf:e483:: with SMTP id i3mr10135222wrm.286.1619255002397;
        Sat, 24 Apr 2021 02:03:22 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id u9sm10501362wmc.38.2021.04.24.02.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:22 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 28/50] staging: rtl8723bs: remove debug macros related to core/rtw_security.c tracing
Date: Sat, 24 Apr 2021 11:02:11 +0200
Message-Id: <510d1f1223156d1b613c6562aeaf86385734214c.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
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

