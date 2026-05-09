Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3880E282F00
	for <linux-staging@lists.linux.dev>; Sat,  9 May 2026 03:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778297022; cv=none; b=SDaagcj6DA2hKw87ni4bsN48vEcb/YRQqh5eqZErUFYl3qb+HfsCwaMa66Zp7O+Gj8CaDz2lZRjaBD8kVuhgjps8eVkZXpismRQ1LUADEQ6s8F+rdNGXctHUDS0ZK5gg5VKAVt6lDW6/9KCpA9OLEJstpbljeuVbLnNtuJKA0Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778297022; c=relaxed/simple;
	bh=Z8+cdmxW/Dm857cl+0Oo8Z+NOiPltxgz/uPdCWtJ24I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hNE0hwUS1AxY3iG2fHXf7i8azCxKCfQoP4AJtSj4UH3Nnoi9WN4rvIebvXhQmzhrrwW34964DCIMjWYd8O4o994QmAQs61FxVXRK8xQT6LhV41udNXwAYdiklQD1Y9rm0PGURToIMOYNLRl7FbDPGa66iKZ/5W0quD5yIhACtmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mecBfNEO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mecBfNEO"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488d2079582so28273135e9.2
        for <linux-staging@lists.linux.dev>; Fri, 08 May 2026 20:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778297015; x=1778901815; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wsk/QaK6R/lcIdIuqhlQw4uaqeFfOOUPnYVze/0dJhY=;
        b=mecBfNEON7tJwNL/2d9S/EnPNFdBguixJAe9uiWfs5vDPQ4izKDv+W5kVVqCssCj4g
         rwoxeb+kjYVhTBhWyIpAQ97iS3+PdxZ38U1hoCyk8JOen3GLZ/6FGGdQD9y1Y3AD0sFZ
         kFsMvCPpxlRpURHRToGm0K6sXDo4IRBOvepVCVnOx9gkZTon86Re5XIaxOeKtjSjMQjh
         mGzr/nxo7wYDq7fg+O4Yo8mfmFLrTlP8D+JYqhdUt5tDgg9myei2RWSwzzPs6ywqu8Eu
         83au7rmNqImWOmt0aCiCy/elf63NbFFMQP9vNsPM61wxrRvKUtmlSVbIKSJQPkO9RTos
         q0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778297015; x=1778901815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsk/QaK6R/lcIdIuqhlQw4uaqeFfOOUPnYVze/0dJhY=;
        b=eYhU6EoIKlJx/a0561Mb41dse3jPnhtS1xGh+8n44zfYUkFWTwQcAldCDTuGbqgHqM
         Cjyt9QrQVzcjrtOrmKP9ay6+eIQzPTeZ2B2HLYMaqF8Md4XgHMbcauUCyos6ryJArfUb
         9ugITpf7GfkkEw09ZcZ5L7rRKUuyt2xuTy+d6djNLskR8DEnZwWz0QhDhvmq6HD3cKiU
         KIeF8RzRnbCELMmIaemyD2pcgLkZeUcfot0S4z4YZfQtIMNa/8gTmldAuRXca86N4e/4
         okMBQhZF4slvWKeHbeweRUoarUuB1N4KQeGIsCSD0z5aMFkSTI9VY8wsvSv9Cew/Qg1F
         i5bg==
X-Gm-Message-State: AOJu0Yx1cjbm2cM8vEclc5IEdXBqmmCjLpVOe7aGbeOKNBaB5YD+9rXX
	EZx2nfLb8W764iWwFilYGBCy7j4ZTsvAKUdGLIpomCuR9K85nyal9ubm
X-Gm-Gg: AeBDieu5IZEea5BFjJSEdydys2uR4Ykawhl3VYSSu4auicm/lstr7r4F52FSvLGvQoB
	VcnBVCOtszELQPvexQthEy+bO5Wsik5iw1cK8OMdtXdLZyZDRuLgX6LZBh+RgUjFqEPNxvovV4t
	MdlptAYDWwBzACgwfKIsUGun9ui4OGJJQuQP7nyohUD0B1nGf6/XDx1EI6XnA1qje1yUhCGlQqi
	raL5nvpgBdQR63Uwd3UZ8zpRva5Dt8eAmOJ8gGpYqdkU+p6RW4xPpJWkGjow+aexlAYPk9tCBRC
	ROlVzj8r99OlcWTpqioJj603IkWG9Gs35QAE0lwQd5OJfpUTbhB9Z5hF/SW2WlyUyFve66kgyAj
	wQ6uqjJRbTa93i25TZCSTH+QRlhfDEtyPriE81rFck/24VC/nkvUTyhOIwl+mfhOzCZ4aZNeZZW
	0FS+lOWEh8D3QQi+DBC4Fjk/OnSOmKSykYdhoIa8P6RPH2CwdFL5/UduHhPOtZnlxhMQIwpnuTz
	S/pvXDmT+WBXYwc2E5EhrqowBW7VOXmO2CLhKvMdpqo/0Te0AFNfWSRl7twMoK4XoTIf7jAarNC
	74/ofI7Y60DGAqCKDNM=
X-Received: by 2002:a05:600c:34c8:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48e51f2ed22mr259623505e9.15.1778297014817;
        Fri, 08 May 2026 20:23:34 -0700 (PDT)
Received: from dynamic-pd01.res.v6.highway.a1.net ([2001:871:25e:8576:c50a:9875:702a:ab71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6d8d6bdbsm13404565e9.3.2026.05.08.20.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 20:23:32 -0700 (PDT)
From: =?UTF-8?q?Michael=20Steinm=C3=B6tzger?= <m.steinmoetzger@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Michael=20Steinm=C3=B6tzger?= <m.steinmoetzger@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace non-standard BITn macros with BIT(n)
Date: Sat,  9 May 2026 05:22:02 +0200
Message-ID: <20260509032202.146240-1-m.steinmoetzger@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the local BIT0-BIT31 macro definitions from osdep_service.h
and replace all usages with the kernel's BIT(n) macro from <linux/bitops.h>.

NOTE: DYNAMIC_BB_DYNAMIC_TXPWR is defined as BIT2 and used
in a bitwise NOT expression. Migrating to BIT(2) causes an
-Werror=overflow warning due to the unsigned long result not
fitting in u32. This instance has been left unconverted.

Compile-tested only.

Signed-off-by: Michael Steinmötzger <m.steinmoetzger@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c    |   2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  16 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |   2 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |   2 +-
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   |  36 ++--
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.h   |  18 +-
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   |  20 +-
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.h   |  16 +-
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h  |  10 +-
 .../staging/rtl8723bs/hal/HalHWImg8723B_BB.c  |  30 +--
 .../staging/rtl8723bs/hal/HalHWImg8723B_MAC.c |  24 +--
 .../staging/rtl8723bs/hal/HalHWImg8723B_RF.c  |  24 +--
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    |  24 +--
 drivers/staging/rtl8723bs/hal/hal_com.c       |   4 +-
 drivers/staging/rtl8723bs/hal/odm.c           |   2 +-
 drivers/staging/rtl8723bs/hal/odm.h           |  50 ++---
 drivers/staging/rtl8723bs/hal/odm_DIG.c       |  22 +--
 drivers/staging/rtl8723bs/hal/odm_DIG.h       |   4 +-
 .../rtl8723bs/hal/odm_DynamicBBPowerSaving.c  |  12 +-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |   4 +-
 .../staging/rtl8723bs/hal/odm_RegDefine11N.h  |   4 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  20 +-
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  12 +-
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   |   4 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |   2 +-
 drivers/staging/rtl8723bs/include/drv_types.h |   6 +-
 .../staging/rtl8723bs/include/hal_com_reg.h   | 104 +++++-----
 drivers/staging/rtl8723bs/include/hal_data.h  |   2 +-
 drivers/staging/rtl8723bs/include/hal_intf.h  |  16 +-
 drivers/staging/rtl8723bs/include/hal_phy.h   |   4 +-
 .../staging/rtl8723bs/include/hal_pwr_seq.h   | 182 +++++++++---------
 .../staging/rtl8723bs/include/osdep_service.h |  32 ---
 .../staging/rtl8723bs/include/rtl8723b_spec.h |  88 ++++-----
 drivers/staging/rtl8723bs/include/rtw_cmd.h   |   4 +-
 drivers/staging/rtl8723bs/include/rtw_ht.h    |  16 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |   6 +-
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |   6 +-
 .../staging/rtl8723bs/include/rtw_pwrctrl.h   |   4 +-
 38 files changed, 401 insertions(+), 433 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index a7a636449813..803a608b74fa 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -95,7 +95,7 @@ u8	*data)
 	/*  <20130121, Kordan> For SMIC EFUSE specificatoin. */
 	/* 0x34[11]: SW force PGMEN input of efuse to high. (for the bank selected by 0x34[9:8]) */
 	/* PHY_SetMacReg(padapter, 0x34, BIT11, 0); */
-	rtw_write16(padapter, 0x34, rtw_read16(padapter, 0x34) & (~BIT11));
+	rtw_write16(padapter, 0x34, rtw_read16(padapter, 0x34) & (~BIT(11)));
 
 	/*  -----------------e-fuse reg ctrl --------------------------------- */
 	/* address */
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 9cf1c95dd924..963b53027c68 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2197,19 +2197,19 @@ void rtw_ht_use_default_setting(struct adapter *padapter)
 	else
 		phtpriv->bss_coexist = 0;
 
-	phtpriv->sgi_40m = TEST_FLAG(pregistrypriv->short_gi, BIT1) ? true : false;
-	phtpriv->sgi_20m = TEST_FLAG(pregistrypriv->short_gi, BIT0) ? true : false;
+	phtpriv->sgi_40m = TEST_FLAG(pregistrypriv->short_gi, BIT(1)) ? true : false;
+	phtpriv->sgi_20m = TEST_FLAG(pregistrypriv->short_gi, BIT(0)) ? true : false;
 
 	/*  LDPC support */
 	rtw_hal_get_def_var(padapter, HAL_DEF_RX_LDPC, (u8 *)&bHwLDPCSupport);
 	CLEAR_FLAGS(phtpriv->ldpc_cap);
 	if (bHwLDPCSupport) {
-		if (TEST_FLAG(pregistrypriv->ldpc_cap, BIT4))
+		if (TEST_FLAG(pregistrypriv->ldpc_cap, BIT(4)))
 			SET_FLAG(phtpriv->ldpc_cap, LDPC_HT_ENABLE_RX);
 	}
 	rtw_hal_get_def_var(padapter, HAL_DEF_TX_LDPC, (u8 *)&bHwLDPCSupport);
 	if (bHwLDPCSupport) {
-		if (TEST_FLAG(pregistrypriv->ldpc_cap, BIT5))
+		if (TEST_FLAG(pregistrypriv->ldpc_cap, BIT(5)))
 			SET_FLAG(phtpriv->ldpc_cap, LDPC_HT_ENABLE_TX);
 	}
 
@@ -2217,12 +2217,12 @@ void rtw_ht_use_default_setting(struct adapter *padapter)
 	rtw_hal_get_def_var(padapter, HAL_DEF_TX_STBC, (u8 *)&bHwSTBCSupport);
 	CLEAR_FLAGS(phtpriv->stbc_cap);
 	if (bHwSTBCSupport) {
-		if (TEST_FLAG(pregistrypriv->stbc_cap, BIT5))
+		if (TEST_FLAG(pregistrypriv->stbc_cap, BIT(5)))
 			SET_FLAG(phtpriv->stbc_cap, STBC_HT_ENABLE_TX);
 	}
 	rtw_hal_get_def_var(padapter, HAL_DEF_RX_STBC, (u8 *)&bHwSTBCSupport);
 	if (bHwSTBCSupport) {
-		if (TEST_FLAG(pregistrypriv->stbc_cap, BIT4))
+		if (TEST_FLAG(pregistrypriv->stbc_cap, BIT(4)))
 			SET_FLAG(phtpriv->stbc_cap, STBC_HT_ENABLE_RX);
 	}
 
@@ -2230,10 +2230,10 @@ void rtw_ht_use_default_setting(struct adapter *padapter)
 	rtw_hal_get_def_var(padapter, HAL_DEF_EXPLICIT_BEAMFORMER, (u8 *)&bHwSupportBeamformer);
 	rtw_hal_get_def_var(padapter, HAL_DEF_EXPLICIT_BEAMFORMEE, (u8 *)&bHwSupportBeamformee);
 	CLEAR_FLAGS(phtpriv->beamform_cap);
-	if (TEST_FLAG(pregistrypriv->beamform_cap, BIT4) && bHwSupportBeamformer)
+	if (TEST_FLAG(pregistrypriv->beamform_cap, BIT(4)) && bHwSupportBeamformer)
 		SET_FLAG(phtpriv->beamform_cap, BEAMFORMING_HT_BEAMFORMER_ENABLE);
 
-	if (TEST_FLAG(pregistrypriv->beamform_cap, BIT5) && bHwSupportBeamformee)
+	if (TEST_FLAG(pregistrypriv->beamform_cap, BIT(5)) && bHwSupportBeamformee)
 		SET_FLAG(phtpriv->beamform_cap, BEAMFORMING_HT_BEAMFORMEE_ENABLE);
 }
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 67570b81034f..20423d82ada0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5526,7 +5526,7 @@ u8 setkey_hdl(struct adapter *padapter, u8 *pbuf)
 		else
 			addr = null_addr;
 
-		ctrl = BIT(15) | BIT6 | ((pparm->algorithm) << 2) | pparm->keyid;
+		ctrl = BIT(15) | BIT(6) | ((pparm->algorithm) << 2) | pparm->keyid;
 		write_cam(padapter, cam_id, ctrl, addr, pparm->key);
 		netdev_dbg(padapter->pnetdev,
 			   "set group key camid:%d, addr:%pM, kid:%d, type:%s\n",
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 4f41f88908d7..d837738b9f40 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -520,7 +520,7 @@ static bool _rtw_camid_is_gk(struct adapter *adapter, u8 cam_id)
 	if (!(cam_ctl->bitmap & BIT(cam_id)))
 		goto exit;
 
-	ret = (dvobj->cam_cache[cam_id].ctrl & BIT6) ? true : false;
+	ret = (dvobj->cam_cache[cam_id].ctrl & BIT(6)) ? true : false;
 
 exit:
 	return ret;
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 622970c7fcfa..f855df776a07 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -245,7 +245,7 @@ static void halbtc8723b1ant_QueryBtInfo(struct btc_coexist *pBtCoexist)
 
 	pCoexSta->bC2hBtInfoReqSent = true;
 
-	H2C_Parameter[0] |= BIT0;	/*  trigger */
+	H2C_Parameter[0] |= BIT(0);	/*  trigger */
 
 	pBtCoexist->fBtcFillH2c(pBtCoexist, 0x61, 1, H2C_Parameter);
 }
