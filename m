Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFF233D6CC
	for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 14:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769436962; cv=none; b=QOE1JPUJp6LJcqYHNV4zGAGq3DSV8YPOa4oybyVJlHymXvVPNtgYYinVTEqB/so1GsMIV5ALQO0qqiyEp6OaAdxgHPlj3bn6lJG/Wa19+IXwrXaAM+oYRq4aZt7+lj79hPwiERN4MrTVSg5a+d47P+ArvphatIP8Sy5OAxWsDGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769436962; c=relaxed/simple;
	bh=GoEx4Uv75QdjPF0v6d9seZHEr9+BxBBVeRkHUUbqcvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UOzE77cYL1mNQTYRfr4AhTxo0UId+O2dVMgq0sbW0gxWoe4iA5PdPA480AqWjRBpZT+javQWQyufGoCA6/B+FABEC/Z9i+kTMs80KPNeuC1kiwYHa/y59kKd946ft2yE2R3xABPdJA9TyO7disP2L4Q+/NtUYC8tZaUhQs1ZVc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VA4Hwy0K; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VA4Hwy0K"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7945838691aso13751687b3.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 06:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769436959; x=1770041759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XBm6sEEZe9njCPVLqzz+tpfyw7ujSmaY9iyVVX+JmhQ=;
        b=VA4Hwy0KysVJXs6XhrGINZBvX6F2eTZxFaeZtUK+uRNvf8yUXhxCxwnmU95uugR4M/
         i36LcMFLyVgQZy0CYqnByzzpep352EIqIjdNQTDP752ji3BANB1T9F5BKsR2cdWRdnUe
         xmklcO0PFa/+7ikZyOnOntcWI4jDhDTWYK5LXzs4CvS7fxNxXMDLbK5N7C0YGwCaHIB3
         S6aD+l3TSD2rTuvrjuBC2mvktmmGB3Tpaenqkskc5maSNhs020/Zte5ZvjkxmgPn4nmi
         Io/f6wfxexr0ub3sGdb2r2qlUx9nv3RxNmtz2Hqw//Z2tH2DDRmNuCMxshf8YJBVD/lo
         t33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769436959; x=1770041759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBm6sEEZe9njCPVLqzz+tpfyw7ujSmaY9iyVVX+JmhQ=;
        b=EXnbaXZtkbPgJyeHjNVSqnBCUvftgBmOabY8yJVOarsUuKVjYYRYIM6CMEncRop3Cs
         GkYn0rKfhvvpx0WKkIwrh8y4/vLFerBJ1+m7YFbKcrijj71NKpQWxY+i1KxjLp+vb7cU
         HrDunbcYC38bTW2tFLZPZh773ZtNjeQn/uPEOuAHlEaeEky0cpJPDuEKBn71th4n/HD7
         DJA0Y+j2h5QiLQrmvPMSoNOaH+SM3TFi1K0rf7apMfg+6wfKsHC/BVpy/TdqVvHDfrnG
         /Q5Y+wv9CMZW8aLq6bkmtDICNXbtkclbRRoDVYYUM7CVpk+snfkczPtsvIp6V551guJd
         8E6g==
X-Gm-Message-State: AOJu0YxRp8w9Tszk2ZsMcgH1qzsairQnCVMVDPObip2qvcR55ISgDJcy
	VGc3P7OSmADOroEyZgMbE9lv1rSo7eXldfy5XABdc+Kbz6A8U+9bk/ok
X-Gm-Gg: AZuq6aLCzHm6Iu4SkP+FRn7hBNkJP3zgkCEw25pwX721i8FY5HPA45YcfnQtQLsRsNC
	U4mwqQ4nnNPIBG8+j3G6k0dSXcaxiT3PsOyeGKygju6tXRKjZcMIkwxjKBUBA11uSP05S1Y8u78
	mFSVd3KnTpLKk6lbefr5rmYsLXBhasq9lJoqXx4Ev63Mqy2Pq1GO5PNYOxPThkfpA7AyZndC6XO
	RVoyL5GSjPCv8aRdgxMJGL2v2K4KnkPNy60z1RMzP5LCFdWiKIBkZeAS6HakSY+MV1RbBnpiFnl
	+Qp1aWHQbYtfwsfRHyR2iaHXSXueWBaVwY606+v38BfM8mhdzEbQ3iyQZMjceGkyeswpOVOosfQ
	d1lgqQXF43P8lMy+OTDWdkdwQuv2i/JmYTuDjOBzc0pyLm2PIn1t+eBDAx7cfxYWJX5Q=
