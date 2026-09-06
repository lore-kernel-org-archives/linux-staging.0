Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72601368D7B
	for <linux-staging@lists.linux.dev>; Sun,  6 Sep 2026 04:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788668523; cv=none; b=NsS5sa8Rd/1F7NDxzFkT0reHaXr2YZuKdr80C6Mx9bDr0hkzkiLkfvz7zOH3BtLwM5kxmX+4p7MlzIZEbaE0N/cKXGrXFdxFDGmQ+LLgIFcURxaMXCg62s3PM+D22CmUFH/ilo48rq5wLpE3xCfnbfDZFDR7nzsQiBmAFQBl4L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788668523; c=relaxed/simple;
	bh=Ny3yj9NVOmp+1J/+9Xrv6v639eolhKp/HLlVY8IEooM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kNf/98T2GR1nXsUO1HYe3bXmQU0mcSHdPW36zOubHjcbQb8pv11TH2Y4vhHASnI0VRpE2TOvOO4Abp6JSjsGPVVNmatY4TEXzr2TNhTBN+f+uDQtHrbMzN8mqVQmKgcTNN50wBINAgzAVLncdNjCP5fzVNBZE7WkROQpWD4FF5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxUCXjGU; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxUCXjGU"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ceab75934dso22667685ad.2
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 21:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788668521; x=1789273321; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJXIgyx4LkC4fgQUoPG9Q6LMnFenMDmyBiwUx/Xoers=;
        b=QxUCXjGU2TkICxfGA4LhsCqgh6Wepsl97YZd0osYDJawTiDo7qzAoRAmAsrNhLVNwE
         YSM19PFeb2G38gWVKk0JINcTNKAUB71kK401SDJFgB6e9MYGja0hIPTh0DDT6H91XDR7
         LGSWwIuKvuhdTNeczTyBp+cG4Er04ovtgH+hUNtzkghWHmiC+WX4AilSI2sbyrWZ0HpY
         mCXWIhBG7psCvmPLT6Tpu5fTWGDMl6Wc3ZEcDRHnKdOTEyaRfdKDe/8woZBteLepwXyK
         KX6yRZ7m+OFE1c5T6hUhjKpVr+83gdf8gwk/4sN1pfb79ep7YRe7GdL3APTlYqbFUdul
         eRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788668521; x=1789273321;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tJXIgyx4LkC4fgQUoPG9Q6LMnFenMDmyBiwUx/Xoers=;
        b=OZv83xm0eAyH2xoHvoklD2MLpOJytq1iocUY9KX7+Lt1ulakiJfSq8s3W8R/5VPNIc
         s5lFO/HWGtNAQxLsgBG6z6IO6Bxsbahw3o/+Zp8a70sNq1thlBhj4I33MSevehAwXCLf
         cxXEZLO/29m0usd9dZosxHxd+re5tlcggPcH7DmPuttat4Oy3OP2Whrceog/zZF6rGx0
         o2QaeDysVkdNHZ7fmFydple7nHdm0brvkgLgntuzNPduFsIyydfBPHRch8PREF3H5ZVl
         r/g2zO1DntF+Tjfh+oqZrdixdcrZqWuIdT09ZIToSJ5Pgh8GtR70nbklUgPu1Vjc3FZQ
         Z2Xw==
X-Gm-Message-State: AFuF++mr4bskVpBW/tEH/pj6rvVsQDQTqorh8wVRGmOta7/eWrfrHLF5
	7uSqxYZPBjsXZ5d3ZDSY27uz8cS6zAXuY7IQMgDBKjPoWtLMmYjGFhiv
X-Gm-Gg: AYBFou0KXRhksKK8wNbPh5XY9iE72k48S2S7LjUDCbEj5ZoQ38NaO4Rl4rXoltV3yEy
	t5LmdQHWm4Eo1YYqkvFXM2vC1UQTRQTrteDJTQEo32AsV5dqcUZhuNQA+IiTe9t78Z4INcIESD+
	T/bu78mKODK36vBbJ9T9UxRx1ZuL7x4RS90wWBayJiTo0Jb+RsXZD9G1G/cV1VKL3NuxED+YK0e
	zjhbN/WCT/kGTp5zIg04qScoh/JJ50zgmbJ92DkI5xeAvjayYWFNIOLi38nme4HyU4ZunBaJPwe
	kMvaIH6TQkyLkNaRDsR1AmPeHQ13xKhvcbX3IPaT8mxg8csrEISU5c3gyOQ5C0UaeALzdXG/NY1
	n5y0oMGsI0HimIJqUnpqsyFDoqTYm+rI7H2Is2nfjgv62LbEy9fJvtZnnmeDMCReSa8pQpqSVE3
	ggAqcHjMzSFKeYNRU8cPB4Mu/Mu/RoVjHcmp6J2n4Ui9HttzUKICd6YmS5BdylVUQTMgyAD5QpS
	Md+BYBBMMbMhFVLdt0egkQ15EOu4ao=
