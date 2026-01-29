Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D26248F7C
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 18:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769710572; cv=none; b=Z6qOzrywYlRbaOwM15NU22jwNiSFuHpFxK0F4Y32fZ7ecX4CDJ9f32F1jCalLAKvdvbM04516dsKUbs6VBva4E8xvZiC/uFbxhLJNBfgTOQqKUl3iiS3i+S/ttMhN0GQeBnVN7cjnLTFNJ3XwDYGdER65NGN8wQnaabWYMKqAu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769710572; c=relaxed/simple;
	bh=gtRfArYMpYtR3Wwdb2Q6o7l+m0XA7ZJ5Jw1ZMR1mG3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRCCdre9LPrO86YBqv7E7STiQ8UbqaUkr77eRfEvMqnvebX97jaiadKyKE7MoEUe+jN1ZHYbmgn5b6jRaepWfHe8WL7cIi1K7g+ytf2gpvFb6pgQ95GbTMeP8sbN8f2wAarIUW9YmWszjEMsPdNz1ivhZVvHBTYuhpBU0yvZn/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLEZRpAt; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLEZRpAt"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806f80cac9so8208265e9.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 10:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769710569; x=1770315369; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsaA9RaWnt72GW7j0IMh4QTElhYpzUgcR96rkJIP9qQ=;
        b=BLEZRpAtUwjEZZAYJj5SjAy5cLjXBxymkXXFcbU74mBKULCk6qijVsyyrBj33sz7NG
         kHS2XsgrsRaVuh70I/CzY1vxx6LtVxlvm52Aa9IBwQfHnlBBC0RpfdDFEKZBVXTwJoFl
         Vbva4g3wj9omgBryiYPyuLsIoC50SlAbic5u+yXTy/uhaSc8g2Z5NWVmqFuQMYRk7QSA
         0p8XGeweT2vuvOqdbd0BzLEEv6GSHV3gM9gDA4FL+UNBsXPUGwI5Vetpl/CFUgEuLKEu
         LteahocejZdzSLdNCdP4uvrl5XyniVjjBzwckHUccqPPWnHpWMlyjqGk868lnqBqDyXM
         J4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769710569; x=1770315369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SsaA9RaWnt72GW7j0IMh4QTElhYpzUgcR96rkJIP9qQ=;
        b=mskNHZcf+1UfOq5w4qNcEy4OI7wzvrpy77di0gmLak6pX6lwPO6nFY+R601/fAqJ37
         K6JjpApFAbXaPMIx4DQ6a4iaxDNrCTys2J3DBMUOpIJEOAwbArl/OAGtPlwDQmIcOFa4
         T+uF3KsaJgvMhvMOWK/Po9F/VeRyi1+LM5bmHImdxS468swJFVvWwo9q7od6j0MB5c6s
         LKEWT4nDlGpWSNIWBz8yposwzvLHJiV3pm8NKEPydhH+jEm8KngJv5GWIAhQ+j+r5CNq
         v939DPqRGuS2pmn/ofYt7NlyrdCWGUE0b5vuzEA0N9qmDe1Y5YvVbufHEOM65txQe21L
         APuw==
X-Forwarded-Encrypted: i=1; AJvYcCViUYeoK7J1Mz4xfxxdjqrq4d1v581hYCC8Hfg+JMSaWy8C3GphViEfcx/a3AKqlyqUElURzn/eAcFS5OR9@lists.linux.dev
X-Gm-Message-State: AOJu0YyOCAajMpsVUXVzWrsWD6pBmuDz6s+ZlKXurIVo12+uffkhh3SD
	Iwuaw9MvVFoElEi0wmLx/1hk8yULGIoxvKE0EPbffQVjk5e5VBQEcHmxAtNm7yo=
X-Gm-Gg: AZuq6aJPMJ7rK9c+lv/8J9dJpkKWEeecv1Seb4fgC+yQzWT96VOFf1M62humjb1WdqM
	GcnUjnfZfRoq/WzVd2l+eG5jbpz+RIw4ublICq9ChE7VpRv/cta1fvYfPLxCix2dGdvyiH+0K+s
	EPD56b56e7bH/UFvDM9JayynIbuPTbSyBvk/NXeppVBm3c1sFxWObeSCIc0OxI+nPveWrBGj3Jm
	Zh07ouA1pEPN12j72j2bgyPPbXDO0xJjlLchSKcbcUD6rGGWuQinRqJs4Bdcr4r5GCLcOIld2gs
	mGy+luH22sVqtE9o84fWEralBotxOnduIjH0gZwkQz1tolQfF+rB4Pj8QEvV6AUT8zTwQ19k0iu
	ljY8w2T47DoyVMik2NQ5d8kdIeZKHLrqXkUGRE0an8NOBRqOExSgkz3/sA1qCHGuknwUxcJb37D
	M7
X-Received: by 2002:a05:600c:1385:b0:47e:dc64:f1c6 with SMTP id 5b1f17b1804b1-482db493eb4mr682455e9.6.1769710568712;
        Thu, 29 Jan 2026 10:16:08 -0800 (PST)
Received: from LGPC ([31.223.131.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdebf86sm136578725e9.8.2026.01.29.10.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 10:16:07 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v4 2/5] staging: rtl8723bs: rename u1bTmp to val
Date: Thu, 29 Jan 2026 19:15:38 +0100
Message-ID: <20260129181541.72066-3-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129181541.72066-1-lukagejak5@gmail.com>
References: <20260129181541.72066-1-lukagejak5@gmail.com>
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

