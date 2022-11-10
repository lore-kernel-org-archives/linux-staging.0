Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC52185E
	for <linux-staging@lists.linux.dev>; Thu, 10 Nov 2022 10:35:24 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id e129so1394368pgc.9
        for <linux-staging@lists.linux.dev>; Thu, 10 Nov 2022 02:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B9QXzhrLhDW3RHcvqKL2KC0I9EowigNO1qRdY6DDV+A=;
        b=MuPr3tbfbxFkIWMMj5tUNTNIGbc7kJOLypJtpArKx7JWS2Q9tjNs37jv1Mtwx79lqR
         IoEJTG52Rzo4UWCWhWbKfA44s9sddH8BpnqdU8d8mzJfFdZdpmA65Bjn5wk7DE/HzDlI
         70DjIXIZABnNq8qUTU8kIKKX3Juqnbo0Q0UXWgqPs8IpXY2nF4wFtRPI0HWy0MfEkcin
         U0baAVdodfnM7OMGrOyGS/EvPg3b4eRliPCNX5NzZSU0qsM7FcUY7vOKtX9Fv3HrIgSs
         Nbc3zSP//xTVfq3UAeWly8bj561qHkN5P71wp8crK4jvqMY7qwABamSycSNCebu5EdTc
         PK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B9QXzhrLhDW3RHcvqKL2KC0I9EowigNO1qRdY6DDV+A=;
        b=hU9XpKFOSFS6weboKxVCv21THa8Uy8CMlqbLMpzC4LC4bwzgfPwkgJIJCNDDHqxNKa
         Ypt/7q+Coow/vgQ4vUO28y5mEo2NXFBBy4Na1pq3LAi0Ux4B5vvWqDg1nO165IlSo2wr
         FVOuFWe2hsCkceVQIs2EvpJYu57XWAJxeZNupSC5GcUmv8IirkkwNNzVJejmW2nPUvPM
         jw9FVKWY0n7jXqIbQS68La2biXmotEO1jJTfytDLkmW6gl9YrkvOBT04NM0W+HLLj4Y6
         pSMo9KP1NPZyVrcXwf0LLL4mVip2mmwRkP0Csz4EgOeEy8q3JFS8Xl4EesoxjW97H0C+
         P4MA==
X-Gm-Message-State: ACrzQf2GOeG14NS6Okwk34jNcwP4KluA/+Wy7+lBEAeDI7F8JCVkt3Iq
	xx/VtFmW8j1AzPlVu1b0Okhs4hkX2BvZHg==
X-Google-Smtp-Source: AMsMyM6QJREfZqusAXyfOgA/K+7oaTU3V8Bs9Q1kaKbp/uTWUQ+YjLpIZGBXEswaL5EmuUFiN7fUFA==
X-Received: by 2002:a63:90c4:0:b0:46f:5a21:3b5d with SMTP id a187-20020a6390c4000000b0046f5a213b5dmr40523313pge.210.1668076523572;
        Thu, 10 Nov 2022 02:35:23 -0800 (PST)
Received: from jacob-Ubuntu (126.224.215.218.sta.wbroadband.net.au. [218.215.224.126])
        by smtp.gmail.com with ESMTPSA id n4-20020a63e044000000b0044e8d66ae05sm8879450pgj.22.2022.11.10.02.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 02:35:23 -0800 (PST)
From: Jacob Bai <jacob.bai.au@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] staging: rtl8192e: replace macro defines with variables
Date: Thu, 10 Nov 2022 21:35:11 +1100
Message-Id: <354847ce7b2f9ea4dc549bf13656192c1db7c231.1668075486.git.jacob.bai.au@gmail.com>
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

remove marco defines of array length, use variables instead and
initialize them from ARRAY_SIZE().

Signed-off-by: Jacob Bai <jacob.bai.au@gmail.com>
---
 .../staging/rtl8192e/rtl8192e/r8192E_hwimg.c  | 31 ++++++++++------
 .../staging/rtl8192e/rtl8192e/r8192E_hwimg.h  | 36 +++++++++----------
 .../staging/rtl8192e/rtl8192e/r8192E_phy.h    | 20 -----------
 3 files changed, 38 insertions(+), 49 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.c
index 8920283f340e..ec9e2de4c942 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.c
@@ -6,9 +6,10 @@
  */
 #include "r8192E_hwimg.h"
 
