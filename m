Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AD51FAB
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 03:13:58 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id v28so7765026pfi.12
        for <linux-staging@lists.linux.dev>; Sat, 05 Nov 2022 20:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAn4ayFDcY1ljL5JrQGh7qC0mRQ6YUvrsVxRS5lz8ds=;
        b=etYbGdxgQB1nzYeW1vKiFr5M2hsgHfON3wyWNvOZJ1LQVjWbdi41e9I5NpHYWZps+G
         OTmdVJAMhSMFt6AAvdp9ep/SLAWxE07aDPz393XsGAw8v390X7C5XvgfVTfBkVPN/5q8
         FRxKDRZKokDwi/dTfoHB700rWAmQiA/2e7rhZRC8L0dgq/B0KeMTT2w89PIavqwanZiz
         dxweil5/vkwUxZD+R6KLHHqCKj3mBNWxwVAHgLngd1WPA4U7HDuNqJUq+UVCWzLBZeM9
         ZEXR5Er8hRgVZ1LlZ7q9HDuhrd/+jVZAEAAL/3nzImtG2Q3tvoyXLpbJyA7ja8COoBza
         HA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAn4ayFDcY1ljL5JrQGh7qC0mRQ6YUvrsVxRS5lz8ds=;
        b=Hgs0q/j4clsGGqQMnDf3f/CA5IwH9tviY1lAhR+CO4lULF5YOVW3MsUaoCK+QRXQ5/
         gZBUIZKsKU3+8hXIVP1uD3kIJ4SHFbWTag1WXGjei/imptKSabinf5hSpiJvhAoHo16T
         HcTD3DSnCgpUzn+xxOPiUjEj3z9Wjubiwqkvy9KA/5Mqs5Q5ho2s/aPr1WtwWVasa1fr
         xkmeTkqj8wFADeNwdFmMhi+gjQCZfK61cNIzYRVvyIy+6sIE94Mq9DmH8hWpAT4treGH
         pc8Ojxfvjk8aMMVESViXtZ52Pw817+jc2yvq/ZPL103Bx85Suj+vrg8iHGA75W9AqxpZ
         zL+A==
X-Gm-Message-State: ACrzQf3XzZdX+r0CRrBSABD5vdo7N5QaaS3VnZ3uC7Sq6x97p7euhul+
	+Rt/PL8nL0rT9dcXC6V9ReI=
X-Google-Smtp-Source: AMsMyM4Dv2moXKX6VaP3eclN4ymY9hu3VkySetuCwBXUdppSYWfE5NtnhrTqsTTF68Mt4YusGQ+CUQ==
X-Received: by 2002:aa7:9099:0:b0:56a:d3f0:a013 with SMTP id i25-20020aa79099000000b0056ad3f0a013mr44015279pfa.26.1667704438386;
        Sat, 05 Nov 2022 20:13:58 -0700 (PDT)
Received: from jacob-Ubuntu (126.224.215.218.sta.wbroadband.net.au. [218.215.224.126])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090adb4200b00214247989dfsm1872841pjx.13.2022.11.05.20.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 20:13:58 -0700 (PDT)
From: Jacob Bai <jacob.bai.au@gmail.com>
To: joe@perches.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: rtl8192e: replace macro defines with ARRAY_SIZE
Date: Sun,  6 Nov 2022 14:13:40 +1100
Message-Id: <13fddf4affd15a58c191be717ddee75772849f4e.1667704057.git.jacob.bai.au@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667704057.git.jacob.bai.au@gmail.com>
References: <cover.1667704057.git.jacob.bai.au@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

use ARRAY_SIZE() to replace  macro defines