@@ -602,7 +602,7 @@ static void halbtc8723b1ant_SetSwPenaltyTxRateAdaptive(
 	H2C_Parameter[0] = 0x6;	/*  opCode, 0x6 = Retry_Penalty */
 
 	if (bLowPenaltyRa) {
-		H2C_Parameter[1] |= BIT0;
+		H2C_Parameter[1] |= BIT(0);
 		H2C_Parameter[2] = 0x00;  /* normal rate except MCS7/6/5, OFDM54/48/36 */
 		H2C_Parameter[3] = 0xf7;  /* MCS7 or OFDM54 */
 		H2C_Parameter[4] = 0xf8;  /* MCS6 or OFDM48 */
@@ -709,7 +709,7 @@ static void halbtc8723b1ant_SetFwIgnoreWlanAct(
 	u8 H2C_Parameter[1] = {0};
 
 	if (bEnable)
-		H2C_Parameter[0] |= BIT0; /* function enable */
+		H2C_Parameter[0] |= BIT(0); /* function enable */
 
 	pBtCoexist->fBtcFillH2c(pBtCoexist, 0x63, 1, H2C_Parameter);
 }
@@ -826,8 +826,8 @@ static void halbtc8723b1ant_SetAntPath(
 
 		/*  0x4c[24:23]= 00, Set Antenna control by BT_RFE_CTRL	BT Vendor 0xac = 0xf002 */
 		u4Tmp = pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x4c);
-		u4Tmp &= ~BIT23;
-		u4Tmp &= ~BIT24;
+		u4Tmp &= ~BIT(23);
+		u4Tmp &= ~BIT(24);
 		pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x4c, u4Tmp);
 	} else {
 		/* Use H2C to set GNT_BT to LOW */
@@ -842,7 +842,7 @@ static void halbtc8723b1ant_SetAntPath(
 				u1Tmp = pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x49d);
 				cntBtCalChk++;
 
-				if (u1Tmp & BIT0)
+				if (u1Tmp & BIT(0))
 					mdelay(50);
 				else
 					break;
@@ -861,8 +861,8 @@ static void halbtc8723b1ant_SetAntPath(
 		if (bInitHwCfg) {
 			/*  0x4c[23]= 0, 0x4c[24]= 1  Antenna control by WL/BT */
 			u4Tmp = pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x4c);
-			u4Tmp &= ~BIT23;
-			u4Tmp |= BIT24;
+			u4Tmp &= ~BIT(23);
+			u4Tmp |= BIT(24);
 			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x4c, u4Tmp);
 
 			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x948, 0x0); /*  fixed internal switch S1->WiFi, S0->BT */
@@ -908,8 +908,8 @@ static void halbtc8723b1ant_SetAntPath(
 		if (bInitHwCfg) {
 			/*  0x4c[23]= 1, 0x4c[24]= 0  Antenna control by 0x64 */
 			u4Tmp = pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x4c);
-			u4Tmp |= BIT23;
-			u4Tmp &= ~BIT24;
+			u4Tmp |= BIT(23);
+			u4Tmp &= ~BIT(24);
 			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x4c, u4Tmp);
 
 			/* Fix Ext switch Main->S1, Aux->S0 */
@@ -967,12 +967,12 @@ static void halbtc8723b1ant_SetFwPstdma(
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_AP_MODE_ENABLE, &bApEnable);
 
 	if (bApEnable) {
-		if (byte1 & BIT4 && !(byte1 & BIT5)) {
-			realByte1 &= ~BIT4;
-			realByte1 |= BIT5;
+		if (byte1 & BIT(4) && !(byte1 & BIT(5))) {
+			realByte1 &= ~BIT(4);
+			realByte1 |= BIT(5);
 
-			realByte5 |= BIT5;
-			realByte5 &= ~BIT6;
+			realByte5 |= BIT(5);
+			realByte5 &= ~BIT(6);
 		}
 	}
 
@@ -2121,7 +2121,7 @@ void EXhalbtc8723b1ant_PowerOnSetting(struct btc_coexist *pBtCoexist)
 
 	/*  enable BB, REG_SYS_FUNC_EN such that we can write 0x948 correctly. */
 	u2Tmp = pBtCoexist->fBtcRead2Byte(pBtCoexist, 0x2);
-	pBtCoexist->fBtcWrite2Byte(pBtCoexist, 0x2, u2Tmp | BIT0 | BIT1);
+	pBtCoexist->fBtcWrite2Byte(pBtCoexist, 0x2, u2Tmp | BIT(0) | BIT(1));
 
 	/*  set GRAN_BT = 1 */
 	pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x765, 0x18);
