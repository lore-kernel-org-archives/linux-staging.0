Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E1B243956
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 01:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769476902; cv=none; b=ZlrEjm9M5lS8CaYlMOhgC85oXk77zEVGXJR+50mN7rHM8ml1XFLa8/OwyQP2Xoq6MIplEt372MI/G9Tf3LkmsyatxcpegYnFad4j+oHzyXJWAdCT9jVfSqtpzkqLUkgkZ9HP3ySOuZlVJP3508t8myj5u41dIRMBUeDDCpytYVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769476902; c=relaxed/simple;
	bh=fgE2tpaaBWO71UpxBuDOuX9k2P1qze0TvGiBr8JrSA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Za0u4sodg9Fj+3nSmd18TGKbpurC3pYiatCGz2QYZ14NTVtm73PYU+jTwzBsiMLtphzSVndQ+o5TpwTEUYg3m7OmEr9i/tCKF0405s+45TYwtEG8xGUdvU520y5SYQj2B7R9L4YoA6jtkvSVTZOaTCpxDx2inCx+6Lnl+Sa2Ghw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDIDXzb4; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDIDXzb4"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78fba1a1b1eso77273007b3.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 17:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769476900; x=1770081700; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljjT7O7ItlrDAqEbKHC9+zTCVSY/1bncKmBNPDCi23I=;
        b=BDIDXzb4u9S0ZqCGgo8GPFWRDPL++Q0ikiLzkasLivz2b9vgFc5+NldE4bzuTZG7+G
         CdjTQ+tz55hPcNKv7n5+4+ntyD0EgZ6UHRta4YUgsgMxJJ3sTBZsS8Y5rJQi5zBVxzPu
         EEG4YFgcGHSBYee/+aMtuy0CC+iT+e1ifxbWuBlGa87Mu1su3DUePQ2Jfljsi/yFVUur
         xjpdXuJ8XzaGyGdQsCTxMssJpNXNgDsnKdwB48TEllwX1OXz2njea0+fZnPz1mTCjK/Y
         Z2WFNOROAfjpOIZ9r5T8m0ofq9UEqgclAaswEKbAXHBxg9J7euLrBjjvBHIztkAdBcDa
         Bc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769476900; x=1770081700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ljjT7O7ItlrDAqEbKHC9+zTCVSY/1bncKmBNPDCi23I=;
        b=vMnW42erq7Z6d6Jrf7c6YWVr5aCpNRtb0tC4aEVt3xWW9MDf5rpDPWkP8xULTbB8gn
         A5656b/NhBEsTdJ3tBj4SIN8U5qz0TEjNiEBaxaXkA54C3aNLCm0z7yqsUNzw/q1a9HG
         qK78MujFGmayBsxBreCx9IqIy/vmlOgecm1Fh44kKuM8cF2IjRPFK0ivCqPhnDGq/G20
         +MGCurJhHdzY3MNwarCfwyEiz8W9WaaS+OPU7VouIoHWX/ZkUnbsN1kUx0+A38QYqoBX
         VYdeaLPR8kvzMCcbmqeQcR1GoixSyCNsK8OXHAyGOdMx3yKFqh5Y+hWrwGxotDiTYv8j
         4C2w==
X-Forwarded-Encrypted: i=1; AJvYcCVMgCWLIQxBmOoKZeArLwwhSV5QBeaI+k5UVxdHgjOPbFEYcOYAH9MQ7zuV7c3+nuuKPrj8WsNky+iG5h0k@lists.linux.dev
X-Gm-Message-State: AOJu0YzcPPjxkVS6gwAT5cIPKC7haGPGSOYT+5G5kH66Ugew9d1EbznW
	UP1AGXgF8uJrHb8nn+pRidFQw5XgPH6k8/56VAio/NpXUPfM/fmEp/mhE7VxNw==
X-Gm-Gg: AZuq6aK7IoW+lzhxt/xOxAERN+JZO+elKSyx3O6o1MBtXpTVKi2TY3fOSbnC2U0Khpi
	s32uGgZkaA9v9JwmDCTgOhsKtH99kx3JXJa2UAcvlKZJV3x6e2cSmHO613mfRSfzxXr34n7PI/7
	IOjsLVYGE2zET8m4BohWjOroKOWBcBtlRaEW2gDAgdoo46T4k2n1UvYpRsHd9XtpNtJkSfpiBiM
	Lmgl87aPzJmPy4oRAGRQ0PZCNLIwSa65WghFQCeEDk7RkgKMvnnBgtXT3htF6bkxpt+0PqYh29D
	t1zd2HAZu2I3IAv739HDAMbkRCGejJDllikZX4QCNCnYUPLVi/cH6QhEOfLpXxt+aPDiToWkkFP
	pvpQicNQPlsE5Gbb4d/mEaXRN0PrYpsxsR9C/yuofOVL6YjovmJBDjR9wkUB++wD/4/8=
