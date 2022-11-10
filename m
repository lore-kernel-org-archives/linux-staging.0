Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F97C185E
	for <linux-staging@lists.linux.dev>; Thu, 10 Nov 2022 10:35:20 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id 130so1600279pfu.8
        for <linux-staging@lists.linux.dev>; Thu, 10 Nov 2022 02:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XN+Q6Uz1Z9DwS84wbHOEHzmi43ielaLqgyLWhdiQqew=;
        b=dT4dsMO76xg61VXBbs4oAcxX7aWNAp6h9PhuTAJ8c7/GSY+MM6ZLl5EfZ41SlhWAet
         VuHzD//m9n+nB5DT0BQM9nHZ35/w2XetGv5A1WfCDmK1VQXqhFIPenC6dd2hY5h9e51c
         L/NKcgdF/w9oUpCqLVKol3dYKF4InQRMkcmvZv+YUm6kOQo5vhF5UEeNhd2lgZBnhPbk
         7uCGad1Ad+IFcEfhJM00gwiHK0srr1/BBN/YHkzKHo1xEEKU+ps/wpI1CHUUEzMVoRpK
         rV7iCwAKOohk78Ww+m0Kzq9eWjXEHTdP4vG5nZTEIz53hGX2L1I07I/CIUdeuTw8KFCK
         qJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XN+Q6Uz1Z9DwS84wbHOEHzmi43ielaLqgyLWhdiQqew=;
        b=dkbnA3qlXjh8xXrNOBX5m3x+xM5tBf70IKfAsHfXLSCZQfi82q4IrHq/EphQiqukhd
         3XS0LiK2S43gaDbcwNnV8ISHMrzE7s+6w97o4Cc8LzjLMYPwvEeUpVDx2C4v3o4Aon4n
         P7sfDmGZR3Scwt2xeMvZUJkXDg52edAqFa/C1BNtwRJI5Z/smhWeUKRw4Jlf+BHzk3od
         zbDN2s6Ok2MsV7m29DDNCSQPli53/4uoDyIS/z9pcji2PP/aj/E+LMx+ht+7/nO10ftJ
         X6hngiREzTlTMGKF3FA9yJ4gRB863tQqkEksyuGS5e0XAfhXTDCkT5xeN+y8c1dShyjV
         PRKg==
X-Gm-Message-State: ACrzQf0c95/aLd34ojKi+HUQo+S0kgYFGYNKP4sOoh9SJu49GmTNASIU
	5l8LPDqq53NPLe6CKeWyAL0ZkpymJ2YqFQ==
X-Google-Smtp-Source: AMsMyM7GsGWhSQO4MeLt/+pVaLLwbInvwOqb4MgdiHCw3Gb0yEwipkNxDyXZEACyYUSQf3NJTBY52w==
X-Received: by 2002:a63:1b10:0:b0:46f:b888:164f with SMTP id b16-20020a631b10000000b0046fb888164fmr2196094pgb.386.1668076519627;
        Thu, 10 Nov 2022 02:35:19 -0800 (PST)
Received: from jacob-Ubuntu (126.224.215.218.sta.wbroadband.net.au. [218.215.224.126])
        by smtp.gmail.com with ESMTPSA id y18-20020a170902b49200b001769206a766sm10764112plr.307.2022.11.10.02.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 02:35:19 -0800 (PST)
From: Jacob Bai <jacob.bai.au@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] staging: rtl8192e: rename tables in r8192e_hwimg.c
Date: Thu, 10 Nov 2022 21:35:10 +1100
Message-Id: <01eb4d9cb22be5f76aa39eedd406577cdfd9f486.1668075486.git.jacob.bai.au@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1668075486.git.jacob.bai.au@gmail.com>
References: <cover.1668075486.git.jacob.bai.au@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix camel case issue.

Signed-off-by: Jacob Bai <jacob.bai.au@gmail.com>
---
 .../staging/rtl8192e/rtl8192e/r8192E_hwimg.c  | 18 +++++-----
 .../staging/rtl8192e/rtl8192e/r8192E_hwimg.h  | 36 +++++++++----------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.h    | 36 +++++++++----------
 3 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.c
index e6fce749e65b..8920283f340e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.c
@@ -6,9 +6,9 @@
  */
 #include "r8192E_hwimg.h"
 
-u32 Rtl8192PciEPHY_REGArray[PHY_REGArrayLengthPciE] = {0x0,};
+u32 RTL8192E_PHY_REG_ARRAY[RTL8192E_PHY_REG_ARRAY_LEN] = {0x0,};
 
