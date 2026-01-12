Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F36378D8B
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 17:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768239778; cv=none; b=aVIIIiHAFQd9lwPNyiVfshllTDr1u5/RS3AF7BEm7wiug4J4nrA2XagLY1CbViOXgkMbeV23LOEpCnHyyNL/MBVSWW+sGuhhSy3ODAv0PErXPcF48ifJLOv4rbuM+80OvParg6170R0Kjjg1atK61nlIQZxTazVyE16RJTpWEgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768239778; c=relaxed/simple;
	bh=CQnOPZYgxeNxaXVrR23UF6dE33CIyoJknaCvKC5jtfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hyvF3GFVNkvdhOIvbaK2qT/178basjZhkYCRlkz0s9P7uSUcSiUYyTHcOL05zwa239MmzfLVv8604K45KpClWsNYcBJn8qMRvL5hA46QJF1tyaVFcXxiHRfmRihP8baVqrOe3i0xfbvtmCSLpqLbMQbvT/r4Dd+YJJFqDC9TO0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYKjo5tl; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYKjo5tl"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-432d256c2e6so3309864f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 09:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768239773; x=1768844573; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4U7ahMZkTVYOTJmtKsNu+JXI6NaqQN0SF98Zi2bPS8=;
        b=dYKjo5tlXaeXvgG7u1XExikcVkmq+oq3reWJer3Htddmhhh+DBkE+XFEsLaIurnxd1
         g9IVIa7cKHKTZw3CUW/VdHFd6VvPZGaPrKX6/Hu3TQmI2PzzzXo7QqfUocCZPaiuXGDt
         N3D5Mypyxye3djHKOHrMVPa4ngBo2+rZfK3Kl+aTXH2JsMRCA395v149Nmemnh6w/9Fu
         t5TrMOgn2aAZxcmaqlZN1ttgZEJp0890d0OpBHtfX26sXBoT2baoui/C5o2UfLjhunJF
         EJMEefs6MtlPoNzp53kCTiR7YOli+JwEAY2whPhkXLmLOZFfjeDsmXTZzlboxVFtyJvy
         NzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239773; x=1768844573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P4U7ahMZkTVYOTJmtKsNu+JXI6NaqQN0SF98Zi2bPS8=;
        b=LRMjafDfN8dR6WR7zC2vdNXKwbL8t1fpTRm9jGrPp9S2jd41af/dLUZRQ+9tDnhE09
         9mfVzehizOMbsa12wmcCdYXwIZgi7UGlEtSHMQnWZdlv7he0XAXyhMLFF7QbfCsJY0G3
         cDuk/4APKG1G+bytrPA+00Q7SNI8lWhot7Bl1EL771r4WQfR2JqhgwxYzQY5geKmbpPU
         I/jYxV7Ql8NdXUiuT9fdT0U6DRpLwJ7LjgUfCzGQdy9L7IeaFVU/KyExaJ9TVHXLKrlS
         54Ycs1KfRQWz7r18fdPZl3gxvhNXhE84SVAMkSegubkJzOi9lZIx50MH6Pt8yG1yfeav
         E/PA==
X-Gm-Message-State: AOJu0YxEdqeRi6fXyxS6ow1xdU6JZDk0Ihh5ph/rtu3ccrt2QH1WkH7q
	orjwItg9jTELzp9+nRx4RTUF+jj3qboQjmblw7II1ZDVvCDNP0Q7Hjxg
X-Gm-Gg: AY/fxX6hQ7mI58OcIRsvjrVZwaItD5SIqgk+M9nYbHj1aNva8s4/2H3gKtwY5L9IqPp
	gg0yxkxLcTWQTJBhDMBsRBap9SfLMz8xm5GAgkam7VHqGTPwYsNF4RPM6rxzu5d0maeHNvfUm4R
	2CZjbJgowBauWjwM6nUCXIE/cmiUApwibDvglgWgeOSwcX8SSCfKc6T8BlY62troO7ZScf+UG/T
	N9ExhmP2ipBm+1NalQW3l35ZoOM/PhgW/gFiAVyTEz7uqqGowRu8LpNklGR8/Odhq23snCqPAuX
	C0y836NNu1oCub/kRd4c7sxumptpYh2ip1n3cM/WUeGvBUbpx+1asPTFK6wXoSzMH8PHWBcagTT
	fVsja20FH1GdhXsa7bjg60v30R8heD9Y70ChhFoLvRubd+P4EQjV/gF6Psit+xve6c7P5E1nmF2
	2wl2WreoO2VK9K4zwA5/v3zB+VUEhYJIz4RMKkolQ=
