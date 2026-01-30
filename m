Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BB7387351
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 18:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769799458; cv=none; b=ghbQDZCFPgxkLfkDs5uGGZQikXpfdIlxEciHxxATkbZLX6KRf8dKhtrNj2Z0ws81OdvMKFmu8y1To96UegO83BdFtIqw8VDbiwct4Wq1w9884jUMJTSVGSyJJ7AROsUMgcTMix4ZfPtO85lzWVJYEObwUTWc0kMVM+R1ycl1FfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769799458; c=relaxed/simple;
	bh=BTGD8PKhmsfkb+4Q1sKuryoutQRF30cIq9URLzQ0h4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mSrJIT/drtTbpowyF7Rnjw3IMm8WykT1sp+VULrZgwvel+Y+WbyRRxlDFrQqIDSssp0KBUYE6qlpDXmdRFKBwMI4mmDYXV076Jj/Xt9HocsBX+wjgLM1mbznUYIxHntpQzh5CNU0DVc8BGBbbb91lo1/Hp76LwRsyf9P8qsQ7W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3PXUtOf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3PXUtOf"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806bf03573so13371405e9.2
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 10:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769799455; x=1770404255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRDtc7+pH6qw1+quaRjh9oBVjXVe884KC2sSKvso1A4=;
        b=G3PXUtOf15WdHW5urQ/uQeouHfH7BX0yB5jggqUKv3kBQ6hcuhNcBdB+blK5mRDrky
         hN3su7iVFoBrrpwarX3mfouP5GsrbBru4rvNy4QAx7h7L4OTfu44Ckw1g1Tz+uTr+gr3
         AJHor/o5bP/tr6q2sganbt4qvdKL5LcEYboRU/igqyHYH/VfmEs8rQCWYAQVTSgC7use
         GZFHye4TNSVMbZOzcJdRzphLCYGoo0wTHvjCzWm4zPZ59GwxNwz7f2Fg/3HODYN0uNBe
         d46ulr78nVVnHz21kpgNqfywM26fSxBN2xe7i2BmX2oeJb2AXP1+PIGXQKK/nfvSV3XF
         fZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769799455; x=1770404255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HRDtc7+pH6qw1+quaRjh9oBVjXVe884KC2sSKvso1A4=;
        b=abonHDM43nmhEwZ3vr89qkGP/7b76yzBzyNLnrKXAmuDrK3O3H2BWvfAQGYYSUJr6s
         Ju6luaRYRcKJRZUJg4bI3UZB1pZukCdPEQVTuQyiV9AjqnlaQdQ1KlbFXg0YQUXxKvSQ
         RuLqZ9GAX0MZsgKEYxEras0r5hu7A09n7A2tfCN9jZk7O2lglfh49kkl3SAuu9uONhhw
         7R+cmhLDut+ecfePx91tPg/7QVsvj537CH6sT/QpgyYmusaoYjTpQ8+/nz9Z8M8RY7nq
         DI2oqJTvsTXhGsdY0xPrBLNCJ9zUbytlWFoiZiSxSMPEei43Umu3ATNDn7bOOA+MUgYz
         kh8A==
X-Forwarded-Encrypted: i=1; AJvYcCUvplEfHciCG5JSa/Vm0yRrcbSeiaVGRMiYjqc/7dA3TVTT7V9WahpgaD2hqxmz1Qyr2YnUNnVvrOrCXX7M@lists.linux.dev
X-Gm-Message-State: AOJu0YwYvXGJxURc2YjMDFjT7eet7oRPHxUCE+G8+FOtd6dxxFOt9c2a
	bPwZ+45ptaI1z/DVIgEPeWAvSdyXwEuOaNZ3cla3fZV3Mh4kHOhZyoLoFMoqdi8=
X-Gm-Gg: AZuq6aI/mh4jZeRCS+c/FaPI5jkKG4ovXHJCI6TwZ28cUb1Pdp7RSkBHYc0xMHHf0jt
	xkgr0an948KJJAPCZYebSmx7GRIIxN4RoK7JPNolp/dTOG2WG5EkQMOkbriOICfUEwXrPiMkRHb
	tp031ZB5WYiNcmPkgMvdxmUoiSRfHNnco/3gMWVy3ubncVJTbwRiJQHFGV6/up+5XVd0gafIsOA
	WqnJY8CFPHcLv0pnEjWzIuMDgCJDnBqfmemiawm2O/FXxnB4DLrBQja5rBp2BL70Gvc2to2fFHA
	K1qy91HJiVWmXusuIVq+tGVRDa0kjBlDUcnjtrOofBRe/BHtrvc8T6KjdEsdgOYzbcrjD1tGj8X
	EeCth6iCjg/v1iidch0dQkmZn3bbNcKgktHblAiKcgqPOkVhbRWaLXsWC9tdYFWLEK3e6uGCqga
	9PrtWAI8UFky+/YZy29/vcJet4c5CufXj9ZJ1fJFJXGo7td/DioVHelNUnWj2imw==
X-Received: by 2002:a05:600c:3155:b0:47e:e9bf:dd8a with SMTP id 5b1f17b1804b1-482db4b5a1dmr45681835e9.37.1769799454682;
        Fri, 30 Jan 2026 10:57:34 -0800 (PST)
Received: from LGPC ([31.223.131.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edf62sm26474164f8f.13.2026.01.30.10.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 10:57:34 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v6 2/5] staging: rtl8723bs: rename u1bTmp to val
Date: Fri, 30 Jan 2026 19:56:55 +0100
Message-ID: <20260130185658.207785-3-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130185658.207785-1-lukagejak5@gmail.com>
References: <20260130185658.207785-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the variable u1bTmp to val to remove Hungarian notation. This
improves readability and aligns the code with kernel naming standards.

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

