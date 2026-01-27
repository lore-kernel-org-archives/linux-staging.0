Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078FA23EA93
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 01:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769476900; cv=none; b=Dx1XfRuxav3vg4IXgAOv8n5HG3zehm99fQSYKvUbiGmvZslCE9+mJI5iK5WBgm16PVizXb29X+Isb6wV7BDExBxJFCyuHMqO5+bMYjYQFsEtAXBYzzENqgbBTsLV/KqHriBnwykfj+VJvuxm/JD1/et0ommqjosVGCni1RKGN5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769476900; c=relaxed/simple;
	bh=UsjQ9ltqiiWqDx26LPu62eiYc2Na0nMJXEbawZWT7Qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k0i8ANULpUs4pGPyCOfB9Pn+o7jlBwkUeqJF/YzemZ6MzLt85XQMsWBdXXOxq9RzhOcThJ+z6LrEkUU8uvIos7asNLH94eA+mMjjg26NimJzrC+k/0areiibj5SkihXOZMPyuYhXXlZRjwQDoFocunD8L5vG9KX8Zz9Rn3kGZqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLYhUXM/; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLYhUXM/"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64959e30705so3833858d50.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Jan 2026 17:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769476898; x=1770081698; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/vN9tI+Ty1fNJHJDsZSICBWCE32xAULAqNRkTr4Q8M=;
        b=bLYhUXM/oeXsjIMj74X/sLxjb5IE2CNOcIniYLvfX3gHTY7wxpHN0fnKz4Y8+EguAT
         H2hMyXKGiy7PWCA1DWmxD42MD1SGfzMt6j8wRz++q1MEJD9tp4EMZKxBUfLSxuK5/QQR
         zaj1IQkVN+bOFs8qhLWmEtedUNclv+l7KOxcHhgVitoaaCYxf+rqNXxhthgcjg92Z2DZ
         Ljh1MdYQCjZD5yKkvCOihvLb1TCnAKhCEEr4Nk4t5NcFCiHAlslcx/rOFyg5y+BBr1gl
         kZb4hNumn0GXMlkA8fTYv5pe/tb07YNfLZ8/yO8IN9qG4U3iu+NF2z7mJmYs1oKpb0Fh
         a2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769476898; x=1770081698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+/vN9tI+Ty1fNJHJDsZSICBWCE32xAULAqNRkTr4Q8M=;
        b=PwY9zK+BTEn1sYulXoZyDEgTYbqmNvnVPLY9KC75r/9r8xBs7z5lpjby+A9rzHHCuc
         I49Pf3rlv4RlxJVHPV6zYKCFoZFp89WsQ606DQTVXMwB2H3cVq5ticZqbQDWbaSJvMIh
         8b8xCZtjAzCmok+khIFwOOhUArx8FGyYFbz3Yc8BqKPv+c+2f6vUsUP6aoVfCdksxJ+K
         5oViUiDXHUWbEZtNAhW2CbfZSHGkVluH54838MFsldJ4Y8WveMQOZdMhvE09T8uIPkYr
         8vfC9Vg+DEzEj2oJpZW/3EiDtcws2tmLeoX63mTy3JHRleu3gz0jc08JD3mW2i4JvrdB
         +f4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlO00RzE0Dam+i0A98ioYAFYHsiVKihFGxYSpRoRunEuFVPWRkTmm82k2SgKb/NKACxjPTuFnHvkifScee@lists.linux.dev
X-Gm-Message-State: AOJu0Yy03JglrCXDCjNmNI5i3S4UT+8LE/+rsOdnvnlu9FCtFDANeg+Q
	mTt8tzCINApSk9R7Jm+qrXBrY4LUW0gTms0xXXv7lxq8j+lk78dZZutL
X-Gm-Gg: AZuq6aKWn8DSXy3aUUue/X3wYPbUT7ifV9GxKglK9YM9RnrMSU6x1+DGndqsl1lhS1j
	r/El0qyDNi19HXewUKF93k+5etTNkBlH8va+VywmOwpDEENDS4Zi5ul0ygo+OcX2yJtZIN3uub1
	nl/UteawNH7H/B5PN1PwsS4ofnUau6n17VuPzoP4Hhs2hQ2Swq/pNhUpF43v1TwW6uSS/Vivx/C
	brkyAtCxZifAs66sW7UVn5o/WZWs7J7hKJzFWlNPINTPMgNbbvNvbks2vIB3AX7tMdLED2TgGQJ
	Pn9OavGmG7rfUZeW3jHNVGntQMGsBGhxMZO4C9Zv0CB4PwUDJzq1mnAIbA88rONu1Z+Tj8x3PON
	hN30q1esH76AjKT+8PMYVy605tvrIRQjMn5d0FjuJRgxojcm/D0duH73h62v4tsQAgWVi1C62iK
	fxyA==
