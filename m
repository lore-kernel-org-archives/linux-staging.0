Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AA171
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:27 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id s7so50600874wru.6
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0TBgmlQX5j7/Q4T3HKXp2yybKM0tyr8DeALWegqbME4=;
        b=TaUYxEsQ/sfJ/xRQfIc+NpGeUV6i4vRbQ5ssasLvZZZMlo3mHXGj+kkQa8oypVUCuO
         o4+W6rx4wDaaAm2kvE4XL6wTd9JTUkHNEI2qIHTBQ9VCOOGbFI5dnOWY0/QXU37ivDtc
         Z81z8ksgcqfqW0GyvxIxdC8xMNieWxTCFLuYkL+iJ0mRFyN58qsPYnf+e7G05sknPItw
         t8L6Nrqs6kzOkGessDifO0AgRkI0lRUJutMwZyuTNcWG0I1muJ5VbC+i03LLPhaicf5m
         bQYZgRPDepjQf55fnDm+7iYwSKHmi7Qi3qne2eoLmz5rhfmRpKZqYbQUFnlQB4zZI3L+
         cUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0TBgmlQX5j7/Q4T3HKXp2yybKM0tyr8DeALWegqbME4=;
        b=juLQgudLJnau74zwZl0A96csVUk8eDVtfXnk67p71uBPGTQmm93bqrhlbIjmX9hQVM
         WLpPgQPcgiLWQ4iX+lp/EN/SAkmjg7ENFiNSo2dNuvB4khPVyIf3ZiM8NajSJo9dCEHe
         qGwCe7x2bv5UDYR6NM78GH8d/WAlHINJRWyjG82bpWhEg0nNHraVadjYLp20c19aWlbf
         bbKf0rwNt7VKagXjOt2JoWEWijtZ+z5qlRLwf+daiJL38d+8nuOCqzmfJUE0c2dnULNN
         wFLpserHDp/l5mnSNLUgyjgYwF7l3I9cyV79G+ldtyPsKIr89Jr2Yle1qZhpZX2nXAQw
         /UeQ==
X-Gm-Message-State: AOAM530ydZFyS+9UdRz6jAERu8LVc+VPsOIMoJGUWoEAH2I534jIwY2R
	hZa6Kee5N/MHA7yCUry9Ehg=
X-Google-Smtp-Source: ABdhPJwEPEqN9zbkWaBBYfyyw6393SACQcZl7tHABTj7l5sCA1+qkZ+WkpwxN6dXl1EfdLUGr3165w==
X-Received: by 2002:a5d:6ac6:: with SMTP id u6mr9844193wrw.290.1619255005986;
        Sat, 24 Apr 2021 02:03:25 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id r11sm12137861wrx.22.2021.04.24.02.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:25 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 30/50] staging: rtl8723bs: remove debug macros related to hal/hal_intf.c tracing
Date: Sat, 24 Apr 2021 11:02:13 +0200
Message-Id: <7f64d5d78b42874364f24a2fb11f664ad9988d99.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
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

