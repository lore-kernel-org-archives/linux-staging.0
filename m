Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BB33314AE
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 15:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702242; cv=none; b=snSwtG8ePwf4R3B+7/xN9xryubB3INev1ffpjX3gOENkl3bH/cNCiupCDLd0f0IrC3XTLx34LTnSxf5DjOYZEawbCVx4W1TfA4Z7ymlvpjvSFBcOlzYMaUCq08QERABPvW7PKg7Nil+rtBJaKfKJlEze1doqg9qI1+Gmv4fxQlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702242; c=relaxed/simple;
	bh=gtRfArYMpYtR3Wwdb2Q6o7l+m0XA7ZJ5Jw1ZMR1mG3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T0k3mjXcCKMx3f7eK3AYcC2MbFdwpWNbohoKv0Hunw2aOJB8wxqCXWKlhTa3yJFxwuJ3I8J8GN3RKErC+UsQHlJRihRRJ85YLafjehPGbiPsl0i6fYDPTq0AHUbLfctzjnp3VQdNcavcT8VfyCL1pDnin1VxhJEtDc2IWaYwjpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8b8CXDw; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8b8CXDw"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so723179f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 07:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769702239; x=1770307039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsaA9RaWnt72GW7j0IMh4QTElhYpzUgcR96rkJIP9qQ=;
        b=m8b8CXDwSJlXp8aESj4MSnjm/n6nTjf3QN1JWtAShtsAd4X2Zq7d0FzFSOf9qoq2TS
         nN/MEfziQBuEmfvhqIIS6Qktr50T2Dau2SGUsHcOX4T+H3MbpLWR6vXY5if5+H9AsU5U
         sQjxJazVsC0Xyij5ne3N6ZwAHBPWErpGOPlOD405Twz1Y58nrwZtPb0N6ISevUwYnJbd
         2bzXc+JKJKXNpAu6uiJWsGcAakfl33KfL87oiZGICRbClwE1Gaq8Oz4EKLbX4DqXIdrj
         8OqqnpUBJlxCEGDMhfK5dS/1BMDuyWpwKgbh3vcE6QQXGZLvnFGvmYd96hSWkt/ZGzgU
         HkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769702239; x=1770307039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SsaA9RaWnt72GW7j0IMh4QTElhYpzUgcR96rkJIP9qQ=;
        b=qxNyuYB2wWTx4KYCe/hBrPzwkOtcZTIu/igiorrXBzoGXK9+7BYSlBXRary9CllNT9
         Yc8i6BJmjB6GYDO6aexaPcl64CkVSiwU36oTly9t02C65XmUpc9RsayqI1zt9ZepRYZS
         K3omlm0uoTEgppHQor1MlF2QIUfNF8VaHqy+jmlO7w3NBgeNkYeGo+qWDM4bqGReMuNC
         328+D8vv89Ug5REB6SYGGC1va68vWnLldobqJPLVTOqdQZE8XMi+lwBwQaLjxGtiWLCI
         xcZXT0QOwITfKSpqG27RfaN0z7I6iQD1l9NfYsG9rYdn0DO9UyPa0XbhHUstZ97duXJ6
         XflQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxeIp7irLqWZgKwu2ak4fK33s2Or2aq2FAEqzs3qRvxoDhUCgRDKmj0yUTqpoPSXstb1clhCvYw5fZJe5n@lists.linux.dev
X-Gm-Message-State: AOJu0YyA1b7gofYc4IX8R8MPCPV0+bdJV1PZSXxCuCb8geesa6poZ5wi
	iAE/NOYu/9+pdGH1pcEM8JX/7NfBLZUz+CpFPeu4y+R3x2N+8SEFaGE=
X-Gm-Gg: AZuq6aIQQVp9FnNPSbV2R6V9Udk2oDfaXzNnJtqC3tJ9+tTObkoZ8Td72Yay+c07EF3
	9SXCaC/nGrI7pxbWjUkYfAjYQUh15UH5NJEEE96pWqgkMkuYBB56ydysCz6sIz/r8ucWJUypQhS
	Sh9BR+47+aRTIalq4USYSlY16MSTibLhjQT5enLNBKpWif+5Vbrbb2qKnTZ9BZe5VdPhqR1z2Hc
	T8imvZ2vSHgwYykeOwCzRUuCocezsTG+dHi6resHBronjHrazhabOi9mP5VTxqbTx7zaqskv+h4
	rEouqTSEbj8mrNv+ZDHzqwPKrwnKnX0lQobGPa91zRJ9/4xFP+LWqglxST90s2LFwy/Jm+E2NkM
	0+mFBynUZonG68jpfh6kQt73OLXCiqUdrcmiSX2ngNJ6oCjsqlG3suHb7byRcDdn6W+fX56EQ6S
	ry
X-Received: by 2002:a05:6000:3110:b0:433:1d30:45f with SMTP id ffacd0b85a97d-435f3a6d009mr117781f8f.1.1769702239028;
        Thu, 29 Jan 2026 07:57:19 -0800 (PST)
