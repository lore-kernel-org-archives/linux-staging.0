Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C90533B6F9
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 16:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702684; cv=none; b=GqbTATJpigG1ztkUsgovhMUU5R0a+c1gDGkGp9pbrQ8dzV9wkccoQNIbA3Tir8ld4yu09I1j9gcHWc9UFQoPjvllOeGff3TcRSoF/o6sNUzRcMDEc7q3YQ65+kx4x1ajwwPqJ5tEtuCFLJHTCLk/ecizwzH78n0YBwAvtCjDnvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702684; c=relaxed/simple;
	bh=pUp+c6LTDlpKVOYcI/ycGERoQP85AZkoROMK1FDTJ1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KjYsfE3BiW2GEwwvjtETeEt66C1qwFOIzUBC2Z8YgeMun9RpQaUD+l8opf35im9IaEv/tqWG7Hxlq+7muIKJcbXribD2UylCpTPnlsLVUYLWl7hHtjtB+eUqYRAnMz9KSejX+nQ8Y0Xf7eU/anH5J7IIVlNOW0u4MJwWGXfZ3t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xv+IzKbF; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xv+IzKbF"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806f80cac9so7406125e9.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 08:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769702681; x=1770307481; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwLJT/eb1tpcmkJAI7RUjujsGl2skEe6JBPlya1TjJU=;
        b=Xv+IzKbFetFptg/mxnx3h1xalLRnaTtq+RmcOcAaTtL+BtDxYiVKX79u4ATr8rMizt
         bnZKxWar/iVYi/hAOagFstMK8TJKDnedyI0MxU1OiARfMdTdjGTIcUbZEXFfzdavpySS
         j9e/Gweg/Kc1Zr7Gj2KccWWy1DLBBkOHmc7sl9AjyTfrTfBWHly2EjgisEOmko232ms2
         yLW9kmcN5LiJHbrQGAAKDjxHziL19vlF3XFX7ir5u924CcbqWmFAavU9688SxsFCviI1
         demsTcHKeDh4M7btep5RV93uAl5C55llR1Uu/6REf3CE2IxgEnDpuNbFvKzZvpSCpuZL
         Ccig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769702681; x=1770307481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FwLJT/eb1tpcmkJAI7RUjujsGl2skEe6JBPlya1TjJU=;
        b=nk2O6pewtpLEyzKoqNXTzJOhi4uDx+ne1iCbHJBsG04qbEJnrAY2TYvN8JbXIL87Q4
         LP3wvfoROoH++P6K+O1KhQjF2RrfmC0rrjOvDZ8VpZShAlMnMjHfo5pCTQkXXh3Z3YQC
         d8SCJYRLKXArSfhvUwjfz07l52vDTbfvXKIt7sQ6IQpTz5ottA5Q7nOqRPjrdGimaUGj
         XET2pP7xut7bVqBwhYNNQf4qz6Gv3D9ApCWURDacdVzGDhUohIoIuw/OKftNyJ0gVrlK
         PrZIAXksHJ4dMFvkJP3bzGlvJ3KhTgrqsX9gCL2oSmesbDyYplREYOUU2ele+kiD5o7g
         CxXA==
X-Gm-Message-State: AOJu0YxEzmHU9xwltKvh/yiUDXRr8Lqn6qUtbnoa3m/6H7O+XT/R/t3e
	YVkDvEcqycTqmI3XjGkCOIhybSj10uz6CWeGmBaXso7Rl0SFtuLhVNh0
X-Gm-Gg: AZuq6aLd8kBxJBrl1peIbRMqFHV6zhdsV9kUB72rB+pTMFktQXpfAPh7d8Xd7ZEaqCH
	21OftPKaS28XJCV/eFicusaBguK/lJ8XWprHH4zSVFuY8nB7ITOaKO4tTSzgMM8lkdFGjSJfDCb
	GZpY8emsPi+a3a0obbyn6IyEkmPZ222ew5PZgL9kX0XT8AIxgtuPw1vfEqZbVD/obBEXccpkiNl
	EDo/t62nIGfnKhuwfkvNEUPHq3DN4tAiXFdmQFF4qXbBYGZp/QnCqiZvSsBZVGs4yy6ES55o4Gb
	7K0rMvbLvmpyYsJ23D6c8E5ESKFqUjMc03t+DfjX/ztSpk1jJJzjpKi2jgwimwIL9i6FuEoZHB+
	G981fEhzaSLXp4V5TzxReXG8WW2Ah1Wy29oFt2CF8clXEyBXpLxuKhG4erhjvaE0TOaKe2jomc0
	myM9R2xZU1afJ+Xab9H7FSXdWwOBWzZs7uL46UQZE+huuSiDQiGg==