-u32 RTL8192E_PHY_REG_ARRAY[RTL8192E_PHY_REG_ARRAY_LEN] = {0x0,};
+u32 RTL8192E_PHY_REG_ARRAY[] = {0x0,};
+u32 RTL8192E_PHY_REG_ARRAY_LEN = ARRAY_SIZE(RTL8192E_PHY_REG_ARRAY);
 
-u32 RTL8192E_PHY_REG_1T2R_ARRAY[RTL8192E_PHY_REG_1T2R_ARRAY_LEN] = {
+u32 RTL8192E_PHY_REG_1T2R_ARRAY[] = {
 	0x800, 0x00000000,
 	0x804, 0x00000001,
 	0x808, 0x0000fc00,
@@ -158,8 +159,9 @@ u32 RTL8192E_PHY_REG_1T2R_ARRAY[RTL8192E_PHY_REG_1T2R_ARRAY_LEN] = {
 	0xe18, 0x161a1a1a,
 	0xe1c, 0x12121416,
 };
+u32 RTL8192E_PHY_REG_1T2R_ARRAY_LEN = ARRAY_SIZE(RTL8192E_PHY_REG_1T2R_ARRAY);
 
-u32 RTL8192E_RADIOA_ARRAY[RTL8192E_RADIOA_ARRAY_LEN] = {
+u32 RTL8192E_RADIOA_ARRAY[] = {
 	0x019, 0x00000003,
 	0x000, 0x000000bf,
 	0x001, 0x00000ee0,
@@ -284,8 +286,9 @@ u32 RTL8192E_RADIOA_ARRAY[RTL8192E_RADIOA_ARRAY_LEN] = {
 	0x004, 0x00000975,
 	0x007, 0x00000700,
 };
+u32 RTL8192E_RADIOA_ARRAY_LEN = ARRAY_SIZE(RTL8192E_RADIOA_ARRAY);
 
-u32 RTL8192E_RADIOB_ARRAY[RTL8192E_RADIOB_ARRAY_LEN] = {
+u32 RTL8192E_RADIOB_ARRAY[] = {
 	0x019, 0x00000003,
 	0x000, 0x000000bf,
 	0x001, 0x000006e0,
@@ -326,14 +329,17 @@ u32 RTL8192E_RADIOB_ARRAY[RTL8192E_RADIOB_ARRAY_LEN] = {
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
@@ -341,8 +347,9 @@ u32 RTL8192E_MAC_ARRAY[RTL8192E_MAC_ARRAY_LEN] = {
 	0x12c, 0xffffffff, 0x04000802,
 	0x318, 0x00000fff, 0x00000100,
 };
+u32 RTL8192E_MAC_ARRAY_LEN = ARRAY_SIZE(RTL8192E_MAC_ARRAY);
 
-u32 RTL8192E_MAC_ARRAY_PG[RTL8192E_MAC_ARRAY_PG_LEN] = {
+u32 RTL8192E_MAC_ARRAY_PG[] = {
 	0x03c, 0xffff0000, 0x00000f0f,
 	0xe00, 0xffffffff, 0x06090909,
 	0xe04, 0xffffffff, 0x00030306,
@@ -354,8 +361,9 @@ u32 RTL8192E_MAC_ARRAY_PG[RTL8192E_MAC_ARRAY_PG_LEN] = {
 	0x12c, 0xffffffff, 0x04000802,
 	0x318, 0x00000fff, 0x00000800,
 };
+u32 RTL8192E_MAC_ARRAY_PG_LEN = ARRAY_SIZE(RTL8192E_MAC_ARRAY_PG);
 
-u32 RTL8192E_AGC_TAB_ARRAY[RTL8192E_AGC_TAB_ARRAY_LEN] = {
+u32 RTL8192E_AGC_TAB_ARRAY[] = {
 	0xc78, 0x7d000001,
 	0xc78, 0x7d010001,
 	0xc78, 0x7d020001,
@@ -549,3 +557,4 @@ u32 RTL8192E_AGC_TAB_ARRAY[RTL8192E_AGC_TAB_ARRAY_LEN] = {
 	0xc78, 0x693e001e,
 	0xc78, 0x6a3f001e,
 };
+u32 RTL8192E_AGC_TAB_ARRAY_LEN = ARRAY_SIZE(RTL8192E_AGC_TAB_ARRAY);
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.h
index a436c089a779..9d2537806460 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hwimg.h
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
-- 
2.34.1