X-Received: by 2002:a05:690c:101:b0:731:817b:4d73 with SMTP id 00721157ae682-7945ac580b1mr44945707b3.14.1769476899622;
        Mon, 26 Jan 2026 17:21:39 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::89f2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7944c5c9b0bsm40189657b3.57.2026.01.26.17.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 17:21:39 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2 2/8] staging: rtl8723bs: rename RegEnableTxPowerByRate to reg_enable_tx_power_by_rate
Date: Mon, 26 Jan 2026 19:21:12 -0600
Message-ID: <20260127012118.43037-3-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127012118.43037-1-ethantidmore06@gmail.com>
References: <20260127012118.43037-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename RegEnableTxPowerByRate to reg_enable_tx_power_by_rate to 
 avoid CamelCase.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c  |  5 +++--
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c | 11 +++++------
 drivers/staging/rtl8723bs/include/drv_types.h   |  2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c     |  2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 403fb485b6b4..e7e355b41747 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -573,8 +573,9 @@ s8 PHY_GetTxPowerByRate(struct adapter *padapter, u8 RFPath, u8 Rate)
 	s8 value = 0;
 	u8 rateIndex = PHY_GetRateIndexOfTxPowerByRate(Rate);
 
-	if ((padapter->registrypriv.RegEnableTxPowerByRate == 2 && pHalData->EEPROMRegulatory == 2) ||
-		   padapter->registrypriv.RegEnableTxPowerByRate == 0)
+	if ((padapter->registrypriv.reg_enable_tx_power_by_rate == 2 &&
+	     pHalData->EEPROMRegulatory == 2) ||
+	   padapter->registrypriv.reg_enable_tx_power_by_rate == 0)
 		return 0;
 
 	if (RFPath >= RF_PATH_MAX)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index e89e34a6ad8c..95ddb34850bc 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -350,12 +350,11 @@ static int phy_BB8723b_Config_ParaFile(struct adapter *Adapter)
 
 	/*  If EEPROM or EFUSE autoload OK, We must config by PHY_REG_PG.txt */
 	PHY_InitTxPowerByRate(Adapter);
-	if (
-		Adapter->registrypriv.RegEnableTxPowerByRate == 1 ||
-		(Adapter->registrypriv.RegEnableTxPowerByRate == 2 && pHalData->EEPROMRegulatory != 2)
-	) {
-		ODM_ConfigBBWithHeaderFile(&pHalData->odmpriv,
-					   CONFIG_BB_PHY_REG_PG);
+
+	if (Adapter->registrypriv.reg_enable_tx_power_by_rate == 1 ||
+	    (Adapter->registrypriv.reg_enable_tx_power_by_rate == 2 &&
+	   pHalData->EEPROMRegulatory != 2)) {
+		ODM_ConfigBBWithHeaderFile(&pHalData->odmpriv, CONFIG_BB_PHY_REG_PG);
 
 		if (pHalData->odmpriv.PhyRegPgValueType == PHY_REG_PG_EXACT_VALUE)
 			PHY_TxPowerByRateConfiguration(Adapter);
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 4e164bec6f4d..847f29c7f3be 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -157,7 +157,7 @@ struct registry_priv {
 
 	/* define for tx power adjust */
 	u8 reg_enable_tx_power_limit;
-	u8 RegEnableTxPowerByRate;
+	u8 reg_enable_tx_power_by_rate;
 	u8 RegPowerBase;
 	u8 RegPwrTblSel;
 	s8	TxBBSwing_2G;
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 725f1da80d32..1558045f9366 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -260,7 +260,7 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 	registry_par->notch_filter = (u8)rtw_notch_filter;
 
 	registry_par->reg_enable_tx_power_limit = (u8)rtw_tx_pwr_lmt_enable;
-	registry_par->RegEnableTxPowerByRate = (u8)rtw_tx_pwr_by_rate;
+	registry_par->reg_enable_tx_power_by_rate = (u8)rtw_tx_pwr_by_rate;
 
 	registry_par->RegPowerBase = 14;
 	registry_par->TxBBSwing_2G = 0xFF;
-- 
2.52.0

