Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6C737F0F8
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 17:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768239774; cv=none; b=F0REXXnXSGvmvNpn+5yoxWy1YsXBTCs1h+QP3nq5oY32rl03J/dVupRGSS46rK3EAzoQ35oDCppbPyOxQg5YAn9F6910ZRgpglb+Hbdr44Apv+kEnF5WMqB2afG3tIJtWjQ16lka4M+JpFph6lV+zgP8iHUVfX6e2q2dA0ivb6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768239774; c=relaxed/simple;
	bh=jEWvTnWlVkfyy618dh49nfBqAB/8VFaYMoUHaoxjbKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AOYRgoHyRTyNdqZW071utOsSMo2MD88cx/VxFCvRzT79dsOlNC5XtkITfoq9Ahqmra/pUCkX3/tWVBPmKfWOA6amV4P9LvUYVy8T68v6HMeiiKl90Xo2hcAr8IGssemsNPoFKidaZz+zo7Fsf0gRpBO3MF993EGOfhBMVtzo9kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XG9FllDw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XG9FllDw"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4775ae77516so72797815e9.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 09:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768239767; x=1768844567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ieg3nCWbmRwuOr2gtzlu5m+z0VK0wbBY5tlSll5PRjw=;
        b=XG9FllDwA0l2is9oFJHeL1zTEKKJbxd8AgltYpd68EnVs+DbmYidgnT6QqDLlXJ47I
         axaFCmkeR+sTieZTmXgMAAY266NK0ercmdIdUx6ubnLZ3ZEfj42v5Ro6tTNqoCJ90KBL
         Yor2n3wH/HzZxjK8XcjNwkWs/3DDFQr7EtFYDn7b4CG+pKYB+T9raqYwqFToWX6iTaWb
         e2gVjUFj8+/zr+M8mjBmcAM7kmcZgA1ko7Dda4HxjCLqbFJz5Jn5QX+tfDf8OQQzocM8
         JL53zJ2KlhXOumYmzlFpfHKGoFmoA4beqMNld9X3kuZ+AimF94AP3I5Efi6ea9pEFRsb
         JYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239767; x=1768844567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ieg3nCWbmRwuOr2gtzlu5m+z0VK0wbBY5tlSll5PRjw=;
        b=sDFm6hCqK8lAh4IAt8JyjlbM0bO6Rg/uz3P7Joo0J95ghq4rMRnWpENFnbyAFG17bg
         B1hyw4DhPrrIkCUv63IcsMTf2R2SNm15OHZiYLBtrSvwDkkaof8oHeAz6H6IXunyi+sY
         /ddrSnxI/4enXYq9KTGAvprWblm8I3jkpfPS/4NN5BWJXYX6q5F6SlFa6K0z0J5zfxqe
         qxqlSF5M1ht91IdDALtYCv3YQTrmjqHihf0/ZPaFWlt3/nCvFKaAj4Zadtx7x0ov6kC1
         A3Q4gL/Hg6b9T34objTRBUGKs3DddCTdwWB1CKKrH5vXg0apko9Hh1jbje8aXfSsrcfk
         GI/g==
X-Gm-Message-State: AOJu0YznajONjrvoeldof93xgY3A4E+Qq65ab5CEbbMd/k8auwqxHrtI
	BwRd4su/4qUi5rfeyIHbI3WFkzxDkofHnAR+e7DlkisE15VNbJv3Bhwy
X-Gm-Gg: AY/fxX6P5TVHWF8wQWRSAt+mzFfFTM1wgSUr4LJpgXQMvAdPeDSDkhsZhGxiVekXvSc
	k6U2H/ijMzteHdjyHp1etpmrYQjKel81ifTCo1fvyDa65P9eDEgtUeY55uzztxJWQmwQxmmx7gD
	AMEfDQ64+3xmrHynAjjF7nfRNd+MDrFKwX8FeG4GveEKu5q4/5BsyVgpUQyNxcrun+u0pZsGiJZ
	/tndRrc+tbhXwWUubT2undyTR3htaMgPFlteolJJBFHIAM/HhXzQNwEDzV+bkpCnx3mLKjri2Va
	Ksq/mQwvUnx4fawA5bgClvWjIWcQSTO3u4dOFJGgxze/2o9prxCcJO+YOYc5Qx4AueSIpyu3+s7
	0Wi/PTx0sX9d3jXTtzrgnz3WJ4U0KoA++9LnOq5M2U9RaG8bGyvgEiG8G2qz2TczpT3zgk6nXoE
	lLpS+D/mzlnx0234iikmcXu45DGjo1BBvdFv1ik2s=
