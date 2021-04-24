Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BC771
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:01 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id x5so383211wrv.13
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/WnmT7CRdJ9xoYI2NiEVYpV5jw3qtqeREXJaneN7WYA=;
        b=KpsHIHX4/w+ZM+DMjOEORZEQyZWl2j+AQ8IqD65PHex2LkWsxK+zrA0bsJEw5Z2BpT
         USot9AZmmVf8KUpceLXfBj06uSh59uN14nhVV/Wmyxmwb7n9vBCmL9j68YNLsaCxn7aC
         /Fup48Jzgt24YyY28lXVTxiOe9sSEk38axExiJeeSV15KxYCcSAE7A3CZAp/fzl87axi
         Pup4cTalI+OMEqxKkq31e93QWefuL6gQ+NiOS+JGu40iVrUByBzvDkKvktvAz7x3P3gD
         eKDfzIXSiy+ntnOpqNqYqT1Cf6Z59e+zhNjxsdNW0oKiN2sgkUPb8XLb5+VUQcUrlcrG
         PzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/WnmT7CRdJ9xoYI2NiEVYpV5jw3qtqeREXJaneN7WYA=;
        b=Yh5Zfbkd/iZGppzM1oO+DsVuzUbqWOq/xLm2jBBaxUe62KdAUDoxaA4VyFrXV5P7U8
         lKjDiF4sHVDNq+1cvDPlGSVGXzr1l10NLl1010woD59NDL8ejHYFxR1DU7k7gG5rDlxg
         w1aEXQ7erpXvcKYU4OYUg4ktLxuPlOOV6oYL5+axQYbZ5O3hXUEjrrKhEh0qRJT0D1qz
         Qexh0C0aCzy40SBM54PqqQAa1i9XXH/NxiLhUvjvt9nlsJsqyonOxX3UqGo+nRkMZDzg
         xd3dFmxDHKFdxUcWhaiDRCSUtK4RM4HoaHAgcskn5TiJnvNv3nM6f+G7QlH1Kgj+6wdx
         wQUA==
X-Gm-Message-State: AOAM5306BA5B/OLSU8BAw44GknpetHAoX3pNFgPomCmbJhiUHLHGnNjb
	a+LBQQjYXO2goNpq9dkO9sw=
X-Google-Smtp-Source: ABdhPJxB7WEqErTgUegtKyrBW7jW7gUmau0WW1NrARONyi3Puqce1ZxeSkJNaMA8tcXJaFIt4XJapA==
X-Received: by 2002:a5d:5041:: with SMTP id h1mr9882692wrt.100.1619254980484;
        Sat, 24 Apr 2021 02:03:00 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id u14sm11659514wrq.65.2021.04.24.02.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:00 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/50] staging: rtl8723bs: remove debug macros related to os_dep/xmit_linux.c tracing
Date: Sat, 24 Apr 2021 11:01:58 +0200
Message-Id: <ab5984670fac9e534b08ae043ddb7cd63ce60450.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macros definitions related to os_dep/xmit_linux.c
obsolete tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 2 --
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index ea4d34678b9c..6403a11d712d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_xmit_osdep_c_		BIT(1)
 #define _module_rtl871x_recv_c_		BIT(2)
 #define _module_recv_osdep_c_		BIT(3)
 #define _module_rtl871x_mlme_c_		BIT(4)
@@ -42,9 +41,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _XMIT_OSDEP_C_
-	#define _MODULE_DEFINE_	_module_xmit_osdep_c_
-#elif defined _RTW_RECV_C_
+#if defined _RTW_RECV_C_
 	#define _MODULE_DEFINE_	_module_rtl871x_recv_c_
 #elif defined _RECV_OSDEP_C_
 	#define _MODULE_DEFINE_	_module_recv_osdep_c_
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 639408eaf4df..6b039c1d8d57 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-#define _XMIT_OSDEP_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 
-- 
2.20.1

