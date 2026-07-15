Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04874A1390
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119862; cv=none; b=t7qt5/N8y7pDFhGu55GIwJAd/5+UJd+rcHDraJKmqO7oAShpg1lk5i9I9zcIRut8wb05iBHAV06t5Yfgv8tmFkOdQ8bgZr3ADsq9nDSGkdCLh9N+kDD/5TCgRPtBzukfbqKLjFrl2Db2tyLvzldx44r06PKbnn7uTnRUcODzsqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119862; c=relaxed/simple;
	bh=ZybPtwgV9g5pEAiIu8Xt4xd8WcHEPSvLIBdB5uTgeIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=apBnlt+5YZ6TaJu0ZHcSSK/xfx2bxtuzjQQiSk1QRx+gOMNqOhTh41crcgYbneMsN72yN7b+jXNGADMSDVLokPaWPMHv8iHYOgnQI7Nm8NS1dNdne1s2b/kZRcQ/l3N9Tl+0ZGoauuu0bjAuZqBCbN77PCZjUBaBfwDRn8iJpHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pku+veyJ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pku+veyJ"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39c83acb86eso19094141fa.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119854; x=1784724654; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKfBmQTqieXbamD4LbBY6VXDsMe0l1JKVyBB18eX4Mg=;
        b=pku+veyJTLue0/guZDza7VU8WGd+ZnKA481CaISYhxu6ZlU7ZEQdVRjUrWCZrenOye
         wLs3SV0PouaPOWX+WcXWT51QWGZgWi+T3dVuF+kuepil5je59C4ICjTWvWMkDH7ZXAgC
         +YJRtGk2pE2iMKeLfkVtUCvGoeaNV+BOqtxw3qikI+MFj3N2ZWSD8fSOY4HtS8gFYkIG
         uq0J3mlfFXzfM0itMSuRARz7lYvuFwPU//CTUrcOV6XuRZJFXh6CNb2KYlZizmDTlwx8
         50VRLqDBfwL44Ua/C3bni5+s5gNg0uZJSQsOnUmVIMbYmcM1cwuMFE9bO4jh4tDRgZXz
         kyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119854; x=1784724654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JKfBmQTqieXbamD4LbBY6VXDsMe0l1JKVyBB18eX4Mg=;
        b=ldV6/zeAcE/BtStfGibXraiYhTfMWS4qUaLcIkjrG7tKOS6LSEXIjoGM/Fs1VO7N+2
         kVdqW3qarvprikkXW+mFsSk/QewT2kKs3mNg1mZareIRpo1wLg+VrqK/cj9JWF/GbGMC
         bXcz3sXlokwS+TnUVnYOFIbAk42A5tjIuaWQYBcPq3RfjMppDGb7lRVHL4KsF6wfekZY
         HxfcvyNQpAPwj8wNYm+MvBHIJuYO3RR3Snmf3Ecg2iRwboUuxqq1oE72/IWKN/EHlFDu
         qHCgqA0B84DR7lXBYVX4/VG95PVUMtvuScVd0r8Lq2ET1crK3OlYI1akZjFoZpjxWpAd
         qwww==
X-Gm-Message-State: AOJu0Yy0hp80Udd3wyYSppWeMGKPyxvZc+t7880qTyRSQRldcApk8He3
	G/26D39xoXdkyTcYQJfs8gV4h6GF6G/5tk9rejQ4RzebclVAQCt2SYSG
X-Gm-Gg: AfdE7cmbOvlKG5jstKehudCrMbBlRyE9/WiY1NV+0ZFu2Lfd1VT2xMn61xWx/bK0+4S
	Bc2HkAwub19YCKtThZn/gmi34yi2CKw6IuIdH5UUKtydmraBiORi7PHh+82KmCZSxc4V+c78RX7
	r5nOvQcG3x0RBpJF99ve+ign/a3HzwKxlQwV4Ec2qzBy2TqPTRiA+W8VToXaQV24kJQGDVsXlFi
	B1gLgVvDW1+Fv+fYeZB8nUhf0FyzoKVmqbBDHRL48dzCDu8t3E/zJUeUJxzF40LwoVvldJOM2ir
	LQ5So2JETu/2VPGGb9A0j9Hs+7h2MesFFWPmky0kFBVW4KEMT3qfu2io8USnqnrKGksNtwsuwiw
	eJLL5+sx7geJRichFRI1nluYXwhH2U3VpKodbFuyHEZjqjOG1YCKa48DC1MXgXn4pi/q5zAVGN8
	MEfLb1xbeQE+WEYFDeDfNcwj8lp4Rd/S+nX8useZY9Q8ufj1RFsHK5cZ8zL4FmtkmGzYeCe1IXA
	N8L8RnZaseTQg==
