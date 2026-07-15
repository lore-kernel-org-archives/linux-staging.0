Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5288A478E5E
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119872; cv=none; b=JOUgCTspyp/wzTvz1zZSuftevbgkI1sDLNJpgIraPJaWfTVPjCUP/dirdMFgtv+kzpkLbo4AhGg9Cpho2NpiPUL3BghLHPIXVYXZJ4IKNkUUZ7QbTwGQwP30I4r5Df9sTSk3Asvz1e8cxQzlRZs8a+Q6rUzR0bXPK2K4Cd3BddU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119872; c=relaxed/simple;
	bh=u1jBMXa16A7v++4qMutiXWlJdKAbcPe3g/LhjZ9tVHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oAu9CqBE33Ia/8kI4kCvQ4gxx4kuBtE130q748jdx0pT2DZvdMiGWu0EYiSMlVBVpihekGEJsZjH82aXyrc0huPm2P2yNr/8xQr7Rr9Gtjohl2UY7HmBDM0+wx5JcFjjkBsP80eeZPSbXAQYNs3PYh0Wsbt/P5jSvWk/gwlsUJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qe/O12HM; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qe/O12HM"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aea0fff535so2260596e87.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119858; x=1784724658; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HGQst0oyHOMRM9hMxtCvVXC1/fk2wJSMXeEKR5JD+kU=;
        b=qe/O12HMe/gIvxeSxz15H76cxyStlHJ/1mHckBqAl/UfiFJAjlbYERoXh8bMzN6nij
         GWzMT21wqx6WsWRFzitECqG1oMaxnX4OnIutrRD2S7ToWR6RtmrCu0AYj+VXjthn6HlX
         Eyh3Lc+uwI3BEv3tnKYsYV7YdnscJCAlN/NtfaK2/nDXItSp5WduRB4rnSjJdltW4VYE
         PE9KJibfsqatGT5v5yllyGdgG81pGupBdb36xh3jBYl36nEYsU1f3eyp7nwK+HGPVShe
         LqVHp594GDtOXvaLTjp2+H46RSTdnJlnaF/Spe8cD14RNx1PViF0RLcsMWv6nZTysFIu
         BI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119858; x=1784724658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HGQst0oyHOMRM9hMxtCvVXC1/fk2wJSMXeEKR5JD+kU=;
        b=C8qlNsAQ+oyaYJ6st4Mk9hRbcNKgavaCDoB1MmnP78+a7O8+Xo6dLIyBtc9/hFHAnr
         2v4PC388cSuh/7QB2jmtUM/8GG+U7C8tWrupuL9uLuznMCXEY0xxWNTpW6uKf1lkT7UL
         CVfDSgFrQ8owyModqr2TQSdjOUZFFLJaiE7fHLqSQPuH1B3m2a94GnCqUoA9VCenIZGl
         /In/GX8w5W9l9UPt0B5VorImpcjBzQ9WXEIr1yu4Dtma52sKVtkLlPFpyg+vzgw5bVMK
         dxpuWOEWg0Ux/1MQ/c4U7MqWyIgQHdokmHfZft4lPnYm3AJZOeZaAiPVVfAlRLqnfqm+
         P3Gw==
X-Gm-Message-State: AOJu0YxxPtrhXITrU1VdoLt4KFrScqk1OVHD99XLJlYwTzFuLrMsaxO0
	NthJCSz0dKyhrHDFzpLXi3AGrzhzv7+ZEEpbU9EyJV+op4l/DxFOl178m2Hwd1sNyjI=
X-Gm-Gg: AfdE7cmjjzI9TpIGV7Uiw/wsXTINIg7aRQjDU5bVhb9fr0wRE/8yn8WezqBZUQkMj8F
	1dPsZIywxipxGXkMDjfffB0OZBiHSvUor5wQf/3bkewjvoiXNAOo3GRVUHHzDhlARt8fZoSlajS
	fKMVAAyTIUMfn2M+TyYK7BH0j3GsSoxA+vHtmR/j4FkfDVte2RClpEmV2R8Svw+lN8dOIsg4Vnn
	71c8ch+dVrbvWB/g70xIEfs715a42SYnocd7B/M7wkeYChjnfD8nOpbJxmYm0EMJlPUvSIkzLJY
	tM/l4a5ts7joirN3kJD6a90hFYia0K2L2XQYZdJE+LG33fvoK1cD4p2EAek5T3vpMzQeO9XE9qL
	DmrlZx3wxbGE8Xw9zizW6JZxmfNgUgBWoEGEylorFp2NiBm5Acyu4LzxNh8PvEYoVZnB7rTXJqU
	ZsI3l60fPb/XjCpfUf3MLIuqa0+ixwE26gW1HCmUMDvuuNscjM9jsVBxA1RbhJzR9Oigw4o2Y9X
	pwXbIIjk+ob3g==
X-Received: by 2002:a05:6512:3e1e:b0:5ae:a9ec:bb31 with SMTP id 2adb3069b0e04-5b0236bb3cemr4161121e87.57.1784119857536;
        Wed, 15 Jul 2026 05:50:57 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:55 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 50/61] staging: rtl8723bs: inline SetHwReg8723BS into rtw_hal_set_hwreg
Date: Wed, 15 Jul 2026 19:48:18 +0700
Message-ID: <20260715124829.90290-51-ulijg308@gmail.com>
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

