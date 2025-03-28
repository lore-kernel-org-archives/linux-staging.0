Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC2F482F2;
	Fri, 28 Mar 2025 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743165854; cv=none; b=eEWa7qv1tO9Re9DTfzSA+T1fMwKzagR4VoIEvW4kes9AanHTk/S/fKFPGWMI/pjquFsWkmn4GksEF1nMfFdooo1O5XRW05HBmPnlpDEPfeFKCpPTok5vszR0Y+hbjBDfC8pRBddNW+y6ZYa7NzLRb/LHCZGajtYuXNjzokAd+rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743165854; c=relaxed/simple;
	bh=WrIN+BAUrs5NvGZQtogfzo0keNjYdjwvQej6G+pv1u0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GnLxtnqFtmGmtWy33JANorwwoL1iyOcq9kR8TUDCz+SXHFf+J5StFX7VvBuTG6HbUUPaQQT/nSzQoeX4hNaOi20Pgzp3NQXghItMUtRcOlSnl9mXjMu1WDifI+d+j5KBdVpxeBJhfO88Okv9wuqHM+RLMZ7pkYVbmV506Mea3YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LgXfquEs; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgXfquEs"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso10408355e9.0;
        Fri, 28 Mar 2025 05:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743165849; x=1743770649; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0TonPVWz9mI3rQIo8Nx/goVi88wQEsQiD42zjG9CpU=;
        b=LgXfquEsh3r8a8hVUmeu7i006g1SIJKZeNoiInKu6ZF13nP4WGu3gs7gzKBtEkEZMK
         BSZLr4PKqIJidBVVxoAZl/hcgcemB9ziafQwEhz/I4IMhEXoB4CpDh4DPLjLConeT94B
         GZV8HKo+WdHLQpK4AJcxETMotJ6ynDzAQx7twT/xMKfmp9TorFdgnEP/4ckAFa7aDk7g
         KLBX74h9mgF7SRPvuFN7oghPmJeW6lOKRHvMF6l/cUGouQ4uULNAqGihDBj5fP0DI5eV
         TSV2W5Q6VlWxR/uyKTcBFOuipqvUSGKBCHjV6JnmlPTX3lDDwPFYzxl1eOVx2wojy4vb
         jeog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743165849; x=1743770649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0TonPVWz9mI3rQIo8Nx/goVi88wQEsQiD42zjG9CpU=;
        b=onhuwUPJTHUSi78FVox7EB/VQT4Eorc13bJEopKPynjxTYDWOlJUeEoQqrTrvzl+V6
         2/wtAjtyBVVgP79t4cB7P8akL5Ug3+P0WtW39aNC9wMWhW3DKgn1sNsj+E+mdzCNAUfD
         0zh2CtcqG2UxfBJUn0AePMppQjv+76IA4PY+xfZkonmHUPTPbE/IrJhldkB7vgIJMSuf
         wRwGQo/KCP//1j8ca2KYlGGCJeouUre2OFnMaFQs/QSkDbJeOVqe+CS2H7DZ7kmW6qN2
         DyZxsS0bevbsYFcIMOaxqbvr/nwZ3KBut8JIzLOmCs9aSM94loYwcpwOZM5ry90ouQNq
         N3kQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2pCFseROnd3c/cAAUbsmLZCRpzJ67sTVOvg+rlo/UHqd7xg1wTTy5f3KwA9WJmpix1ZtcYsToRnCTQT++@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk6TFoz5tR4gnp+jxcrew8tmBxiM+yXe+vrt4AsElEVUYBYQcb
	CIQFsodh7JKePdRas4Cq8owI2ScZ2SE9j/tvzXd8Kz7BYkgNajN5
X-Gm-Gg: ASbGncsWdweIQnkWD1FCt1hY7/fQMTafR+wt7aZkXPg74x3pDtHt1fvQsA39HmiKObL
	dz9Bq0ibBMXZ25EHRmlIzpmeX40nTrcpo5WBmLxFo7JjKeHD0tRARKnLixukHpaIj/AXugkF8Sf
	/L5EuNLFl6RFr5gGC4M2G29lHqHv+qJGsGGAyDcomf5C76HevmVObN3WHq7LK4yUmg0BmMwsRKc
	nMBxSv38jEt3S0gR9r1XmmJKCBRzbMG2NlkcVLp/opuRhQOTbeLt/H89GiU6jZLA0KdXwLFPsUV
	lOmDvZswwQbQ/yQyEp+UiogO+yGg08Mf9X6ZwvVMxeaCcQtD