@@ -2500,7 +2500,7 @@ void EXhalbtc8723b1ant_BtInfoNotify(
 
 		/*  Here we need to resend some wifi info to BT */
 		/*  because bt is reset and loss of the info. */
-		if (pCoexSta->btInfoExt & BIT1) {
+		if (pCoexSta->btInfoExt & BIT(1)) {
 			pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected);
 			if (bWifiConnected)
 				EXhalbtc8723b1ant_MediaStatusNotify(pBtCoexist, BTC_MEDIA_CONNECT);
@@ -2508,7 +2508,7 @@ void EXhalbtc8723b1ant_BtInfoNotify(
 				EXhalbtc8723b1ant_MediaStatusNotify(pBtCoexist, BTC_MEDIA_DISCONNECT);
 		}
 
-		if (pCoexSta->btInfoExt & BIT3) {
+		if (pCoexSta->btInfoExt & BIT(3)) {
 			if (!pBtCoexist->bManualControl && !pBtCoexist->bStopCoexDm)
 				halbtc8723b1ant_IgnoreWlanAct(pBtCoexist, FORCE_EXEC, false);
 		} else {
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
index de471e27a185..7a12d92da0a9 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
@@ -5,17 +5,17 @@
  *
  ******************************************************************************/
 /*  The following is for 8723B 1ANT BT Co-exist definition */
-#define	BT_INFO_8723B_1ANT_B_FTP		BIT7
-#define	BT_INFO_8723B_1ANT_B_A2DP		BIT6
-#define	BT_INFO_8723B_1ANT_B_HID		BIT5
-#define	BT_INFO_8723B_1ANT_B_SCO_BUSY		BIT4
-#define	BT_INFO_8723B_1ANT_B_ACL_BUSY		BIT3
-#define	BT_INFO_8723B_1ANT_B_INQ_PAGE		BIT2
-#define	BT_INFO_8723B_1ANT_B_SCO_ESCO		BIT1
-#define	BT_INFO_8723B_1ANT_B_CONNECTION		BIT0
+#define	BT_INFO_8723B_1ANT_B_FTP		BIT(7)
+#define	BT_INFO_8723B_1ANT_B_A2DP		BIT(6)
+#define	BT_INFO_8723B_1ANT_B_HID		BIT(5)
+#define	BT_INFO_8723B_1ANT_B_SCO_BUSY		BIT(4)
+#define	BT_INFO_8723B_1ANT_B_ACL_BUSY		BIT(3)
+#define	BT_INFO_8723B_1ANT_B_INQ_PAGE		BIT(2)
+#define	BT_INFO_8723B_1ANT_B_SCO_ESCO		BIT(1)
+#define	BT_INFO_8723B_1ANT_B_CONNECTION		BIT(0)
 
 #define	BT_INFO_8723B_1ANT_A2DP_BASIC_RATE(_BT_INFO_EXT_)	\
-		(((_BT_INFO_EXT_ & BIT0)) ? true : false)
+		(((_BT_INFO_EXT_ & BIT(0))) ? true : false)
 
 #define	BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT 2
 
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index 58f6cf063498..4faa832ee2bb 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -185,7 +185,7 @@ static void halbtc8723b2ant_QueryBtInfo(struct btc_coexist *pBtCoexist)
 
 	pCoexSta->bC2hBtInfoReqSent = true;
 
-	H2C_Parameter[0] |= BIT0;	/*  trigger */
+	H2C_Parameter[0] |= BIT(0);	/*  trigger */
 
 	pBtCoexist->fBtcFillH2c(pBtCoexist, 0x61, 1, H2C_Parameter);
 }
@@ -510,7 +510,7 @@ static void halbtc8723b2ant_SetSwPenaltyTxRateAdaptive(
 	H2C_Parameter[0] = 0x6;	/*  opCode, 0x6 = Retry_Penalty */
 
 	if (bLowPenaltyRa) {
-		H2C_Parameter[1] |= BIT0;
+		H2C_Parameter[1] |= BIT(0);
 		H2C_Parameter[2] = 0x00;  /* normal rate except MCS7/6/5, OFDM54/48/36 */
 		H2C_Parameter[3] = 0xf7;  /* MCS7 or OFDM54 */
 		H2C_Parameter[4] = 0xf8;  /* MCS6 or OFDM48 */
@@ -749,7 +749,7 @@ static void halbtc8723b2ant_SetFwIgnoreWlanAct(
 	u8 	H2C_Parameter[1] = {0};
 
 	if (bEnable)
-		H2C_Parameter[0] |= BIT0;		/*  function enable */
+		H2C_Parameter[0] |= BIT(0);		/*  function enable */
 
 	pBtCoexist->fBtcFillH2c(pBtCoexist, 0x63, 1, H2C_Parameter);
 }
@@ -878,8 +878,8 @@ static void halbtc8723b2ant_SetAntPath(
 		if (bInitHwCfg) {
 			/*  0x4c[23]= 0, 0x4c[24]= 1  Antenna control by WL/BT */
 			u4Tmp = pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x4c);
-			u4Tmp &= ~BIT23;
-			u4Tmp |= BIT24;
+			u4Tmp &= ~BIT(23);
+			u4Tmp |= BIT(24);
 			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x4c, u4Tmp);
 		}
 
@@ -896,8 +896,8 @@ static void halbtc8723b2ant_SetAntPath(
 		if (bInitHwCfg) {
 			/*  0x4c[23]= 0, 0x4c[24]= 1  Antenna control by WL/BT */
 			u4Tmp = pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x4c);
-			u4Tmp |= BIT23;
-			u4Tmp &= ~BIT24;
+			u4Tmp |= BIT(23);
+			u4Tmp &= ~BIT(24);
 			pBtCoexist->fBtcWrite4Byte(pBtCoexist, 0x4c, u4Tmp);
 		}
 
@@ -2337,7 +2337,7 @@ void EXhalbtc8723b2ant_PowerOnSetting(struct btc_coexist *pBtCoexist)
 
 	/*  enable BB, REG_SYS_FUNC_EN such that we can write 0x948 correctly. */
 	u2Tmp = pBtCoexist->fBtcRead2Byte(pBtCoexist, 0x2);
-	pBtCoexist->fBtcWrite2Byte(pBtCoexist, 0x2, u2Tmp | BIT0 | BIT1);
+	pBtCoexist->fBtcWrite2Byte(pBtCoexist, 0x2, u2Tmp | BIT(0) | BIT(1));
 
 	/*  set GRAN_BT = 1 */
 	pBtCoexist->fBtcWrite1Byte(pBtCoexist, 0x765, 0x18);
@@ -2506,7 +2506,7 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 
 		/*  Here we need to resend some wifi info to BT */
 		/*  because bt is reset and loss of the info. */
-		if ((pCoexSta->btInfoExt & BIT1)) {
+		if ((pCoexSta->btInfoExt & BIT(1))) {
 			pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_CONNECTED, &bWifiConnected);
 
 			if (bWifiConnected)
@@ -2515,7 +2515,7 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 				EXhalbtc8723b2ant_MediaStatusNotify(pBtCoexist, BTC_MEDIA_DISCONNECT);
 		}
 
-		if ((pCoexSta->btInfoExt & BIT3)) {
+		if ((pCoexSta->btInfoExt & BIT(3))) {
 			halbtc8723b2ant_IgnoreWlanAct(pBtCoexist, FORCE_EXEC, false);
 		} else {
 			/*  BT already NOT ignore Wlan active, do nothing here. */
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h
index 1896ac54614c..ebc47f65e8d2 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h
@@ -5,14 +5,14 @@
  *
  ******************************************************************************/
 /*  The following is for 8723B 2Ant BT Co-exist definition */
-#define	BT_INFO_8723B_2ANT_B_FTP		BIT7
-#define	BT_INFO_8723B_2ANT_B_A2DP		BIT6
-#define	BT_INFO_8723B_2ANT_B_HID		BIT5
-#define	BT_INFO_8723B_2ANT_B_SCO_BUSY		BIT4
-#define	BT_INFO_8723B_2ANT_B_ACL_BUSY		BIT3
-#define	BT_INFO_8723B_2ANT_B_INQ_PAGE		BIT2
-#define	BT_INFO_8723B_2ANT_B_SCO_ESCO		BIT1
-#define	BT_INFO_8723B_2ANT_B_CONNECTION		BIT0
+#define	BT_INFO_8723B_2ANT_B_FTP		BIT(7)
+#define	BT_INFO_8723B_2ANT_B_A2DP		BIT(6)
+#define	BT_INFO_8723B_2ANT_B_HID		BIT(5)
+#define	BT_INFO_8723B_2ANT_B_SCO_BUSY		BIT(4)
+#define	BT_INFO_8723B_2ANT_B_ACL_BUSY		BIT(3)
+#define	BT_INFO_8723B_2ANT_B_INQ_PAGE		BIT(2)
+#define	BT_INFO_8723B_2ANT_B_SCO_ESCO		BIT(1)
+#define	BT_INFO_8723B_2ANT_B_CONNECTION		BIT(0)
 
 #define		BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT		2
 
diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index 9091f2f75fe1..36b0f429dd4c 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -69,11 +69,11 @@ enum btc_chip_interface {
 };
 
 /*  following is for wifi link status */
-#define WIFI_STA_CONNECTED				BIT0
-#define WIFI_AP_CONNECTED				BIT1
-#define WIFI_HS_CONNECTED				BIT2
-#define WIFI_P2P_GO_CONNECTED			BIT3
-#define WIFI_P2P_GC_CONNECTED			BIT4
+#define WIFI_STA_CONNECTED				BIT(0)
+#define WIFI_AP_CONNECTED				BIT(1)
+#define WIFI_HS_CONNECTED				BIT(2)
+#define WIFI_P2P_GO_CONNECTED			BIT(3)
+#define WIFI_P2P_GC_CONNECTED			BIT(4)
 
 struct btc_board_info {
 	/*  The following is some board information */
diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
index 4666b2ff3157..afdde3980ec3 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
@@ -11,11 +11,11 @@
 static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const u32 Condition2)
 {
 	u8 _BoardType =
-		((pDM_Odm->BoardType & BIT4) >> 4) << 0 | /* _GLNA */
-		((pDM_Odm->BoardType & BIT3) >> 3) << 1 | /* _GPA */
-		((pDM_Odm->BoardType & BIT7) >> 7) << 2 | /* _ALNA */
-		((pDM_Odm->BoardType & BIT6) >> 6) << 3 | /* _APA */
-		((pDM_Odm->BoardType & BIT2) >> 2) << 4;  /* _BT */
+		((pDM_Odm->BoardType & BIT(4)) >> 4) << 0 | /* _GLNA */
+		((pDM_Odm->BoardType & BIT(3)) >> 3) << 1 | /* _GPA */
+		((pDM_Odm->BoardType & BIT(7)) >> 7) << 2 | /* _ALNA */
+		((pDM_Odm->BoardType & BIT(6)) >> 6) << 3 | /* _APA */
+		((pDM_Odm->BoardType & BIT(2)) >> 2) << 4;  /* _BT */
 
 	u32 cond1 = Condition1, cond2 = Condition2;
 	u32 driver1 =
@@ -51,13 +51,13 @@ static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const
 		if ((cond1 & 0x0F) == 0) /* BoardType is DONTCARE */
 			return true;
 
-		if ((cond1 & BIT0) != 0) /* GLNA */
+		if ((cond1 & BIT(0)) != 0) /* GLNA */
 			bitMask |= 0x000000FF;
-		if ((cond1 & BIT1) != 0) /* GPA */
+		if ((cond1 & BIT(1)) != 0) /* GPA */
 			bitMask |= 0x0000FF00;
-		if ((cond1 & BIT2) != 0) /* ALNA */
+		if ((cond1 & BIT(2)) != 0) /* ALNA */
 			bitMask |= 0x00FF0000;
-		if ((cond1 & BIT3) != 0) /* APA */
+		if ((cond1 & BIT(3)) != 0) /* APA */
 			bitMask |= 0xFF000000;
 
 		/* BoardType of each RF path is matched */
@@ -223,7 +223,7 @@ void ODM_ReadAndConfig_MP_8723B_AGC_TAB(struct dm_odm_t *pDM_Odm)
 		} else {
 			/* This line is the beginning of branch. */
 			bool bMatched = true;
-			u8  cCond  = (u8)((v1 & (BIT29 | BIT28)) >> 28);
+			u8  cCond  = (u8)((v1 & (BIT(29) | BIT(28))) >> 28);
 
 			if (cCond == COND_ELSE) { /* ELSE, ENDIF */
 				bMatched = true;
@@ -255,10 +255,10 @@ void ODM_ReadAndConfig_MP_8723B_AGC_TAB(struct dm_odm_t *pDM_Odm)
 				}
 
 				/* Keeps reading until ENDIF. */
-				cCond = (u8)((v1 & (BIT29 | BIT28)) >> 28);
+				cCond = (u8)((v1 & (BIT(29) | BIT(28))) >> 28);
 				while (cCond != COND_ENDIF && i < ArrayLen - 2) {
 					READ_NEXT_PAIR(v1, v2, i);
-					cCond = (u8)((v1 & (BIT29 | BIT28)) >> 28);
+					cCond = (u8)((v1 & (BIT(29) | BIT(28))) >> 28);
 				}
 			}
 		}
@@ -483,7 +483,7 @@ void ODM_ReadAndConfig_MP_8723B_PHY_REG(struct dm_odm_t *pDM_Odm)
 		} else {
 			/* This line is the beginning of branch. */
 			bool bMatched = true;
-			u8  cCond  = (u8)((v1 & (BIT29 | BIT28)) >> 28);
+			u8  cCond  = (u8)((v1 & (BIT(29) | BIT(28))) >> 28);
 
 			if (cCond == COND_ELSE) { /* ELSE, ENDIF */
 				bMatched = true;
@@ -514,10 +514,10 @@ void ODM_ReadAndConfig_MP_8723B_PHY_REG(struct dm_odm_t *pDM_Odm)
 				}
 
 				/* Keeps reading until ENDIF. */
-				cCond = (u8)((v1 & (BIT29 | BIT28)) >> 28);
+				cCond = (u8)((v1 & (BIT(29) | BIT(28))) >> 28);
 				while (cCond != COND_ENDIF && i < ArrayLen - 2) {
 					READ_NEXT_PAIR(v1, v2, i);
-					cCond = (u8)((v1 & (BIT29 | BIT28)) >> 28);
+					cCond = (u8)((v1 & (BIT(29) | BIT(28))) >> 28);
 				}
 			}
 		}
diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
index 9a3393f5122b..0e098bd2d9f6 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
@@ -11,11 +11,11 @@
 static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const u32 Condition2)
 {
 	u8 _BoardType =
-		((pDM_Odm->BoardType & BIT4) >> 4) << 0 | /* _GLNA */
-		((pDM_Odm->BoardType & BIT3) >> 3) << 1 | /* _GPA */
-		((pDM_Odm->BoardType & BIT7) >> 7) << 2 | /* _ALNA */
-		((pDM_Odm->BoardType & BIT6) >> 6) << 3 | /* _APA */
-		((pDM_Odm->BoardType & BIT2) >> 2) << 4;  /* _BT */
+		((pDM_Odm->BoardType & BIT(4)) >> 4) << 0 | /* _GLNA */
+		((pDM_Odm->BoardType & BIT(3)) >> 3) << 1 | /* _GPA */
+		((pDM_Odm->BoardType & BIT(7)) >> 7) << 2 | /* _ALNA */
+		((pDM_Odm->BoardType & BIT(6)) >> 6) << 3 | /* _APA */
+		((pDM_Odm->BoardType & BIT(2)) >> 2) << 4;  /* _BT */
 
 	u32   cond1   = Condition1, cond2 = Condition2;
 	u32    driver1 =
@@ -51,13 +51,13 @@ static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const
 		if ((cond1 & 0x0F) == 0) /* BoardType is DONTCARE */
 			return true;
 
-		if ((cond1 & BIT0) != 0) /* GLNA */
+		if ((cond1 & BIT(0)) != 0) /* GLNA */
 			bitMask |= 0x000000FF;
-		if ((cond1 & BIT1) != 0) /* GPA */
+		if ((cond1 & BIT(1)) != 0) /* GPA */
 			bitMask |= 0x0000FF00;
-		if ((cond1 & BIT2) != 0) /* ALNA */
+		if ((cond1 & BIT(2)) != 0) /* ALNA */
 			bitMask |= 0x00FF0000;
-		if ((cond1 & BIT3) != 0) /* APA */
+		if ((cond1 & BIT(3)) != 0) /* APA */
 			bitMask |= 0xFF000000;
 
 		/* BoardType of each RF path is matched */
@@ -195,7 +195,7 @@ void ODM_ReadAndConfig_MP_8723B_MAC_REG(struct dm_odm_t *pDM_Odm)
 		} else {
 			/* This line is the beginning of branch. */
 			bool bMatched = true;
-			u8  cCond  = (u8)((v1 & (BIT29 | BIT28)) >> 28);
+			u8  cCond  = (u8)((v1 & (BIT(29) | BIT(28))) >> 28);
 
 			if (cCond == COND_ELSE) { /* ELSE, ENDIF */
 				bMatched = true;
@@ -226,10 +226,10 @@ void ODM_ReadAndConfig_MP_8723B_MAC_REG(struct dm_odm_t *pDM_Odm)
 				}
 
 				/* Keeps reading until ENDIF. */
-				cCond = (u8)((v1 & (BIT29 | BIT28)) >> 28);
+				cCond = (u8)((v1 & (BIT(29) | BIT(28))) >> 28);
 				while (cCond != COND_ENDIF && i < ArrayLen - 2) {
 					READ_NEXT_PAIR(v1, v2, i);
-					cCond = (u8)((v1 & (BIT29 | BIT28)) >> 28);
+					cCond = (u8)((v1 & (BIT(29) | BIT(28))) >> 28);
 				}
 			}
 		}
diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
index 0c7d0307b822..bfdebc840730 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
@@ -13,11 +13,11 @@ static bool CheckPositive(
 )
 {
 	u8 _BoardType =
-			((pDM_Odm->BoardType & BIT4) >> 4) << 0 | /*  _GLNA */
-			((pDM_Odm->BoardType & BIT3) >> 3) << 1 | /*  _GPA */
-			((pDM_Odm->BoardType & BIT7) >> 7) << 2 | /*  _ALNA */
-			((pDM_Odm->BoardType & BIT6) >> 6) << 3 | /*  _APA */
-			((pDM_Odm->BoardType & BIT2) >> 2) << 4;  /*  _BT */
+			((pDM_Odm->BoardType & BIT(4)) >> 4) << 0 | /*  _GLNA */
+			((pDM_Odm->BoardType & BIT(3)) >> 3) << 1 | /*  _GPA */
+			((pDM_Odm->BoardType & BIT(7)) >> 7) << 2 | /*  _ALNA */
+			((pDM_Odm->BoardType & BIT(6)) >> 6) << 3 | /*  _APA */
+			((pDM_Odm->BoardType & BIT(2)) >> 2) << 4;  /*  _BT */
 
 	u32 cond1 = Condition1, cond2 = Condition2;
 	u32 driver1 =
@@ -59,13 +59,13 @@ static bool CheckPositive(
 		if ((cond1 & 0x0F) == 0) /*  BoardType is DONTCARE */
 			return true;
 
-		if ((cond1 & BIT0) != 0) /* GLNA */
+		if ((cond1 & BIT(0)) != 0) /* GLNA */
 			bitMask |= 0x000000FF;
-		if ((cond1 & BIT1) != 0) /* GPA */
+		if ((cond1 & BIT(1)) != 0) /* GPA */
 			bitMask |= 0x0000FF00;
-		if ((cond1 & BIT2) != 0) /* ALNA */
+		if ((cond1 & BIT(2)) != 0) /* ALNA */
 			bitMask |= 0x00FF0000;
-		if ((cond1 & BIT3) != 0) /* APA */
+		if ((cond1 & BIT(3)) != 0) /* APA */
 			bitMask |= 0xFF000000;
 
 		/*  BoardType of each RF path is matched */
@@ -227,7 +227,7 @@ void ODM_ReadAndConfig_MP_8723B_RadioA(struct dm_odm_t *pDM_Odm)
 		} else {
 			/*  This line is the beginning of branch. */
 			bool bMatched = true;
-			u8  cCond  = (u8)((v1 & (BIT29|BIT28)) >> 28);
+			u8  cCond  = (u8)((v1 & (BIT(29)|BIT(28))) >> 28);
 
 			if (cCond == COND_ELSE) { /*  ELSE, ENDIF */
 				bMatched = true;
@@ -259,10 +259,10 @@ void ODM_ReadAndConfig_MP_8723B_RadioA(struct dm_odm_t *pDM_Odm)
 				}
 
 				/*  Keeps reading until ENDIF. */
-				cCond = (u8)((v1 & (BIT29|BIT28)) >> 28);
+				cCond = (u8)((v1 & (BIT(29)|BIT(28))) >> 28);
 				while (cCond != COND_ENDIF && i < ArrayLen-2) {
 					READ_NEXT_PAIR(v1, v2, i);
-					cCond = (u8)((v1 & (BIT29|BIT28)) >> 28);
+					cCond = (u8)((v1 & (BIT(29)|BIT(28))) >> 28);
 				}
 			}
 		}
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 6ab65e9e8bee..0d8ee967b69a 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -79,7 +79,7 @@ static void setIqkMatrix_8723B(
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, bMaskH4Bits, value32);
 
 			value32 = ((IqkResult_X * ele_D)>>7)&0x01;
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT24, value32);
+			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(24), value32);
 			break;
 		case RF_PATH_B:
 			/* write new elements A, C, D to regC88 and regC9C,
@@ -92,7 +92,7 @@ static void setIqkMatrix_8723B(
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskH4Bits, value32);
 
 			value32 = ((IqkResult_X * ele_D)>>7)&0x01;
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT28, value32);
+			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(28), value32);
 
 			break;
 		default:
@@ -103,13 +103,13 @@ static void setIqkMatrix_8723B(
 		case RF_PATH_A:
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XATxIQImbalance, bMaskDWord, OFDMSwingTable_New[OFDM_index]);
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XCTxAFE, bMaskH4Bits, 0x00);
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT24, 0x00);
+			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(24), 0x00);
 			break;
 
 		case RF_PATH_B:
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XBTxIQImbalance, bMaskDWord, OFDMSwingTable_New[OFDM_index]);
 			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskH4Bits, 0x00);
-			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT28, 0x00);
+			PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, BIT(28), 0x00);
 			break;
 
 		default:
@@ -426,7 +426,7 @@ static u8 phy_PathA_IQK_8723B(
 		tmp = 0x400 - tmp;
 
 	if (
-		!(regEAC & BIT28) &&
+		!(regEAC & BIT(28)) &&
 		(((regE94 & 0x03FF0000)>>16) != 0x142) &&
 		(((regE9C & 0x03FF0000)>>16) != 0x42) &&
 		(((regE94 & 0x03FF0000)>>16) < 0x110) &&
@@ -525,7 +525,7 @@ static u8 phy_PathA_RxIQK8723B(
 		tmp = 0x400 - tmp;
 
 	if (
-		!(regEAC & BIT28) &&
+		!(regEAC & BIT(28)) &&
 		(((regE94 & 0x03FF0000)>>16) != 0x142) &&
 		(((regE9C & 0x03FF0000)>>16) != 0x42) &&
 		(((regE94 & 0x03FF0000)>>16) < 0x110) &&
@@ -616,7 +616,7 @@ static u8 phy_PathA_RxIQK8723B(
 		tmp = 0x400 - tmp;
 
 	if (
-		!(regEAC & BIT27) && /* if Tx is OK, check whether Rx is OK */
+		!(regEAC & BIT(27)) && /* if Tx is OK, check whether Rx is OK */
 		(((regEA4 & 0x03FF0000)>>16) != 0x132) &&
 		(((regEAC & 0x03FF0000)>>16) != 0x36) &&
 		(((regEA4 & 0x03FF0000)>>16) < 0x110) &&
