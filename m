Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EF248B364
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119853; cv=none; b=UU6mDasNIqpRabvrD5CHPpxwVrQWuyezHrc/IyRzwrKFgAtxOIjc4j+tDqC2Jad3ICQUimzvOQWk5IT2B6xuvFReXPwj7Jpdom/znkmpuZryoC1wyj3Qf37RPxd7sXmHIjNiYzZxE7nrvrROOc09e//Z1VziVR64klSNsbVjYZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119853; c=relaxed/simple;
	bh=YtJxF4Is0snuBMbeg+ChIlG/QhAqDBn18REtNAV4k2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pre/082l7nWQtJdgH6R71WPH13nubi5QeD8amc81tWy+Ic0hjMaCOjPalScSc3Hv2bprRrp/KB/Kn9IC5cZvOUDgLBUoVZzrtftr4hxTWphg2YMeHb9LADP5nuRfRlFL35pD1dwuTNtCic/kmRNKgu5SfInlhi3/BEuvcAyfa5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbWKHwBq; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbWKHwBq"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b0f19bea2fso2002993e87.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119846; x=1784724646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRZKMKBLHzjrLUfnJ386Esme59XPCYH886UtCUem0Pc=;
        b=HbWKHwBqS4xrPkdQim6PBn9jiyEoXxIMDk3Vg6j0mCUolafKevB62t152z6viryKjG
         Yx/LhPWrT89elJw+fTMiNqiY54yeU4+tNl+C4BFIH7FKVW7R4qEonGi+0HLdUp1peUoJ
         pEuDCviEdFKXv+i8e8G9NMVnHNX1hw64hnly+bgC8bdPvRVFRhTifnYAOZ5p8897Jgdv
         jlOsWx0CwGe8CTlnriVh40ZC0t/dt7Xbn36Q5n2IKCe2ZRwKrPx8iX+ZGJIk56rh8lVD
         T/dqmpxw9nK8efgRsQbbBD8ESPxzNQ1TJJXcd6sb6t/SxUliIdTPFI9IZaPvNh11PMOH
         lzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119846; x=1784724646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IRZKMKBLHzjrLUfnJ386Esme59XPCYH886UtCUem0Pc=;
        b=HhTgdXxS/4QiqWIRAzuq9eTj01xG+qPcN0GmVvDU7kV2OI8pkeXl/kV+gW4sjJJXop
         wYtYYF2I5IXHO7fnNbWLZwYptnrRvgLt5j8OONjFVzk6AVsqlo7tNwfZfhM02+lpvXJh
         QvV1CfJW4XJ40yDJysnTXdzb1ietQnNfLMYOkYvoX1vHqQjArWPC/7RSgdtVp7kb/OoI
         sGwwwhyy5XNaNBFdYVj0O88VE/9LPykNg68gdwS2LYMoTGwY2Jbc1sidhsw7/MzZLdhA
         03ijpnCBWeHrG/2qhsU1SVR9qEr+YCbmeFBCYtkvo95uxLNcHgp8+tvnZnA1Vo7EGUdS
         i0fg==
X-Gm-Message-State: AOJu0YzpqcGKa+okHIywpRUto/z+627k56IEa5Kw3pZXEmFMcr5Apa+K
	lsiUUDjxlpPYt0dpTTHxvm5cV3Wm8AHH3xWFctVbzThv/H0oRoXiSTZG
X-Gm-Gg: AfdE7ckFDxw5BgWCe8VZaB5k4eyd16Qn6ZnLQbLe8KlDEit64CmPWAIoFp0VyuIkmPo
	0llwuPQSpGXqFSk5r/MDE2t/f4sqrLY1+h2IcFSRyoVE9NVz9ClWqiLN3yCTJY6uqIrYPHxGqn5
	PsOGqRnb1K+0ov7r/DMpUfWjNskUpI9oWC9SrgJIwxWvV3xgvED+eVWPdqHUCVmIZuqU+pTK42J
	n5dOmeALxrWpMmPAXTYhEcJ+4mPDVh5YqM/9ENmmncCpMrFKXYjkpZAsEIDg1NIOYL4WghKoMlr
	gaUJD/VTEV2uig7MasvzhBSz7bgQfdYezeuxzojWWBJtjqbMb61DlIl2bnvi/J2S4CdLKQku3uZ
	VyCkSKUBCBvVyxhYTDl1gigfrJkiSIXXN8cPMCXKjZCWkyCQ43JO3twQMooq4g8BxNRAnE3NxFx
	Jm87J6jSuJJrE3CXiVUcQMopyyDWYnTIM0Gck/6FrFe1cLeS7HmCwPffA80zKRPnsseMK/p2xx5
	1EfZ/3olLp6IQ==
X-Received: by 2002:a05:6512:8344:b0:5ae:c745:f39 with SMTP id 2adb3069b0e04-5b0236a66ccmr2897073e87.44.1784119845553;
        Wed, 15 Jul 2026 05:50:45 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:45 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 38/61] staging: rtl8723bs: remove redundant ternary operators from bool returns
