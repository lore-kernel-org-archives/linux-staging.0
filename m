Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91F938F658
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 18:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784314477; cv=none; b=OEgdLvx0ZOkoHDEUoZ4uJqqADoC74ABoWkmlahay9XqwV3RN9Yw+ZXZN6w+/zZHsneuseM7uYuyAFmfyortXEe8WtTL+aCjkhTehj/dqnRHlJllXd1kWo+zPKc7bx+TB7/o49d2tKTqcVQ3NVXZjFRC1S0e1QL02EqPzo1N6mdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784314477; c=relaxed/simple;
	bh=8cgi8SV8/hXDFTEojNtDIJVKKfmCJPsPciLAwqzYARA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TKLqkkOmUbrX4MTtSpLhZF+f2SUcrOP0Td/q0rr249mRBB0UMWUl60itGANwk02N7L+tOp3ArygYAha+rocwHY39A3FGOvKgBK4fD1hxZQQmRBEqShtmmOZe/6evbLA7xDSs5lkhL6jUVuWVrjzJDa3sD1jeD8hl3fMZwRAfwEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONLGl0Ke; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONLGl0Ke"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c16794450aeso415696866b.2
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 11:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784314474; x=1784919274; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fD+9M0ACOf7SyCTUjrBIDP+9gs41lxiHn2WnAvMwjIg=;
        b=ONLGl0KeK6zegEs6C1Z/2bHGd7zdGZHWWJgqbaZlCJJKVO2yPsJoozfZdsWRK7Zjw5
         squwwEaM+GoGbrVdDtPEcqhI2f+gG+KIBvd84HG7ldT3ZEQxNl2Z9yfBtUhRWIDgXj1j
         I5fUSQna4E9UsN0L3sWPVX7S2xuU1cCOn0IL+EBCCMTiO5tmq3RFKsu58GYg/8hcN6Wr
         9LSLTfsXhRlItoVn1nrIESe6ooGFzIxvU5zxoP1IPlP2BMJFXWegzPxIQrbpDBp+iRVn
         po/Sq5qnkGxHkHzAOmRcl0gCDJgWtoVTh38lEMINyAamr7+SjAySKsePIo5n9/Qi/9Xc
         JcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784314474; x=1784919274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fD+9M0ACOf7SyCTUjrBIDP+9gs41lxiHn2WnAvMwjIg=;
        b=ZW1zFcpM8yKOxz1OyzrL6OQ1Fk/vz30Gwwkgnd0ryyundv/XTKTMZ63pG0Nbg/L6O6
         TduS7Q1IfMzpSwLLEf7OS8t5Z8YCdpWK4Vg2vb9dYnVkhIm21/3/plSa1e00jB2hMtO9
         cuALhiHSYJ8loLf15G9MSZ8U+vmxWXAWz8LmW4PYXJjOkUtgyHufYzRgP/LFbKi5bm4D
         G8kSxm+tJDiE6BeADAZYbgA6PcpnSSWzmBfZFtUKrezOmS1x5KdAlttZsr2lX3WBhogF
         Zec3JjNGVU+ymlY1nI//9NGiSJlh+D78ip2Rl9FSGvlI2WfxlsI1Mho5UigQQDL1Tese
         /IYA==
X-Gm-Message-State: AOJu0YxgS9wMOEvVRXCr2ntHy6HQa5gWE5RdpO7qjn5z6aIp1PW6X0bj
	KsE6kw5YXGEDP1+gbQ8ugKi0R+rkJd8TdFhIeumUqiqNcg2RN4o8xEv7uyFJcw==
X-Gm-Gg: AfdE7ck5crbEDD02vLLLyuafKAYr7o0e6V7G+jobRFGhfEIV4GUkABJMbOZLsFSA3gn
	+/azdEPU0+TNPloWv3lq/uVqhExm0oBAHPzVBFltUShCDXMkxtpYZ+FWe1saytSyP2WSa42AARN
	4OwzXedcvmFluNm1PUuoMHPbHnY5VswtC02GbwtNp2I+fiQT0lR77wIIDKGMsD/mvV+ckR/fBHC
	7Ah8+I23LUSXGyfThVsHXBSrn9xwzIDCHw1goM6rEAapafUtKtZfOy771eig0HVPu7n3xddbxrC
	ZkZ8pJi7os4XrPSaJaFqvmo3xe/AEZ/NrSV34gNYUn+Yqcajp1VvRDnwD4dsuBCzKQOytVIAbNd
	jJUE58wQEboRUK1+bRUXY4Tfe423SbMtaedTfEOg84lY7gGWoZ819aTjeW6GF/9SL14eUq2Wzav
	7c