@@ -709,7 +709,7 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 		tmp = 0x400 - tmp;
 
 	if (
-		!(regEAC & BIT28) &&
+		!(regEAC & BIT(28)) &&
 		(((regE94 & 0x03FF0000)>>16) != 0x142) &&
 		(((regE9C & 0x03FF0000)>>16) != 0x42) &&
 		(((regE94 & 0x03FF0000)>>16) < 0x110) &&
@@ -804,7 +804,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 		tmp = 0x400 - tmp;
 
 	if (
-		!(regEAC & BIT28) &&
+		!(regEAC & BIT(28)) &&
 		(((regE94 & 0x03FF0000)>>16) != 0x142) &&
 		(((regE9C & 0x03FF0000)>>16) != 0x42)  &&
 		(((regE94 & 0x03FF0000)>>16) < 0x110) &&
@@ -896,7 +896,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 		tmp = 0x400 - tmp;
 
 	if (
-		!(regEAC & BIT27) && /* if Tx is OK, check whether Rx is OK */
+		!(regEAC & BIT(27)) && /* if Tx is OK, check whether Rx is OK */
 		(((regEA4 & 0x03FF0000)>>16) != 0x132) &&
 		(((regEAC & 0x03FF0000)>>16) != 0x36) &&
 		(((regEA4 & 0x03FF0000)>>16) < 0x110) &&
@@ -1195,9 +1195,9 @@ static void _PHY_MACSettingCalibration8723B(
 	rtw_write8(pDM_Odm->Adapter, MACReg[i], 0x3F);
 
 	for (i = 1 ; i < (IQK_MAC_REG_NUM - 1); i++) {
-		rtw_write8(pDM_Odm->Adapter, MACReg[i], (u8)(MACBackup[i]&(~BIT3)));
+		rtw_write8(pDM_Odm->Adapter, MACReg[i], (u8)(MACBackup[i]&(~BIT(3))));
 	}
-	rtw_write8(pDM_Odm->Adapter, MACReg[i], (u8)(MACBackup[i]&(~BIT5)));
+	rtw_write8(pDM_Odm->Adapter, MACReg[i], (u8)(MACBackup[i]&(~BIT(5))));
 
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 25686aeb073b..6a564476f363 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -756,7 +756,7 @@ void rtw_bb_rf_gain_offset(struct adapter *padapter)
 	u32 v1 = 0, v2 = 0, target = 0;
 	u32 i = 0;
 
-	if (value & BIT4) {
+	if (value & BIT(4)) {
 		if (padapter->eeprompriv.EEPROMRFGainVal != 0xff) {
 			rtw_hal_read_rfreg(padapter, RF_PATH_A, 0x7f, 0xffffffff);
 
@@ -768,7 +768,7 @@ void rtw_bb_rf_gain_offset(struct adapter *padapter)
 					break;
 				}
 			}
-			PHY_SetRFReg(padapter, RF_PATH_A, REG_RF_BB_GAIN_OFFSET, BIT18|BIT17|BIT16|BIT15, target);
+			PHY_SetRFReg(padapter, RF_PATH_A, REG_RF_BB_GAIN_OFFSET, BIT(18)|BIT(17)|BIT(16)|BIT(15), target);
 
 			rtw_hal_read_rfreg(padapter, RF_PATH_A, 0x7f, 0xffffffff);
 		}
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index b4f872f4d6c9..b0b8f63669d7 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -551,7 +551,7 @@ void ODM_TXPowerTrackingCheck(struct dm_odm_t *pDM_Odm)
 		return;
 
 	if (!pDM_Odm->RFCalibrateInfo.TM_Trigger) { /* at least delay 1 sec */
-		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_T_METER_NEW, (BIT17 | BIT16), 0x03);
+		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_T_METER_NEW, (BIT(17) | BIT(16)), 0x03);
 
 		pDM_Odm->RFCalibrateInfo.TM_Trigger = 1;
 		return;
diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index aa4e36b6f2b4..40217b714999 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -355,30 +355,30 @@ enum { /* _ODM_Support_Ability_Definition */
 	/*  */
 	/*  BB ODM section BIT 0-15 */
 	/*  */
-	ODM_BB_DIG			= BIT0,
-	ODM_BB_RA_MASK			= BIT1,
-	ODM_BB_DYNAMIC_TXPWR		= BIT2,
-	ODM_BB_FA_CNT			= BIT3,
-	ODM_BB_RSSI_MONITOR		= BIT4,
-	ODM_BB_CCK_PD			= BIT5,
-	ODM_BB_ANT_DIV			= BIT6,
-	ODM_BB_PWR_SAVE			= BIT7,
-	ODM_BB_PWR_TRAIN		= BIT8,
-	ODM_BB_RATE_ADAPTIVE		= BIT9,
-	ODM_BB_PATH_DIV			= BIT10,
-	ODM_BB_PSD			= BIT11,
-	ODM_BB_RXHP			= BIT12,
-	ODM_BB_ADAPTIVITY		= BIT13,
-	ODM_BB_CFO_TRACKING		= BIT14,
+	ODM_BB_DIG			= BIT(0),
+	ODM_BB_RA_MASK			= BIT(1),
+	ODM_BB_DYNAMIC_TXPWR		= BIT(2),
+	ODM_BB_FA_CNT			= BIT(3),
+	ODM_BB_RSSI_MONITOR		= BIT(4),
+	ODM_BB_CCK_PD			= BIT(5),
+	ODM_BB_ANT_DIV			= BIT(6),
+	ODM_BB_PWR_SAVE			= BIT(7),
+	ODM_BB_PWR_TRAIN		= BIT(8),
+	ODM_BB_RATE_ADAPTIVE		= BIT(9),
+	ODM_BB_PATH_DIV			= BIT(10),
+	ODM_BB_PSD			= BIT(11),
+	ODM_BB_RXHP			= BIT(12),
+	ODM_BB_ADAPTIVITY		= BIT(13),
+	ODM_BB_CFO_TRACKING		= BIT(14),
 
 	/*  MAC DM section BIT 16-23 */
-	ODM_MAC_EDCA_TURBO		= BIT16,
-	ODM_MAC_EARLY_MODE		= BIT17,
+	ODM_MAC_EDCA_TURBO		= BIT(16),
+	ODM_MAC_EARLY_MODE		= BIT(17),
 
 	/*  RF ODM section BIT 24-31 */
-	ODM_RF_TX_PWR_TRACK		= BIT24,
-	ODM_RF_RX_GAIN_TRACK	= BIT25,
-	ODM_RF_CALIBRATION		= BIT26,
+	ODM_RF_TX_PWR_TRACK		= BIT(24),
+	ODM_RF_RX_GAIN_TRACK	= BIT(25),
+	ODM_RF_CALIBRATION		= BIT(26),
 };
 
 /* 	ODM_CMNINFO_INTERFACE */
@@ -389,7 +389,7 @@ enum { /* tag_ODM_Support_Interface_Definition */
 
 /*  ODM_CMNINFO_IC_TYPE */
 enum { /* tag_ODM_Support_IC_Type_Definition */
-	ODM_RTL8723B	=	BIT8,
+	ODM_RTL8723B	=	BIT(8),
 };
 
 /* ODM_CMNINFO_CUT_VER */
@@ -434,10 +434,10 @@ enum { /* tag_ODM_RF_Type_Definition */
 /*  ODM_CMNINFO_WM_MODE */
 enum { /* tag_Wireless_Mode_Definition */
 	ODM_WM_UNKNOWN    = 0x0,
-	ODM_WM_B          = BIT0,
-	ODM_WM_G          = BIT1,
-	ODM_WM_N24G       = BIT3,
-	ODM_WM_AUTO       = BIT5,
+	ODM_WM_B          = BIT(0),
+	ODM_WM_G          = BIT(1),
+	ODM_WM_N24G       = BIT(3),
+	ODM_WM_AUTO       = BIT(5),
 };
 
 /*  ODM_CMNINFO_BW */
diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index fba85cc0e7bf..ef3c2db8553e 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -19,8 +19,8 @@ void odm_NHMCounterStatisticsInit(void *pDM_VOID)
 	rtw_write32(pDM_Odm->Adapter, ODM_REG_NHM_TH3_TO_TH0_11N, 0xffffff52);	/* 0x898 = 0xffffff52		th_3, th_2, th_1, th_0 */
 	rtw_write32(pDM_Odm->Adapter, ODM_REG_NHM_TH7_TO_TH4_11N, 0xffffffff);	/* 0x89c = 0xffffffff		th_7, th_6, th_5, th_4 */
 	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_FPGA0_IQK_11N, bMaskByte0, 0xff);		/* 0xe28[7:0]= 0xff		th_8 */
-	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_NHM_TH9_TH10_11N, BIT10|BIT9|BIT8, 0x7);	/* 0x890[9:8]=3			enable CCX */
-	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_OFDM_FA_RSTC_11N, BIT7, 0x1);		/* 0xc0c[7]= 1			max power among all RX ants */
+	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_NHM_TH9_TH10_11N, BIT(10)|BIT(9)|BIT(8), 0x7);	/* 0x890[9:8]=3			enable CCX */
+	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_OFDM_FA_RSTC_11N, BIT(7), 0x1);		/* 0xc0c[7]= 1			max power among all RX ants */
 }
 
 void odm_NHMCounterStatistics(void *pDM_VOID)
@@ -48,8 +48,8 @@ void odm_NHMCounterStatisticsReset(void *pDM_VOID)
 {
 	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
 
-	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_NHM_TH9_TH10_11N, BIT1, 0);
-	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_NHM_TH9_TH10_11N, BIT1, 1);
+	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_NHM_TH9_TH10_11N, BIT(1), 0);
+	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_NHM_TH9_TH10_11N, BIT(1), 1);
 }
 
 void odm_NHMBBInit(void *pDM_VOID)
@@ -143,9 +143,9 @@ void odm_SearchPwdBLowerBound(void *pDM_VOID, u8 IGI_target)
 		for (cnt = 0; cnt < 20; cnt++) {
 			value32 = PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG_RPT_11N, bMaskDWord);
 
-			if (value32 & BIT30)
+			if (value32 & BIT(30))
 				pDM_Odm->txEdcca1 = pDM_Odm->txEdcca1 + 1;
-			else if (value32 & BIT29)
+			else if (value32 & BIT(29))
 				pDM_Odm->txEdcca1 = pDM_Odm->txEdcca1 + 1;
 			else
 				pDM_Odm->txEdcca0 = pDM_Odm->txEdcca0 + 1;
@@ -209,7 +209,7 @@ void odm_AdaptivityInit(void *pDM_VOID)
 	pDM_Odm->Adaptivity_IGI_upper = 0;
 	odm_NHMBBInit(pDM_Odm);
 
-	PHY_SetBBReg(pDM_Odm->Adapter, REG_RD_CTRL, BIT11, 1); /*  stop counting if EDCCA is asserted */
+	PHY_SetBBReg(pDM_Odm->Adapter, REG_RD_CTRL, BIT(11), 1); /*  stop counting if EDCCA is asserted */
 }
 
 
@@ -612,9 +612,9 @@ void odm_FalseAlarmCounterStatistics(void *pDM_VOID)
 
 	/* hold ofdm counter */
 	/* hold page C counter */
-	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_OFDM_FA_HOLDC_11N, BIT31, 1);
+	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_OFDM_FA_HOLDC_11N, BIT(31), 1);
 	/* hold page D counter */
-	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_OFDM_FA_RSTD_11N, BIT31, 1);
+	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_OFDM_FA_RSTD_11N, BIT(31), 1);
 
 	ret_value = PHY_QueryBBReg(
 		pDM_Odm->Adapter, ODM_REG_OFDM_FA_TYPE1_11N, bMaskDWord
@@ -649,8 +649,8 @@ void odm_FalseAlarmCounterStatistics(void *pDM_VOID)
 
 	{
 		/* hold cck counter */
-		PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_CCK_FA_RST_11N, BIT12, 1);
-		PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_CCK_FA_RST_11N, BIT14, 1);
+		PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_CCK_FA_RST_11N, BIT(12), 1);
+		PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_CCK_FA_RST_11N, BIT(14), 1);
 
 		ret_value = PHY_QueryBBReg(
 			pDM_Odm->Adapter, ODM_REG_CCK_FA_LSB_11N, bMaskByte0
diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.h b/drivers/staging/rtl8723bs/hal/odm_DIG.h
index a5b041101c89..032c4abae49b 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.h
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.h
@@ -78,8 +78,8 @@ struct  false_ALARM_STATISTICS {
 };
 
 enum ODM_Pause_DIG_TYPE {
-	ODM_PAUSE_DIG = BIT0,
-	ODM_RESUME_DIG = BIT1
+	ODM_PAUSE_DIG = BIT(0),
+	ODM_RESUME_DIG = BIT(1)
 };
 
 #define		DM_DIG_THRESH_HIGH			40
diff --git a/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c b/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
index 57c5736527d2..ba6357c6a7ed 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
@@ -35,7 +35,7 @@ void ODM_RF_Saving(void *pDM_VOID, u8 bForceInNormal)
 	if (pDM_PSTable->initialize == 0) {
 
 		pDM_PSTable->Reg874 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x874, bMaskDWord)&0x1CC000)>>14;
-		pDM_PSTable->RegC70 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xc70, bMaskDWord)&BIT3)>>3;
+		pDM_PSTable->RegC70 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xc70, bMaskDWord)&BIT(3))>>3;
 		pDM_PSTable->Reg85C = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x85c, bMaskDWord)&0xFF000000)>>24;
 		pDM_PSTable->RegA74 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xa74, bMaskDWord)&0xF000)>>12;
 		/* Reg818 = PHY_QueryBBReg(padapter, 0x818, bMaskDWord); */
@@ -63,18 +63,18 @@ void ODM_RF_Saving(void *pDM_VOID, u8 bForceInNormal)
 	if (pDM_PSTable->PreRFState != pDM_PSTable->CurRFState) {
 		if (pDM_PSTable->CurRFState == RF_Save) {
 			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0x1C0000, 0x2); /* Reg874[20:18]=3'b010 */
-			PHY_SetBBReg(pDM_Odm->Adapter, 0xc70, BIT3, 0); /* RegC70[3]= 1'b0 */
+			PHY_SetBBReg(pDM_Odm->Adapter, 0xc70, BIT(3), 0); /* RegC70[3]= 1'b0 */
 			PHY_SetBBReg(pDM_Odm->Adapter, 0x85c, 0xFF000000, 0x63); /* Reg85C[31:24]= 0x63 */
 			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0xC000, 0x2); /* Reg874[15:14]=2'b10 */
 			PHY_SetBBReg(pDM_Odm->Adapter, 0xa74, 0xF000, 0x3); /* RegA75[7:4]= 0x3 */
-			PHY_SetBBReg(pDM_Odm->Adapter, 0x818, BIT28, 0x0); /* Reg818[28]= 1'b0 */
-			PHY_SetBBReg(pDM_Odm->Adapter, 0x818, BIT28, 0x1); /* Reg818[28]= 1'b1 */
+			PHY_SetBBReg(pDM_Odm->Adapter, 0x818, BIT(28), 0x0); /* Reg818[28]= 1'b0 */
+			PHY_SetBBReg(pDM_Odm->Adapter, 0x818, BIT(28), 0x1); /* Reg818[28]= 1'b1 */
 		} else {
 			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0x1CC000, pDM_PSTable->Reg874);
-			PHY_SetBBReg(pDM_Odm->Adapter, 0xc70, BIT3, pDM_PSTable->RegC70);
+			PHY_SetBBReg(pDM_Odm->Adapter, 0xc70, BIT(3), pDM_PSTable->RegC70);
 			PHY_SetBBReg(pDM_Odm->Adapter, 0x85c, 0xFF000000, pDM_PSTable->Reg85C);
 			PHY_SetBBReg(pDM_Odm->Adapter, 0xa74, 0xF000, pDM_PSTable->RegA74);
-			PHY_SetBBReg(pDM_Odm->Adapter, 0x818, BIT28, 0x0);
+			PHY_SetBBReg(pDM_Odm->Adapter, 0x818, BIT(28), 0x0);
 		}
 		pDM_PSTable->PreRFState = pDM_PSTable->CurRFState;
 	}
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 994b8c578e7a..4784d33eab0e 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -335,7 +335,7 @@ static void odm_Process_RSSIForDM(
 				}
 			}
 
