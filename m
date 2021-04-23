Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8E82FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:29 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id x7so48673730wrw.10
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XWbAJszKoLy8l9tAL4imgVyw3i2GGpSRBC2wgrevcm0=;
        b=F2ipSsp3lpDqsgV5x+7AtT8/UDYfTdQDEZaxy+s7yudYw8AHX1lysH2hFS0Jqlo7jM
         FzfxtgmBUWAF2nyEDpzLwsyNHCdW0Bc3mL0VzwkjjtgbczUFVE6lFFcV+F4QRB7iW3sz
         k8Me4OsyUlEQKp4la00Kq59X0dhOhRCiZPCUGG7dGo3bczK+briVyCzChz5XlfVvC6Qp
         JzT7/sEvyXMDbBZeu+6xJzu40p+LyTlXtvG22yvXZa6848MrOmAg0W2Hi3OgU2hwDhgx
         brZwofySIuJi/ORK80GgKYkZVh0g3TMUFWNnXCvLYVPk+gJggB4990YrGAxT+wIn38SE
         izPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XWbAJszKoLy8l9tAL4imgVyw3i2GGpSRBC2wgrevcm0=;
        b=ol0aouhJnigAUfjKpVR9M5fpxA743w4BxnbKYthVdLEzY7NrE/nDPOdcAwFNBwTKGJ
         hMjM4F52YfZRvldbg9hEi1uXTi6LUzhz0duDGTTpesp1joykBNUAo25okIO/WtXvslsD
         UjFWIkKlz6BdZ8saEe7ilFXI8a6Hlr6cUuaLyooAJupGoXu3Lt5yxhF7U77GqgxlFy7f
         cINJ0qu/ZtMFdDsgkRbT7SRYqJdhEZocW+LBtmVnrwhEANpYNSLsyHWsLP6IEFkX06gB
         zGmEcFhZgdsgTCQZqx3rXOhA4+NUY1rD3dBmNBJC72hms3ytCLQ/wD5ZCY0hbpqJgzHx
         8z6w==
X-Gm-Message-State: AOAM533onhbG+A8QnFUX9mMNbdqjNoOCNSlzfhUTP3ND4dQN3lohOZ9h
	w6s6nU5B+QptSG6Sl2DBZnw=
X-Google-Smtp-Source: ABdhPJzwIpw6EFjOGmu206g9N4dVqBJ8Vv8q8Lrfr4XlfRSJUErGY9KXL70Q2K9yMM/3Hq0g0tXbFg==
X-Received: by 2002:a05:6000:8b:: with SMTP id m11mr5285075wrx.224.1619189968100;
        Fri, 23 Apr 2021 07:59:28 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id b15sm9520223wrt.57.2021.04.23.07.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:27 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 28/49] staging: rtl8723bs: remove debug macros related to core/rtw_eeprom.c tracing
Date: Fri, 23 Apr 2021 16:58:19 +0200
Message-Id: <20f87136d548f61c8656f46a4374d48b08d0c482.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macro definitions related to core/rtw_eeprom.c
obsolete tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_eeprom.c   | 2 --
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_eeprom.c b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
index be0eda1604d0..4dcee4d2e513 100644
--- a/drivers/staging/rtl8723bs/core/rtw_eeprom.c
+++ b/drivers/staging/rtl8723bs/core/rtw_eeprom.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-#define _RTW_EEPROM_C_
-
 #include <drv_conf.h>
 #include <osdep_service.h>
 #include <drv_types.h>
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 70bfe24d9e0c..8a4ee840434e 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_rtl871x_eeprom_c_			BIT(13)
 #define _module_hal_init_c_		BIT(14)
 #define _module_hci_hal_init_c_		BIT(15)
 #define _module_rtl871x_ioctl_c_		BIT(16)
@@ -30,9 +29,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTW_EEPROM_C_
-	#define	_MODULE_DEFINE_	_module_rtl871x_eeprom_c_
-#elif defined _HAL_INTF_C_
+#if defined _HAL_INTF_C_
 	#define	_MODULE_DEFINE_	_module_hal_init_c_
 #elif (defined _HCI_HAL_INIT_C_) || (defined _SDIO_HALINIT_C_)
 	#define	_MODULE_DEFINE_	_module_hci_hal_init_c_
-- 
2.20.1

