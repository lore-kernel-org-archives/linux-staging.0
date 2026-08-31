Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C1335C68C
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 02:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788141975; cv=none; b=WX3RFmBi9YrDXPOHBX+A7MljC0n0ishmdzoj20lmY77+/1imnJZSmytB2Q2sR7PMljjSfYxBuWcfGUfJIFp1R9zJ0XDQtoGiaySF9OCxWUnAZrijtF4DftBxwfCbHHRFGvN4ztJTfo2+o0LiwPS/NamBvyd1yVxfWONjFhwQlEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788141975; c=relaxed/simple;
	bh=MyUsmlPrjFa9G9tFhdDf0OLhVbhTnza+J8rFfTrbiQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lS8gM4diCJygLsbrCecEPJsbbYD3eXTxAXqEgku6jD1GLW6JNHUgWlHzuh8Zc6YyXyCJ2e4r+G0LPaGJR0dZyVymuxsufhg/VXP8DW89DdNjRvQ60nRLJ1l1Y7/fLwwxgClQuSjRN7fhertJsifJzGSbaiKMDtJYWdOPfKjf7Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7bxrfqY; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7bxrfqY"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-754ac74c495so877299137.0
        for <linux-staging@lists.linux.dev>; Sun, 30 Aug 2026 19:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788141973; x=1788746773; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74zrCdqnpgkTZC+gQBTbytn1uqCFGAy5HSmBiXdJznM=;
        b=X7bxrfqYkRQWqPca6mWuDx6fQI52l8wOsdNv/zTWioM2Ly51SPrnVgTG99U+toQl5o
         XFoguD2vOV6soVt3srzoksL4lXleg8StMwz+uik8UkznfHhtvD60IhDLLoAZxK10EgfE
         0ykLPtsCAbzO1WTphxe8hpvWmJdQBEY6H2jZkcPobnuz7Du0sG0/pYfLLNcdW/+8TN7v
         i/wVjBiDQD1APlga3qdQ10vpH+daloF9Y657+a09vXwwdsd7z3QnRx6aEQK9CsPLRTdb
         PrvhIoa06kq5bdeNuUw5sNWVL9q4bZklDdbasP5kXJ4uHUgLTpiQOLaBwsVILmd/Z6AZ
         sXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788141973; x=1788746773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74zrCdqnpgkTZC+gQBTbytn1uqCFGAy5HSmBiXdJznM=;
        b=kRDCf8HableOlRR4COcs2Yi+Vfdt2qoTy5yYSKVhz0tmWz7TeoRN9uvlGaObrw2xmu
         QyXuZhOlLvT/z8V0JMI47S/MKXqk2H+3xtl2noxo4HIQnjBGmQd1rRsHnqpdtAwjnv3g
         mZLQ81YcecFO3UlzJX4x3G6xgwQiEVmnvZjCXV04lCI5F6vMMKCB5kki1l1eWGhB8nxJ
         cNHdXtSvUguO9Q5GJRPYnxddUiMAHkKFwJowalQM1NU0R4kHRPv9C/VcWuwjnC4kSyP8
         HXH1H9lbeBJHP2C02fdMcQE3fM1kMFLq9EBb+bTGUzT6Ut6yZE2TK8/7Y9RdOZgTCLls
         BVrA==
X-Gm-Message-State: AFuF++mLrCq8hts535rjqMcTA2zoPtHFQCh/aDkfy1caKm+2pYs7PBJ4
	opgrdS87E/Fl1Zaj4FaeltyKxR/+o2EBUC28rEpJOa6q+yU0DGfe9Qwe7bdE0pYu
X-Gm-Gg: AR+sD131r80sa1MG/XB4cKy/T4f1rp2EzsTBUGLAtvTK4fwdAeu15dOPXMIOgodLtfm
	UKVH7ugqiTRzjRngUkPmJ78JJroY8ErQFZcyPOCWlRIVkF1hg5aBjVJORfXCNenNDdfywbwB1tE
	njmtTFHg+4ZCYvVow6L3P3paiGUmEmGggiG24l4T1gS8dAJuQZcjccCTGpjr22+Bwid6JNCD4b8
	u51hjQDPpopP0D8jUf3tC1OA4lBdIhhsbaNOZCDlqM5NAXYuf/M/7+sXgezQhXfTM3+X9WQxbhv
	xLK7C5oyzdcWelVTlIFj0yNSJ6U83XkvG0FuBMwoWAZsE4HM1+UsOKHl/sSfn7fYDGgZFGXYoNc
	5aXcCsqd74pk61ydFzDGHtem748QuqDwiv0cy7VM1SKC2qp9/RRCKfLqfX99OLuYGYitqYkNiuW
	ntL7y7ieSTdOG63riQRwdUhby9N5FDnfBqxaGKj9fw/H+VuBOL6j1t
