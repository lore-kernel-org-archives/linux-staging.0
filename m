Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BED71
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:25 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id e5so22023843wrg.7
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XWbAJszKoLy8l9tAL4imgVyw3i2GGpSRBC2wgrevcm0=;
        b=cY5w0nII7OZZH+6EfBm4RhqYdQMMIufgCanME1upICTTbdm92/jkcL1TyyxzX7k+WU
         0XDOIOoXUWOjNuk7s7veDoQ0+HKlYp91n8ELgK9jaaxpnteMEzgileEYy/ZVYBPIjOkQ
         MVuowDHFvWG+7pdqtNyyQ2epDTbhcTXGwrQCtgXaUClCGsC/F030d0uxx28gdlaj7y5k
         8Z7bkgKdY3Ux3bl2Ed8vSl6wNqr3Ib87r3T6KYaxgArZ/LNYWgj/EOlnRevqtABjMWCF
         PSSb0u/XaM6uz5Tc8qB9ki88m1f8PsazfNpFmhLivuENgMJiECjviwHV+H9kCHRIi2am
         D2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XWbAJszKoLy8l9tAL4imgVyw3i2GGpSRBC2wgrevcm0=;
        b=FPkaBmk+KsuYfWroZfDrtT+tRlnvIPVleyRDiYdoluD3XNAZonLR36a9GeFxdbTWZ5
         2SCFODFLLquomG2EevVs92hmLiOUESUT/v314MtfT0LQcWK3AzCaL/qI7ndTuj5GCznM
         gBxCyOER+jMlUgpyqLeT1iJAL8Ywv2mjyWvVFmnyk3W5r70l6zTTEcKGlpqL3sByMZTO
         2UYQSH/VdXF+JQRx+R7cG55oVGom8q1ZFVENKeo3+vs6D4i2BijbZ5lz1GeZmXmrFnGW
         B54tCs6sNdU9NBNBqlQh2NnCcaanl17AMSXAuH/Cx52rSXms7xKVTi6bFhS8OtmEmFT5
         TioA==
X-Gm-Message-State: AOAM533hTzdbZbo6rRS8J/4WtEx+bGi06puT0FD7SjchkQBCxmlAdsDq
	hL4SdUJm+2+BGHtDpHuQ+Ao=
X-Google-Smtp-Source: ABdhPJwO+9v5u8Jc5wlgqMjWOkNXmDTE5iBHQt2okYI++VCUXZJXRR6Kgv2DHxTEtIZ6U4Vj5aQK2A==
X-Received: by 2002:a5d:6a90:: with SMTP id s16mr9864459wru.163.1619255004251;
        Sat, 24 Apr 2021 02:03:24 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id t63sm10090413wma.20.2021.04.24.02.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:23 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 29/50] staging: rtl8723bs: remove debug macros related to core/rtw_eeprom.c tracing
Date: Sat, 24 Apr 2021 11:02:12 +0200
Message-Id: <d11884043d17db211793e35e9d07a570951110e8.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
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

