Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCC571
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:05 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id e7so41702510wrs.11
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QIhM6s/LWPN2qislBbfeytQsgbBH4Yl1FLgMdln/Wyk=;
        b=ssPNMkGOWzBKCuCGMww0jjdHGD6Xug2jimuwxTwVYEagQrxYTMGjBPVewUa7K3E8RH
         nSjoZmlG7EyHM6lzNHTh9/p+wLPGJ02TGFBR1kkwbNtRTBbV6T2D0HJg9DoE+FB+WbRv
         M23bOZJdADvAVq5Eaq94nojyu9pYxqU5qu+ltfdbXIOETVy5maVDAt9Jhp04PQly0ge9
         pHL6OYTrjKpcDZlDbloNXFAq3XQG5p6UQgtkF/8perTsCeOtFLqTkP1fX8KBpeKmfwMg
         J4kpF0qr34BnPIlf7q4ZtHE7WL1wzt2Mfr7XhS2mpC9b8fFGbNq4l+Jn6vDFe54IZxCL
         VZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QIhM6s/LWPN2qislBbfeytQsgbBH4Yl1FLgMdln/Wyk=;
        b=H5UBvKZ1mvoI02Zo96MVhPXmTAAGO+JSV2RNhvYQ/6/gCo/IC997C0jyBWa2C92R4L
         quO7SqaGkMngKoI56OBe0vJo4CFcfVe3wAQxm0MZq1jEKy03uz1giGaYcyRTtGz/fpCB
         CasW5WqvkMtHRuyW+KVBnFIMV5aG1AYKAR6D5JFm48jwhBUZeOVF5xd01yjED+2gnefI
         85EmPScM/Vv1kJOIUd+02Q8GcczkL8sZrpNvn0Adb1cIlz96h6t+V4lAC5KlBlWjs7aP
         Ur10LJxSmSobF8ZBtcyT8aOJC61hVZnKMTY59juyVj5iphHphWkJhTafveWM+VXTQC/K
         tZ0A==
X-Gm-Message-State: AOAM533nx93vmDg5z6h/mC/KrCnAaLtJtn+XrFY0w7s4oGpIJM5Tzy00
	GgFL3NRoKTUpeGYnUKAWx+6r+Bhbu3RXYQ==
X-Google-Smtp-Source: ABdhPJww3HKjIGR63C8N1YOYEe0r6MeYp68XgZlY7bfHoQaU/nqI+VS6+d+NczTahURo5k3O8ki5rw==
X-Received: by 2002:a05:6000:1564:: with SMTP id 4mr9766468wrz.197.1619254983756;
        Sat, 24 Apr 2021 02:03:03 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id m14sm387546wmi.39.2021.04.24.02.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:03 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/50] staging: rtl8723bs: remove debug macros related to os_dep/recv_linux.c tracing
Date: Sat, 24 Apr 2021 11:02:00 +0200
Message-Id: <7461d3589ff726ad3c61bb8c6edb1f177fcb0532.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macros definitions related to os_dep/recv_linux.c
obsolete tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 drivers/staging/rtl8723bs/os_dep/recv_linux.c | 2 --
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 422d6bcfcc6f..d04f116bc9a4 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_recv_osdep_c_		BIT(3)
 #define _module_rtl871x_mlme_c_		BIT(4)
 #define _module_mlme_osdep_c_		BIT(5)
 #define _module_rtl871x_sta_mgt_c_		BIT(6)
@@ -40,9 +39,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RECV_OSDEP_C_
-	#define _MODULE_DEFINE_	_module_recv_osdep_c_
-#elif defined _RTW_MLME_C_
+#if defined _RTW_MLME_C_
 	#define _MODULE_DEFINE_	_module_rtl871x_mlme_c_
 #elif defined _MLME_OSDEP_C_
 	#define _MODULE_DEFINE_	_module_mlme_osdep_c_
diff --git a/drivers/staging/rtl8723bs/os_dep/recv_linux.c b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
index cd51430d4618..88a69c7ca8f2 100644
--- a/drivers/staging/rtl8723bs/os_dep/recv_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-#define _RECV_OSDEP_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 #include <linux/jiffies.h>
-- 
2.20.1