X-Received: by 2002:a05:6512:12cc:b0:5b0:17e7:67cb with SMTP id 2adb3069b0e04-5b02366a270mr4528182e87.17.1784119854037;
        Wed, 15 Jul 2026 05:50:54 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:53 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 48/61] staging: rtl8723bs: remove PHY_TxPowerByRateConfiguration wrapper
Date: Wed, 15 Jul 2026 19:48:16 +0700
Message-ID: <20260715124829.90290-49-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the single-use function PHY_TxPowerByRateConfiguration. Inline
its code directly at the call site, along with the relevant block
comment, to eliminate an unnecessary redirection layer and clean up
the overall driver flow.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c     | 13 ++-----------
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c    |  7 ++++---
 drivers/staging/rtl8723bs/include/hal_com_phycfg.h |  1 -
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h   |  4 ++++
 4 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 21b9d1c82..32b69ba3b 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -60,7 +60,7 @@ phy_SetTxPowerByRateBase(struct adapter *Adapter, u8 RfPath,
 	}
 }
 
-static void phy_StoreTxPowerByRateBase(struct adapter *padapter)
+void phy_StoreTxPowerByRateBase(struct adapter *padapter)
 {
 	u8 path, base;
 
@@ -367,7 +367,7 @@ void PHY_StoreTxPowerByRate(
 	}
 }
 
-static void phy_ConvertTxPowerByRateInDbmToRelativeValues(struct adapter *padapter)
+void phy_ConvertTxPowerByRateInDbmToRelativeValues(struct adapter *padapter)
 {
 	u8 base = 0;
 	u8 i = 0;
@@ -408,15 +408,6 @@ static void phy_ConvertTxPowerByRateInDbmToRelativeValues(struct adapter *padapt
 	}
 }
 
-/*
- * This function must be called if the value in the PHY_REG_PG.txt(or header)
- * is exact dBm values
- */
-void PHY_TxPowerByRateConfiguration(struct adapter *padapter)
-{
-	phy_StoreTxPowerByRateBase(padapter);
-	phy_ConvertTxPowerByRateInDbmToRelativeValues(padapter);
-}
 
 void PHY_SetTxPowerIndexByRateSection(
 	struct adapter *padapter, u8 RFPath, u8 Channel, u8 RateSection
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index d6369eb7b..75d01e730 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -346,9 +346,10 @@ static int phy_BB8723b_Config_ParaFile(struct adapter *Adapter)
 	   pHalData->EEPROMRegulatory != 2)) {
 		ODM_ConfigBBWithHeaderFile(&pHalData->odmpriv, CONFIG_BB_PHY_REG_PG);
 
-		if (pHalData->odmpriv.PhyRegPgValueType == PHY_REG_PG_EXACT_VALUE)
-			PHY_TxPowerByRateConfiguration(Adapter);
-
+		if (pHalData->odmpriv.PhyRegPgValueType == PHY_REG_PG_EXACT_VALUE) {
+			phy_StoreTxPowerByRateBase(Adapter);
+			phy_ConvertTxPowerByRateInDbmToRelativeValues(Adapter);
+		}
 		if (Adapter->registrypriv.reg_enable_tx_power_limit == 1 ||
 		    (Adapter->registrypriv.reg_enable_tx_power_limit == 2 &&
 		   pHalData->EEPROMRegulatory == 1))
diff --git a/drivers/staging/rtl8723bs/include/hal_com_phycfg.h b/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
index cb7c7ed74..2dde01c2a 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
@@ -85,7 +85,6 @@ void PHY_InitTxPowerByRate(struct adapter *padapter);
 void PHY_StoreTxPowerByRate(struct adapter *padapter, u32 RfPath,
 			    u32	RegAddr, u32 BitMask, u32 Data);
 
-void PHY_TxPowerByRateConfiguration(struct adapter *padapter);
 
 u8 PHY_GetTxPowerIndexBase(struct adapter *padapter, u8 RFPath, u8 Rate,
 			   enum channel_width BandWidth, u8 Channel);
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index b6006110a..fe6401c4f 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -239,4 +239,8 @@ s32 c2h_handler_8723b(struct adapter *padapter, u8 *pC2hEvent);
 void Hal_ReadRFGainOffset(struct adapter *padapter, u8 *hwinfo,
 			  bool AutoLoadFail);
 
+
+void phy_StoreTxPowerByRateBase(struct adapter *padapter);
+void phy_ConvertTxPowerByRateInDbmToRelativeValues(struct adapter *padapter);
+
 #endif
-- 
2.55.0