X-Google-Smtp-Source: AGHT+IExXjQcfjbnQapMrGuCe9E89fc53u9VzHErPAXseomIXaiiCUVczlem5w4ZMpM1fu0LuInwHA==
X-Received: by 2002:a05:6000:2913:b0:42f:b707:56cc with SMTP id ffacd0b85a97d-432c37950c5mr21524970f8f.30.1768239767167;
        Mon, 12 Jan 2026 09:42:47 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm39090716f8f.4.2026.01.12.09.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:42:46 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mahad.ibrahim.dev@gmail.com
Subject: [PATCH 04/10] staging: rtl8723bs: Fix block comment alignment in HalHWImg8723B_BB.c
Date: Mon, 12 Jan 2026 22:42:21 +0500
Message-ID: <20260112174227.14922-5-mahad.ibrahim.dev@gmail.com>
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
The warnings were: "Block comments should align the * on each line".

This patch aligns the asterisks in the block comments so they adhere to
the kernel coding style.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 .../staging/rtl8723bs/hal/HalHWImg8723B_BB.c  | 34 ++++++++++---------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
index 4da2487f6750..630dace0af47 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
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
@@ -71,8 +71,8 @@ static bool CheckPositive(
 }
 
 /******************************************************************************
-*                           AGC_TAB.TXT
-******************************************************************************/
+ *                           AGC_TAB.TXT
+ ******************************************************************************/
 
 static u32 Array_MP_8723B_AGC_TAB[] = {
 		0xC78, 0xFD000001,
@@ -242,9 +242,10 @@ void ODM_ReadAndConfig_MP_8723B_AGC_TAB(struct dm_odm_t *pDM_Odm)
 			}
 
 			if (!bMatched) {
-				/*  Condition isn't matched.
-				*   Discard the following (offset, data) pairs.
-				*/
+				/*
+				 *   Condition isn't matched.
+				 *   Discard the following (offset, data) pairs.
+				 */
 				while (v1 < 0x40000000 && i < ArrayLen-2)
 					READ_NEXT_PAIR(v1, v2, i);
 
@@ -268,8 +269,8 @@ void ODM_ReadAndConfig_MP_8723B_AGC_TAB(struct dm_odm_t *pDM_Odm)
 }
 
 /******************************************************************************
-*                           PHY_REG.TXT
-******************************************************************************/
+ *                           PHY_REG.TXT
+ ******************************************************************************/
 
 static u32 Array_MP_8723B_PHY_REG[] = {
 		0x800, 0x80040000,
@@ -501,9 +502,10 @@ void ODM_ReadAndConfig_MP_8723B_PHY_REG(struct dm_odm_t *pDM_Odm)
 			}
 
 			if (!bMatched) {
-				/*  Condition isn't matched.
-				*   Discard the following (offset, data) pairs.
-				*/
+				/*
+				 *   Condition isn't matched.
+				 *   Discard the following (offset, data) pairs.
+				 */
 				while (v1 < 0x40000000 && i < ArrayLen-2)
 					READ_NEXT_PAIR(v1, v2, i);
 
@@ -526,8 +528,8 @@ void ODM_ReadAndConfig_MP_8723B_PHY_REG(struct dm_odm_t *pDM_Odm)
 }
 
 /******************************************************************************
-*                           PHY_REG_PG.TXT
-******************************************************************************/
+ *                           PHY_REG_PG.TXT
+ ******************************************************************************/
 
 static u32 Array_MP_8723B_PHY_REG_PG[] = {
 	0, 0x00000e08, 0x0000ff00, 0x00003800,
-- 
2.47.3