X-Received: by 2002:a05:600c:8b16:b0:475:de14:db1e with SMTP id 5b1f17b1804b1-48069c8c0d2mr127173095e9.24.1769702680506;
        Thu, 29 Jan 2026 08:04:40 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c515sm135883175e9.11.2026.01.29.08.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 08:04:40 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mahad.ibrahim.dev@gmail.com
Subject: [PATCH v3 5/5] staging: rtl8723bs: standardize comment style in HAL
Date: Thu, 29 Jan 2026 21:04:26 +0500
Message-ID: <20260129160426.13737-6-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260129160426.13737-1-mahad.ibrahim.dev@gmail.com>
References: <20260129160426.13737-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel coding style for comments requires a single space after the
"/*". Currently, many files in HAL contain two spaces after the "/*", or
use irregular indentation. The modified files also suffer from this.

Fix line comment style inconsistencies by removing additional space after
"/*" to adhere to kernel coding standards.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 .../staging/rtl8723bs/hal/HalHWImg8723B_BB.c  | 54 +++++++++----------
 .../staging/rtl8723bs/hal/HalHWImg8723B_MAC.c | 32 +++++------
 2 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
index 988636a16112..4666b2ff3157 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
@@ -11,11 +11,11 @@
 static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const u32 Condition2)
 {
 	u8 _BoardType =
-		((pDM_Odm->BoardType & BIT4) >> 4) << 0 | /*  _GLNA */
-		((pDM_Odm->BoardType & BIT3) >> 3) << 1 | /*  _GPA */
-		((pDM_Odm->BoardType & BIT7) >> 7) << 2 | /*  _ALNA */
-		((pDM_Odm->BoardType & BIT6) >> 6) << 3 | /*  _APA */
-		((pDM_Odm->BoardType & BIT2) >> 2) << 4;  /*  _BT */
+		((pDM_Odm->BoardType & BIT4) >> 4) << 0 | /* _GLNA */
+		((pDM_Odm->BoardType & BIT3) >> 3) << 1 | /* _GPA */
+		((pDM_Odm->BoardType & BIT7) >> 7) << 2 | /* _ALNA */
+		((pDM_Odm->BoardType & BIT6) >> 6) << 3 | /* _APA */
+		((pDM_Odm->BoardType & BIT2) >> 2) << 4;  /* _BT */
 
 	u32 cond1 = Condition1, cond2 = Condition2;
 	u32 driver1 =
@@ -31,7 +31,7 @@ static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const
 		pDM_Odm->TypeALNA << 16 |
 		pDM_Odm->TypeAPA << 24;
 
-	/*  Value Defined Check =============== */
+	/* Value Defined Check =============== */
 	/* QFN Type [15:12] and Cut Version [27:24] need to do value check */
 
 	if (((cond1 & 0x0000F000) != 0) && ((cond1 & 0x0000F000) != (driver1 & 0x0000F000)))
@@ -39,16 +39,16 @@ static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const
 	if (((cond1 & 0x0F000000) != 0) && ((cond1 & 0x0F000000) != (driver1 & 0x0F000000)))
 		return false;
 
-	/*  Bit Defined Check ================ */
-	/*  We don't care [31:28] and [23:20] */
-	/*  */
+	/* Bit Defined Check ================ */
+	/* We don't care [31:28] and [23:20] */
+	/* */
 	cond1   &= 0x000F0FFF;
 	driver1 &= 0x000F0FFF;
 
 	if ((cond1 & driver1) == cond1) {
 		u32 bitMask = 0;
 
-		if ((cond1 & 0x0F) == 0) /*  BoardType is DONTCARE */
+		if ((cond1 & 0x0F) == 0) /* BoardType is DONTCARE */
 			return true;
 
 		if ((cond1 & BIT0) != 0) /* GLNA */
@@ -60,7 +60,7 @@ static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const
 		if ((cond1 & BIT3) != 0) /* APA */
 			bitMask |= 0xFF000000;
 
-		/*  BoardType of each RF path is matched */
+		/* BoardType of each RF path is matched */
 		if ((cond2 & bitMask) == (driver2 & bitMask))
 			return true;
 	}
@@ -216,16 +216,16 @@ void ODM_ReadAndConfig_MP_8723B_AGC_TAB(struct dm_odm_t *pDM_Odm)
 		u32 v1 = Array[i];
 		u32 v2 = Array[i + 1];
 
-		/*  This (offset, data) pair doesn't care the condition. */
+		/* This (offset, data) pair doesn't care the condition. */
 		if (v1 < 0x40000000) {
 			odm_ConfigBB_AGC_8723B(pDM_Odm, v1, bMaskDWord, v2);
 			continue;
 		} else {
-			/*  This line is the beginning of branch. */
+			/* This line is the beginning of branch. */
 			bool bMatched = true;
 			u8  cCond  = (u8)((v1 & (BIT29 | BIT28)) >> 28);
 
-			if (cCond == COND_ELSE) { /*  ELSE, ENDIF */
+			if (cCond == COND_ELSE) { /* ELSE, ENDIF */
 				bMatched = true;
 				READ_NEXT_PAIR(v1, v2, i);
 			} else if (!CheckPositive(pDM_Odm, v1, v2)) {
@@ -240,21 +240,21 @@ void ODM_ReadAndConfig_MP_8723B_AGC_TAB(struct dm_odm_t *pDM_Odm)
 
 			if (!bMatched) {
 				/*
-				 *   Condition isn't matched.
-				 *   Discard the following (offset, data) pairs.
+				 * Condition isn't matched.
+				 * Discard the following (offset, data) pairs.
 				 */
 				while (v1 < 0x40000000 && i < ArrayLen - 2)
 					READ_NEXT_PAIR(v1, v2, i);
 
-				i -= 2; /*  prevent from for-loop += 2 */
+				i -= 2; /* prevent from for-loop += 2 */
 			} else {
-				/*  Configure matched pairs and skip to end of if-else. */
+				/* Configure matched pairs and skip to end of if-else. */
 				while (v1 < 0x40000000 && i < ArrayLen - 2) {
 					odm_ConfigBB_AGC_8723B(pDM_Odm, v1, bMaskDWord, v2);
 					READ_NEXT_PAIR(v1, v2, i);
 				}
 
-				/*  Keeps reading until ENDIF. */
+				/* Keeps reading until ENDIF. */
 				cCond = (u8)((v1 & (BIT29 | BIT28)) >> 28);
 				while (cCond != COND_ENDIF && i < ArrayLen - 2) {
 					READ_NEXT_PAIR(v1, v2, i);
@@ -476,16 +476,16 @@ void ODM_ReadAndConfig_MP_8723B_PHY_REG(struct dm_odm_t *pDM_Odm)
 		u32 v1 = Array[i];
 		u32 v2 = Array[i + 1];
 
-		/*  This (offset, data) pair doesn't care the condition. */
+		/* This (offset, data) pair doesn't care the condition. */
 		if (v1 < 0x40000000) {
 			odm_ConfigBB_PHY_8723B(pDM_Odm, v1, bMaskDWord, v2);
 			continue;
 		} else {
-			/*  This line is the beginning of branch. */
+			/* This line is the beginning of branch. */
 			bool bMatched = true;
 			u8  cCond  = (u8)((v1 & (BIT29 | BIT28)) >> 28);
 
-			if (cCond == COND_ELSE) { /*  ELSE, ENDIF */
+			if (cCond == COND_ELSE) { /* ELSE, ENDIF */
 				bMatched = true;
 				READ_NEXT_PAIR(v1, v2, i);
 			} else if (!CheckPositive(pDM_Odm, v1, v2)) {
@@ -500,20 +500,20 @@ void ODM_ReadAndConfig_MP_8723B_PHY_REG(struct dm_odm_t *pDM_Odm)
 
 			if (!bMatched) {
 				/*
-				 *   Condition isn't matched.
-				 *   Discard the following (offset, data) pairs.
+				 * Condition isn't matched.
+				 * Discard the following (offset, data) pairs.
 				 */
 				while (v1 < 0x40000000 && i < ArrayLen - 2)
 					READ_NEXT_PAIR(v1, v2, i);
 
-				i -= 2; /*  prevent from for-loop += 2 */
-			} else { /*  Configure matched pairs and skip to end of if-else. */
+				i -= 2; /* prevent from for-loop += 2 */
+			} else { /* Configure matched pairs and skip to end of if-else. */
 				while (v1 < 0x40000000 && i < ArrayLen - 2) {
 					odm_ConfigBB_PHY_8723B(pDM_Odm, v1, bMaskDWord, v2);
 					READ_NEXT_PAIR(v1, v2, i);
 				}
 
-				/*  Keeps reading until ENDIF. */
+				/* Keeps reading until ENDIF. */
 				cCond = (u8)((v1 & (BIT29 | BIT28)) >> 28);
 				while (cCond != COND_ENDIF && i < ArrayLen - 2) {
 					READ_NEXT_PAIR(v1, v2, i);
diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
index e428884335a8..9a3393f5122b 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
@@ -11,11 +11,11 @@
 static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const u32 Condition2)
 {
 	u8 _BoardType =
-		((pDM_Odm->BoardType & BIT4) >> 4) << 0 | /*  _GLNA */
-		((pDM_Odm->BoardType & BIT3) >> 3) << 1 | /*  _GPA */
-		((pDM_Odm->BoardType & BIT7) >> 7) << 2 | /*  _ALNA */
-		((pDM_Odm->BoardType & BIT6) >> 6) << 3 | /*  _APA */
-		((pDM_Odm->BoardType & BIT2) >> 2) << 4;  /*  _BT */
+		((pDM_Odm->BoardType & BIT4) >> 4) << 0 | /* _GLNA */
+		((pDM_Odm->BoardType & BIT3) >> 3) << 1 | /* _GPA */
+		((pDM_Odm->BoardType & BIT7) >> 7) << 2 | /* _ALNA */
+		((pDM_Odm->BoardType & BIT6) >> 6) << 3 | /* _APA */
+		((pDM_Odm->BoardType & BIT2) >> 2) << 4;  /* _BT */
 
 	u32   cond1   = Condition1, cond2 = Condition2;
 	u32    driver1 =
@@ -31,7 +31,7 @@ static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const
 		pDM_Odm->TypeALNA << 16 |
 		pDM_Odm->TypeAPA  << 24;
 
-	/*  Value Defined Check =============== */
+	/* Value Defined Check =============== */
 	/* QFN Type [15:12] and Cut Version [27:24] need to do value check */
 
 	if (((cond1 & 0x0000F000) != 0) && ((cond1 & 0x0000F000) != (driver1 & 0x0000F000)))
@@ -39,16 +39,16 @@ static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const
 	if (((cond1 & 0x0F000000) != 0) && ((cond1 & 0x0F000000) != (driver1 & 0x0F000000)))
 		return false;
 
-	/*  Bit Defined Check ================ */
-	/*  We don't care [31:28] and [23:20] */
-	/*  */
+	/* Bit Defined Check ================ */
+	/* We don't care [31:28] and [23:20] */
+	/* */
 	cond1   &= 0x000F0FFF;
 	driver1 &= 0x000F0FFF;
 
 	if ((cond1 & driver1) == cond1) {
 		u32 bitMask = 0;
 
-		if ((cond1 & 0x0F) == 0) /*  BoardType is DONTCARE */
+		if ((cond1 & 0x0F) == 0) /* BoardType is DONTCARE */
 			return true;
 
 		if ((cond1 & BIT0) != 0) /* GLNA */
@@ -188,16 +188,16 @@ void ODM_ReadAndConfig_MP_8723B_MAC_REG(struct dm_odm_t *pDM_Odm)
 		u32 v1 = Array[i];
 		u32 v2 = Array[i + 1];
 
-		/*  This (offset, data) pair doesn't care the condition. */
+		/* This (offset, data) pair doesn't care the condition. */
 		if (v1 < 0x40000000) {
 			odm_ConfigMAC_8723B(pDM_Odm, v1, (u8)v2);
 			continue;
 		} else {
-			/*  This line is the beginning of branch. */
+			/* This line is the beginning of branch. */
 			bool bMatched = true;
 			u8  cCond  = (u8)((v1 & (BIT29 | BIT28)) >> 28);
 
-			if (cCond == COND_ELSE) { /*  ELSE, ENDIF */
+			if (cCond == COND_ELSE) { /* ELSE, ENDIF */
 				bMatched = true;
 				READ_NEXT_PAIR(v1, v2, i);
 			} else if (!CheckPositive(pDM_Odm, v1, v2)) {
@@ -218,14 +218,14 @@ void ODM_ReadAndConfig_MP_8723B_MAC_REG(struct dm_odm_t *pDM_Odm)
 				while (v1 < 0x40000000 && i < ArrayLen - 2)
 					READ_NEXT_PAIR(v1, v2, i);
 
-				i -= 2; /*  prevent from for-loop += 2 */
-			} else { /*  Configure matched pairs and skip to end of if-else. */
+				i -= 2; /* prevent from for-loop += 2 */
+			} else { /* Configure matched pairs and skip to end of if-else. */
 				while (v1 < 0x40000000 && i < ArrayLen - 2) {
 					odm_ConfigMAC_8723B(pDM_Odm, v1, (u8)v2);
 					READ_NEXT_PAIR(v1, v2, i);
 				}
 
-				/*  Keeps reading until ENDIF. */
+				/* Keeps reading until ENDIF. */
 				cCond = (u8)((v1 & (BIT29 | BIT28)) >> 28);
 				while (cCond != COND_ENDIF && i < ArrayLen - 2) {
 					READ_NEXT_PAIR(v1, v2, i);
-- 
2.47.3