X-Google-Smtp-Source: AGHT+IH+M1H6NQa8Z2M4QlINtAbkG+ajmJC/3xRR4fh+SsBnVhZz4g7Oz2Ge60JhFSFIpN14jqi2SA==
X-Received: by 2002:a05:600c:83cf:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-43d84fbbc43mr84772155e9.16.1743165848864;
        Fri, 28 Mar 2025 05:44:08 -0700 (PDT)
Received: from HP-650 ([105.112.193.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a448dsm2483159f8f.100.2025.03.28.05.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 05:44:08 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	julia.lawall@inria.fr,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH 5/5] staging: rtl8723bs: modify variable names to comply with kernel naming convention
Date: Fri, 28 Mar 2025 13:39:42 +0100
Message-Id: <dd32dfe6c837d88dd13a546aadcb0bc207b997d6.1743163801.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743163800.git.abrahamadekunle50@gmail.com>
References: <cover.1743163800.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable names use the camelCase naming convention which is not consistent
with Linux kernel naming convention.

Modify the names to use snake_case in adherence to the Linux kernel approved
naming convention for consistency with the codebase.

Reported by checkpatch:

CHECK: Avoid camelCase:

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 22 +++++-----
 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 42 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  8 ++--
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 14 +++----
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 18 ++++----
 5 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ad949b0e2b97..ae22b2bf5446 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1132,10 +1132,10 @@ static void collect_traffic_statistics(struct adapter *padapter)
 
 u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 {
-	u8 bEnterPS = false;
-	u16 BusyThresholdHigh = 25;
-	u16 BusyThresholdLow = 10;
-	u16 BusyThreshold = BusyThresholdHigh;
+	u8 b_enter_ps = false;
+	u16 busy_threshold_high = 25;
+	u16 busy_threshold_low = 10;
+	u16 busy_threshold = busy_threshold_high;
 	u8 bBusyTraffic = false, bTxBusyTraffic = false, bRxBusyTraffic = false;
 	u8 bHigherBusyTraffic = false, bHigherBusyRxTraffic = false, bHigherBusyTxTraffic = false;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -1149,10 +1149,10 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 		/*&& !MgntInitAdapterInProgress(pMgntInfo)*/) {
 		/*  if we raise bBusyTraffic in last watchdog, using lower threshold. */
 		if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
-			BusyThreshold = BusyThresholdLow;
+			busy_threshold = busy_threshold_low;
 
-		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > BusyThreshold ||
-			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > BusyThreshold) {
+		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > busy_threshold ||
+			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > busy_threshold) {
 			bBusyTraffic = true;
 
 			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
@@ -1175,7 +1175,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 		/*  check traffic for  powersaving. */
 		if (((pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod + pmlmepriv->LinkDetectInfo.NumTxOkInPeriod) > 8) ||
 			(pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 2)) {
-			bEnterPS = false;
+			b_enter_ps = false;
 
 			if (bBusyTraffic) {
 				if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount <= 4)
@@ -1193,11 +1193,11 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 				pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
 
 			if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount == 0)
-				bEnterPS = true;
+				b_enter_ps = true;
 		}
 
 		/*  LeisurePS only work in infra mode. */
-		if (bEnterPS) {
+		if (b_enter_ps) {
 			if (!from_timer)
 				LPS_Enter(padapter, "TRAFFIC_IDLE");
 		} else {
@@ -1227,7 +1227,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 	pmlmepriv->LinkDetectInfo.bHigherBusyRxTraffic = bHigherBusyRxTraffic;
 	pmlmepriv->LinkDetectInfo.bHigherBusyTxTraffic = bHigherBusyTxTraffic;
 
-	return bEnterPS;
+	return b_enter_ps;
 
 }
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 62a2919086f3..6a2fc4dfa07e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -10,21 +10,21 @@
 
 
 /* Define global variables */
-u8 fakeEfuseBank;
-u32 fakeEfuseUsedBytes;
-u8 fakeEfuseContent[EFUSE_MAX_HW_SIZE] = {0};
-u8 fakeEfuseInitMap[EFUSE_MAX_MAP_LEN] = {0};
-u8 fakeEfuseModifiedMap[EFUSE_MAX_MAP_LEN] = {0};
-
-u32 BTEfuseUsedBytes;
-u8 BTEfuseContent[EFUSE_MAX_BT_BANK][EFUSE_MAX_HW_SIZE];
-u8 BTEfuseInitMap[EFUSE_BT_MAX_MAP_LEN] = {0};
-u8 BTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
-
-u32 fakeBTEfuseUsedBytes;
-u8 fakeBTEfuseContent[EFUSE_MAX_BT_BANK][EFUSE_MAX_HW_SIZE];
-u8 fakeBTEfuseInitMap[EFUSE_BT_MAX_MAP_LEN] = {0};
-u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
+u8 fake_efuse_bank;
+u32 fake_efuse_used_bytes;
+u8 fake_efuse_content[EFUSE_MAX_HW_SIZE] = {0};
+u8 fake_efuse_init_map[EFUSE_MAX_MAP_LEN] = {0};
+u8 fake_efuse_modified_map[EFUSE_MAX_MAP_LEN] = {0};
+
+u32 bte_fuse_used_bytes;
+u8 bte_fuse_content[EFUSE_MAX_BT_BANK][EFUSE_MAX_HW_SIZE];
+u8 bte_use_init_map[EFUSE_BT_MAX_MAP_LEN] = {0};
+u8 bte_use_modified_map[EFUSE_BT_MAX_MAP_LEN] = {0};
+
+u32 fakebte_fuse_used_bytes;
+u8 fakebte_fuse_content[EFUSE_MAX_BT_BANK][EFUSE_MAX_HW_SIZE];
+u8 fakebte_use_init_map[EFUSE_BT_MAX_MAP_LEN] = {0};
+u8 fakebte_use_modified_map[EFUSE_BT_MAX_MAP_LEN] = {0};
 
 #define REG_EFUSE_CTRL		0x0030
 #define EFUSE_CTRL			REG_EFUSE_CTRL		/*  E-Fuse Control. */
@@ -33,10 +33,10 @@ static bool Efuse_Read1ByteFromFakeContent(u16 Offset, u8 *Value)
 {
 	if (Offset >= EFUSE_MAX_HW_SIZE)
 		return false;
-	if (fakeEfuseBank == 0)
-		*Value = fakeEfuseContent[Offset];
+	if (fake_efuse_bank == 0)
+		*Value = fake_efuse_content[Offset];
 	else
-		*Value = fakeBTEfuseContent[fakeEfuseBank - 1][Offset];
+		*Value = fakebte_fuse_content[fake_efuse_bank - 1][Offset];
 	return true;
 }
 
@@ -44,10 +44,10 @@ static bool Efuse_Write1ByteToFakeContent(u16 Offset, u8 Value)
 {
 	if (Offset >= EFUSE_MAX_HW_SIZE)
 		return false;
-	if (fakeEfuseBank == 0)
-		fakeEfuseContent[Offset] = Value;
+	if (fake_efuse_bank == 0)
+		fake_efuse_content[Offset] = Value;
 	else
-		fakeBTEfuseContent[fakeEfuseBank - 1][Offset] = Value;
+		fakebte_fuse_content[fake_efuse_bank - 1][Offset] = Value;
 	return true;
 }
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 183c3046ca1f..90966b7034ab 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3579,7 +3579,7 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 	dump_mgntframe(padapter, pmgntframe);
 }
 
-static void issue_action_BSSCoexistPacket(struct adapter *padapter)
+static void issue_action_bss_coexist_packet(struct adapter *padapter)
 {
 	struct list_head		*plist, *phead;
 	unsigned char category, action;
@@ -3901,9 +3901,9 @@ void site_survey(struct adapter *padapter)
 			pmlmeext->chan_scan_time = SURVEY_TO;
 			pmlmeext->sitesurvey_res.state = SCAN_DISABLE;
 
-			issue_action_BSSCoexistPacket(padapter);
-			issue_action_BSSCoexistPacket(padapter);
-			issue_action_BSSCoexistPacket(padapter);
+			issue_action_bss_coexist_packet(padapter);
+			issue_action_bss_coexist_packet(padapter);
+			issue_action_bss_coexist_packet(padapter);
 		}
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 84109e338c86..75ce5f15f996 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -406,14 +406,14 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 {
 	unsigned long start_time;
-	u8 bAwake = false;
+	u8 b_awake = false;
 	s32 err = 0;
 
 
 	start_time = jiffies;
 	while (1) {
-		rtw_hal_get_hwreg(padapter, HW_VAR_FWLPS_RF_ON, &bAwake);
-		if (bAwake)
+		rtw_hal_get_hwreg(padapter, HW_VAR_FWLPS_RF_ON, &b_awake);
+		if (b_awake)
 			break;
 
 		if (padapter->bSurpriseRemoved) {
@@ -558,11 +558,11 @@ void LPS_Leave_check(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv;
 	unsigned long	start_time;
-	u8 bReady;
+	u8 b_ready;
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
-	bReady = false;
+	b_ready = false;
 	start_time = jiffies;
 
 	cond_resched();
@@ -573,11 +573,11 @@ void LPS_Leave_check(struct adapter *padapter)
 		if (padapter->bSurpriseRemoved ||
 		    !(padapter->hw_init_completed) ||
 		    (pwrpriv->pwr_mode == PS_MODE_ACTIVE))
-			bReady = true;
+			b_ready = true;
 
 		mutex_unlock(&pwrpriv->lock);
 
-		if (bReady)
+		if (b_ready)
 			break;
 
 		if (jiffies_to_msecs(jiffies - start_time) > 100)
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 73c70b016f00..06e7677b5e3a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -223,16 +223,16 @@ void UpdateBrateTblForSoftAP(u8 *bssrateset, u32 bssratelen)
 
 void Save_DM_Func_Flag(struct adapter *padapter)
 {
-	u8 bSaveFlag = true;
+	u8 b_save_flag = true;
 
-	rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_OP, (u8 *)(&bSaveFlag));
+	rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_OP, (u8 *)(&b_save_flag));
 }
 
 void Restore_DM_Func_Flag(struct adapter *padapter)
 {
-	u8 bSaveFlag = false;
+	u8 b_save_flag = false;
 
-	rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_OP, (u8 *)(&bSaveFlag));
+	rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_OP, (u8 *)(&b_save_flag));
 }
 
 void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable)