X-Received: by 2002:a17:90b:3809:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-39b261014e2mr21750107a91.7.1788668520882;
        Sat, 05 Sep 2026 21:22:00 -0700 (PDT)
Received: from DESKTOP-PKFJL56.localdomain (39-10-57-72.adsl.fetnet.net. [39.10.57.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ce4221sm22936853a91.14.2026.09.05.21.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 21:22:00 -0700 (PDT)
From: Hank Yang <s950343@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	b9788213@gmail.com,
	guojy.bj@gmail.com,
	Hank Yang <s950343@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove dead 5GHz fallback in GetDeltaSwingTable_8723B
Date: Sun,  6 Sep 2026 12:20:43 +0800
Message-ID: <20260906042043.1850-1-s950343@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GetDeltaSwingTable_8723B() falls back to calibration tables from a
different chip (8188E) when `channel` is outside the range of 1 to 14:

  } else {
          *TemperatureUP_A   = (u8 *)DeltaSwingTableIdx_2GA_P_8188E;
          ...
  }

This branch is unreachable. `channel` comes from `CurrentChannel`,
which is only updated in rtl8723b_phycfg.c after passing
HAL_IsLegalChannel(), which enforces a range of 1 to 14. Since
RTL8723BS is a 2.4GHz-only chip [1][2], with no 5GHz support,
`CurrentChannel` can never exceed the range of 1 to 14, so this
fallback branch can never execute.

See discussion at [3] for the full reasoning.

Also remove the two DeltaSwingTableIdx_*_8188E arrays that were
only used by this branch, along with a comment referencing a
TxPowerTrack.txt config file — no such file-reading logic exists
anywhere in this driver, so the comment is stale as well.

[1] https://www.realtek.com/Product/Index?id=610&cate_id=194
[2] https://fccid.io/TX2-RTL8723BS/User-Manual/User-Manual-System-pdf-2365682
[3] https://lore.kernel.org/linux-staging/2026090527-outdoors-press-9602@gregkh/T/#t

Assisted-by: Claude:claude-sonnet-5

Signed-off-by: Hank Yang <s950343@gmail.com>
---
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 6c5f56d5a1f4..394ee4e732a6 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -21,20 +21,6 @@
 #define		PATH_S1							0 /*  RF_PATH_A */
 #define		IDX_0xC4C						2
 
-/*---------------------------Define Local Constant---------------------------*/
-
-/* In the case that we fail to read TxPowerTrack.txt, we use the table for
- * 88E as the default table.
- */
-static u8 DeltaSwingTableIdx_2GA_N_8188E[] = {
-	0, 0, 0, 2, 2, 3, 3, 4,  4,  4,  4,  5,  5,  6,  6,
-	7, 7, 7, 7, 8, 8, 9, 9, 10, 10, 10, 11, 11, 11, 11
-};
-static u8 DeltaSwingTableIdx_2GA_P_8188E[] = {
-	0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 4, 4, 4,
-	4, 4, 4, 5, 5, 7, 7, 8, 8, 8, 9, 9, 9, 9, 9
-};
-
 /* 3 ============================================================ */
 /* 3 Tx Power Tracking */
 /* 3 ============================================================ */
@@ -312,11 +298,6 @@ static void GetDeltaSwingTable_8723B(
 			*TemperatureUP_B   = pRFCalibrateInfo->DeltaSwingTableIdx_2GB_P;
 			*TemperatureDOWN_B = pRFCalibrateInfo->DeltaSwingTableIdx_2GB_N;
 		}
-	} else {
-		*TemperatureUP_A   = (u8 *)DeltaSwingTableIdx_2GA_P_8188E;
-		*TemperatureDOWN_A = (u8 *)DeltaSwingTableIdx_2GA_N_8188E;
-		*TemperatureUP_B   = (u8 *)DeltaSwingTableIdx_2GA_P_8188E;
-		*TemperatureDOWN_B = (u8 *)DeltaSwingTableIdx_2GA_N_8188E;
 	}
 }
 
-- 
2.43.0

