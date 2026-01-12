Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30BF37E309
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 17:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768239778; cv=none; b=HIJt9LhO2IHCpzkOFLuL7EEhIV5bqsmwQvDdHHhEFXCrHsYU5fRFdbEl7NmazKI6QFgid0dg1Ojl4iARvRstf3Ml0ZZpzHCZF5Ps2CceQDmlltUS+5z0UHadfRfE6XbGW39vS0N/sPh2bupmG28Np60pRLzQGFq2JO7rvDGAPGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768239778; c=relaxed/simple;
	bh=d/D+sRjmLO3CPJQG+jooYJJZhZ8zFqaRh7N7Y52TNWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pi1d6RHoqjyl8+RnZfcsxs2KPmFtd5NOkIyeE49VcDdq+e76cS7MmunrK1D3GUOckKwO5bIBiE9Zoy0JI3h80qkFcPQjO4/gN2s7M725Y1fmxkx7HD6Ht0ziKLgpbZgXuvJLRKQwTbDRxi95ADgPuLoagvsHrkpveWLPqt31Rv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8TWIHHn; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8TWIHHn"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fbc3056afso3842556f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 09:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768239772; x=1768844572; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIN4CCw3XmeQpWVvgurgu72KckUtvIj0tvlEd3pAWVY=;
        b=l8TWIHHnUYs5bSfvCFpFUA83Gfi7O6W8JdxnOZ2P4bo6SoNDKH+mSuhM7hXTuqJ9fn
         xgHWB3YIjHUKhxSWrW2FjNCgQwVtMIlU5gfE2eKV2nZlIxeH8DSkM4lsLmfUCDnCgfw7
         ZYDYfBE1Y/jEq+cYqWuwOsj3Zp1/1SKhn0e2mTIiiIHQc2EddZvyCpF1PdhPzJblzUpZ
         4aFqVrw3CkNKeszl6nbZXPZXNCbZ+a2FTGasDtVoFuESJ28oK49v+7yYNwCfY436LuEA
         hZpSygpsg358SSA4tOopvHECJJEENf6QH8+X7zvmhzeGiaZ+Q8XSEk2Ep2uoTSEpXtn6
         czvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239772; x=1768844572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rIN4CCw3XmeQpWVvgurgu72KckUtvIj0tvlEd3pAWVY=;
        b=bnNG+yyxPaz1nbQ+9cCyIsjqmaS2ra07OO+pN/aUDhvmibp86p6M3WsB6cbcMXU8v3
         pVAAAmkz3xFSoe96f7S9clWyhAOvur8UJGmOrh3KZUeubTYgsCNywtn9Ngq+HM+F5fsE
         gQlf5e7H03xbvRmp9NAWnAUo6xWjFtU6Yi1EQkOrTjwIIIXNG4DVi83+zpDJaYEML83f
         wAssvhLZk/C5QEIMDUszQ6vDARWpLF+nU6anRRYvhwDazpbVw2Kh7nlNpbhzitkv4jm5
         dEENEZCuXOP1CAVQ2ip2O8IDhoxTcVvoFmdRu2fuo1Mptuz0Q5SsW8hwg0AYhqVYFu5e
         CI7A==
X-Gm-Message-State: AOJu0Yy1UsEX5AsdjHciIsNwL7n4QGQaVfW4+HsxgSq14sU78HQznu8h
	SccBpZ+HuWAD6xHfiMBZBNKPFTbCK4qEZn7QO0B4nBR8cDFv9uovQumD