X-Received: by 2002:a17:907:3e18:b0:c16:82cb:36c with SMTP id a640c23a62f3a-c16b4878388mr158112966b.65.1784314474033;
        Fri, 17 Jul 2026 11:54:34 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f8c5sm118622666b.34.2026.07.17.11.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 11:54:33 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 8/9] staging: rtl8723bs: remove 'rf_chip' from struct hal_com_data
Date: Fri, 17 Jul 2026 21:52:07 +0300
Message-ID: <20260717185407.56513-9-nikolayof23@gmail.com>
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

The 'rf_chip' field is set to only one value (RF_6052), which makes any
conditions with this field predictable.

Remove it and the associated static functions (_ReadRFType() and
_InitRFType()), since they simply set a value in the field and will be
empty without it.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c    |  2 --
 drivers/staging/rtl8723bs/hal/sdio_halinit.c   | 18 ------------------
 drivers/staging/rtl8723bs/include/hal_data.h   |  1 -
 3 files changed, 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 78fa99115751..c46a02588cfd 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -649,8 +649,6 @@ static void phy_SwChnl8723B(struct adapter *padapter)
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	u8 channelToSW = pHalData->CurrentChannel;
 
-	if (pHalData->rf_chip == RF_PSEUDO_11N)
-		return;
 	pHalData->RfRegChnlVal[0] = ((pHalData->RfRegChnlVal[0] & 0xfffff00) | channelToSW);
 	PHY_SetRFReg(padapter, RF_PATH_A, RF_CHNLBW, 0x3FF, pHalData->RfRegChnlVal[0]);
 	PHY_SetRFReg(padapter, RF_PATH_B, RF_CHNLBW, 0x3FF, pHalData->RfRegChnlVal[0]);
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index e11d0add8c02..57d2925642e7 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -533,13 +533,6 @@ static void _InitInterrupt(struct adapter *padapter)
 	InitInterrupt8723BSdio(padapter);
 }
 
-static void _InitRFType(struct adapter *padapter)
-{
-	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
-
-	pHalData->rf_chip	= RF_6052;
-}
-
 static void _RfPowerSave(struct adapter *padapter)
 {
 /* YJ, TODO */
@@ -643,9 +636,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	/*  HW GPIO pin. Before PHY_RFConfig8192C. */
 	HalDetectPwrDownMode(padapter);
 
-	/*  Set RF type for BB/RF configuration */
-	_InitRFType(padapter);
-
 	/*  Save target channel */
 	/*  <Roger_Notes> Current Channel will be updated again later. */
 	pHalData->CurrentChannel = 6;
@@ -976,13 +966,6 @@ static void _EfuseCellSel(struct adapter *padapter)
 	rtw_write32(padapter, EFUSE_TEST, value32);
 }
 
-static void _ReadRFType(struct adapter *Adapter)
-{
-	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
-
-	pHalData->rf_chip = RF_6052;
-}
-
 static void Hal_EfuseParseMACAddr_8723BS(
 	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
 )
@@ -1080,7 +1063,6 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
 	rtw_write8(padapter, 0x4e, val8);
 
 	_EfuseCellSel(padapter);
-	_ReadRFType(padapter);
 	_ReadPROMContent(padapter);
 
 	if (!padapter->hw_init_completed) {
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 3f37d91ebf23..6c8664b59d2f 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -157,7 +157,6 @@ struct hal_com_data {
 	u32 ReceiveConfig;
 
 	/* rf_ctrl */
-	u8 rf_chip;
 	u8 PackageType;
 
 	/*  EEPROM setting. */
-- 
2.55.0