-			pEntry->rssi_stat.PacketMap = (pEntry->rssi_stat.PacketMap<<1) | BIT0;
+			pEntry->rssi_stat.PacketMap = (pEntry->rssi_stat.PacketMap<<1) | BIT(0);
 
 		} else {
 			RSSI_Ave = pPhyInfo->rx_pwd_ba11;
@@ -369,7 +369,7 @@ static void odm_Process_RSSIForDM(
 				pEntry->rssi_stat.ValidBit++;
 
 			for (i = 0; i < pEntry->rssi_stat.ValidBit; i++)
-				OFDM_pkt += (u8)(pEntry->rssi_stat.PacketMap>>i)&BIT0;
+				OFDM_pkt += (u8)(pEntry->rssi_stat.PacketMap>>i)&BIT(0);
 
 			if (pEntry->rssi_stat.ValidBit == 64) {
 				Weighting = ((OFDM_pkt<<4) > 64)?64:(OFDM_pkt<<4);
diff --git a/drivers/staging/rtl8723bs/hal/odm_RegDefine11N.h b/drivers/staging/rtl8723bs/hal/odm_RegDefine11N.h
index 3c71938899e0..6d7062a1cbbe 100644
--- a/drivers/staging/rtl8723bs/hal/odm_RegDefine11N.h
+++ b/drivers/staging/rtl8723bs/hal/odm_RegDefine11N.h
@@ -155,8 +155,8 @@
 
 /* DIG Related */
 #define	ODM_BIT_IGI_11N					0x0000007F
-#define	ODM_BIT_CCK_RPT_FORMAT_11N		BIT9
+#define	ODM_BIT_CCK_RPT_FORMAT_11N		BIT(9)
 #define	ODM_BIT_BB_RX_PATH_11N			0xF
-#define	ODM_BIT_BB_ATC_11N				BIT11
+#define	ODM_BIT_BB_ATC_11N				BIT(11)
 
 #endif
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index ebcd174336dc..2a748367fbba 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -267,7 +267,7 @@ void rtl8723b_FirmwareSelfReset(struct adapter *padapter)
 		rtw_write8(padapter, REG_HMETFR+3, 0x20);
 
 		val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
-		while (val & BIT2) {
+		while (val & BIT(2)) {
 			Delay--;
 			if (Delay == 0)
 				break;
@@ -278,7 +278,7 @@ void rtl8723b_FirmwareSelfReset(struct adapter *padapter)
 		if (Delay == 0) {
 			/* force firmware reset */
 			val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
-			rtw_write8(padapter, REG_SYS_FUNC_EN + 1, val & (~BIT2));
+			rtw_write8(padapter, REG_SYS_FUNC_EN + 1, val & (~BIT(2)));
 		}
 	}
 }
@@ -1004,9 +1004,9 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 void hal_notch_filter_8723b(struct adapter *adapter, bool enable)
 {
 	if (enable)
-		rtw_write8(adapter, rOFDM0_RxDSP+1, rtw_read8(adapter, rOFDM0_RxDSP+1) | BIT1);
+		rtw_write8(adapter, rOFDM0_RxDSP+1, rtw_read8(adapter, rOFDM0_RxDSP+1) | BIT(1));
 	else
-		rtw_write8(adapter, rOFDM0_RxDSP+1, rtw_read8(adapter, rOFDM0_RxDSP+1) & ~BIT1);
+		rtw_write8(adapter, rOFDM0_RxDSP+1, rtw_read8(adapter, rOFDM0_RxDSP+1) & ~BIT(1));
 }
 
 void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
@@ -1261,7 +1261,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 					pwrInfo24G->BW20_Diff[rfPath][TxCount] =	EEPROM_DEFAULT_24G_HT20_DIFF;
 				else {
 					pwrInfo24G->BW20_Diff[rfPath][TxCount] =	(PROMContent[eeAddr]&0xf0)>>4;
-					if (pwrInfo24G->BW20_Diff[rfPath][TxCount] & BIT3)		/* 4bit sign number to 8 bit sign number */
+					if (pwrInfo24G->BW20_Diff[rfPath][TxCount] & BIT(3))		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->BW20_Diff[rfPath][TxCount] |= 0xF0;
 				}
 
@@ -1269,7 +1269,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = EEPROM_DEFAULT_24G_OFDM_DIFF;
 				else {
 					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = (PROMContent[eeAddr]&0x0f);
-					if (pwrInfo24G->OFDM_Diff[rfPath][TxCount] & BIT3)		/* 4bit sign number to 8 bit sign number */
+					if (pwrInfo24G->OFDM_Diff[rfPath][TxCount] & BIT(3))		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->OFDM_Diff[rfPath][TxCount] |= 0xF0;
 				}
 				pwrInfo24G->CCK_Diff[rfPath][TxCount] = 0;
@@ -1279,7 +1279,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 					pwrInfo24G->BW40_Diff[rfPath][TxCount] = EEPROM_DEFAULT_DIFF;
 				else {
 					pwrInfo24G->BW40_Diff[rfPath][TxCount] = (PROMContent[eeAddr]&0xf0)>>4;
-					if (pwrInfo24G->BW40_Diff[rfPath][TxCount] & BIT3)		/* 4bit sign number to 8 bit sign number */
+					if (pwrInfo24G->BW40_Diff[rfPath][TxCount] & BIT(3))		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->BW40_Diff[rfPath][TxCount] |= 0xF0;
 				}
 
@@ -1287,7 +1287,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 					pwrInfo24G->BW20_Diff[rfPath][TxCount] = EEPROM_DEFAULT_DIFF;
 				else {
 					pwrInfo24G->BW20_Diff[rfPath][TxCount] = (PROMContent[eeAddr]&0x0f);
-					if (pwrInfo24G->BW20_Diff[rfPath][TxCount] & BIT3)		/* 4bit sign number to 8 bit sign number */
+					if (pwrInfo24G->BW20_Diff[rfPath][TxCount] & BIT(3))		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->BW20_Diff[rfPath][TxCount] |= 0xF0;
 				}
 				eeAddr++;
@@ -1296,7 +1296,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = EEPROM_DEFAULT_DIFF;
 				else {
 					pwrInfo24G->OFDM_Diff[rfPath][TxCount] = (PROMContent[eeAddr]&0xf0)>>4;
-					if (pwrInfo24G->OFDM_Diff[rfPath][TxCount] & BIT3)		/* 4bit sign number to 8 bit sign number */
+					if (pwrInfo24G->OFDM_Diff[rfPath][TxCount] & BIT(3))		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->OFDM_Diff[rfPath][TxCount] |= 0xF0;
 				}
 
@@ -1304,7 +1304,7 @@ static void Hal_ReadPowerValueFromPROM_8723B(
 					pwrInfo24G->CCK_Diff[rfPath][TxCount] = EEPROM_DEFAULT_DIFF;
 				else {
 					pwrInfo24G->CCK_Diff[rfPath][TxCount] = (PROMContent[eeAddr]&0x0f);
-					if (pwrInfo24G->CCK_Diff[rfPath][TxCount] & BIT3)		/* 4bit sign number to 8 bit sign number */
+					if (pwrInfo24G->CCK_Diff[rfPath][TxCount] & BIT(3))		/* 4bit sign number to 8 bit sign number */
 						pwrInfo24G->CCK_Diff[rfPath][TxCount] |= 0xF0;
 				}
 				eeAddr++;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 10eb96105f83..d6369eb7b570 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -124,9 +124,9 @@ static u32 phy_RFSerialRead_8723B(
 	udelay(10);
 
 	if (eRFPath == RF_PATH_A)
-		RfPiEnable = (u8)PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter1 | MaskforPhySet, BIT8);
+		RfPiEnable = (u8)PHY_QueryBBReg(Adapter, rFPGA0_XA_HSSIParameter1 | MaskforPhySet, BIT(8));
 	else if (eRFPath == RF_PATH_B)
-		RfPiEnable = (u8)PHY_QueryBBReg(Adapter, rFPGA0_XB_HSSIParameter1 | MaskforPhySet, BIT8);
+		RfPiEnable = (u8)PHY_QueryBBReg(Adapter, rFPGA0_XB_HSSIParameter1 | MaskforPhySet, BIT(8));
 
 	if (RfPiEnable) {
 		/*  Read from BBreg8b8, 12 bits for 8190, 20bits for T65 RF */
@@ -374,7 +374,7 @@ int PHY_BBConfig8723B(struct adapter *Adapter)
 
 	/*  Enable BB and RF */
 	RegVal = rtw_read16(Adapter, REG_SYS_FUNC_EN);
-	rtw_write16(Adapter, REG_SYS_FUNC_EN, (u16)(RegVal | BIT13 | BIT0 | BIT1));
+	rtw_write16(Adapter, REG_SYS_FUNC_EN, (u16)(RegVal | BIT(13) | BIT(0) | BIT(1)));
 
 	rtw_write32(Adapter, 0x948, 0x280);	/*  Others use Antenna S1 */
 
@@ -574,7 +574,7 @@ static void phy_SetRegBW_8723B(
 		break;
 
 	case CHANNEL_WIDTH_40:
-		u2tmp = RegRfMod_BW | BIT7;
+		u2tmp = RegRfMod_BW | BIT(7);
 		rtw_write16(Adapter, REG_TRXPTCL_CTL_8723B, (u2tmp & 0xFEFF)); /*  BIT 7 = 1, BIT 8 = 0 */
 		break;
 
@@ -620,7 +620,7 @@ static void phy_PostSetBwMode8723B(struct adapter *Adapter)
 
 		PHY_SetBBReg(Adapter, rFPGA1_RFMOD, bRFMOD, 0x0);
 
-		PHY_SetBBReg(Adapter, rOFDM0_TxPseudoNoiseWgt, (BIT31 | BIT30), 0x0);
+		PHY_SetBBReg(Adapter, rOFDM0_TxPseudoNoiseWgt, (BIT(31) | BIT(30)), 0x0);
 		break;
 
 	/* 40 MHz channel*/
@@ -634,7 +634,7 @@ static void phy_PostSetBwMode8723B(struct adapter *Adapter)
 
 		PHY_SetBBReg(Adapter, rOFDM1_LSTF, 0xC00, pHalData->nCur40MhzPrimeSC);
 
-		PHY_SetBBReg(Adapter, 0x818, (BIT26 | BIT27), (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER) ? 2 : 1);
+		PHY_SetBBReg(Adapter, 0x818, (BIT(26) | BIT(27)), (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER) ? 2 : 1);
 		break;
 	default:
 		break;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
index ffb35e1ace62..64480ea609f3 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
@@ -62,13 +62,13 @@ void PHY_RF6052SetBandwidth8723B(
 
 	switch (Bandwidth) {
 	case CHANNEL_WIDTH_20:
-		pHalData->RfRegChnlVal[0] = ((pHalData->RfRegChnlVal[0] & 0xfffff3ff) | BIT10 | BIT11);
+		pHalData->RfRegChnlVal[0] = ((pHalData->RfRegChnlVal[0] & 0xfffff3ff) | BIT(10) | BIT(11));
 		PHY_SetRFReg(Adapter, RF_PATH_A, RF_CHNLBW, bRFRegOffsetMask, pHalData->RfRegChnlVal[0]);
 		PHY_SetRFReg(Adapter, RF_PATH_B, RF_CHNLBW, bRFRegOffsetMask, pHalData->RfRegChnlVal[0]);
 		break;
 
 	case CHANNEL_WIDTH_40:
-		pHalData->RfRegChnlVal[0] = ((pHalData->RfRegChnlVal[0] & 0xfffff3ff) | BIT10);
+		pHalData->RfRegChnlVal[0] = ((pHalData->RfRegChnlVal[0] & 0xfffff3ff) | BIT(10));
 		PHY_SetRFReg(Adapter, RF_PATH_A, RF_CHNLBW, bRFRegOffsetMask, pHalData->RfRegChnlVal[0]);
 		PHY_SetRFReg(Adapter, RF_PATH_B, RF_CHNLBW, bRFRegOffsetMask, pHalData->RfRegChnlVal[0]);
 		break;
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index b801a78f69e0..1e0498268aee 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -564,7 +564,7 @@ static bool HalDetectPwrDownMode(struct adapter *Adapter)
 	rtw_efuse_shadow_read(Adapter, 1, 0x7B/*EEPROM_RF_OPT3_92C*/, (u32 *)&tmpvalue);
 
 	/*  2010/08/25 MH INF priority > PDN Efuse value. */
-	if (tmpvalue & BIT4 && pwrctrlpriv->reg_pdnmode)
+	if (tmpvalue & BIT(4) && pwrctrlpriv->reg_pdnmode)
 		pHalData->pwrdown = true;
 	else
 		pHalData->pwrdown = false;
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 7ed375ba18d8..a4ed896662bf 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -383,9 +383,9 @@ struct adapter {
 /*  */
 /*  Function disabled. */
 /*  */
-#define DF_TX_BIT		BIT0
-#define DF_RX_BIT		BIT1
-#define DF_IO_BIT		BIT2
+#define DF_TX_BIT		BIT(0)
+#define DF_RX_BIT		BIT(1)
+#define DF_IO_BIT		BIT(2)
 
 /* define RTW_ENABLE_FUNC(padapter, func) (atomic_sub(&adapter_to_dvobj(padapter)->disable_func, (func))) */
 
diff --git a/drivers/staging/rtl8723bs/include/hal_com_reg.h b/drivers/staging/rtl8723bs/include/hal_com_reg.h
index cf5c15dc2bfd..479748d85626 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_reg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_reg.h
@@ -204,22 +204,22 @@
 /*  */
 /*        8723/8188E Host System Interrupt Status Register (offset 0x5C, 32 byte) */
 /*  */
-#define HSISR_GPIO12_0_INT				BIT0
-#define HSISR_SPS_OCP_INT				BIT5
-#define HSISR_RON_INT					BIT6
-#define HSISR_PDNINT					BIT7
-#define HSISR_GPIO9_INT					BIT25
+#define HSISR_GPIO12_0_INT				BIT(0)
+#define HSISR_SPS_OCP_INT				BIT(5)
+#define HSISR_RON_INT					BIT(6)
+#define HSISR_PDNINT					BIT(7)
+#define HSISR_GPIO9_INT					BIT(25)
 
 /*  */
 /*        Response Rate Set Register	(offset 0x440, 24bits) */
 /*  */
-#define RRSR_1M					BIT0
-#define RRSR_2M					BIT1
-#define RRSR_5_5M				BIT2
-#define RRSR_11M				BIT3
-#define RRSR_6M					BIT4
-#define RRSR_12M				BIT6
-#define RRSR_24M				BIT8
+#define RRSR_1M					BIT(0)
+#define RRSR_2M					BIT(1)
+#define RRSR_5_5M				BIT(2)
+#define RRSR_11M				BIT(3)
+#define RRSR_6M					BIT(4)
+#define RRSR_12M				BIT(6)
+#define RRSR_24M				BIT(8)
 
 #define RRSR_CCK_RATES (RRSR_11M|RRSR_5_5M|RRSR_2M|RRSR_1M)
 
@@ -250,12 +250,12 @@
 /*  */
 /*        BW_OPMODE bits				(Offset 0x603, 8bit) */
 /*  */
-#define BW_OPMODE_20MHZ			BIT2
+#define BW_OPMODE_20MHZ			BIT(2)
 
 /*  */
 /*        CAM Config Setting (offset 0x680, 1 byte) */
 /*  */
-#define CAM_VALID				BIT15
+#define CAM_VALID				BIT(15)
 
 #define CAM_CONTENT_COUNT	8
 
@@ -263,8 +263,8 @@
 
 #define TOTAL_CAM_ENTRY		32
 
-#define CAM_WRITE				BIT16
-#define CAM_POLLINIG			BIT31
+#define CAM_WRITE				BIT(16)
+#define CAM_POLLINIG			BIT(31)
 
 /*  */
 /*  12. Host Interrupt Status Registers */
@@ -273,20 +273,20 @@
 /*  */
 /*        8192C (RCR) Receive Configuration Register	(Offset 0x608, 32 bits) */
 /*  */
-#define RCR_APPFCS				BIT31	/*  WMAC append FCS after pauload */
-#define RCR_APP_MIC				BIT30	/*  MACRX will retain the MIC at the bottom of the packet. */
-#define RCR_APP_ICV				BIT29	/*  MACRX will retain the ICV at the bottom of the packet. */
-#define RCR_APP_PHYST_RXFF		BIT28	/*  PHY Status is appended before RX packet in RXFF */
-#define RCR_APP_BA_SSN			BIT27	/*  SSN of previous TXBA is appended as after original RXDESC as the 4-th DW of RXDESC. */
-#define RCR_HTC_LOC_CTRL		BIT14	/*  MFC<--HTC = 1 MFC-->HTC = 0 */
-#define RCR_AMF					BIT13	/*  Accept management type frame */
-#define RCR_ADF					BIT11	/*  Accept data type frame. This bit also regulates BA, BAR, and PS-Poll (AP mode only). */
-#define RCR_ACRC32				BIT8		/*  Accept CRC32 error packet */
-#define RCR_CBSSID_BCN			BIT7		/*  Accept BSSID match packet (Rx beacon, probe rsp) */
-#define RCR_CBSSID_DATA		BIT6		/*  Accept BSSID match packet (Data) */
-#define RCR_AB					BIT3		/*  Accept broadcast packet */
-#define RCR_AM					BIT2		/*  Accept multicast packet */
-#define RCR_APM					BIT1		/*  Accept physical match packet */
+#define RCR_APPFCS				BIT(31)	/*  WMAC append FCS after pauload */
+#define RCR_APP_MIC				BIT(30)	/*  MACRX will retain the MIC at the bottom of the packet. */
+#define RCR_APP_ICV				BIT(29)	/*  MACRX will retain the ICV at the bottom of the packet. */
+#define RCR_APP_PHYST_RXFF		BIT(28)	/*  PHY Status is appended before RX packet in RXFF */
+#define RCR_APP_BA_SSN			BIT(27)	/*  SSN of previous TXBA is appended as after original RXDESC as the 4-th DW of RXDESC. */
+#define RCR_HTC_LOC_CTRL		BIT(14)	/*  MFC<--HTC = 1 MFC-->HTC = 0 */
+#define RCR_AMF					BIT(13)	/*  Accept management type frame */
+#define RCR_ADF					BIT(11)	/*  Accept data type frame. This bit also regulates BA, BAR, and PS-Poll (AP mode only). */
+#define RCR_ACRC32				BIT(8)		/*  Accept CRC32 error packet */
+#define RCR_CBSSID_BCN			BIT(7)		/*  Accept BSSID match packet (Rx beacon, probe rsp) */
+#define RCR_CBSSID_DATA		BIT(6)		/*  Accept BSSID match packet (Data) */
+#define RCR_AB					BIT(3)		/*  Accept broadcast packet */
+#define RCR_AM					BIT(2)		/*  Accept multicast packet */
+#define RCR_APM					BIT(1)		/*  Accept physical match packet */
 
 
 /*  */
@@ -540,26 +540,26 @@
 #define SDIO_HIMR_DISABLED			0
 
 /*  RTL8723/RTL8188E SDIO Host Interrupt Mask Register */
-#define SDIO_HIMR_RX_REQUEST_MSK		BIT0
-#define SDIO_HIMR_AVAL_MSK			BIT1
+#define SDIO_HIMR_RX_REQUEST_MSK		BIT(0)
+#define SDIO_HIMR_AVAL_MSK			BIT(1)
 
 /*  SDIO Host Interrupt Service Routine */
-#define SDIO_HISR_RX_REQUEST			BIT0
-#define SDIO_HISR_AVAL					BIT1
-#define SDIO_HISR_TXERR					BIT2
-#define SDIO_HISR_RXERR					BIT3
-#define SDIO_HISR_TXFOVW				BIT4
-#define SDIO_HISR_RXFOVW				BIT5
-#define SDIO_HISR_TXBCNOK				BIT6
-#define SDIO_HISR_TXBCNERR				BIT7
-#define SDIO_HISR_C2HCMD				BIT17
-#define SDIO_HISR_CPWM1				BIT18
-#define SDIO_HISR_CPWM2				BIT19
-#define SDIO_HISR_HSISR_IND			BIT20
-#define SDIO_HISR_GTINT3_IND			BIT21
-#define SDIO_HISR_GTINT4_IND			BIT22
-#define SDIO_HISR_PSTIMEOUT			BIT23
-#define SDIO_HISR_OCPINT				BIT24
+#define SDIO_HISR_RX_REQUEST			BIT(0)
+#define SDIO_HISR_AVAL					BIT(1)
+#define SDIO_HISR_TXERR					BIT(2)
+#define SDIO_HISR_RXERR					BIT(3)
+#define SDIO_HISR_TXFOVW				BIT(4)
+#define SDIO_HISR_RXFOVW				BIT(5)
+#define SDIO_HISR_TXBCNOK				BIT(6)
+#define SDIO_HISR_TXBCNERR				BIT(7)
+#define SDIO_HISR_C2HCMD				BIT(17)
+#define SDIO_HISR_CPWM1				BIT(18)
+#define SDIO_HISR_CPWM2				BIT(19)
+#define SDIO_HISR_HSISR_IND			BIT(20)
+#define SDIO_HISR_GTINT3_IND			BIT(21)
+#define SDIO_HISR_GTINT4_IND			BIT(22)
+#define SDIO_HISR_PSTIMEOUT			BIT(23)
+#define SDIO_HISR_OCPINT				BIT(24)
 
 #define MASK_SDIO_HISR_CLEAR		(SDIO_HISR_TXERR |\
 									SDIO_HISR_RXERR |\
@@ -590,9 +590,9 @@
 #define C2H_EVT_FW_CLOSE		0xFF	/*  Set by FW indicating that FW had set the C2H command message and it's not yet read by driver. */
 
 /* 2REG_MULTI_FUNC_CTRL(For RTL8723 Only) */
-#define WL_HWPDN_SL			BIT1	/*  WiFi HW PDn polarity control */
-#define WL_FUNC_EN				BIT2	/*  WiFi function enable */
-#define BT_FUNC_EN				BIT18	/*  BT function enable */
-#define GPS_FUNC_EN			BIT22	/*  GPS function enable */
+#define WL_HWPDN_SL			BIT(1)	/*  WiFi HW PDn polarity control */
+#define WL_FUNC_EN				BIT(2)	/*  WiFi function enable */
+#define BT_FUNC_EN				BIT(18)	/*  BT function enable */
+#define GPS_FUNC_EN			BIT(22)	/*  GPS function enable */
 
 #endif /* __HAL_COMMON_H__ */
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 876b3666aa1c..bc9d8c945f38 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -77,7 +77,7 @@ enum {
 struct dm_priv {
 	u8 DM_Type;
 
-#define DYNAMIC_FUNC_BT BIT0
+#define DYNAMIC_FUNC_BT BIT(0)
 
 	u8 DMFlag;
 	u8 InitDMFlag;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 1d62ea71a890..9b000681ff80 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -9,10 +9,10 @@
 
 
 enum {
-	RTW_PCIE	= BIT0,
-	RTW_USB		= BIT1,
-	RTW_SDIO	= BIT2,
-	RTW_GSPI	= BIT3,
+	RTW_PCIE	= BIT(0),
+	RTW_USB		= BIT(1),
+	RTW_SDIO	= BIT(2),
+	RTW_GSPI	= BIT(3),
 };
 
 enum {
@@ -161,10 +161,10 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 #define RF_CHANGE_BY_INIT	0
-#define RF_CHANGE_BY_IPS	BIT28
-#define RF_CHANGE_BY_PS		BIT29
-#define RF_CHANGE_BY_HW		BIT30
-#define RF_CHANGE_BY_SW		BIT31
+#define RF_CHANGE_BY_IPS	BIT(28)
+#define RF_CHANGE_BY_PS		BIT(29)
+#define RF_CHANGE_BY_HW		BIT(30)
+#define RF_CHANGE_BY_SW		BIT(31)
 
 #define GET_EEPROM_EFUSE_PRIV(adapter) (&adapter->eeprompriv)
 #define is_boot_from_eeprom(adapter) (adapter->eeprompriv.EepromOrEfuse)
diff --git a/drivers/staging/rtl8723bs/include/hal_phy.h b/drivers/staging/rtl8723bs/include/hal_phy.h
index 3d71a4f41592..abc0f27fdaa4 100644
--- a/drivers/staging/rtl8723bs/include/hal_phy.h
+++ b/drivers/staging/rtl8723bs/include/hal_phy.h
@@ -10,8 +10,8 @@
 /*  Antenna detection method, i.e., using single tone detection or RSSI reported from each antenna detected. */
 /*  Added by Roger, 2013.05.22. */
 /*  */
-#define ANT_DETECT_BY_SINGLE_TONE	BIT0
-#define ANT_DETECT_BY_RSSI				BIT1
+#define ANT_DETECT_BY_SINGLE_TONE	BIT(0)
+#define ANT_DETECT_BY_RSSI				BIT(1)
 #define IS_ANT_DETECT_SUPPORT_SINGLE_TONE(__Adapter)		((GET_HAL_DATA(__Adapter)->AntDetection) & ANT_DETECT_BY_SINGLE_TONE)
 #define IS_ANT_DETECT_SUPPORT_RSSI(__Adapter)		((GET_HAL_DATA(__Adapter)->AntDetection) & ANT_DETECT_BY_RSSI)
 
diff --git a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
index 48bf7f66a06e..9639eef8a51d 100644
--- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
+++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
@@ -39,92 +39,92 @@
 #define RTL8723B_TRANS_CARDEMU_TO_ACT														\
 	/* format */																\
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value },  comments here*/								\
-	{0x0020, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK|PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, BIT0}, /*0x20[0] = 1b'1 enable LDOA12 MACRO block for all interface*/   \
-	{0x0067, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK|PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT4, 0}, /*0x67[0] = 0 to disable BT_GPS_SEL pins*/	\
+	{0x0020, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK|PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), BIT(0)}, /*0x20[0] = 1b'1 enable LDOA12 MACRO block for all interface*/   \
+	{0x0067, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK|PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(4), 0}, /*0x67[0] = 0 to disable BT_GPS_SEL pins*/	\
 	{0x0001, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK|PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_DELAY, 1, PWRSEQ_DELAY_MS},/*Delay 1ms*/   \
-	{0x0000, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK|PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT5, 0}, /*0x00[5] = 1b'0 release analog Ips to digital , 1:isolation*/   \
-	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, (BIT4|BIT3|BIT2), 0},/* disable SW LPS 0x04[10]= 0 and WLSUS_EN 0x04[11]= 0*/	\
-	{0x0075, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, BIT0},/* Disable USB suspend */	\
-	{0x0006, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_POLLING, BIT1, BIT1},/* wait till 0x04[17] = 1    power ready*/	\
-	{0x0075, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 0},/* Enable USB suspend */	\
-	{0x0006, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, BIT0},/* release WLON reset  0x04[16]= 1*/	\
-	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT7, 0},/* disable HWPDN 0x04[15]= 0*/	\
-	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, (BIT4|BIT3), 0},/* disable WL suspend*/	\
-	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, BIT0},/* polling until return 0*/	\
-	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_POLLING, BIT0, 0},/**/	\
-	{0x0010, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT6, BIT6},/* Enable WL control XTAL setting*/	\
-	{0x0049, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT1, BIT1},/*Enable falling edge triggering interrupt*/\
-	{0x0063, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT1, BIT1},/*Enable GPIO9 interrupt mode*/\
-	{0x0062, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT1, 0},/*Enable GPIO9 input mode*/\
-	{0x0058, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, BIT0},/*Enable HSISR GPIO[C:0] interrupt*/\
-	{0x005A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT1, BIT1},/*Enable HSISR GPIO9 interrupt*/\
-	{0x0068, PWR_CUT_TESTCHIP_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3, BIT3},/*For GPIO9 internal pull high setting by test chip*/\
-	{0x0069, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT6, BIT6},/*For GPIO9 internal pull high setting*/\
+	{0x0000, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK|PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(5), 0}, /*0x00[5] = 1b'0 release analog Ips to digital , 1:isolation*/   \
+	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, (BIT(4)|BIT(3)|BIT(2)), 0},/* disable SW LPS 0x04[10]= 0 and WLSUS_EN 0x04[11]= 0*/	\
+	{0x0075, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), BIT(0)},/* Disable USB suspend */	\
+	{0x0006, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_POLLING, BIT(1), BIT(1)},/* wait till 0x04[17] = 1    power ready*/	\
+	{0x0075, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), (0)},/* Enable USB suspend */	\
+	{0x0006, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), BIT(0)},/* release WLON reset  0x04[16]= 1*/	\
+	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(7), 0},/* disable HWPDN 0x04[15]= 0*/	\
+	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, (BIT(4)|BIT(3)), 0},/* disable WL suspend*/	\
+	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), BIT(0)},/* polling until return 0*/	\
+	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_POLLING, BIT(0), 0},/**/	\
+	{0x0010, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(6), BIT(6)},/* Enable WL control XTAL setting*/	\
+	{0x0049, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(1), BIT(1)},/*Enable falling edge triggering interrupt*/\
+	{0x0063, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(1), BIT(1)},/*Enable GPIO9 interrupt mode*/\
+	{0x0062, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(1), 0},/*Enable GPIO9 input mode*/\
+	{0x0058, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), BIT(0)},/*Enable HSISR GPIO[C:0] interrupt*/\
+	{0x005A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(1), BIT(1)},/*Enable HSISR GPIO9 interrupt*/\
+	{0x0068, PWR_CUT_TESTCHIP_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(3), BIT(3)},/*For GPIO9 internal pull high setting by test chip*/\
+	{0x0069, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(6), BIT(6)},/*For GPIO9 internal pull high setting*/\
 
 
 #define RTL8723B_TRANS_ACT_TO_CARDEMU													\
 	/* format */																\
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value },  comments here*/								\
 	{0x001F, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0},/*0x1F[7:0] = 0 turn off RF*/	\