Date: Wed, 15 Jul 2026 19:48:06 +0700
Message-ID: <20260715124829.90290-39-ulijg308@gmail.com>
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

Purge all implicit and redundant ternary operator expressions of the form
'(condition) ? true : false' or comparisons with zero from logical return
statements across the driver.

Expressions like '(atomic_read(...) != 0) ? true : false' add useless
visual clutter and unnecessary branching, since the underlying comparison
or atomic read already naturally evaluates to a boolean truth value in C.

Replace these verbose patterns with direct return statements to streamline
the code, maximize readability, and match standard kernel coding style.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c         |  6 +++---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c    |  2 +-
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h   |  2 +-
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h      | 11 ++++++++---
 drivers/staging/rtl8723bs/hal/hal_com.c           |  2 +-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c      |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c |  4 ++--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c      |  4 ++--
 drivers/staging/rtl8723bs/include/ieee80211.h     |  6 +++---
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h   |  2 +-
 drivers/staging/rtl8723bs/os_dep/osdep_service.c  |  4 ++--
 11 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index b57b665c2..7e5f73707 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1629,7 +1629,7 @@ inline bool rtw_is_scan_deny(struct adapter *adapter)
 {
 	struct mlme_priv *mlmepriv = &adapter->mlmepriv;
 
-	return (atomic_read(&mlmepriv->set_scan_deny) != 0) ? true : false;
+	return atomic_read(&mlmepriv->set_scan_deny);
 }
 
 inline void rtw_clear_scan_deny(struct adapter *adapter)
@@ -2197,8 +2197,8 @@ void rtw_ht_use_default_setting(struct adapter *padapter)
 	else
 		phtpriv->bss_coexist = 0;
 
-	phtpriv->sgi_40m = TEST_FLAG(pregistrypriv->short_gi, BIT(1)) ? true : false;
-	phtpriv->sgi_20m = TEST_FLAG(pregistrypriv->short_gi, BIT(0)) ? true : false;
+	phtpriv->sgi_40m = TEST_FLAG(pregistrypriv->short_gi, BIT(1));
+	phtpriv->sgi_20m = TEST_FLAG(pregistrypriv->short_gi, BIT(0));
 
 	/*  LDPC support */
 	rtw_hal_get_def_var(padapter, HAL_DEF_RX_LDPC, (u8 *)&bHwLDPCSupport);
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index df5508ce5..d833c5e3a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -476,7 +476,7 @@ static bool _rtw_camid_is_gk(struct adapter *adapter, u8 cam_id)
 	if (!(cam_ctl->bitmap & BIT(cam_id)))
 		goto exit;
 
-	ret = (dvobj->cam_cache[cam_id].ctrl & BIT(6)) ? true : false;
+	ret = dvobj->cam_cache[cam_id].ctrl & BIT(6);
 
 exit:
 	return ret;
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
index 7a12d92da..f39c93ac7 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
@@ -15,7 +15,7 @@
 #define	BT_INFO_8723B_1ANT_B_CONNECTION		BIT(0)
 
 #define	BT_INFO_8723B_1ANT_A2DP_BASIC_RATE(_BT_INFO_EXT_)	\
-		(((_BT_INFO_EXT_ & BIT(0))) ? true : false)
+		(((_BT_INFO_EXT_ & BIT(0))))
 
 #define	BTC_RSSI_COEX_THRESH_TOL_8723B_1ANT 2
 
diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index 36b0f429d..0002b822a 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -93,9 +93,14 @@ enum {
 	BTC_RSSI_STATE_STAY_LOW			= 0x5,
 	BTC_RSSI_MAX
 };