X-Gm-Gg: AY/fxX5Y/+3NuXl7evtwTorvoZJIf4hsdZNmoWRfBQsrok5dxZzYjyztFp/7fxjLm8L
	XoCSFsi9hDQw+JQuwPh9NGXlDNbYRFIM5zS/Dc6KyriUA46i+kUC2Ou1m0WZpefSzHxqdy2fj9n
	sgkSmuDxB1L4AMmjZ/6SWAbeYORHVWuTfKP31FkGlkLQBmx2QkNx9JTpZOFl2oistkF5eXhcAXK
	ziR2jrbAiiKEZiBGM+cSJ+nTImYJdfmvjOvphrWi0mVawYgcWFSBopAFy1LuF4PAUJie4jMA/V8
	YEiWDzXTiIAlXPsvRAuonF1BtZKg57i+a0Zw8IlgYMBD5ekrYSoOYlS//vHZ4Ek1aZJfcvdB9r0
	0/Y7cEzgNqcRI89+h/ba5wKzZkdLfOxRb/nfJLcnjb8MoEhV6ddiHbA60PF13sP75cRVpZ5+XiU
	+EGomG7xrXi9C2NR5d0NAUJWkFOZc1O7kTmZA5BjA=
X-Google-Smtp-Source: AGHT+IF4uRABTT3xVs+aNy7ISwo4oRDkCT8BAVFjZH+2hn+SsJce7p9/y/YAZX1wtFZBngKdTKTkKQ==
X-Received: by 2002:a05:6000:2913:b0:42f:b871:66b9 with SMTP id ffacd0b85a97d-432c3778dc8mr22382565f8f.56.1768239771656;
        Mon, 12 Jan 2026 09:42:51 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm39090716f8f.4.2026.01.12.09.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:42:51 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mahad.ibrahim.dev@gmail.com
Subject: [PATCH 07/10] staging: rtl8723bs: Fix block comment alignment in HalHWImg8723B_RF.c
Date: Mon, 12 Jan 2026 22:42:24 +0500
Message-ID: <20260112174227.14922-8-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112174227.14922-1-mahad.ibrahim.dev@gmail.com>
References: <20260112174227.14922-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warnings regarding block comment alignment.

Adhere to kernel coding style by fixing block comments.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 .../staging/rtl8723bs/hal/HalHWImg8723B_RF.c  | 27 ++++++++++---------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
index 155ec311a52e..0c7d0307b822 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /******************************************************************************
-*
-* Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
-*
-******************************************************************************/
+ *
+ * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
+ *
+ ******************************************************************************/
 
 #include <linux/kernel.h>
 #include "odm_precomp.h"
@@ -79,8 +79,8 @@ static bool CheckPositive(
 }
 
 /******************************************************************************
-*                           RadioA.TXT
-******************************************************************************/
+ *                           RadioA.TXT
+ ******************************************************************************/
 
 static u32 Array_MP_8723B_RadioA[] = {
 		0x000, 0x00010000,
@@ -243,9 +243,10 @@ void ODM_ReadAndConfig_MP_8723B_RadioA(struct dm_odm_t *pDM_Odm)
 			}
 
 			if (!bMatched) {
-				/*  Condition isn't matched.
-				*   Discard the following (offset, data) pairs.
-				*/
+				/*
+				 *  Condition isn't matched.
+				 *  Discard the following (offset, data) pairs.
+				 */
 				while (v1 < 0x40000000 && i < ArrayLen-2)
 					READ_NEXT_PAIR(v1, v2, i);
 
@@ -269,8 +270,8 @@ void ODM_ReadAndConfig_MP_8723B_RadioA(struct dm_odm_t *pDM_Odm)
 }
 
 /******************************************************************************
-*                           TxPowerTrack_SDIO.TXT
-******************************************************************************/
+ *                           TxPowerTrack_SDIO.TXT
+ ******************************************************************************/
 
 static u8 gDeltaSwingTableIdx_MP_2GB_N_TxPowerTrack_SDIO_8723B[] = {
 	0, 0, 1, 2, 2, 2, 3, 3, 3, 4,  5,  5,  6,  6, 6,  6,
@@ -354,8 +355,8 @@ void ODM_ReadAndConfig_MP_8723B_TxPowerTrack_SDIO(struct dm_odm_t *pDM_Odm)
 }
 
 /******************************************************************************
-*                           TXPWR_LMT.TXT
-******************************************************************************/
+ *                           TXPWR_LMT.TXT
+ ******************************************************************************/
 
 static u8 *Array_MP_8723B_TXPWR_LMT[] = {
 	"FCC", "20M", "CCK", "1T", "01", "32",
-- 
2.47.3