-	{0x0049, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT1, 0},/*Enable rising edge triggering interrupt*/ \
-	{0x0006, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, BIT0},/* release WLON reset  0x04[16]= 1*/	\
-	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT1, BIT1}, /*0x04[9] = 1 turn off MAC by HW state machine*/	\
-	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_POLLING, BIT1, 0}, /*wait till 0x04[9] = 0 polling until return 0 to disable*/	\
-	{0x0010, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT6, 0},/* Enable BT control XTAL setting*/\
-	{0x0000, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK|PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT5, BIT5}, /*0x00[5] = 1b'1 analog Ips to digital , 1:isolation*/   \
-	{0x0020, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK|PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 0}, /*0x20[0] = 1b'0 disable LDOA12 MACRO block*/\
+	{0x0049, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(1), 0},/*Enable rising edge triggering interrupt*/ \
+	{0x0006, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), BIT(0)},/* release WLON reset  0x04[16]= 1*/	\
+	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(1), BIT(1)}, /*0x04[9] = 1 turn off MAC by HW state machine*/	\
+	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_POLLING, BIT(1), 0}, /*wait till 0x04[9] = 0 polling until return 0 to disable*/	\
+	{0x0010, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(6), 0},/* Enable BT control XTAL setting*/\
+	{0x0000, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK|PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(5), BIT(5)}, /*0x00[5] = 1b'1 analog Ips to digital , 1:isolation*/   \
+	{0x0020, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK|PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), 0}, /*0x20[0] = 1b'0 disable LDOA12 MACRO block*/\
 
 
 #define RTL8723B_TRANS_CARDEMU_TO_SUS													\
 	/* format */																\
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value },  comments here*/								\
-	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT4|BIT3, (BIT4|BIT3)}, /*0x04[12:11] = 2b'11 enable WL suspend for PCIe*/	\
-	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK|PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3|BIT4, BIT3}, /*0x04[12:11] = 2b'01 enable WL suspend*/	\
-	{0x0023, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT4, BIT4}, /*0x23[4] = 1b'1 12H LDO enter sleep mode*/   \
+	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(4)|BIT(3), (BIT(4)|BIT(3))}, /*0x04[12:11] = 2b'11 enable WL suspend for PCIe*/	\
+	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK|PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(3)|BIT(4), BIT(3)}, /*0x04[12:11] = 2b'01 enable WL suspend*/	\
+	{0x0023, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(4), BIT(4)}, /*0x23[4] = 1b'1 12H LDO enter sleep mode*/   \
 	{0x0007, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0x20}, /*0x07[7:0] = 0x20 SDIO SOP option to disable BG/MB/ACK/SWR*/   \
