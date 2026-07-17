Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E645C385D6B
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 18:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784314462; cv=none; b=AkYqEBCYpi1GoGcBx8Av8p/fRgsBgd9xLnpqnxIsw6pl8mgvung1eEz8c5eFnzCUGM/ok5tVTqxGWbeS7KbMLiUbALqemlO3gGc8IDg5+xqhRcUsphKC45Dy9wGAd292/9Az4lL4vU9h8rl73HAqi/6m8k0C3fif4EpFgmwzqCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784314462; c=relaxed/simple;
	bh=No2ezKch2todCwkKqAo2TgTLOc21HGeVklQJeHCTXG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iA+7OiSB0GXITsGT/Bn3Tbx9bXGKBbEYLKNm4lDHLpuEM05n/7UVywMJBHB6AbsHc1xvQ5wLQPAxfWzO98S2Aj8atspg2Ca7zTjNKW9C1Nqc9ycOU7h9wawxnmS1iG9PZtcxl6/5yhpmDaSTVoxM8EZIYxtCbebJkHljUXDdhr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imC41GkJ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imC41GkJ"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c16794450aeso415663666b.2
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 11:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784314459; x=1784919259; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTZt8754/e1sxdp8s4voDK7NYM6qmairXeMD5vaXfBg=;
        b=imC41GkJI1sicGMX7weuCWVVpH0S/LBVyCSpp46txLkQ2z83gcxOKWJ/DkaNROE29i
         P0+nSLK90znzgEABub0IQCHGUibTQ6F9a55I87AtOzGiUBOLZtJNP+Uf80O1Q+CdtPAw
         20gruiab/onJfa2jnlo+XiYTl4Gz6Vz2FCB5gOssaSiSyNm6eFVISv9DVNGf68021sXa
         WxIMPUsysB4cRsKgjcC6SshoFTs7dNO3UC6pebQz/Nb6pLx3HrPoZM21HebKs+VER7JI
         EPrdX511Y9JuKF6NjRE0JF7oY+C7mkfzJnP9TDZAJqOaTObLaNCiqZZ6lLV/o33OvMwW
         +lRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784314459; x=1784919259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JTZt8754/e1sxdp8s4voDK7NYM6qmairXeMD5vaXfBg=;
        b=b2viDqBFqhJpOhCJmwCiFSJomEfR20CgOKpzgX9JUS6+0DNyHu5DK1Y4pfpi1oLAmK
         0a57nP+X7XXMvGFesvPAMEzQV1NIak+90ucNssyoz7EF6wluAkQIMm6jtNjkwgGBMSGJ
         PlWNZaki+suzbFHiVVUwv56Ezg9HRRSOJLJq5jKW8Podz5aeRSP2ewFk7IKyOoy+VULj
         eVtkRTvguQieKbqod/BiD5DGEDVdTc18k4kxVv8q/TuhHo0UrZbdAx5+zkdKZi+bBvPY
         bLCvHrjV8j0LaWf1fwRiNpfH5f7VcBi50McQQdW8wI0AJXFUQVX5VrKhDxvsMCHd+9lA
         371w==
X-Gm-Message-State: AOJu0YySrBfbNPmciKASl2PocTVi1RVl+RyiP0LKGTnrBpfGF0xeLRO/
	oIoyzf2auCmH4UYCcLBymm3PxvaVjU5xy0Kmc+ZImLHY1ulopjzkcZnI
X-Gm-Gg: AfdE7ckmmbR8m7ZuEMNnhP5AApQCVoa+5Me0YVTLWHatPKs+fbERVSCEXJ1MGToR3qK
	fri3QeSYavR/azfLUXMYcEUHZk7te+xNefFehE4ckbPI1OsmuTh7wNB14ijzcBY1+uqbEAWy/ZR
	jjZ3oBSqvKSraFxAKpN/LzhUAGZjNXFzFrcvQKfi8RiVE/kyekLAnuXwELcBhplFflYPeNbONH9
	NJ1D+aVlHUbeMFqkJUojKj66JtxgZCu33s5TsGuaZZbA3vHvedBeyB6gCM2wS+/Ir0meslrbYE0
	ksJiGCWovcTPYSszIHIYX3vkPbig1QNzry+oee7cDZVRPLJv2Ui/Is69eCGXvTEbTEnQyv/q9UI
	kCEY46TBPgtycsuRNaR4lmFyTaWsI+f35PUab67iqPT24fTlFwacmg9fVhixKZg4a/FpxqFu3ZZ
	0sh9FMx8onxV4=
X-Received: by 2002:a17:907:d18:b0:c16:8799:fcb4 with SMTP id a640c23a62f3a-c16b46ab8d1mr185366966b.19.1784314459119;
        Fri, 17 Jul 2026 11:54:19 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f8c5sm118622666b.34.2026.07.17.11.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 11:54:18 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 2/9] staging: rtl8723bs: remove unused array MCSTxPowerLevelOriginalOffset
Date: Fri, 17 Jul 2026 21:52:01 +0300
Message-ID: <20260717185407.56513-3-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717185407.56513-1-nikolayof23@gmail.com>
References: <20260717185407.56513-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the 'MCSTxPowerLevelOriginalOffset' array and the 'pwrGroupCnt'
field (which is used as an index for that array), as values are being
written to it but are no longer used.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 13 -------------
 drivers/staging/rtl8723bs/include/hal_data.h   |  4 ----
 2 files changed, 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index f886699104e5..df0eaff4c841 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -329,16 +329,6 @@ static void PHY_StoreTxPowerByRateNew(struct adapter *padapter,	u32 RfPath,
 	}
 }
 
-static void PHY_StoreTxPowerByRateOld(
-	struct adapter *padapter, u32	RegAddr, u32 BitMask, u32 Data
-)
-{
-	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
-	u8	index = PHY_GetRateSectionIndexOfTxPowerByRate(padapter, RegAddr, BitMask);
-
-	pHalData->MCSTxPowerLevelOriginalOffset[pHalData->pwrGroupCnt][index] = Data;
-}
-
 void PHY_InitTxPowerByRate(struct adapter *padapter)
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
@@ -362,9 +352,6 @@ void PHY_StoreTxPowerByRate(
 
 	if (pDM_Odm->PhyRegPgVersion > 0)
 		PHY_StoreTxPowerByRateNew(padapter, RfPath, RegAddr, BitMask, Data);
-	else if (pDM_Odm->PhyRegPgVersion == 0) {
-		PHY_StoreTxPowerByRateOld(padapter, RegAddr, BitMask, Data);
-	}
 }
 
 static void
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index b88ae2eb1072..8b1b61e78fee 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -198,10 +198,6 @@ struct hal_com_data {
 	/*  Store the original power by rate value of the base of each rate section of rf path A & B */
 	u8 TxPwrByRateBase2_4G[MAX_RF_PATH_NUM][MAX_RATE_SECTION_NUM];
 
-	/*  Read/write are allow for following hardware information variables */
-	u8 pwrGroupCnt;
-	u32 MCSTxPowerLevelOriginalOffset[MAX_PG_GROUP][16];
-
 	u8 CrystalCap;
 
 	u8 TypeGLNA;
-- 
2.55.0

