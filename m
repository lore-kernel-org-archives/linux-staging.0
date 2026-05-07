Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E04D3AD513
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 17:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778175797; cv=none; b=FvRO87FrAwdv5D122Dx8oqn5utWvF/tRnakUBZTHKFerST2+nhm+RXBNvz2lMdMLsxRX5bjOscBKkUUKvhrkWNYQeAcYDhrE57gow/Oo/lG84Vp7Nh2HAudR8Pugo/AXYOPtLpO3G9OGCSJToPmOyTKq9N6h17T6xFiHEJfFmrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778175797; c=relaxed/simple;
	bh=gDOogxUeHJVjw6xuLfQ2+HHzJl+6Cf344948mZTd6wA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ManD0p4Zm4UBfNVJJ6ZXtSPVGOzxr2DWfokirDpcc+r2ZmhFm0RpFawJr80Pz6xzzOtrUn4a4Ydq0ScGuhKQ7zg1HP/rZGMznYRJKbyS0m9O2yOnk9qzEC4Y1McOo0f9uBBAiU3DC1N0Tgqpa2THt+jFjLb95fUwybOZOysxZBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o486BZQG; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o486BZQG"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ef8d6ba48bso653156eec.1
        for <linux-staging@lists.linux.dev>; Thu, 07 May 2026 10:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778175795; x=1778780595; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rUlGO+hmTdn76QVwPi6yv7XLRMlmihN0y8VNjIwWANg=;
        b=o486BZQGFI58my2gOB66MRgRtx2/YuWRCvi0TwDBS6HrIyRPTtXAqt/fbwXrn2OBXW
         o9ASQqmLgP11P87yAttnYD79mKWnvu6kcaAmXc/+QhgNppMpE5DHJvE0WCzEj/npcVHQ
         7dg4MICIjPs3WF+PqFOw3Gtc+65K+2PQ8t9w2smVmQdhrA47BdN5AdsH/YutS2WIxKVt
         eS5YZrBmpyjFDW5MA57FHRwHbmAH7JENjbrJBglAyTAbmKWCMdb+vfHxvCSfSsNbPBax
         2pLARlO7EhEzcoc7Q6TGzPAg5K2WknkoPnDWka9EwUgWBFAVJeKv8yUb8ppSfVUdXxrE
         F5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778175795; x=1778780595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUlGO+hmTdn76QVwPi6yv7XLRMlmihN0y8VNjIwWANg=;
        b=R2QICY/MkD/vA5Jq5Y2BsrRlc/7mOnT9YGDhWBygpyCsrxwXnWxzHWBqcIPy72dj9I
         GH0W/siLaTtcpqd8rpxflVhGnj24c/kV4USf6AgmkoY3vKBfPQy4gKWVg+VqzzEOD0Po
         JOhmrz281LIeKVju8VCqTuuKKMvxHaoXxYnyaPi18+fJrBaOXD93Qaql1IsB/23q3D1i
         MbkBqvkYFbdpoDsKMAE3xjsVd1QcH4dUU+wu6kQBScgE6bVlTsJbiyzwofi1kM3Fqm8I
         7iNqPM3Di1akx/OVg5ZV9JEmwDYOzVrVeXyMy9TkdS8/UYftsgdzOruYL160ZX6YIA84
         ttTQ==
X-Gm-Message-State: AOJu0YwsMdEBFGfwSnKvd7v4qve5msg1Jo35YDOuU8LsnKhpiDnJNIAg
	lrmcb6WC8TwAnkWhZfVzVCCI8sTfqs2jwzl2xGpKbp1HIexOqMhVh+WWbfgDuA==