-	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3|BIT4, BIT3|BIT4}, /*0x04[12:11] = 2b'11 enable WL suspend for PCIe*/	\
-	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_WRITE, BIT0, BIT0}, /*Set SDIO suspend local register*/	\
-	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_POLLING, BIT1, 0}, /*wait power state to suspend*/
+	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(3)|BIT(4), BIT(3)|BIT(4)}, /*0x04[12:11] = 2b'11 enable WL suspend for PCIe*/	\
+	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_WRITE, BIT(0), BIT(0)}, /*Set SDIO suspend local register*/	\
+	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_POLLING, BIT(1), 0}, /*wait power state to suspend*/
 
 #define RTL8723B_TRANS_SUS_TO_CARDEMU													\
 	/* format */																\
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value },  comments here*/								\
-	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3 | BIT7, 0}, /*clear suspend enable and power down enable*/	\
-	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_WRITE, BIT0, 0}, /*Set SDIO suspend local register*/	\
-	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_POLLING, BIT1, BIT1}, /*wait power state to suspend*/\
-	{0x0023, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT4, 0}, /*0x23[4] = 1b'0 12H LDO enter normal mode*/   \
-	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3|BIT4, 0}, /*0x04[12:11] = 2b'01enable WL suspend*/
+	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(3) | BIT(7), 0}, /*clear suspend enable and power down enable*/	\
+	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_WRITE, BIT(0), 0}, /*Set SDIO suspend local register*/	\
+	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_POLLING, BIT(1), BIT(1)}, /*wait power state to suspend*/\
+	{0x0023, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(4), 0}, /*0x23[4] = 1b'0 12H LDO enter normal mode*/   \
+	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(3)|BIT(4), 0}, /*0x04[12:11] = 2b'01enable WL suspend*/
 
 #define RTL8723B_TRANS_CARDEMU_TO_CARDDIS													\
 	/* format */																\
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, omments here*/								\
 	{0x0007, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0x20}, /*0x07 = 0x20 , SOP option to disable BG/MB*/	\
-	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK|PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3|BIT4, BIT3}, /*0x04[12:11] = 2b'01 enable WL suspend*/	\
-	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT2, BIT2}, /*0x04[10] = 1, enable SW LPS*/	\
-	{0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 1}, /*0x48[16] = 1 to enable GPIO9 as EXT WAKEUP*/   \
-	{0x0023, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT4, BIT4}, /*0x23[4] = 1b'1 12H LDO enter sleep mode*/   \
-	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_WRITE, BIT0, BIT0}, /*Set SDIO suspend local register*/	\
-	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_POLLING, BIT1, 0}, /*wait power state to suspend*/
+	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK|PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(3)|BIT(4), BIT(3)}, /*0x04[12:11] = 2b'01 enable WL suspend*/	\
+	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(2), BIT(2)}, /*0x04[10] = 1, enable SW LPS*/	\
+	{0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), 1}, /*0x48[16] = 1 to enable GPIO9 as EXT WAKEUP*/   \
+	{0x0023, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(4), BIT(4)}, /*0x23[4] = 1b'1 12H LDO enter sleep mode*/   \
+	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_WRITE, BIT(0), BIT(0)}, /*Set SDIO suspend local register*/	\
+	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_POLLING, BIT(1), 0}, /*wait power state to suspend*/
 
 #define RTL8723B_TRANS_CARDDIS_TO_CARDEMU													\
 	/* format */																\
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, comments here*/								\
-	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3 | BIT7, 0}, /*clear suspend enable and power down enable*/	\
-	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_WRITE, BIT0, 0}, /*Set SDIO suspend local register*/	\
-	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_POLLING, BIT1, BIT1}, /*wait power state to suspend*/\
-        {0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 0}, /*0x48[16] = 0 to disable GPIO9 as EXT WAKEUP*/   \
-	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3|BIT4, 0}, /*0x04[12:11] = 2b'01enable WL suspend*/\
-	{0x0023, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT4, 0}, /*0x23[4] = 1b'0 12H LDO enter normal mode*/   \
+	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(3) | BIT(7), 0}, /*clear suspend enable and power down enable*/	\
+	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_WRITE, BIT(0), 0}, /*Set SDIO suspend local register*/	\
+	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_POLLING, BIT(1), BIT(1)}, /*wait power state to suspend*/\
+	    {0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), 0}, /*0x48[16] = 0 to disable GPIO9 as EXT WAKEUP*/   \
+	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(3)|BIT(4), 0}, /*0x04[12:11] = 2b'01enable WL suspend*/\
+	{0x0023, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(4), 0}, /*0x23[4] = 1b'0 12H LDO enter normal mode*/   \
 	{0x0301, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0},/*PCIe DMA start*/
 
 
 #define RTL8723B_TRANS_CARDEMU_TO_PDN												\
 	/* format */																\
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, comments here*/								\
-	{0x0023, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT4, BIT4}, /*0x23[4] = 1b'1 12H LDO enter sleep mode*/   \
+	{0x0023, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(4), BIT(4)}, /*0x23[4] = 1b'1 12H LDO enter sleep mode*/   \
 	{0x0007, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK|PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0x20}, /*0x07[7:0] = 0x20 SOP option to disable BG/MB/ACK/SWR*/   \
-	{0x0006, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 0},/* 0x04[16] = 0*/\
-	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT7, BIT7},/* 0x04[15] = 1*/
+	{0x0006, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), 0},/* 0x04[16] = 0*/\
+	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(7), BIT(7)},/* 0x04[15] = 1*/
 
 #define RTL8723B_TRANS_ACT_TO_LPS														\
 	/* format */																\
@@ -135,13 +135,13 @@
 	{0x05F9, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_POLLING, 0xFF, 0},/*Should be zero if no packet is transmitting*/	\
 	{0x05FA, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_POLLING, 0xFF, 0},/*Should be zero if no packet is transmitting*/	\
 	{0x05FB, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_POLLING, 0xFF, 0},/*Should be zero if no packet is transmitting*/	\
-	{0x0002, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 0},/*CCK and OFDM are disabled, and clock are gated*/	\
+	{0x0002, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), 0},/*CCK and OFDM are disabled, and clock are gated*/	\
 	{0x0002, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_DELAY, 0, PWRSEQ_DELAY_US},/*Delay 1us*/	\
-	{0x0002, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT1, 0},/*Whole BB is reset*/	\
+	{0x0002, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(1), 0},/*Whole BB is reset*/	\
 	{0x0100, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0x03},/*Reset MAC TRX*/	\
-	{0x0101, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT1, 0},/*check if removed later*/	\
+	{0x0101, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(1), 0},/*check if removed later*/	\
 	{0x0093, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0x00},/*When driver enter Sus/ Disable, enable LOP for BT*/	\
-	{0x0553, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT5, BIT5},/*Respond TxOK to scheduler*/	\
+	{0x0553, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(5), BIT(5)},/*Respond TxOK to scheduler*/	\
 
 
 #define RTL8723B_TRANS_LPS_TO_ACT															\
@@ -151,59 +151,59 @@
 	{0xFE58, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0x84}, /*USB RPWM*/\
 	{0x0361, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0x84}, /*PCIe RPWM*/\
 	{0x0002, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_DELAY, 0, PWRSEQ_DELAY_MS}, /*Delay*/\
-	{0x0008, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT4, 0}, /*.	0x08[4] = 0		 switch TSF to 40M*/\
-	{0x0109, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_POLLING, BIT7, 0}, /*Polling 0x109[7]= 0  TSF in 40M*/\
-	{0x0029, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT6|BIT7, 0}, /*.	0x29[7:6] = 2b'00	 enable BB clock*/\
-	{0x0101, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT1, BIT1}, /*.	0x101[1] = 1*/\
+	{0x0008, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(4), 0}, /*.	0x08[4] = 0		 switch TSF to 40M*/\
+	{0x0109, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_POLLING, BIT(7), 0}, /*Polling 0x109[7]= 0  TSF in 40M*/\
+	{0x0029, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(6)|BIT(7), 0}, /*.	0x29[7:6] = 2b'00	 enable BB clock*/\
+	{0x0101, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(1), BIT(1)}, /*.	0x101[1] = 1*/\
 	{0x0100, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0xFF}, /*.	0x100[7:0] = 0xFF	 enable WMAC TRX*/\
-	{0x0002, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT1|BIT0, BIT1|BIT0}, /*.	0x02[1:0] = 2b'11	 enable BB macro*/\
+	{0x0002, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(1)|BIT(0), BIT(1)|BIT(0)}, /*.	0x02[1:0] = 2b'11	 enable BB macro*/\
 	{0x0522, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0}, /*.	0x522 = 0*/
 
 
  #define RTL8723B_TRANS_ACT_TO_SWLPS														\
 	/* format */																\
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, comments here*/								\
-	{0x0194, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, BIT0},/*enable 32 K source*/	\
-	{0x0002, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 0},/*CCK and OFDM are disabled, and clock are gated*/	\
-	{0x0002, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 1},/*CCK and OFDM are enable*/	\
-	{0x0002, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 0},/*CCK and OFDM are disabled, and clock are gated*/	\
-	{0x0002, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 1},/*CCK and OFDM are enable*/	\
-	{0x0002, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 0},/*CCK and OFDM are disabled, and clock are gated*/	\
+	{0x0194, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), BIT(0)},/*enable 32 K source*/	\
+	{0x0002, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), 0},/*CCK and OFDM are disabled, and clock are gated*/	\
+	{0x0002, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), 1},/*CCK and OFDM are enable*/	\
+	{0x0002, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), 0},/*CCK and OFDM are disabled, and clock are gated*/	\
+	{0x0002, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), 1},/*CCK and OFDM are enable*/	\
+	{0x0002, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), 0},/*CCK and OFDM are disabled, and clock are gated*/	\
 	{0x0100, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0x3F},/*Reset MAC TRX*/	\
-	{0x0101, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT1, 0},/*disable security engine*/	\
+	{0x0101, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(1), 0},/*disable security engine*/	\
 	{0x0093, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0x40},/*When driver enter Sus/ Disable, enable LOP for BT*/	\
-	{0x0553, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT5, BIT5},/*reset dual TSF*/	\
-	{0x0003, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT2, 0},/*Reset CPU*/	\
+	{0x0553, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(5), BIT(5)},/*reset dual TSF*/	\
+	{0x0003, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(2), 0},/*Reset CPU*/	\
 	{0x0080, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0},/*Reset MCUFWDL register*/	\
-	{0x001D, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 0},/*Reset CPU IO Wrapper*/	\
-	{0x001D, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 1},/*Reset CPU IO Wrapper*/	\
+	{0x001D, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), 0},/*Reset CPU IO Wrapper*/	\
+	{0x001D, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), 1},/*Reset CPU IO Wrapper*/	\
 	{0x0287, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_POLLING, 0xFF, 0},/*polling RXFF packet number = 0 */	\
-	{0x0286, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_POLLING, BIT1, BIT1},/*polling RXDMA idle */	\
-	{0x013D, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, BIT0},/*Clear FW RPWM interrupt */\
-	{0x0139, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, BIT0},/*Set FW RPWM interrupt source*/\
-	{0x0008, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT4, BIT4},/*switch TSF to 32K*/\
-	{0x0109, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT7, BIT7},/*polling TSF stable*/\
-	{0x0090, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, BIT0},/*Set FW LPS*/	\
-	{0x0090, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_POLLING, BIT0, 0},/*polling FW LPS ready */
+	{0x0286, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_POLLING, BIT(1), BIT(1)},/*polling RXDMA idle */	\
+	{0x013D, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), BIT(0)},/*Clear FW RPWM interrupt */\
+	{0x0139, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), BIT(0)},/*Set FW RPWM interrupt source*/\
+	{0x0008, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(4), BIT(4)},/*switch TSF to 32K*/\
+	{0x0109, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(7), BIT(7)},/*polling TSF stable*/\
+	{0x0090, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), BIT(0)},/*Set FW LPS*/	\
+	{0x0090, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_POLLING, BIT(0), 0},/*polling FW LPS ready */
 
 
 #define RTL8723B_TRANS_SWLPS_TO_ACT															\
 	/* format */																\
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, comments here*/								\
-	{0x0008, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT4, 0},/*switch TSF to 32K*/\
-	{0x0109, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT7, 0},/*polling TSF stable*/\
-	{0x0101, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT1, BIT1}, /*.	0x101[1] = 1, enable security engine*/\
+	{0x0008, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(4), 0},/*switch TSF to 32K*/\
+	{0x0109, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(7), 0},/*polling TSF stable*/\
+	{0x0101, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(1), BIT(1)}, /*.	0x101[1] = 1, enable security engine*/\
 	{0x0100, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0xFF}, /*.	0x100[7:0] = 0xFF	 enable WMAC TRX*/\
 	{0x06B7, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0x09}, /*.	reset MAC rx state machine*/\
 	{0x06B4, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0x86}, /*.	reset MAC rx state machine*/\
-	{0x0080, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT1, BIT1},/* set CPU RAM code ready*/	\
-	{0x001D, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 0},/*Reset CPU IO Wrapper*/	\
-	{0x0003, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT2, 0},/* Enable CPU*/	\
-	{0x001D, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, BIT0},/*enable CPU IO Wrapper*/	\
-	{0x0003, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT2, BIT2},/* Enable CPU*/	\
-	{0x0080, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_POLLING, BIT7, BIT7},/*polling FW init ready */	\
-	{0x0080, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_POLLING, BIT6, BIT6},/*polling FW init ready */	\
-	{0x0002, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, BIT0}, /*.	0x02[1:0] = 2b'11	 enable BB macro*/\
+	{0x0080, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(1), BIT(1)},/* set CPU RAM code ready*/	\
+	{0x001D, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), 0},/*Reset CPU IO Wrapper*/	\
+	{0x0003, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(2), 0},/* Enable CPU*/	\
+	{0x001D, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), BIT(0)},/*enable CPU IO Wrapper*/	\
+	{0x0003, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(2), BIT(2)},/* Enable CPU*/	\
+	{0x0080, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_POLLING, BIT(7), BIT(7)},/*polling FW init ready */	\
+	{0x0080, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_POLLING, BIT(6), BIT(6)},/*polling FW init ready */	\
+	{0x0002, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT(0), BIT(0)}, /*.	0x02[1:0] = 2b'11	 enable BB macro*/\
 	{0x0522, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0}, /*.	0x522 = 0*/
 
 #define RTL8723B_TRANS_END															\
diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 86b321e2081d..bd72edcb4259 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -14,39 +14,7 @@
 
 #include <osdep_service_linux.h>
 
-#define BIT0	0x00000001
-#define BIT1	0x00000002
 #define BIT2	0x00000004
-#define BIT3	0x00000008
-#define BIT4	0x00000010
-#define BIT5	0x00000020
-#define BIT6	0x00000040
-#define BIT7	0x00000080
-#define BIT8	0x00000100
-#define BIT9	0x00000200
-#define BIT10	0x00000400
-#define BIT11	0x00000800
-#define BIT12	0x00001000
-#define BIT13	0x00002000
-#define BIT14	0x00004000
-#define BIT15	0x00008000
-#define BIT16	0x00010000
-#define BIT17	0x00020000
-#define BIT18	0x00040000
-#define BIT19	0x00080000
-#define BIT20	0x00100000
-#define BIT21	0x00200000
-#define BIT22	0x00400000
-#define BIT23	0x00800000
-#define BIT24	0x01000000
-#define BIT25	0x02000000
-#define BIT26	0x04000000
-#define BIT27	0x08000000
-#define BIT28	0x10000000
-#define BIT29	0x20000000
-#define BIT30	0x40000000
-#define BIT31	0x80000000
-#define BIT32	0x0100000000
 
 extern int RTW_STATUS_CODE(int error_code);
 
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_spec.h b/drivers/staging/rtl8723bs/include/rtl8723b_spec.h
index 6816040a6aff..7f749e32a5b9 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_spec.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_spec.h
@@ -167,7 +167,7 @@
 /*  */
 /*        8723B REG_CCK_CHECK						(offset 0x454) */
 /*  */