Inline the hardware register configuration logic from SetHwReg8723BS
directly into rtw_hal_set_hwreg. This eliminates the intermediate
CamelCase call layer for SDIO-specific registers and cleans up the
driver entry point.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  4 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      | 35 ++++++++++++++-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 43 -------------------
 drivers/staging/rtl8723bs/include/hal_intf.h  |  1 -
 5 files changed, 37 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 0cc6887bb..1fab3e829 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5449,7 +5449,7 @@ u8 setkey_hdl(struct adapter *padapter, u8 *pbuf)
 		rtw_hal_set_hwreg(padapter, HW_VAR_SEC_DK_CFG, (u8 *)true);
 
 	/* allow multicast packets to driver */
-	SetHwReg8723BS(padapter, HW_VAR_ON_RCR_AM, null_addr);
+	rtw_hal_set_hwreg(padapter, HW_VAR_ON_RCR_AM, null_addr);
 
 	return H2C_SUCCESS;
 }
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index d833c5e3a..3ac04c8b0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1515,9 +1515,9 @@ void update_wireless_mode(struct adapter *padapter)
 	SIFS_Timer = 0x0a0a0808; /* 0x0808 -> for CCK, 0x0a0a -> for OFDM */
 													/* change this value if having IOT issues. */
 
-	SetHwReg8723BS(padapter, HW_VAR_RESP_SIFS,  (u8 *)&SIFS_Timer);
+	rtw_hal_set_hwreg(padapter, HW_VAR_RESP_SIFS,  (u8 *)&SIFS_Timer);
 
-	SetHwReg8723BS(padapter, HW_VAR_WIRELESS_MODE,  (u8 *)&(pmlmeext->cur_wireless_mode));
+	rtw_hal_set_hwreg(padapter, HW_VAR_WIRELESS_MODE,  (u8 *)&(pmlmeext->cur_wireless_mode));
 
 	if (pmlmeext->cur_wireless_mode & WIRELESS_11B)
 		update_mgnt_tx_rate(padapter, IEEE80211_CCK_RATE_1MB);
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 9a3ebad35..bbf987ace 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -71,7 +71,40 @@ uint rtw_hal_deinit(struct adapter *padapter)
 
 void rtw_hal_set_hwreg(struct adapter *padapter, u8 variable, u8 *val)
 {
-	SetHwReg8723BS(padapter, variable, val);
+	u8 val8;
+
+	switch (variable) {
+	case HW_VAR_SET_RPWM:
+		/*  rpwm value only use BIT0(clock bit) , BIT6(Ack bit), and BIT7(Toggle bit) */
+		/*  BIT0 value - 1: 32k, 0:40MHz. */
+		/*  BIT6 value - 1: report cpwm value after success set, 0:do not report. */
+		/*  BIT7 value - Toggle bit change. */
+		{
+			val8 = *val;
+			val8 &= 0xC1;
+			rtw_write8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HRPWM1, val8);
+		}
+		break;
+	case HW_VAR_SET_REQ_FW_PS:
+		{
+			u8 req_fw_ps = 0;
+
+			req_fw_ps = rtw_read8(padapter, 0x8f);
+			req_fw_ps |= 0x10;
+			rtw_write8(padapter, 0x8f, req_fw_ps);
+		}
+		break;
+	case HW_VAR_RXDMA_AGG_PG_TH:
+		val8 = *val;
+		break;
+
+	case HW_VAR_DM_IN_LPS:
+		rtl8723b_hal_dm_in_lps(padapter);
+		break;
+	default:
+		SetHwReg8723B(padapter, variable, val);
+		break;
+	}
 }
 
 void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 731ca9276..775fd5138 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1077,49 +1077,6 @@ void rtw_read_adapter_info(struct adapter *padapter)
 
 	_ReadAdapterInfo8723BS(padapter);
 }
-
-/*
- * If variable not handled here,
- * some variables will be processed in SetHwReg8723B()
- */
-void SetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val)
-{
-	u8 val8;
-
-	switch (variable) {
-	case HW_VAR_SET_RPWM:
-		/*  rpwm value only use BIT0(clock bit) , BIT6(Ack bit), and BIT7(Toggle bit) */
-		/*  BIT0 value - 1: 32k, 0:40MHz. */
-		/*  BIT6 value - 1: report cpwm value after success set, 0:do not report. */
-		/*  BIT7 value - Toggle bit change. */
-		{
-			val8 = *val;
-			val8 &= 0xC1;
-			rtw_write8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HRPWM1, val8);
-		}
-		break;
-	case HW_VAR_SET_REQ_FW_PS:
-		{
-			u8 req_fw_ps = 0;
-
-			req_fw_ps = rtw_read8(padapter, 0x8f);
-			req_fw_ps |= 0x10;
-			rtw_write8(padapter, 0x8f, req_fw_ps);
-		}
-		break;
-	case HW_VAR_RXDMA_AGG_PG_TH:
-		val8 = *val;
-		break;
-
-	case HW_VAR_DM_IN_LPS:
-		rtl8723b_hal_dm_in_lps(padapter);
-		break;
-	default:
-		SetHwReg8723B(padapter, variable, val);
-		break;
-	}
-}
-
 /*
  * If variable not handled here,
  * some variables will be processed in GetHwReg8723B()
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index ee8ad2632..51fdbf9fe 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -241,7 +241,6 @@ s32 rtw_hal_macid_wakeup(struct adapter *padapter, u32 macid);
 
 s32 rtw_hal_fill_h2c_cmd(struct adapter *, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer);
 
-void SetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
 void GetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
 void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int len);
 u8 GetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
-- 
2.55.0