Received: from LGPC ([31.223.131.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee078sm15749231f8f.16.2026.01.29.07.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 07:57:18 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v3 2/5] staging: rtl8723bs: rename u1bTmp to val
Date: Thu, 29 Jan 2026 16:56:51 +0100
Message-ID: <20260129155654.5565-3-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129155654.5565-1-lukagejak5@gmail.com>
References: <20260129155654.5565-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the variable u1bTmp to val to remove Hungarian notation.
This improves readability and aligns the
code with kernel naming standards.

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 12 +++----
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 32 +++++++++----------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 57c83f332e74..d75a63fd8a6b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -259,7 +259,7 @@ static s32 _FWFreeToGo(struct adapter *adapter, u32 min_cnt, u32 timeout_ms)
 void rtl8723b_FirmwareSelfReset(struct adapter *padapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
-	u8 u1bTmp;
+	u8 val;
 	u8 Delay = 100;
 
 	if (
@@ -268,19 +268,19 @@ void rtl8723b_FirmwareSelfReset(struct adapter *padapter)
 		/* 0x1cf = 0x20. Inform 8051 to reset. 2009.12.25. tynli_test */
 		rtw_write8(padapter, REG_HMETFR+3, 0x20);
 
-		u1bTmp = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
-		while (u1bTmp & BIT2) {
+		val = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
+		while (val & BIT2) {
 			Delay--;
 			if (Delay == 0)
 				break;
 			udelay(50);
-			u1bTmp = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
+			val = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
 		}
 
 		if (Delay == 0) {
 			/* force firmware reset */
-			u1bTmp = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
-			rtw_write8(padapter, REG_SYS_FUNC_EN+1, u1bTmp&(~BIT2));
+			val = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
+			rtw_write8(padapter, REG_SYS_FUNC_EN+1, val&(~BIT2));
 		}
 	}
 }
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 4e81ef53dc47..c774a9009e95 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -589,7 +589,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	struct hal_com_data *pHalData;
 	struct pwrctrl_priv *pwrctrlpriv;
 	u32 NavUpper = WiFiNavUpperUs;
-	u8 u1bTmp;
+	u8 val;
 
 	pHalData = GET_HAL_DATA(padapter);
 	pwrctrlpriv = adapter_to_pwrctl(padapter);
@@ -780,9 +780,9 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	pHalData->SdioTxOQTMaxFreeSpace = pHalData->SdioTxOQTFreeSpace;
 
 	/*  Enable MACTXEN/MACRXEN block */
-	u1bTmp = rtw_read8(padapter, REG_CR);
-	u1bTmp |= (MACTXEN | MACRXEN);
-	rtw_write8(padapter, REG_CR, u1bTmp);
+	val = rtw_read8(padapter, REG_CR);
+	val |= (MACTXEN | MACRXEN);
+	rtw_write8(padapter, REG_CR, val);
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_NAV_UPPER, (u8 *)&NavUpper);
 
@@ -848,7 +848,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 /*  */
 static void CardDisableRTL8723BSdio(struct adapter *padapter)
 {
-	u8 u1bTmp;
+	u8 val;
 	u8 bMacPwrCtrlOn;
 
 	/*  Run LPS WL RFOFF flow */
@@ -856,26 +856,26 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 
 	/* 	==== Reset digital sequence   ====== */
 
-	u1bTmp = rtw_read8(padapter, REG_MCUFWDL);
-	if ((u1bTmp & RAM_DL_SEL) && padapter->bFWReady) /* 8051 RAM code */
+	val = rtw_read8(padapter, REG_MCUFWDL);
+	if ((val & RAM_DL_SEL) && padapter->bFWReady) /* 8051 RAM code */
 		rtl8723b_FirmwareSelfReset(padapter);
 
 	/*  Reset MCU 0x2[10]= 0. Suggested by Filen. 2011.01.26. by tynli. */
-	u1bTmp = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
-	u1bTmp &= ~BIT(2);	/*  0x2[10], FEN_CPUEN */
-	rtw_write8(padapter, REG_SYS_FUNC_EN + 1, u1bTmp);
+	val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
+	val &= ~BIT(2);	/*  0x2[10], FEN_CPUEN */
+	rtw_write8(padapter, REG_SYS_FUNC_EN + 1, val);
 
 	/*  MCUFWDL 0x80[1:0]= 0 */
 	/*  reset MCU ready status */
 	rtw_write8(padapter, REG_MCUFWDL, 0);
 
 	/*  Reset MCU IO Wrapper, added by Roger, 2011.08.30 */
-	u1bTmp = rtw_read8(padapter, REG_RSV_CTRL + 1);
-	u1bTmp &= ~BIT(0);
-	rtw_write8(padapter, REG_RSV_CTRL + 1, u1bTmp);
-	u1bTmp = rtw_read8(padapter, REG_RSV_CTRL + 1);
-	u1bTmp |= BIT(0);
-	rtw_write8(padapter, REG_RSV_CTRL+1, u1bTmp);
+	val = rtw_read8(padapter, REG_RSV_CTRL + 1);
+	val &= ~BIT(0);
+	rtw_write8(padapter, REG_RSV_CTRL + 1, val);
+	val = rtw_read8(padapter, REG_RSV_CTRL + 1);
+	val |= BIT(0);
+	rtw_write8(padapter, REG_RSV_CTRL+1, val);
 
 	/* 	==== Reset digital sequence end ====== */
 
-- 
2.52.0