-#define BIT_BCN_PORT_SEL		BIT5
+#define BIT_BCN_PORT_SEL		BIT(5)
 
 /*  */
 /*  */
@@ -188,50 +188,50 @@
 /*  */
 #define	IMR_DISABLED_8723B					0
 /*  IMR DW0(0x00B0-00B3) Bit 0-31 */
-#define	IMR_TIMER2_8723B					BIT31		/*  Timeout interrupt 2 */
-#define	IMR_TIMER1_8723B					BIT30		/*  Timeout interrupt 1 */
-#define	IMR_PSTIMEOUT_8723B				BIT29		/*  Power Save Time Out Interrupt */
-#define	IMR_GTINT4_8723B					BIT28		/*  When GTIMER4 expires, this bit is set to 1 */
-#define	IMR_GTINT3_8723B					BIT27		/*  When GTIMER3 expires, this bit is set to 1 */
-#define	IMR_TXBCN0ERR_8723B				BIT26		/*  Transmit Beacon0 Error */
-#define	IMR_TXBCN0OK_8723B				BIT25		/*  Transmit Beacon0 OK */
-#define	IMR_TSF_BIT32_TOGGLE_8723B		BIT24		/*  TSF Timer BIT32 toggle indication interrupt */
-#define	IMR_BCNDMAINT0_8723B				BIT20		/*  Beacon DMA Interrupt 0 */
-#define	IMR_BCNDERR0_8723B				BIT16		/*  Beacon Queue DMA OK0 */
-#define	IMR_HSISR_IND_ON_INT_8723B		BIT15		/*  HSISR Indicator (HSIMR & HSISR is true, this bit is set to 1) */
-#define	IMR_BCNDMAINT_E_8723B			BIT14		/*  Beacon DMA Interrupt Extension for Win7 */
-#define	IMR_ATIMEND_8723B				BIT12		/*  CTWidnow End or ATIM Window End */
-#define	IMR_C2HCMD_8723B					BIT10		/*  CPU to Host Command INT Status, Write 1 clear */
-#define	IMR_CPWM2_8723B					BIT9			/*  CPU power Mode exchange INT Status, Write 1 clear */
-#define	IMR_CPWM_8723B					BIT8			/*  CPU power Mode exchange INT Status, Write 1 clear */
-#define	IMR_HIGHDOK_8723B				BIT7			/*  High Queue DMA OK */
-#define	IMR_MGNTDOK_8723B				BIT6			/*  Management Queue DMA OK */
-#define	IMR_BKDOK_8723B					BIT5			/*  AC_BK DMA OK */
-#define	IMR_BEDOK_8723B					BIT4			/*  AC_BE DMA OK */
-#define	IMR_VIDOK_8723B					BIT3			/*  AC_VI DMA OK */
-#define	IMR_VODOK_8723B					BIT2			/*  AC_VO DMA OK */
-#define	IMR_RDU_8723B					BIT1			/*  Rx Descriptor Unavailable */
-#define	IMR_ROK_8723B					BIT0			/*  Receive DMA OK */
+#define	IMR_TIMER2_8723B					BIT(31)		/*  Timeout interrupt 2 */
+#define	IMR_TIMER1_8723B					BIT(30)		/*  Timeout interrupt 1 */
+#define	IMR_PSTIMEOUT_8723B				BIT(29)		/*  Power Save Time Out Interrupt */
+#define	IMR_GTINT4_8723B					BIT(28)		/*  When GTIMER4 expires, this bit is set to 1 */
+#define	IMR_GTINT3_8723B					BIT(27)		/*  When GTIMER3 expires, this bit is set to 1 */
+#define	IMR_TXBCN0ERR_8723B				BIT(26)		/*  Transmit Beacon0 Error */
+#define	IMR_TXBCN0OK_8723B				BIT(25)		/*  Transmit Beacon0 OK */
+#define	IMR_TSF_BIT32_TOGGLE_8723B		BIT(24)		/*  TSF Timer BIT32 toggle indication interrupt */
+#define	IMR_BCNDMAINT0_8723B				BIT(20)		/*  Beacon DMA Interrupt 0 */
+#define	IMR_BCNDERR0_8723B				BIT(16)		/*  Beacon Queue DMA OK0 */
+#define	IMR_HSISR_IND_ON_INT_8723B		BIT(15)		/*  HSISR Indicator (HSIMR & HSISR is true, this bit is set to 1) */
+#define	IMR_BCNDMAINT_E_8723B			BIT(14)		/*  Beacon DMA Interrupt Extension for Win7 */
+#define	IMR_ATIMEND_8723B				BIT(12)		/*  CTWidnow End or ATIM Window End */
+#define	IMR_C2HCMD_8723B					BIT(10)		/*  CPU to Host Command INT Status, Write 1 clear */
+#define	IMR_CPWM2_8723B					BIT(9)			/*  CPU power Mode exchange INT Status, Write 1 clear */
+#define	IMR_CPWM_8723B					BIT(8)			/*  CPU power Mode exchange INT Status, Write 1 clear */
+#define	IMR_HIGHDOK_8723B				BIT(7)			/*  High Queue DMA OK */
+#define	IMR_MGNTDOK_8723B				BIT(6)			/*  Management Queue DMA OK */
+#define	IMR_BKDOK_8723B					BIT(5)			/*  AC_BK DMA OK */
+#define	IMR_BEDOK_8723B					BIT(4)			/*  AC_BE DMA OK */
+#define	IMR_VIDOK_8723B					BIT(3)			/*  AC_VI DMA OK */
+#define	IMR_VODOK_8723B					BIT(2)			/*  AC_VO DMA OK */
+#define	IMR_RDU_8723B					BIT(1)			/*  Rx Descriptor Unavailable */
+#define	IMR_ROK_8723B					BIT(0)			/*  Receive DMA OK */
 
 /*  IMR DW1(0x00B4-00B7) Bit 0-31 */
-#define	IMR_BCNDMAINT7_8723B				BIT27		/*  Beacon DMA Interrupt 7 */
-#define	IMR_BCNDMAINT6_8723B				BIT26		/*  Beacon DMA Interrupt 6 */
-#define	IMR_BCNDMAINT5_8723B				BIT25		/*  Beacon DMA Interrupt 5 */
-#define	IMR_BCNDMAINT4_8723B				BIT24		/*  Beacon DMA Interrupt 4 */
-#define	IMR_BCNDMAINT3_8723B				BIT23		/*  Beacon DMA Interrupt 3 */
-#define	IMR_BCNDMAINT2_8723B				BIT22		/*  Beacon DMA Interrupt 2 */
-#define	IMR_BCNDMAINT1_8723B				BIT21		/*  Beacon DMA Interrupt 1 */
-#define	IMR_BCNDOK7_8723B					BIT20		/*  Beacon Queue DMA OK Interrupt 7 */
-#define	IMR_BCNDOK6_8723B					BIT19		/*  Beacon Queue DMA OK Interrupt 6 */
-#define	IMR_BCNDOK5_8723B					BIT18		/*  Beacon Queue DMA OK Interrupt 5 */
-#define	IMR_BCNDOK4_8723B					BIT17		/*  Beacon Queue DMA OK Interrupt 4 */
-#define	IMR_BCNDOK3_8723B					BIT16		/*  Beacon Queue DMA OK Interrupt 3 */
-#define	IMR_BCNDOK2_8723B					BIT15		/*  Beacon Queue DMA OK Interrupt 2 */
-#define	IMR_BCNDOK1_8723B					BIT14		/*  Beacon Queue DMA OK Interrupt 1 */
-#define	IMR_ATIMEND_E_8723B				BIT13		/*  ATIM Window End Extension for Win7 */
-#define	IMR_TXERR_8723B					BIT11		/*  Tx Error Flag Interrupt Status, write 1 clear. */
-#define	IMR_RXERR_8723B					BIT10		/*  Rx Error Flag INT Status, Write 1 clear */
-#define	IMR_TXFOVW_8723B					BIT9			/*  Transmit FIFO Overflow */
-#define	IMR_RXFOVW_8723B					BIT8			/*  Receive FIFO Overflow */
+#define	IMR_BCNDMAINT7_8723B				BIT(27)		/*  Beacon DMA Interrupt 7 */
+#define	IMR_BCNDMAINT6_8723B				BIT(26)		/*  Beacon DMA Interrupt 6 */
+#define	IMR_BCNDMAINT5_8723B				BIT(25)		/*  Beacon DMA Interrupt 5 */
+#define	IMR_BCNDMAINT4_8723B				BIT(24)		/*  Beacon DMA Interrupt 4 */
+#define	IMR_BCNDMAINT3_8723B				BIT(23)		/*  Beacon DMA Interrupt 3 */
+#define	IMR_BCNDMAINT2_8723B				BIT(22)		/*  Beacon DMA Interrupt 2 */
+#define	IMR_BCNDMAINT1_8723B				BIT(21)		/*  Beacon DMA Interrupt 1 */
+#define	IMR_BCNDOK7_8723B					BIT(20)		/*  Beacon Queue DMA OK Interrupt 7 */
+#define	IMR_BCNDOK6_8723B					BIT(19)		/*  Beacon Queue DMA OK Interrupt 6 */
+#define	IMR_BCNDOK5_8723B					BIT(18)		/*  Beacon Queue DMA OK Interrupt 5 */
+#define	IMR_BCNDOK4_8723B					BIT(17)		/*  Beacon Queue DMA OK Interrupt 4 */
+#define	IMR_BCNDOK3_8723B					BIT(16)		/*  Beacon Queue DMA OK Interrupt 3 */
+#define	IMR_BCNDOK2_8723B					BIT(15)		/*  Beacon Queue DMA OK Interrupt 2 */
+#define	IMR_BCNDOK1_8723B					BIT(14)		/*  Beacon Queue DMA OK Interrupt 1 */
+#define	IMR_ATIMEND_E_8723B				BIT(13)		/*  ATIM Window End Extension for Win7 */
+#define	IMR_TXERR_8723B					BIT(11)		/*  Tx Error Flag Interrupt Status, write 1 clear. */
+#define	IMR_RXERR_8723B					BIT(10)		/*  Rx Error Flag INT Status, Write 1 clear */
+#define	IMR_TXFOVW_8723B					BIT(9)			/*  Transmit FIFO Overflow */
+#define	IMR_RXFOVW_8723B					BIT(8)			/*  Receive FIFO Overflow */
 
 #endif
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index 3014fcf7bb85..f78aa0d7abc5 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -33,8 +33,8 @@
 
 	/* cmd flags */
 	enum {
-		RTW_CMDF_DIRECTLY = BIT0,
-		RTW_CMDF_WAIT_ACK = BIT1,
+		RTW_CMDF_DIRECTLY = BIT(0),
+		RTW_CMDF_WAIT_ACK = BIT(1),
 	};
 
 	struct cmd_priv {
diff --git a/drivers/staging/rtl8723bs/include/rtw_ht.h b/drivers/staging/rtl8723bs/include/rtw_ht.h
index 54fadb92334c..da3efba7112a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_ht.h
+++ b/drivers/staging/rtl8723bs/include/rtw_ht.h
@@ -61,16 +61,16 @@ enum {
 	RT_HT_CAP_USE_JAGUAR_CCUT = 0x04,
 };
 
-#define	LDPC_HT_ENABLE_RX			BIT0
-#define	LDPC_HT_ENABLE_TX			BIT1
-#define	LDPC_HT_CAP_TX				BIT3
+#define	LDPC_HT_ENABLE_RX			BIT(0)
+#define	LDPC_HT_ENABLE_TX			BIT(1)
+#define	LDPC_HT_CAP_TX				BIT(3)
 
-#define	STBC_HT_ENABLE_RX			BIT0
-#define	STBC_HT_ENABLE_TX			BIT1
-#define	STBC_HT_CAP_TX				BIT3
+#define	STBC_HT_ENABLE_RX			BIT(0)
+#define	STBC_HT_ENABLE_TX			BIT(1)
+#define	STBC_HT_CAP_TX				BIT(3)
 
-#define	BEAMFORMING_HT_BEAMFORMER_ENABLE	BIT0	/*  Declare our NIC supports beamformer */
-#define	BEAMFORMING_HT_BEAMFORMEE_ENABLE	BIT1	/*  Declare our NIC supports beamformee */
+#define	BEAMFORMING_HT_BEAMFORMER_ENABLE	BIT(0)	/*  Declare our NIC supports beamformer */
+#define	BEAMFORMING_HT_BEAMFORMEE_ENABLE	BIT(1)	/*  Declare our NIC supports beamformee */
 
 /*  20/40 BSS Coexist */
 #define SET_EXT_CAPABILITY_ELE_BSS_COEXIST(_pEleStart, _val)			SET_BITS_TO_LE_1BYTE((_pEleStart), 0, 1, _val)
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index ac3ba746b64c..8cc96164e1cf 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -111,9 +111,9 @@ struct rt_link_detect_t {
 
 /* used for mlme_priv.roam_flags */
 enum {
-	RTW_ROAM_ON_EXPIRED = BIT0,
-	RTW_ROAM_ON_RESUME = BIT1,
-	RTW_ROAM_ACTIVE = BIT2,
+	RTW_ROAM_ON_EXPIRED = BIT(0),
+	RTW_ROAM_ON_RESUME = BIT(1),
+	RTW_ROAM_ACTIVE = BIT(2),
 };
 
 struct mlme_priv {
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 95769f90d196..a4770f5eb75c 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -27,12 +27,12 @@
 
 /*  ====== ODM_ABILITY_E ======== */
 /*  BB ODM section BIT 0-15 */
-#define DYNAMIC_BB_DIG				BIT0 /* ODM_BB_DIG */
+#define DYNAMIC_BB_DIG				BIT(0) /* ODM_BB_DIG */
 #define DYNAMIC_BB_DYNAMIC_TXPWR	BIT2 /* ODM_BB_DYNAMIC_TXPWR */
-#define DYNAMIC_BB_ANT_DIV			BIT6 /* ODM_BB_ANT_DIV */
+#define DYNAMIC_BB_ANT_DIV			BIT(6) /* ODM_BB_ANT_DIV */
 
 /*  RF ODM section BIT 24-31 */
-#define DYNAMIC_RF_CALIBRATION		BIT26/* ODM_RF_CALIBRATION */
+#define DYNAMIC_RF_CALIBRATION		BIT(26)/* ODM_RF_CALIBRATION */
 
 #define DYNAMIC_ALL_FUNC_ENABLE		0xFFFFFFF
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index c27d07861b8c..67dc74512e8f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -86,8 +86,8 @@ enum rt_rf_power_state {
 
 /*  ASPM OSC Control bit, added by Roger, 2013.03.29. */
 #define	RT_PCI_ASPM_OSC_IGNORE		0	 /*  PCI ASPM ignore OSC control in default */
-#define	RT_PCI_ASPM_OSC_ENABLE		BIT0 /*  PCI ASPM controlled by OS according to ACPI Spec 5.0 */
-#define	RT_PCI_ASPM_OSC_DISABLE		BIT1 /*  PCI ASPM controlled by driver or BIOS, i.e., force enable ASPM */
+#define	RT_PCI_ASPM_OSC_ENABLE		BIT(0) /*  PCI ASPM controlled by OS according to ACPI Spec 5.0 */
+#define	RT_PCI_ASPM_OSC_DISABLE		BIT(1) /*  PCI ASPM controlled by driver or BIOS, i.e., force enable ASPM */
 
 enum {
 	PSBBREG_RF0 = 0,

base-commit: 81f55766523e5293604cb96c5e98d10da345ff33
-- 
2.54.0

