Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4E6179
	for <linux-staging@lists.linux.dev>; Sun, 24 Jul 2022 18:25:44 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id mf4so16855685ejc.3
        for <linux-staging@lists.linux.dev>; Sun, 24 Jul 2022 11:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mc8TRcMxDtFgQPktrRYxaiC84c9xSC4w48WZBhDyELI=;
        b=oCa1EnIGhj2fSSmj29Q1sdTyfzuWOOqeNHEPnZvDIZLbdBnKn7tqWEj5H02S5YN8Hj
         8PEtlPX+XhzBIoYeVq2KG0Vu4PSu/jCQCTfWNuy965gZ/DPDpGg2kvhmj7Id7XwHAPA8
         1Lr7nRIj0VhGvFM956rn7q6KF7RhywN7DhFakrtwPP0nOuQBRH0oI+ah6ETcCABh2Dgm
         aNBZosGaGOkhp3zkYkcldZ4nf++YMymGLbv3vd4q4xnqw6Ds+bLhv9Pyc2qSiZYgNdDK
         TGBpXQzVoboNfn8xkMUWZnUFUcEQqXLq15G+7zqz7vLbLoTxYnpb5zzF3fulBXm85SN+
         clHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mc8TRcMxDtFgQPktrRYxaiC84c9xSC4w48WZBhDyELI=;
        b=oaaKT89QeNWNTp9p2CDGJBQ7wOhuah91ljUdwoPEDu+VkGlxRItupxJWe/p2QU1j+p
         EFQoVojkfgoWdXxxPi9XeuQNNOVmTA9KVZyn6OPp+0fXzCobwU6zi42Xq3PsR/3Dsr1z
         Oklqvu0WyTR1gSpJl/C4yIf4fjo/vfFz+J18yRaCvHXjJpFKeG2hvMpJQBVcWEO2nWvV
         jSBIMennDEs+YhvOxdG0jc52jDlHkHpnzdPamf2lCRROn1ud3ubIMnLNYMU8B5rJFrQU
         REvLMB0X/37J502YducQ4Nr++3RKoockDf1BHXAFN5T925RBHWc3O5ipFA6d9diYDgyp
         xk6w==
X-Gm-Message-State: AJIora/wwZVgN1NhwTDjCqp8Dxx7zxIhRGyPxXQcqu2Tef89UaeqXaZj
	7mquTJ99XNK3OFGS/bWGq04=
X-Google-Smtp-Source: AGRyM1tnh2sZ3SyAw6PmlacimcW8Fpy9h94p1H4tYt/5uTnGQM/5ePImjhHqdDkrb63u+aY7/FyInw==
X-Received: by 2002:a17:907:87b0:b0:72f:8d3d:2010 with SMTP id qv48-20020a17090787b000b0072f8d3d2010mr7355936ejc.743.1658687142570;
        Sun, 24 Jul 2022 11:25:42 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb56.dynamic.kabel-deutschland.de. [95.90.187.86])
        by smtp.gmail.com with ESMTPSA id cb8-20020a0564020b6800b0043bb7c11a59sm5943505edb.93.2022.07.24.11.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 11:25:41 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: make dump_chip_info() static
Date: Sun, 24 Jul 2022 20:25:20 +0200
Message-Id: <20220724182520.7794-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function dump_chip_info() is only used in rtl8188e_hal_init.c.
Make it static to reduce the driver object file size by 281 bytes.

before:
  text    data     bss     dec     hex filename
530606   43897    7072  581575   8dfc7 drivers/staging/r8188eu/r8188eu.o

after:
  text    data     bss     dec     hex filename
530405   43817    7072  581294   8deae drivers/staging/r8188eu/r8188eu.o

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_com.c         | 39 -------------------
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 39 +++++++++++++++++++
 drivers/staging/r8188eu/include/hal_com.h     |  3 --
 3 files changed, 39 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_com.c b/drivers/staging/r8188eu/hal/hal_com.c
index e9a32dd84a8e..6a1cdc67335b 100644
--- a/drivers/staging/r8188eu/hal/hal_com.c
+++ b/drivers/staging/r8188eu/hal/hal_com.c
@@ -10,45 +10,6 @@
 
 #define _HAL_INIT_C_
 