-#define BTC_RSSI_HIGH(_rssi_)	((_rssi_ == BTC_RSSI_STATE_HIGH || _rssi_ == BTC_RSSI_STATE_STAY_HIGH) ? true : false)
-#define BTC_RSSI_MEDIUM(_rssi_)	((_rssi_ == BTC_RSSI_STATE_MEDIUM || _rssi_ == BTC_RSSI_STATE_STAY_MEDIUM) ? true : false)
-#define BTC_RSSI_LOW(_rssi_)	((_rssi_ == BTC_RSSI_STATE_LOW || _rssi_ == BTC_RSSI_STATE_STAY_LOW) ? true : false)
+#define BTC_RSSI_HIGH(_rssi_) \
+	((_rssi_) == BTC_RSSI_STATE_HIGH || (_rssi_) == BTC_RSSI_STATE_STAY_HIGH)
+
+#define BTC_RSSI_MEDIUM(_rssi_) \
+	((_rssi_) == BTC_RSSI_STATE_MEDIUM || (_rssi_) == BTC_RSSI_STATE_STAY_MEDIUM)
+
+#define BTC_RSSI_LOW(_rssi_) \
+	((_rssi_) == BTC_RSSI_STATE_LOW || (_rssi_) == BTC_RSSI_STATE_STAY_LOW)
 
 enum {
 	BTC_WIFI_BW_LEGACY			= 0x0,
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 634af4657..77b189efa 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -396,7 +396,7 @@ bool Hal_MappingOutPipe(struct adapter *padapter, u8 NumOutPipe)
 {
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 
-	bool bWIFICfg = (pregistrypriv->wifi_spec) ? true : false;
+	bool bWIFICfg = pregistrypriv->wifi_spec;
 
 	bool result = true;
 
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index c88d669cb..5b374eea0 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -268,7 +268,7 @@ static void odm_Process_RSSIForDM(
 	if (pPktinfo->is_beacon)
 		pDM_Odm->PhyDbgInfo.NumQryBeaconPkt++;
 
-	isCCKrate = ((pPktinfo->data_rate <= DESC_RATE11M)) ? true : false;
+	isCCKrate = pPktinfo->data_rate <= DESC_RATE11M;
 	pDM_Odm->RxRate = pPktinfo->data_rate;
 
 	/* Statistic for antenna/path diversity------------------ */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 53f6cd708..7ddc75e65 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2751,7 +2751,7 @@ void GetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 		{
 			/*  BCN_VALID, BIT16 of REG_TDECTRL = BIT0 of REG_TDECTRL+2 */
 			val8 = rtw_read8(padapter, REG_TDECTRL+2);
-			*val = (BIT(0) & val8) ? true : false;
+			*val = BIT(0) & val8;
 		}
 		break;
 
@@ -2805,7 +2805,7 @@ void GetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 		break;
 	case HW_VAR_CHK_HI_QUEUE_EMPTY:
 		val16 = rtw_read16(padapter, REG_TXPKT_EMPTY);
-		*val = (val16 & BIT(10)) ? true : false;
+		*val = val16 & BIT(10);
 		break;
 	default:
 		GetHwReg(padapter, variable, val);
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index ed9b8fb07..767db342c 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1032,8 +1032,8 @@ static void _ReadPROMContent(struct adapter *padapter)
 
 	eeValue = rtw_read8(padapter, REG_9346CR);
 	/*  To check system boot selection. */
-	pEEPROM->EepromOrEfuse = (eeValue & BOOT_FROM_EEPROM) ? true : false;
-	pEEPROM->bautoload_fail_flag = (eeValue & EEPROM_EN) ? false : true;
+	pEEPROM->EepromOrEfuse = eeValue & BOOT_FROM_EEPROM;
+	pEEPROM->bautoload_fail_flag = eeValue & EEPROM_EN;
 
 	_ReadEfuseInfo8723BS(padapter);
 }
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 39ee139f1..3363c6496 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -155,10 +155,10 @@ enum network_type {
 
 #define is_legacy_only(net_type)  ((net_type) == ((net_type) & (WIRELESS_11BG)))
 
-#define is_supported_24g(net_type) ((net_type) & SUPPORTED_24G_NETTYPE_MSK ? true : false)
+#define is_supported_24g(net_type) ((net_type) & SUPPORTED_24G_NETTYPE_MSK)
 
-#define is_supported_tx_cck(net_type) (((net_type) & (WIRELESS_11B)) ? true : false)
-#define is_supported_ht(net_type) (((net_type) & (WIRELESS_11_24N)) ? true : false)
+#define is_supported_tx_cck(net_type) (((net_type) & (WIRELESS_11B)))
+#define is_supported_ht(net_type) (((net_type) & (WIRELESS_11_24N)))
 
 struct ieee_param {
 	u32 cmd;
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 9b6c42e4f..bcf141274 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -80,7 +80,7 @@ enum rt_rf_power_state {
 #define	RT_RF_LPS_DISALBE_2R			BIT(30)	/*  When LPS is on, disable 2R if no packet is received or transmitted. */
 #define	RT_RF_LPS_LEVEL_ASPM			BIT(31)	/*  LPS with ASPM */
 
-#define	RT_IN_PS_LEVEL(ppsc, _PS_FLAG)		((ppsc->cur_ps_level & _PS_FLAG) ? true : false)
+#define	RT_IN_PS_LEVEL(ppsc, _PS_FLAG)		((ppsc->cur_ps_level & _PS_FLAG))
 #define	RT_CLEAR_PS_LEVEL(ppsc, _PS_FLAG)	(ppsc->cur_ps_level &= (~(_PS_FLAG)))
 #define	RT_SET_PS_LEVEL(ppsc, _PS_FLAG)		(ppsc->cur_ps_level |= _PS_FLAG)
 
diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 4cfdf7c62..214c1fd9b 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -130,7 +130,7 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
  */
 inline bool rtw_cbuf_full(struct rtw_cbuf *cbuf)
 {
-	return (cbuf->write == cbuf->read - 1) ? true : false;
+	return cbuf->write == cbuf->read - 1;
 }
 
 /**
@@ -141,7 +141,7 @@ inline bool rtw_cbuf_full(struct rtw_cbuf *cbuf)
  */
 inline bool rtw_cbuf_empty(struct rtw_cbuf *cbuf)
 {
-	return (cbuf->write == cbuf->read) ? true : false;
+	return cbuf->write == cbuf->read;
 }
 
 /**
-- 
2.55.0