X-Received: by 2002:a05:690c:c38f:b0:794:6fa2:a037 with SMTP id 00721157ae682-7946fa2aa29mr39518767b3.8.1769476897891;
        Mon, 26 Jan 2026 17:21:37 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::89f2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7944c5c9b0bsm40189657b3.57.2026.01.26.17.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 17:21:37 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2 1/8] staging: rtl8723bs: rename RegEnableTxPowerLimit to reg_enable_tx_power_limit
Date: Mon, 26 Jan 2026 19:21:11 -0600
Message-ID: <20260127012118.43037-2-ethantidmore06@gmail.com>
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

Rename RegEnableTxPowerLimit to reg_enable_tx_power_limit to avoid
CamelCase.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c |  4 ++--
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c    | 18 +++++++-----------
 drivers/staging/rtl8723bs/include/drv_types.h  |  2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c    |  2 +-
 4 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index cd76e26e868f..403fb485b6b4 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -690,9 +690,9 @@ s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,
 	struct hal_com_data *hal_data = GET_HAL_DATA(adapter);
 	s8 limits[10] = {0}; u8 i = 0;
 
-	if (((adapter->registrypriv.RegEnableTxPowerLimit == 2) &&
+	if (((adapter->registrypriv.reg_enable_tx_power_limit == 2) &&
 	     (hal_data->EEPROMRegulatory != 1)) ||
-	    (adapter->registrypriv.RegEnableTxPowerLimit == 0))
+	    (adapter->registrypriv.reg_enable_tx_power_limit == 0))
 		return MAX_POWER_INDEX;
 
 	switch (adapter->registrypriv.RegPwrTblSel) {
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index d8709d40cb33..e89e34a6ad8c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -338,13 +338,10 @@ static int phy_BB8723b_Config_ParaFile(struct adapter *Adapter)
 
 	/*  Read Tx Power Limit File */
 	PHY_InitTxPowerLimit(Adapter);
-	if (
-		Adapter->registrypriv.RegEnableTxPowerLimit == 1 ||
-		(Adapter->registrypriv.RegEnableTxPowerLimit == 2 && pHalData->EEPROMRegulatory == 1)
-	) {
-		ODM_ConfigRFWithHeaderFile(&pHalData->odmpriv,
-					   CONFIG_RF_TXPWR_LMT, 0);
-	}
+	if (Adapter->registrypriv.reg_enable_tx_power_limit == 1 ||
+	    (Adapter->registrypriv.reg_enable_tx_power_limit == 2 &&
+	   pHalData->EEPROMRegulatory == 1))
+		ODM_ConfigRFWithHeaderFile(&pHalData->odmpriv, CONFIG_RF_TXPWR_LMT, 0);
 
 	/*  */
 	/*  1. Read PHY_REG.TXT BB INIT!! */
@@ -363,10 +360,9 @@ static int phy_BB8723b_Config_ParaFile(struct adapter *Adapter)
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
 
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index f86180dc350c..4e164bec6f4d 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -156,7 +156,7 @@ struct registry_priv {
 	u8 notch_filter;
 
 	/* define for tx power adjust */
-	u8 RegEnableTxPowerLimit;
+	u8 reg_enable_tx_power_limit;
 	u8 RegEnableTxPowerByRate;
 	u8 RegPowerBase;
 	u8 RegPwrTblSel;
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index bc02db13781c..725f1da80d32 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -259,7 +259,7 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 
 	registry_par->notch_filter = (u8)rtw_notch_filter;
 
-	registry_par->RegEnableTxPowerLimit = (u8)rtw_tx_pwr_lmt_enable;
+	registry_par->reg_enable_tx_power_limit = (u8)rtw_tx_pwr_lmt_enable;
 	registry_par->RegEnableTxPowerByRate = (u8)rtw_tx_pwr_by_rate;
 
 	registry_par->RegPowerBase = 14;
-- 
2.52.0