-void dump_chip_info(struct HAL_VERSION	chip_vers)
-{
-	uint cnt = 0;
-	char buf[128];
-
-	cnt += sprintf((buf + cnt), "Chip Version Info: CHIP_8188E_");
-	cnt += sprintf((buf + cnt), "%s_", IS_NORMAL_CHIP(chip_vers) ?
-		       "Normal_Chip" : "Test_Chip");
-	cnt += sprintf((buf + cnt), "%s_", IS_CHIP_VENDOR_TSMC(chip_vers) ?
-		       "TSMC" : "UMC");
-
-	switch (chip_vers.CUTVersion) {
-	case A_CUT_VERSION:
-		cnt += sprintf((buf + cnt), "A_CUT_");
-		break;
-	case B_CUT_VERSION:
-		cnt += sprintf((buf + cnt), "B_CUT_");
-		break;
-	case C_CUT_VERSION:
-		cnt += sprintf((buf + cnt), "C_CUT_");
-		break;
-	case D_CUT_VERSION:
-		cnt += sprintf((buf + cnt), "D_CUT_");
-		break;
-	case E_CUT_VERSION:
-		cnt += sprintf((buf + cnt), "E_CUT_");
-		break;
-	default:
-		cnt += sprintf((buf + cnt), "UNKNOWN_CUT(%d)_", chip_vers.CUTVersion);
-		break;
-	}
-
-	cnt += sprintf((buf + cnt), "1T1R_");
-
-	cnt += sprintf((buf + cnt), "RomVer(%d)\n", 0);
-
-	pr_info("%s", buf);
-}
-
 #define	CHAN_PLAN_HW	0x80
 
 u8 /* return the final channel plan decision */
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index fe477438899e..5b8f1a912bbb 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -526,6 +526,45 @@ void rtl8188e_ReadEFuse(struct adapter *Adapter, u16 _size_byte, u8 *pbuf)
 	Hal_EfuseReadEFuse88E(Adapter, 0, _size_byte, pbuf);
 }
 
+static void dump_chip_info(struct HAL_VERSION chip_vers)
+{
+	uint cnt = 0;
+	char buf[128];
+
+	cnt += sprintf((buf + cnt), "Chip Version Info: CHIP_8188E_");
+	cnt += sprintf((buf + cnt), "%s_", IS_NORMAL_CHIP(chip_vers) ?
+		       "Normal_Chip" : "Test_Chip");
+	cnt += sprintf((buf + cnt), "%s_", IS_CHIP_VENDOR_TSMC(chip_vers) ?
+		       "TSMC" : "UMC");
+
+	switch (chip_vers.CUTVersion) {
+	case A_CUT_VERSION:
+		cnt += sprintf((buf + cnt), "A_CUT_");
+		break;
+	case B_CUT_VERSION:
+		cnt += sprintf((buf + cnt), "B_CUT_");
+		break;
+	case C_CUT_VERSION:
+		cnt += sprintf((buf + cnt), "C_CUT_");
+		break;
+	case D_CUT_VERSION:
+		cnt += sprintf((buf + cnt), "D_CUT_");
+		break;
+	case E_CUT_VERSION:
+		cnt += sprintf((buf + cnt), "E_CUT_");
+		break;
+	default:
+		cnt += sprintf((buf + cnt), "UNKNOWN_CUT(%d)_", chip_vers.CUTVersion);
+		break;
+	}
+
+	cnt += sprintf((buf + cnt), "1T1R_");
+
+	cnt += sprintf((buf + cnt), "RomVer(%d)\n", 0);
+
+	pr_info("%s", buf);
+}
+
 void rtl8188e_read_chip_version(struct adapter *padapter)
 {
 	u32				value32;
diff --git a/drivers/staging/r8188eu/include/hal_com.h b/drivers/staging/r8188eu/include/hal_com.h
index 56ba356b5371..d7e333f6ce39 100644
--- a/drivers/staging/r8188eu/include/hal_com.h
+++ b/drivers/staging/r8188eu/include/hal_com.h
@@ -131,9 +131,6 @@
 #define REG_NOA_DESC_START			0x05E8
 #define REG_NOA_DESC_COUNT			0x05EC
 
-#include "HalVerDef.h"
-void dump_chip_info(struct HAL_VERSION	ChipVersion);
-
 /* return the final channel plan decision */
 u8 hal_com_get_channel_plan(struct adapter *padapter,
 			    u8 hw_channel_plan,
-- 
2.37.1