X-Received: by 2002:a05:690e:4008:b0:649:6f4a:d8d4 with SMTP id 956f58d0204a3-649713668bcmr3110631d50.20.1769436958938;
        Mon, 26 Jan 2026 06:15:58 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::89f2])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6495ce752f2sm5283655d50.1.2026.01.26.06.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 06:15:58 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v1] staging: rtl8723bs: rename members of struct registry_priv
Date: Mon, 26 Jan 2026 08:15:43 -0600
Message-ID: <20260126141543.2527-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename CamelCase members of struct registry_priv to snake_case to
comply with the Linux kernel coding style.

As some of these renames result in longer variable names, use a local
pointer in deeply nested functions to avoid exceeding the 100-column
limit and fix block braces where necessary to maintain style
consistency.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    | 16 ++++++----
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 32 ++++++++-----------
 drivers/staging/rtl8723bs/include/drv_types.h | 18 +++++------
 .../rtl8723bs/include/hal_com_phycfg.h        |  2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 12 +++----
 5 files changed, 39 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index cd76e26e8..450bd2e38 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -573,8 +573,9 @@ s8 PHY_GetTxPowerByRate(struct adapter *padapter, u8 RFPath, u8 Rate)
 	s8 value = 0;
 	u8 rateIndex = PHY_GetRateIndexOfTxPowerByRate(Rate);
 
-	if ((padapter->registrypriv.RegEnableTxPowerByRate == 2 && pHalData->EEPROMRegulatory == 2) ||
-		   padapter->registrypriv.RegEnableTxPowerByRate == 0)
+	if ((padapter->registrypriv.reg_enable_tx_power_by_rate == 2 &&
+	     pHalData->EEPROMRegulatory == 2) ||
+	    padapter->registrypriv.reg_enable_tx_power_by_rate == 0)
 		return 0;
 
 	if (RFPath >= RF_PATH_MAX)
@@ -690,12 +691,12 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,
 	struct hal_com_data *hal_data = GET_HAL_DATA(adapter);
 	s8 limits[10] = {0}; u8 i = 0;
 