Signed-off-by: Jacob Bai <jacob.bai.au@gmail.com>
---
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 52 +++++++++----------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.h    | 20 -------
 drivers/staging/rtl8192e/rtl8192e/table.c     | 32 ++++++++----
 drivers/staging/rtl8192e/rtl8192e/table.h     | 36 ++++++-------
 4 files changed, 65 insertions(+), 75 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index eabb4187d907..aad1842857c0 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -307,12 +307,12 @@ void rtl92e_config_mac(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 
 	if (priv->bTXPowerDataReadFromEEPORM) {
-		dwArrayLen = MACPHY_Array_PGLength;
-		pdwArray = Rtl819XMACPHY_Array_PG;
+		dwArrayLen = RTL8192E_MAC_ARRAY_PG_LEN;
+		pdwArray = RTL8192E_MAC_ARRAY_PG;
 
 	} else {
-		dwArrayLen = MACPHY_ArrayLength;
-		pdwArray = Rtl819XMACPHY_Array;
+		dwArrayLen = RTL8192E_MAC_ARRAY_LEN;
+		pdwArray = RTL8192E_MAC_ARRAY;
 	}
 	for (i = 0; i < dwArrayLen; i += 3) {
 		if (pdwArray[i] == 0x318)
@@ -332,14 +332,14 @@ static void _rtl92e_phy_config_bb(struct net_device *dev, u8 ConfigType)
 	u16 AGCTAB_ArrayLen, PHY_REGArrayLen = 0;
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	AGCTAB_ArrayLen = AGCTAB_ArrayLength;
-	Rtl819XAGCTAB_Array_Table = Rtl819XAGCTAB_Array;
+	AGCTAB_ArrayLen = RTL8192E_AGC_TAB_ARRAY_LEN;
+	Rtl819XAGCTAB_Array_Table = RTL8192E_AGC_TAB_ARRAY;
 	if (priv->rf_type == RF_2T4R) {
-		PHY_REGArrayLen = PHY_REGArrayLength;
-		Rtl819XPHY_REGArray_Table = Rtl819XPHY_REGArray;
+		PHY_REGArrayLen = RTL8192E_PHY_REG_ARRAY_LEN;
+		Rtl819XPHY_REGArray_Table = RTL8192E_PHY_REG_ARRAY;
 	} else if (priv->rf_type == RF_1T2R) {
-		PHY_REGArrayLen = PHY_REG_1T2RArrayLength;
-		Rtl819XPHY_REGArray_Table = Rtl819XPHY_REG_1T2RArray;
+		PHY_REGArrayLen = RTL8192E_PHY_REG_1T2R_ARRAY_LEN;
+		Rtl819XPHY_REGArray_Table = RTL8192E_PHY_REG_1T2R_ARRAY;
 	}
 
 	if (ConfigType == BaseBand_Config_PHY_REG) {
@@ -668,50 +668,50 @@ u8 rtl92e_config_rf_path(struct net_device *dev, enum rf90_radio_path eRFPath)
 
 	switch (eRFPath) {
 	case RF90_PATH_A:
-		for (i = 0; i < RadioA_ArrayLength; i += 2) {
-			if (Rtl819XRadioA_Array[i] == 0xfe) {
+		for (i = 0; i < RTL8192E_RADIOA_ARRAY_LEN; i += 2) {
+			if (RTL8192E_RADIOA_ARRAY[i] == 0xfe) {
 				msleep(100);
 				continue;
 			}
-			rtl92e_set_rf_reg(dev, eRFPath, Rtl819XRadioA_Array[i],
+			rtl92e_set_rf_reg(dev, eRFPath, RTL8192E_RADIOA_ARRAY[i],
 					  bMask12Bits,
-					  Rtl819XRadioA_Array[i+1]);
+					  RTL8192E_RADIOA_ARRAY[i+1]);
 
 		}
 		break;
 	case RF90_PATH_B:
-		for (i = 0; i < RadioB_ArrayLength; i += 2) {
-			if (Rtl819XRadioB_Array[i] == 0xfe) {
+		for (i = 0; i < RTL8192E_RADIOB_ARRAY_LEN; i += 2) {
+			if (RTL8192E_RADIOB_ARRAY[i] == 0xfe) {
 				msleep(100);
 				continue;
 			}
-			rtl92e_set_rf_reg(dev, eRFPath, Rtl819XRadioB_Array[i],
+			rtl92e_set_rf_reg(dev, eRFPath, RTL8192E_RADIOB_ARRAY[i],
 					  bMask12Bits,
-					  Rtl819XRadioB_Array[i+1]);
+					  RTL8192E_RADIOB_ARRAY[i+1]);
 
 		}
 		break;
 	case RF90_PATH_C:
-		for (i = 0; i < RadioC_ArrayLength; i += 2) {
-			if (Rtl819XRadioC_Array[i] == 0xfe) {
+		for (i = 0; i < RTL8192E_RADIOC_ARRAY_LEN; i += 2) {
+			if (RTL8192E_RADIOC_ARRAY[i] == 0xfe) {
 				msleep(100);
 				continue;
 			}
-			rtl92e_set_rf_reg(dev, eRFPath, Rtl819XRadioC_Array[i],
+			rtl92e_set_rf_reg(dev, eRFPath, RTL8192E_RADIOC_ARRAY[i],
 					  bMask12Bits,
-					  Rtl819XRadioC_Array[i+1]);
+					  RTL8192E_RADIOC_ARRAY[i+1]);
 
 		}
 		break;
 	case RF90_PATH_D:
-		for (i = 0; i < RadioD_ArrayLength; i += 2) {
-			if (Rtl819XRadioD_Array[i] == 0xfe) {
+		for (i = 0; i < RTL8192E_RADIOD_ARRAY_LEN; i += 2) {
+			if (RTL8192E_RADIOD_ARRAY[i] == 0xfe) {
 				msleep(100);
 				continue;
 			}
-			rtl92e_set_rf_reg(dev, eRFPath, Rtl819XRadioD_Array[i],
+			rtl92e_set_rf_reg(dev, eRFPath, RTL8192E_RADIOD_ARRAY[i],
 					  bMask12Bits,
-					  Rtl819XRadioD_Array[i+1]);
+					  RTL8192E_RADIOD_ARRAY[i+1]);
 
 		}
 		break;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
index e1c1f19b71a3..5e6527e835db 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
@@ -9,26 +9,6 @@
 
 #define MAX_DOZE_WAITING_TIMES_9x 64
 
-#define AGCTAB_ArrayLength			RTL8192E_AGC_TAB_ARRAY_LEN
-#define MACPHY_ArrayLength			RTL8192E_MAC_ARRAY_LEN
-#define RadioA_ArrayLength			RTL8192E_RADIOA_ARRAY_LEN
-#define RadioB_ArrayLength			RTL8192E_RADIOB_ARRAY_LEN
-#define MACPHY_Array_PGLength			RTL8192E_MAC_ARRAY_PG_LEN
-#define RadioC_ArrayLength			RTL8192E_RADIOC_ARRAY_LEN
-#define RadioD_ArrayLength			RTL8192E_RADIOD_ARRAY_LEN
-#define PHY_REGArrayLength			RTL8192E_PHY_REG_ARRAY_LEN
-#define PHY_REG_1T2RArrayLength			RTL8192E_PHY_REG_1T2R_ARRAY_LEN
-
-#define Rtl819XMACPHY_Array_PG			RTL8192E_MAC_ARRAY_PG
-#define Rtl819XMACPHY_Array			RTL8192E_MAC_ARRAY
-#define Rtl819XRadioA_Array			RTL8192E_RADIOA_ARRAY
-#define Rtl819XRadioB_Array			RTL8192E_RADIOB_ARRAY
-#define Rtl819XRadioC_Array			RTL8192E_RADIOC_ARRAY
-#define Rtl819XRadioD_Array			RTL8192E_RADIOD_ARRAY
-#define Rtl819XAGCTAB_Array			RTL8192E_AGC_TAB_ARRAY
-#define Rtl819XPHY_REGArray			RTL8192E_PHY_REG_ARRAY
-#define Rtl819XPHY_REG_1T2RArray		RTL8192E_PHY_REG_1T2R_ARRAY
-
 extern u32 rtl819XAGCTAB_Array[];
 
 enum hw90_block {
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.c b/drivers/staging/rtl8192e/rtl8192e/table.c
index 2e75f40db874..936f2ea180cd 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.c
+++ b/drivers/staging/rtl8192e/rtl8192e/table.c
@@ -4,11 +4,13 @@
  *
  * Contact Information: wlanfae <wlanfae@realtek.com>
  */
+#include <linux/kernel.h>
 #include "table.h"
 
-u32 RTL8192E_PHY_REG_ARRAY[RTL8192E_PHY_REG_ARRAY_LEN] = {0x0,};
+u32 RTL8192E_PHY_REG_ARRAY[] = {0x0,};
+u32 RTL8192E_PHY_REG_ARRAY_LEN = ARRAY_SIZE(RTL8192E_PHY_REG_ARRAY);
 
-u32 RTL8192E_PHY_REG_1T2R_ARRAY[RTL8192E_PHY_REG_1T2R_ARRAY_LEN] = {
+u32 RTL8192E_PHY_REG_1T2R_ARRAY[] = {
 	0x800, 0x00000000,
 	0x804, 0x00000001,
 	0x808, 0x0000fc00,
@@ -158,8 +160,9 @@ u32 RTL8192E_PHY_REG_1T2R_ARRAY[RTL8192E_PHY_REG_1T2R_ARRAY_LEN] = {
 	0xe18, 0x161a1a1a,
 	0xe1c, 0x12121416,
 };
+u32 RTL8192E_PHY_REG_1T2R_ARRAY_LEN = ARRAY_SIZE(RTL8192E_PHY_REG_1T2R_ARRAY);
 
-u32 RTL8192E_RADIOA_ARRAY[RTL8192E_RADIOA_ARRAY_LEN] = {
+u32 RTL8192E_RADIOA_ARRAY[] = {
 	0x019, 0x00000003,
 	0x000, 0x000000bf,
 	0x001, 0x00000ee0,
@@ -284,8 +287,9 @@ u32 RTL8192E_RADIOA_ARRAY[RTL8192E_RADIOA_ARRAY_LEN] = {
 	0x004, 0x00000975,
 	0x007, 0x00000700,
 };
+u32 RTL8192E_RADIOA_ARRAY_LEN = ARRAY_SIZE(RTL8192E_RADIOA_ARRAY);
 
-u32 RTL8192E_RADIOB_ARRAY[RTL8192E_RADIOB_ARRAY_LEN] = {
+u32 RTL8192E_RADIOB_ARRAY[] = {
 	0x019, 0x00000003,
 	0x000, 0x000000bf,
 	0x001, 0x000006e0,
@@ -326,14 +330,17 @@ u32 RTL8192E_RADIOB_ARRAY[RTL8192E_RADIOB_ARRAY_LEN] = {
 	0x004, 0x00000975,
 	0x007, 0x00000700,
 };
+u32 RTL8192E_RADIOB_ARRAY_LEN = ARRAY_SIZE(RTL8192E_RADIOB_ARRAY);
 
-u32 RTL8192E_RADIOC_ARRAY[RTL8192E_RADIOC_ARRAY_LEN] = {
-	0x0,  };
+u32 RTL8192E_RADIOC_ARRAY[] = {
+	0x0, 0x0 };
+u32 RTL8192E_RADIOC_ARRAY_LEN = ARRAY_SIZE(RTL8192E_RADIOC_ARRAY);
 
-u32 RTL8192E_RADIOD_ARRAY[RTL8192E_RADIOD_ARRAY_LEN] = {
-	0x0, };
+u32 RTL8192E_RADIOD_ARRAY[] = {
+	0x0, 0x0 };
+u32 RTL8192E_RADIOD_ARRAY_LEN = ARRAY_SIZE(RTL8192E_RADIOD_ARRAY);
 
-u32 RTL8192E_MAC_ARRAY[RTL8192E_MAC_ARRAY_LEN] = {
+u32 RTL8192E_MAC_ARRAY[] = {
 	0x03c, 0xffff0000, 0x00000f0f,
 	0x340, 0xffffffff, 0x161a1a1a,
 	0x344, 0xffffffff, 0x12121416,
@@ -341,8 +348,9 @@ u32 RTL8192E_MAC_ARRAY[RTL8192E_MAC_ARRAY_LEN] = {
 	0x12c, 0xffffffff, 0x04000802,
 	0x318, 0x00000fff, 0x00000100,
 };
+u32 RTL8192E_MAC_ARRAY_LEN = ARRAY_SIZE(RTL8192E_MAC_ARRAY);
 
-u32 RTL8192E_MAC_ARRAY_PG[RTL8192E_MAC_ARRAY_PG_LEN] = {
+u32 RTL8192E_MAC_ARRAY_PG[] = {
 	0x03c, 0xffff0000, 0x00000f0f,
 	0xe00, 0xffffffff, 0x06090909,
 	0xe04, 0xffffffff, 0x00030306,
@@ -354,8 +362,9 @@ u32 RTL8192E_MAC_ARRAY_PG[RTL8192E_MAC_ARRAY_PG_LEN] = {
 	0x12c, 0xffffffff, 0x04000802,
 	0x318, 0x00000fff, 0x00000800,
 };
+u32 RTL8192E_MAC_ARRAY_PG_LEN = ARRAY_SIZE(RTL8192E_MAC_ARRAY_PG);
 
-u32 RTL8192E_AGC_TAB_ARRAY[RTL8192E_AGC_TAB_ARRAY_LEN] = {
+u32 RTL8192E_AGC_TAB_ARRAY[] = {
 	0xc78, 0x7d000001,
 	0xc78, 0x7d010001,
 	0xc78, 0x7d020001,
@@ -549,3 +558,4 @@ u32 RTL8192E_AGC_TAB_ARRAY[RTL8192E_AGC_TAB_ARRAY_LEN] = {
 	0xc78, 0x693e001e,
 	0xc78, 0x6a3f001e,
 };
+u32 RTL8192E_AGC_TAB_ARRAY_LEN = ARRAY_SIZE(RTL8192E_AGC_TAB_ARRAY);
diff --git a/drivers/staging/rtl8192e/rtl8192e/table.h b/drivers/staging/rtl8192e/rtl8192e/table.h
index a80176c47127..233beeec3e65 100644
--- a/drivers/staging/rtl8192e/rtl8192e/table.h
+++ b/drivers/staging/rtl8192e/rtl8192e/table.h
@@ -11,23 +11,23 @@
 
 #include <linux/types.h>
 
-#define RTL8192E_PHY_REG_ARRAY_LEN 1
-extern u32 RTL8192E_PHY_REG_ARRAY[RTL8192E_PHY_REG_ARRAY_LEN];
-#define RTL8192E_PHY_REG_1T2R_ARRAY_LEN 296
-extern u32 RTL8192E_PHY_REG_1T2R_ARRAY[RTL8192E_PHY_REG_1T2R_ARRAY_LEN];
-#define RTL8192E_RADIOA_ARRAY_LEN 246
-extern u32 RTL8192E_RADIOA_ARRAY[RTL8192E_RADIOA_ARRAY_LEN];
-#define RTL8192E_RADIOB_ARRAY_LEN 78
-extern u32 RTL8192E_RADIOB_ARRAY[RTL8192E_RADIOB_ARRAY_LEN];
-#define RTL8192E_RADIOC_ARRAY_LEN 2
-extern u32 RTL8192E_RADIOC_ARRAY[RTL8192E_RADIOC_ARRAY_LEN];
-#define RTL8192E_RADIOD_ARRAY_LEN 2
-extern u32 RTL8192E_RADIOD_ARRAY[RTL8192E_RADIOD_ARRAY_LEN];
-#define RTL8192E_MAC_ARRAY_LEN 18
-extern u32 RTL8192E_MAC_ARRAY[RTL8192E_MAC_ARRAY_LEN];
-#define RTL8192E_MAC_ARRAY_PG_LEN 30
-extern u32 RTL8192E_MAC_ARRAY_PG[RTL8192E_MAC_ARRAY_PG_LEN];
-#define RTL8192E_AGC_TAB_ARRAY_LEN 384
-extern u32 RTL8192E_AGC_TAB_ARRAY[RTL8192E_AGC_TAB_ARRAY_LEN];
+extern u32 RTL8192E_PHY_REG_ARRAY_LEN;
+extern u32 RTL8192E_PHY_REG_ARRAY[];
+extern u32 RTL8192E_PHY_REG_1T2R_ARRAY_LEN;
+extern u32 RTL8192E_PHY_REG_1T2R_ARRAY[];
+extern u32 RTL8192E_RADIOA_ARRAY_LEN;
+extern u32 RTL8192E_RADIOA_ARRAY[];
+extern u32 RTL8192E_RADIOB_ARRAY_LEN;
+extern u32 RTL8192E_RADIOB_ARRAY[];
+extern u32 RTL8192E_RADIOC_ARRAY_LEN;
+extern u32 RTL8192E_RADIOC_ARRAY[];
+extern u32 RTL8192E_RADIOD_ARRAY_LEN;
+extern u32 RTL8192E_RADIOD_ARRAY[];
+extern u32 RTL8192E_MAC_ARRAY_LEN;
+extern u32 RTL8192E_MAC_ARRAY[];
+extern u32 RTL8192E_MAC_ARRAY_PG_LEN;
+extern u32 RTL8192E_MAC_ARRAY_PG[];
+extern u32 RTL8192E_AGC_TAB_ARRAY_LEN;
+extern u32 RTL8192E_AGC_TAB_ARRAY[];
 
 #endif
-- 
2.34.1

