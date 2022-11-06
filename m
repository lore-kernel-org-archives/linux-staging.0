Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF9D7F
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 01:11:54 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id s196so7523803pgs.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Nov 2022 18:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XN+Q6Uz1Z9DwS84wbHOEHzmi43ielaLqgyLWhdiQqew=;
        b=lJRUavAgJlRY5aixkL78+mU7fHHMZ7XzcjuhQZ48ULo2VueXubRTP64zOeAdJpSx7X
         c79u4M3V5lpm+4PiTBnFC3+fp6A+zNRt/i14m/B6Iqdx84Tz3CxyVOwFl9cdLCVOa3bY
         Z1SfAjc4p2pwZf0e1wLZI2jJ6d5aVJtyGvBxomfHiu94vOmNes18Xrq1HrhWKBfHeF0J
         OYD1Nq5yDlNu3r/N1DoLFwAsyqYVVd3sPRzx5tEnxFHbo00gQYm4RPqVgPmWBSLJzm8c
         xEQr7Rw3nDRjDgU+lzjAksaYrJNQFswmEsc1C34FFgzk6mO7SDzJlb1QgOoijosYoVDq
         1zqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XN+Q6Uz1Z9DwS84wbHOEHzmi43ielaLqgyLWhdiQqew=;
        b=EJXLsvbbkr0is6YE8yRWxk7BHph4mZD2HjhqVH66w+8Z9PssyFRROhJC8LIgUvIkkz
         OFOO58pxZuClRr7YkjUOtuSrPDhm2TIseJ39A6E89TazpbAVOJAQoFhoYa2gj/j1yHdb
         oPaIW5jnZFT9VBh4RTCoMIbVYc/E+9SfDmZCSyUobHYypuOV66ShoWPRL6CEuUhGLnlo
         82lzyLh7USrLteyHEoX7A97bN2jVeKlhOuCvm3QFrcIN8CfmhALdgNiiN19LjobHQ8D1
         gaUMwv445nMweyTXtbCqNZSV7mUA9QmFoJqilIvZNwT5uW5bbRdVa54Hj8fQ8G2K1cKN
         RuXA==
X-Gm-Message-State: ACrzQf0F76ForN5lZ/ZNo2xtmx/w2UGA3Z634bnx+WHjn1dqnHAElTk7
	0mgZlzTgsPd290qIzgMqFODnVImasMLXcs/G
X-Google-Smtp-Source: AMsMyM5kj68jKTl7zJ/aA1Gf16DVSOyd2WbUHCoKuyR62mswO0viNDseknW04AQZM3kMKAjn/fosNA==
X-Received: by 2002:a63:194b:0:b0:457:7295:8de0 with SMTP id 11-20020a63194b000000b0045772958de0mr37560668pgz.612.1667697113947;
        Sat, 05 Nov 2022 18:11:53 -0700 (PDT)
Received: from jacob-Ubuntu (126.224.215.218.sta.wbroadband.net.au. [218.215.224.126])
        by smtp.gmail.com with ESMTPSA id ij11-20020a170902ab4b00b001853e6d6179sm2254819plb.162.2022.11.05.18.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 18:11:53 -0700 (PDT)
From: Jacob Bai <jacob.bai.au@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jacob Bai <jacob.bai.au@gmail.com>
Subject: [PATCH v2 1/3] staging: rtl8192e: rename tables in r8192e_hwimg.c
Date: Sun,  6 Nov 2022 12:11:43 +1100
Message-Id: <01eb4d9cb22be5f76aa39eedd406577cdfd9f486.1667694826.git.jacob.bai.au@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667694826.git.jacob.bai.au@gmail.com>
References: <cover.1667694826.git.jacob.bai.au@gmail.com>
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