-	if (((adapter->registrypriv.RegEnableTxPowerLimit == 2) &&
+	if (((adapter->registrypriv.reg_enable_tx_power_limit == 2) &&
 	     (hal_data->EEPROMRegulatory != 1)) ||
-	    (adapter->registrypriv.RegEnableTxPowerLimit == 0))
+	    (adapter->registrypriv.reg_enable_tx_power_limit == 0))
 		return MAX_POWER_INDEX;
 
-	switch (adapter->registrypriv.RegPwrTblSel) {
+	switch (adapter->registrypriv.reg_pwr_tbl_sel) {
 	case 1:
 		idx_regulation = TXPWR_LMT_ETSI;
 		break;
@@ -750,7 +751,8 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,
 
 void PHY_ConvertTxPowerLimitToPowerIndex(struct adapter *Adapter)
 {
-	struct hal_com_data	*pHalData = GET_HAL_DATA(Adapter);
+	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
+	struct registry_priv *r = &Adapter->registrypriv;
 	u8 BW40PwrBasedBm2_4G = 0x2E;
 	u8 regulation, bw, channel, rateSection;
 	s8 tempValue = 0, tempPwrLmt = 0;
@@ -771,7 +773,7 @@ void PHY_ConvertTxPowerLimitToPowerIndex(struct adapter *Adapter)
 							else if (rateSection == 0) /*  CCK */
 								BW40PwrBasedBm2_4G = PHY_GetTxPowerByRateBase(Adapter, rfPath, CCK);
 						} else
-							BW40PwrBasedBm2_4G = Adapter->registrypriv.RegPowerBase * 2;
+							BW40PwrBasedBm2_4G = r->reg_power_base * 2;
 
 						if (tempPwrLmt != MAX_POWER_INDEX) {
 							tempValue = tempPwrLmt - BW40PwrBasedBm2_4G;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index d8709d40c..897c3f98e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -338,13 +338,11 @@ static int phy_BB8723b_Config_ParaFile(struct adapter *Adapter)
 
 	/*  Read Tx Power Limit File */
 	PHY_InitTxPowerLimit(Adapter);
-	if (
-		Adapter->registrypriv.RegEnableTxPowerLimit == 1 ||
-		(Adapter->registrypriv.RegEnableTxPowerLimit == 2 && pHalData->EEPROMRegulatory == 1)
-	) {
-		ODM_ConfigRFWithHeaderFile(&pHalData->odmpriv,
-					   CONFIG_RF_TXPWR_LMT, 0);
-	}
+
+	if (Adapter->registrypriv.reg_enable_tx_power_limit == 1 ||
+	    (Adapter->registrypriv.reg_enable_tx_power_limit == 2 &&
+	   pHalData->EEPROMRegulatory == 1))
+		ODM_ConfigRFWithHeaderFile(&pHalData->odmpriv, CONFIG_RF_TXPWR_LMT, 0);
 
 	/*  */
 	/*  1. Read PHY_REG.TXT BB INIT!! */
@@ -353,20 +351,18 @@ static int phy_BB8723b_Config_ParaFile(struct adapter *Adapter)
 
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
 
-		if (
-			Adapter->registrypriv.RegEnableTxPowerLimit == 1 ||
-			(Adapter->registrypriv.RegEnableTxPowerLimit == 2 && pHalData->EEPROMRegulatory == 1)
-		)
+		if (Adapter->registrypriv.reg_enable_tx_power_limit == 1 ||
+		    (Adapter->registrypriv.reg_enable_tx_power_limit == 2 &&
+		   pHalData->EEPROMRegulatory == 1))
 			PHY_ConvertTxPowerLimitToPowerIndex(Adapter);
 	}
 
@@ -541,7 +537,7 @@ u8 PHY_GetTxPowerIndex(
 
 	limit = phy_get_tx_pwr_lmt(
 		padapter,
-		padapter->registrypriv.RegPwrTblSel,
+		padapter->registrypriv.reg_pwr_tbl_sel,
 		pHalData->CurrentChannelBW,
 		RFPath,
 		Rate,
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index f86180dc3..a63eb722c 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -156,15 +156,15 @@ struct registry_priv {
 	u8 notch_filter;
 
 	/* define for tx power adjust */
-	u8 RegEnableTxPowerLimit;
-	u8 RegEnableTxPowerByRate;
-	u8 RegPowerBase;
-	u8 RegPwrTblSel;
-	s8	TxBBSwing_2G;
-	u8 AmplifierType_2G;
-	u8 bEn_RFE;
-	u8 RFE_Type;
-	u8  check_fw_ps;
+	u8 reg_enable_tx_power_limit;
+	u8 reg_enable_tx_power_by_rate;
+	u8 reg_power_base;
+	u8 reg_pwr_tbl_sel;
+	s8 tx_bb_swing_2g;
+	u8 amplifier_type_2g;
+	u8 b_en_rfe;
+	u8 rfe_type;
+	u8 check_fw_ps;
 
 	u8 qos_opt_enable;
 
diff --git a/drivers/staging/rtl8723bs/include/hal_com_phycfg.h b/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
index cb7c7ed74..deb5ec16f 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
@@ -90,7 +90,7 @@ void PHY_TxPowerByRateConfiguration(struct adapter *padapter);
 u8 PHY_GetTxPowerIndexBase(struct adapter *padapter, u8 RFPath, u8 Rate,
 			   enum channel_width BandWidth, u8 Channel);
 
-s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 RegPwrTblSel,
+s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,
 		      enum channel_width Bandwidth, u8 RfPath, u8 DataRate,
 		      u8 Channel);
 
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index bc02db137..b67b4997f 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -259,13 +259,13 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 
 	registry_par->notch_filter = (u8)rtw_notch_filter;
 
-	registry_par->RegEnableTxPowerLimit = (u8)rtw_tx_pwr_lmt_enable;
-	registry_par->RegEnableTxPowerByRate = (u8)rtw_tx_pwr_by_rate;
+	registry_par->reg_enable_tx_power_limit = (u8)rtw_tx_pwr_lmt_enable;
+	registry_par->reg_enable_tx_power_by_rate = (u8)rtw_tx_pwr_by_rate;
 
-	registry_par->RegPowerBase = 14;
-	registry_par->TxBBSwing_2G = 0xFF;
-	registry_par->bEn_RFE = 1;
-	registry_par->RFE_Type = 64;
+	registry_par->reg_power_base = 14;
+	registry_par->tx_bb_swing_2g = 0xFF;
+	registry_par->b_en_rfe = 1;
+	registry_par->rfe_type = 64;
 
 	registry_par->qos_opt_enable = (u8)rtw_qos_opt_enable;
 
-- 
2.52.0