@@ -1502,7 +1502,7 @@ void update_capinfo(struct adapter *Adapter, u16 updateCap)
 {
 	struct mlme_ext_priv *pmlmeext = &Adapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	bool		ShortPreamble;
+	bool		short_preamble;
 
 	/*  Check preamble mode, 2005.01.06, by rcnjko. */
 	/*  Mark to update preamble value forever, 2008.03.18 by lanhsin */
@@ -1511,16 +1511,16 @@ void update_capinfo(struct adapter *Adapter, u16 updateCap)
 		if (updateCap & cShortPreamble) {
 			/*  Short Preamble */
 			if (pmlmeinfo->preamble_mode != PREAMBLE_SHORT) { /*  PREAMBLE_LONG or PREAMBLE_AUTO */
-				ShortPreamble = true;
+				short_preamble = true;
 				pmlmeinfo->preamble_mode = PREAMBLE_SHORT;
-				rtw_hal_set_hwreg(Adapter, HW_VAR_ACK_PREAMBLE, (u8 *)&ShortPreamble);
+				rtw_hal_set_hwreg(Adapter, HW_VAR_ACK_PREAMBLE, (u8 *)&short_preamble);
 			}
 		} else {
 			/*  Long Preamble */
 			if (pmlmeinfo->preamble_mode != PREAMBLE_LONG) { /*  PREAMBLE_SHORT or PREAMBLE_AUTO */
-				ShortPreamble = false;
+				short_preamble = false;
 				pmlmeinfo->preamble_mode = PREAMBLE_LONG;
-				rtw_hal_set_hwreg(Adapter, HW_VAR_ACK_PREAMBLE, (u8 *)&ShortPreamble);
+				rtw_hal_set_hwreg(Adapter, HW_VAR_ACK_PREAMBLE, (u8 *)&short_preamble);
 			}
 		}
 	}
-- 
2.34.1