X-Google-Smtp-Source: AGHT+IFWIvqiIBM4zMFzmf4FfMnuelp81OKLXDRTcRxGMFTfyz9z28XdlOLe4Aoxdy8Aw+TUJDgrZQ==
X-Received: by 2002:adf:fe8f:0:b0:430:f97a:6f43 with SMTP id ffacd0b85a97d-432c379f3c9mr19910375f8f.53.1768239773012;
        Mon, 12 Jan 2026 09:42:53 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm39090716f8f.4.2026.01.12.09.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:42:52 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mahad.ibrahim.dev@gmail.com
Subject: [PATCH 08/10] staging: rtl8723bs: Fix style and alignment issues in HalHWImg8723B_RF.c
Date: Mon, 12 Jan 2026 22:42:25 +0500
Message-ID: <20260112174227.14922-9-mahad.ibrahim.dev@gmail.com>
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

Fix multiple coding style issues to silence checkpatch.pl warnings.

- Move the first part of the conditional logic in 'if' statements to the
  same line as the opening parenthesis. This fixes the checkpatch warning:
  "Lines should not end with a '('".

- Fix the alignment of function arguments and long variable assignments.
  Use spaces to align subsequent lines with the opening parenthesis,
  adhering to the kernel coding style guidelines.

- Remove hanging parentheses to improve readability.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 .../staging/rtl8723bs/hal/HalHWImg8723B_RF.c  | 97 +++++++------------
 1 file changed, 36 insertions(+), 61 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
index 0c7d0307b822..22be62ad8e0e 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
@@ -8,9 +8,7 @@
 #include <linux/kernel.h>
 #include "odm_precomp.h"
 
