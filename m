Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11BB2FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:30 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id r7so36708251wrm.1
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0TBgmlQX5j7/Q4T3HKXp2yybKM0tyr8DeALWegqbME4=;
        b=dqhvI9nnqy1hbsqBBtjaq0ArNtfqvWIlv0sVmgOdiW8ES5u/rl5wnnHQaQsnB1BcZb
         W3ZL1CVagrjYbCl2ScdQ2l4ova2TDRpRm8ttOKJMCO/MgXlguZo5cJV9BvH30k9bmran
         +Gr4rnDQejlot512la8hQD95ZrCy6Hcde52pDTTGpAB0qASOn/YFGasIDt4DqjMaNkAs
         p8wyXg2flq+S0lCUkXN5eJ7fuPwcVmpSRHsyqhJE0HkzozPYrlPHHNKWj7AU692nQvxG
         KCa5/ij7fC07A0YbntQUPujY8iZtfXnYhAXV58HmBzgiHh1IL7PrrWPmBihNjKbCwtdq
         995g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0TBgmlQX5j7/Q4T3HKXp2yybKM0tyr8DeALWegqbME4=;
        b=EqL1weqy2bQQsBxmfQzfArbRUsoZuHLmngFHWToR+H8tKVyiDSUdGEaWR5X9A5RRp8
         GFqnEsp+zoWSrt3YF4lKWaE5qH0IxMXkDuxTd/J1Las/Tn/mIObP2bhei3EmJP7KBFq3
         AgjOxHGzsoInzOIuB9HIlf+hF+kHkNNZs/ptfaMj7ICwyWXqstWMVuXFhKeyVF2H+CXe
         oOl9/hF0BSs0/Lfr1LlAbHkXnzwrC9IF63qP5GaAooucCP58OZxNAf3eOBSagZ0bm4yI
         /ajhtv72V31WdGo+/E2ooxRIx8mT+q2tpp3HE9sRVxKCMBIBPqQb1C/TpvzclZcMst09
         8Jlw==
X-Gm-Message-State: AOAM532PKjWjzOfBCvcceF9qUHAm5C/FmrKdOih65DZ49ZzYokFqTCn2
	iPvbjW+V7v/P3c4Vre5TXPg=
X-Google-Smtp-Source: ABdhPJxUKftQQYSxvsy0BAFq9GCJIbwrptTqjydvAJJ7z9LJ88GX0BwFoihKdRQHSb/SLdD4lS5YSw==
X-Received: by 2002:a5d:66cd:: with SMTP id k13mr5290056wrw.387.1619189969626;
        Fri, 23 Apr 2021 07:59:29 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id e10sm9464383wrw.20.2021.04.23.07.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:29 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 29/49] staging: rtl8723bs: remove debug macros related to hal/hal_intf.c tracing
Date: Fri, 23 Apr 2021 16:58:20 +0200
Message-Id: <aa3d08bd65faf97676f7af6d46c47155a66fe347.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macro definitions related to hal/hal_intf.c
obsolete tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c      | 3 ---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 8dc4dd8c6d4c..4868a69cdb8f 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -4,9 +4,6 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-
-#define _HAL_INTF_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 #include <hal_data.h>
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 8a4ee840434e..4da881e3a0c0 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_hal_init_c_		BIT(14)
 #define _module_hci_hal_init_c_		BIT(15)
 #define _module_rtl871x_ioctl_c_		BIT(16)
 #define _module_rtl871x_ioctl_set_c_		BIT(17)
@@ -29,9 +28,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _HAL_INTF_C_
-	#define	_MODULE_DEFINE_	_module_hal_init_c_
-#elif (defined _HCI_HAL_INIT_C_) || (defined _SDIO_HALINIT_C_)
+#if (defined _HCI_HAL_INIT_C_) || (defined _SDIO_HALINIT_C_)
 	#define	_MODULE_DEFINE_	_module_hci_hal_init_c_
 #elif defined _RTL871X_IOCTL_C_
 	#define	_MODULE_DEFINE_	_module_rtl871x_ioctl_c_
-- 
2.20.1