-u32 Rtl8192PciEPHY_REG_1T2RArray[PHY_REG_1T2RArrayLengthPciE] = {
+u32 RTL8192E_PHY_REG_1T2R_ARRAY[RTL8192E_PHY_REG_1T2R_ARRAY_LEN] = {
 	0x800, 0x00000000,
 	0x804, 0x00000001,
 	0x808, 0x0000fc00,
@@ -159,7 +159,7 @@ u32 Rtl8192PciEPHY_REG_1T2RArray[PHY_REG_1T2RArrayLengthPciE] = {
 	0xe1c, 0x12121416,
 };
 
-u32 Rtl8192PciERadioA_Array[RadioA_ArrayLengthPciE] = {
+u32 RTL8192E_RADIOA_ARRAY[RTL8192E_RADIOA_ARRAY_LEN] = {
 	0x019, 0x00000003,
 	0x000, 0x000000bf,
 	0x001, 0x00000ee0,
@@ -285,7 +285,7 @@ u32 Rtl8192PciERadioA_Array[RadioA_ArrayLengthPciE] = {
 	0x007, 0x00000700,
 };
 
-u32 Rtl8192PciERadioB_Array[RadioB_ArrayLengthPciE] = {
+u32 RTL8192E_RADIOB_ARRAY[RTL8192E_RADIOB_ARRAY_LEN] = {
 	0x019, 0x00000003,
 	0x000, 0x000000bf,
 	0x001, 0x000006e0,
@@ -327,13 +327,13 @@ u32 Rtl8192PciERadioB_Array[RadioB_ArrayLengthPciE] = {
 	0x007, 0x00000700,
 };
 
-u32 Rtl8192PciERadioC_Array[RadioC_ArrayLengthPciE] = {
+u32 RTL8192E_RADIOC_ARRAY[RTL8192E_RADIOC_ARRAY_LEN] = {
 	0x0,  };
 
-u32 Rtl8192PciERadioD_Array[RadioD_ArrayLengthPciE] = {
+u32 RTL8192E_RADIOD_ARRAY[RTL8192E_RADIOD_ARRAY_LEN] = {
 	0x0, };
 
-u32 Rtl8192PciEMACPHY_Array[] = {
+u32 RTL8192E_MAC_ARRAY[RTL8192E_MAC_ARRAY_LEN] = {
 	0x03c, 0xffff0000, 0x00000f0f,
 	0x340, 0xffffffff, 0x161a1a1a,
 	0x344, 0xffffffff, 0x12121416,
@@ -342,7 +342,7 @@ u32 Rtl8192PciEMACPHY_Array[] = {
 	0x318, 0x00000fff, 0x00000100,
 };
 
-u32 Rtl8192PciEMACPHY_Array_PG[] = {
+u32 RTL8192E_MAC_ARRAY_PG[RTL8192E_MAC_ARRAY_PG_LEN] = {
 	0x03c, 0xffff0000, 0x00000f0f,
 	0xe00, 0xffffffff, 0x06090909,
 	0xe04, 0xffffffff, 0x00030306,
@@ -355,7 +355,7 @@ u32 Rtl8192PciEMACPHY_Array_PG[] = {
 	0x318, 0x00000fff, 0x00000800,
 };
 
-u32 Rtl8192PciEAGCTAB_Array[AGCTAB_ArrayLengthPciE] = {
+u32 RTL8192E_AGC_TAB_ARRAY[RTL8192E_AGC_TAB_ARRAY_LEN] = {
 	0xc78, 0x7d000001,
 	0xc78, 0x7d010001,
 	0xc78, 0x7d020001,
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.h
index 7d63f5a5c1b7..a436c089a779 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.h
@@ -11,23 +11,23 @@
 
 #include <linux/types.h>
 
-#define PHY_REGArrayLengthPciE 1
-extern u32 Rtl8192PciEPHY_REGArray[PHY_REGArrayLengthPciE];
-#define PHY_REG_1T2RArrayLengthPciE 296
-extern u32 Rtl8192PciEPHY_REG_1T2RArray[PHY_REG_1T2RArrayLengthPciE];
-#define RadioA_ArrayLengthPciE 246
-extern u32 Rtl8192PciERadioA_Array[RadioA_ArrayLengthPciE];
-#define RadioB_ArrayLengthPciE 78
-extern u32 Rtl8192PciERadioB_Array[RadioB_ArrayLengthPciE];
-#define RadioC_ArrayLengthPciE 2
-extern u32 Rtl8192PciERadioC_Array[RadioC_ArrayLengthPciE];
-#define RadioD_ArrayLengthPciE 2
-extern u32 Rtl8192PciERadioD_Array[RadioD_ArrayLengthPciE];
-#define MACPHY_ArrayLengthPciE 18
-extern u32 Rtl8192PciEMACPHY_Array[MACPHY_ArrayLengthPciE];
-#define MACPHY_Array_PGLengthPciE 30
-extern u32 Rtl8192PciEMACPHY_Array_PG[MACPHY_Array_PGLengthPciE];
-#define AGCTAB_ArrayLengthPciE 384
-extern u32 Rtl8192PciEAGCTAB_Array[AGCTAB_ArrayLengthPciE];
+#define RTL8192E_PHY_REG_ARRAY_LEN 1
+extern u32 RTL8192E_PHY_REG_ARRAY[RTL8192E_PHY_REG_ARRAY_LEN];
+#define RTL8192E_PHY_REG_1T2R_ARRAY_LEN 296
+extern u32 RTL8192E_PHY_REG_1T2R_ARRAY[RTL8192E_PHY_REG_1T2R_ARRAY_LEN];
+#define RTL8192E_RADIOA_ARRAY_LEN 246
+extern u32 RTL8192E_RADIOA_ARRAY[RTL8192E_RADIOA_ARRAY_LEN];
+#define RTL8192E_RADIOB_ARRAY_LEN 78
+extern u32 RTL8192E_RADIOB_ARRAY[RTL8192E_RADIOB_ARRAY_LEN];
+#define RTL8192E_RADIOC_ARRAY_LEN 2
+extern u32 RTL8192E_RADIOC_ARRAY[RTL8192E_RADIOC_ARRAY_LEN];
+#define RTL8192E_RADIOD_ARRAY_LEN 2
+extern u32 RTL8192E_RADIOD_ARRAY[RTL8192E_RADIOD_ARRAY_LEN];
+#define RTL8192E_MAC_ARRAY_LEN 18
+extern u32 RTL8192E_MAC_ARRAY[RTL8192E_MAC_ARRAY_LEN];
+#define RTL8192E_MAC_ARRAY_PG_LEN 30
+extern u32 RTL8192E_MAC_ARRAY_PG[RTL8192E_MAC_ARRAY_PG_LEN];
+#define RTL8192E_AGC_TAB_ARRAY_LEN 384
+extern u32 RTL8192E_AGC_TAB_ARRAY[RTL8192E_AGC_TAB_ARRAY_LEN];
 
 #endif
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
index 75629f5df954..e1c1f19b71a3 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
@@ -9,25 +9,25 @@
 
 #define MAX_DOZE_WAITING_TIMES_9x 64
 
-#define AGCTAB_ArrayLength			AGCTAB_ArrayLengthPciE
-#define MACPHY_ArrayLength			MACPHY_ArrayLengthPciE
-#define RadioA_ArrayLength			RadioA_ArrayLengthPciE
-#define RadioB_ArrayLength			RadioB_ArrayLengthPciE
-#define MACPHY_Array_PGLength			MACPHY_Array_PGLengthPciE
-#define RadioC_ArrayLength			RadioC_ArrayLengthPciE
-#define RadioD_ArrayLength			RadioD_ArrayLengthPciE
-#define PHY_REGArrayLength			PHY_REGArrayLengthPciE
-#define PHY_REG_1T2RArrayLength			PHY_REG_1T2RArrayLengthPciE
+#define AGCTAB_ArrayLength			RTL8192E_AGC_TAB_ARRAY_LEN
+#define MACPHY_ArrayLength			RTL8192E_MAC_ARRAY_LEN
+#define RadioA_ArrayLength			RTL8192E_RADIOA_ARRAY_LEN
+#define RadioB_ArrayLength			RTL8192E_RADIOB_ARRAY_LEN
+#define MACPHY_Array_PGLength			RTL8192E_MAC_ARRAY_PG_LEN
+#define RadioC_ArrayLength			RTL8192E_RADIOC_ARRAY_LEN
+#define RadioD_ArrayLength			RTL8192E_RADIOD_ARRAY_LEN
+#define PHY_REGArrayLength			RTL8192E_PHY_REG_ARRAY_LEN
+#define PHY_REG_1T2RArrayLength			RTL8192E_PHY_REG_1T2R_ARRAY_LEN
 
-#define Rtl819XMACPHY_Array_PG			Rtl8192PciEMACPHY_Array_PG
-#define Rtl819XMACPHY_Array			Rtl8192PciEMACPHY_Array
-#define Rtl819XRadioA_Array			Rtl8192PciERadioA_Array
-#define Rtl819XRadioB_Array			Rtl8192PciERadioB_Array
-#define Rtl819XRadioC_Array			Rtl8192PciERadioC_Array
-#define Rtl819XRadioD_Array			Rtl8192PciERadioD_Array
-#define Rtl819XAGCTAB_Array			Rtl8192PciEAGCTAB_Array
-#define Rtl819XPHY_REGArray			Rtl8192PciEPHY_REGArray
-#define Rtl819XPHY_REG_1T2RArray		Rtl8192PciEPHY_REG_1T2RArray
+#define Rtl819XMACPHY_Array_PG			RTL8192E_MAC_ARRAY_PG
+#define Rtl819XMACPHY_Array			RTL8192E_MAC_ARRAY
+#define Rtl819XRadioA_Array			RTL8192E_RADIOA_ARRAY
+#define Rtl819XRadioB_Array			RTL8192E_RADIOB_ARRAY
+#define Rtl819XRadioC_Array			RTL8192E_RADIOC_ARRAY
+#define Rtl819XRadioD_Array			RTL8192E_RADIOD_ARRAY
+#define Rtl819XAGCTAB_Array			RTL8192E_AGC_TAB_ARRAY
+#define Rtl819XPHY_REGArray			RTL8192E_PHY_REG_ARRAY
+#define Rtl819XPHY_REG_1T2RArray		RTL8192E_PHY_REG_1T2R_ARRAY
 
 extern u32 rtl819XAGCTAB_Array[];
 
-- 
2.34.1