-static bool CheckPositive(
-	struct dm_odm_t *pDM_Odm, const u32 Condition1, const u32 Condition2
-)
+static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const u32 Condition2)
 {
 	u8 _BoardType =
 			((pDM_Odm->BoardType & BIT4) >> 4) << 0 | /*  _GLNA */
@@ -36,16 +34,12 @@ static bool CheckPositive(
 	/*  Value Defined Check =============== */
 	/* QFN Type [15:12] and Cut Version [27:24] need to do value check */
 
-	if (
-		((cond1 & 0x0000F000) != 0) &&
-		((cond1 & 0x0000F000) != (driver1 & 0x0000F000))
-	)
+	if (((cond1 & 0x0000F000) != 0) &&
+	    ((cond1 & 0x0000F000) != (driver1 & 0x0000F000)))
 		return false;
 
-	if (
-		((cond1 & 0x0F000000) != 0) &&
-		((cond1 & 0x0F000000) != (driver1 & 0x0F000000))
-	)
+	if (((cond1 & 0x0F000000) != 0) &&
+	    ((cond1 & 0x0F000000) != (driver1 & 0x0F000000)))
 		return false;
 
 	/*  Bit Defined Check ================ */
@@ -311,47 +305,30 @@ void ODM_ReadAndConfig_MP_8723B_TxPowerTrack_SDIO(struct dm_odm_t *pDM_Odm)
 	struct odm_rf_cal_t *pRFCalibrateInfo = &pDM_Odm->RFCalibrateInfo;
 
 
-	memcpy(
-		pRFCalibrateInfo->DeltaSwingTableIdx_2GA_P,
-		gDeltaSwingTableIdx_MP_2GA_P_TxPowerTrack_SDIO_8723B,
-		DELTA_SWINGIDX_SIZE
-	);
-	memcpy(
-		pRFCalibrateInfo->DeltaSwingTableIdx_2GA_N,
-		gDeltaSwingTableIdx_MP_2GA_N_TxPowerTrack_SDIO_8723B,
-		DELTA_SWINGIDX_SIZE
-	);
-	memcpy(
-		pRFCalibrateInfo->DeltaSwingTableIdx_2GB_P,
-		gDeltaSwingTableIdx_MP_2GB_P_TxPowerTrack_SDIO_8723B,
-		DELTA_SWINGIDX_SIZE
-	);
-	memcpy(
-		pRFCalibrateInfo->DeltaSwingTableIdx_2GB_N,
-		gDeltaSwingTableIdx_MP_2GB_N_TxPowerTrack_SDIO_8723B,
-		DELTA_SWINGIDX_SIZE
-	);
-
-	memcpy(
-		pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKA_P,
-		gDeltaSwingTableIdx_MP_2GCCKA_P_TxPowerTrack_SDIO_8723B,
-		DELTA_SWINGIDX_SIZE
-	);
-	memcpy(
-		pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKA_N,
-		gDeltaSwingTableIdx_MP_2GCCKA_N_TxPowerTrack_SDIO_8723B,
-		DELTA_SWINGIDX_SIZE
-	);
-	memcpy(
-		pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKB_P,
-		gDeltaSwingTableIdx_MP_2GCCKB_P_TxPowerTrack_SDIO_8723B,
-		DELTA_SWINGIDX_SIZE
-	);
-	memcpy(
-		pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKB_N,
-		gDeltaSwingTableIdx_MP_2GCCKB_N_TxPowerTrack_SDIO_8723B,
-		DELTA_SWINGIDX_SIZE
-	);
+	memcpy(pRFCalibrateInfo->DeltaSwingTableIdx_2GA_P,
+	       gDeltaSwingTableIdx_MP_2GA_P_TxPowerTrack_SDIO_8723B,
+	       DELTA_SWINGIDX_SIZE);
+	memcpy(pRFCalibrateInfo->DeltaSwingTableIdx_2GA_N,
+	       gDeltaSwingTableIdx_MP_2GA_N_TxPowerTrack_SDIO_8723B,
+	       DELTA_SWINGIDX_SIZE);
+	memcpy(pRFCalibrateInfo->DeltaSwingTableIdx_2GB_P,
+	       gDeltaSwingTableIdx_MP_2GB_P_TxPowerTrack_SDIO_8723B,
+	       DELTA_SWINGIDX_SIZE);
+	memcpy(pRFCalibrateInfo->DeltaSwingTableIdx_2GB_N,
+	       gDeltaSwingTableIdx_MP_2GB_N_TxPowerTrack_SDIO_8723B,
+	       DELTA_SWINGIDX_SIZE);
+	memcpy(pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKA_P,
+	       gDeltaSwingTableIdx_MP_2GCCKA_P_TxPowerTrack_SDIO_8723B,
+	       DELTA_SWINGIDX_SIZE);
+	memcpy(pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKA_N,
+	       gDeltaSwingTableIdx_MP_2GCCKA_N_TxPowerTrack_SDIO_8723B,
+	       DELTA_SWINGIDX_SIZE);
+	memcpy(pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKB_P,
+	       gDeltaSwingTableIdx_MP_2GCCKB_P_TxPowerTrack_SDIO_8723B,
+	       DELTA_SWINGIDX_SIZE);
+	memcpy(pRFCalibrateInfo->DeltaSwingTableIdx_2GCCKB_N,
+	       gDeltaSwingTableIdx_MP_2GCCKB_N_TxPowerTrack_SDIO_8723B,
+	       DELTA_SWINGIDX_SIZE);
 }
 
 /******************************************************************************
@@ -542,14 +519,12 @@ void ODM_ReadAndConfig_MP_8723B_TXPWR_LMT(struct dm_odm_t *pDM_Odm)
 		u8 *chnl = Array[i+4];
 		u8 *val = Array[i+5];
 
-		odm_ConfigBB_TXPWR_LMT_8723B(
-			pDM_Odm,
-			regulation,
-			bandwidth,
-			rate,
-			rfPath,
-			chnl,
-			val
-		);
+		odm_ConfigBB_TXPWR_LMT_8723B(pDM_Odm,
+					     regulation,
+					     bandwidth,
+					     rate,
+					     rfPath,
+					     chnl,
+					     val);
 	}
 }
-- 
2.47.3