X-Received: by 2002:a05:6102:38c6:b0:76f:eaa2:6fa7 with SMTP id ada2fe7eead31-78595aa7320mr6706560137.2.1788141972762;
        Sun, 30 Aug 2026 19:06:12 -0700 (PDT)
Received: from adriano ([190.215.95.120])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f532aafcsm5875214137.1.2026.08.30.19.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:06:12 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: remove unused chip-type enums and defines
Date: Sun, 30 Aug 2026 22:05:57 -0400
Message-ID: <20260831020557.1235504-3-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260831020557.1235504-1-adrianox@gmail.com>
References: <20260831020557.1235504-1-adrianox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove enums and defines left over from other Realtek chips:

  - the RF_8225, RF_8256, RF_8258, RF_6052 and RF_PSEUDO_11N RF-type
    enum
  - TX_2S, TX_3S and TX_4S
  - RF_PATH_MAX_92C_88E and RF_PATH_MAX_90_8812
  - TX_POWER_NEAR_FIELD_THRESH_8812
  - ODM_ITRF_ALL

None of them is referenced anywhere in the driver.

Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h              |  1 -
 .../staging/rtl8723bs/hal/odm_DynamicTxPower.h   |  1 -
 drivers/staging/rtl8723bs/include/hal_phy.h      | 16 ----------------
 3 files changed, 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index d29eaba41d..b123df98fa 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -382,7 +382,6 @@ enum { /* _ODM_Support_Ability_Definition */
 /* 	ODM_CMNINFO_INTERFACE */
 enum { /* tag_ODM_Support_Interface_Definition */
 	ODM_ITRF_SDIO	=	0x4,
-	ODM_ITRF_ALL	=	0x7,
 };
 
 /*  ODM_CMNINFO_IC_TYPE */
diff --git a/drivers/staging/rtl8723bs/hal/odm_DynamicTxPower.h b/drivers/staging/rtl8723bs/hal/odm_DynamicTxPower.h
index e2d244324e..4431a3ddf1 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DynamicTxPower.h
+++ b/drivers/staging/rtl8723bs/hal/odm_DynamicTxPower.h
@@ -11,7 +11,6 @@
 #define		TX_POWER_NEAR_FIELD_THRESH_LVL2	74
 #define		TX_POWER_NEAR_FIELD_THRESH_LVL1	67
 #define		TX_POWER_NEAR_FIELD_THRESH_AP		0x3F
-#define		TX_POWER_NEAR_FIELD_THRESH_8812	60
 
 #define		TxHighPwrLevel_Normal		0
 #define		TxHighPwrLevel_Level1		1
diff --git a/drivers/staging/rtl8723bs/include/hal_phy.h b/drivers/staging/rtl8723bs/include/hal_phy.h
index abc0f27fda..ec9bc47816 100644
--- a/drivers/staging/rtl8723bs/include/hal_phy.h
+++ b/drivers/staging/rtl8723bs/include/hal_phy.h
@@ -17,16 +17,6 @@
 
 
 /*--------------------------Define Parameters-------------------------------*/
-enum {
-	RF_TYPE_MIN = 0,	/*  0 */
-	RF_8225 = 1,		/*  1 11b/g RF for verification only */
-	RF_8256 = 2,		/*  2 11b/g/n */
-	RF_8258 = 3,		/*  3 11a/b/g/n RF */
-	RF_6052 = 4,		/*  4 11b/g/n RF */
-	RF_PSEUDO_11N = 5,	/*  5, It is a temporality RF. */
-	RF_TYPE_MAX
-};
-
 enum rf_path {
 	RF_PATH_A = 0,
 	RF_PATH_B,
@@ -34,12 +24,6 @@ enum rf_path {
 };
 
 #define	TX_1S			0
-#define	TX_2S			1
-#define	TX_3S			2
-#define	TX_4S			3
-
-#define	RF_PATH_MAX_92C_88E		2
-#define	RF_PATH_MAX_90_8812		4	/* Max RF number 90 support */
 
 enum wireless_mode {
 	WIRELESS_MODE_UNKNOWN = 0x00,
-- 
2.51.0