X-Gm-Gg: AeBDiev6+11q9vnXuuWSwdgMZD0phAcRQG30L5aiLznTOHQA0BMgpHGfCBjEwp4C87A
	8QX8tQ7AKoZwbek5m2BaK+qA9mhe1/FZgzOWBvckMSgEgTlNaT835AXLQhB8g28CPEDrFU+uWzp
	Z73mLd3O+o1Lz8XOXkVcvlHMcDXCiZWPo1a5l9BnDF7Ch0ExE6kbj2FbSp1Qqm56kog6Uv4/mAQ
	IK0Z1G4DGQpq/mOMm2DOp4ELKChAUgGN4KZT2gI30JX7LdNMpLDh3tZODv9R1XHUIYJSKunW3Ys
	ZQ8a+DPUkSpb9o0JL3N6+F087iUsoCtnCMSvgVVsIHUTyhpHAIHvsYz692yQXU6D+p+OvWG2L0O
	9M+nuh+e/W0r5s67Mx3RuEN47GSEmszOtlTco9a6KAZvP7ZYF0mXED83a68AtZJkii49oECvhrP
	PvGXid7apXnDBgBey/oGBIyGeMUP1PtIpQ
X-Received: by 2002:a05:7300:b58b:b0:2ea:ea7:480e with SMTP id 5a478bee46e88-2f6e3e93cbbmr1608006eec.10.1778175795111;
        Thu, 07 May 2026 10:43:15 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-2f56cec593dsm9766437eec.6.2026.05.07.10.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 10:43:14 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix block comment alignment in hal/ header files
Date: Thu,  7 May 2026 10:42:56 -0700
Message-Id: <20260507174256.5319-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add leading whitespace to block comments in order to adhere to
the kernel coding style.

This fixes the following checkpatch.pl warning:
  WARNING: Block comments should align the * on each line.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 .../staging/rtl8723bs/hal/HalHWImg8723B_MAC.h | 12 +++++------
 .../staging/rtl8723bs/hal/HalHWImg8723B_RF.h  | 20 +++++++++----------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.h b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.h
index 50429c159fee..82de8aa0008b 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.h
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.h
@@ -1,17 +1,17 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
-*
-* Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
-*
-******************************************************************************/
+ *
+ * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
+ *
+ ******************************************************************************/
 
 #ifndef __INC_MP_MAC_HW_IMG_8723B_H
 #define __INC_MP_MAC_HW_IMG_8723B_H
 
 
 /******************************************************************************
-*                           MAC_REG.TXT
-******************************************************************************/
+ *                           MAC_REG.TXT
+ ******************************************************************************/
 
 void
 ODM_ReadAndConfig_MP_8723B_MAC_REG(/*  TC: Test Chip, MP: MP Chip */
diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.h b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.h
index acf5679d188c..04441fdeaa26 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.h
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.h
@@ -1,17 +1,17 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
-*
-* Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
-*
-******************************************************************************/
+ *
+ * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
+ *
+ ******************************************************************************/
 
 #ifndef __INC_MP_RF_HW_IMG_8723B_H
 #define __INC_MP_RF_HW_IMG_8723B_H
 
 
 /******************************************************************************
-*                           RadioA.TXT
-******************************************************************************/
+ *                           RadioA.TXT
+ ******************************************************************************/
 
 void
 ODM_ReadAndConfig_MP_8723B_RadioA(/*  TC: Test Chip, MP: MP Chip */
@@ -19,8 +19,8 @@ ODM_ReadAndConfig_MP_8723B_RadioA(/*  TC: Test Chip, MP: MP Chip */
 );
 
 /******************************************************************************
-*                           TxPowerTrack_SDIO.TXT
-******************************************************************************/
+ *                           TxPowerTrack_SDIO.TXT
+ ******************************************************************************/
 
 void
 ODM_ReadAndConfig_MP_8723B_TxPowerTrack_SDIO(/*  TC: Test Chip, MP: MP Chip */
@@ -29,8 +29,8 @@ ODM_ReadAndConfig_MP_8723B_TxPowerTrack_SDIO(/*  TC: Test Chip, MP: MP Chip */
 u32 ODM_GetVersion_MP_8723B_TxPowerTrack_SDIO(void);
 
 /******************************************************************************
-*                           TXPWR_LMT.TXT
-******************************************************************************/
+ *                           TXPWR_LMT.TXT
+ ******************************************************************************/
 
 void
 ODM_ReadAndConfig_MP_8723B_TXPWR_LMT(/*  TC: Test Chip, MP: MP Chip */
-- 
2.34.1

