Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572BD37F107
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 18:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769797008; cv=none; b=AvFk4ME0ssD7xaVHlr5EiGRUOy7SgR55yBlNlZ4yVnOg2VMtCDXe8fU86mS73FZ+WE9NHEYVzSz6oUf0f3ouUPpl+jqmDlm1gUupOc+W414E+6udLYadkIOtyzkF5cxYmAWwWifkOwc9bVbupY6IU4D4FFFxwz5+EUCa0uIYHE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769797008; c=relaxed/simple;
	bh=BTGD8PKhmsfkb+4Q1sKuryoutQRF30cIq9URLzQ0h4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gAiWlk3UQaeLKqKgMgU+78Jgv894AODls1VYzkND8oBc7xu4HKUHq9WqsSba19jwG8Y2Me+6urfB4ojomfyrOwVIbeM3KO7buqAi5/wBGFf6uvy2NJ5tUb/smVBDm4cICsi4L1cQ/y+chtWC5eptmJVz6pOqQjG4I+tY9J3W41U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TD9PZ8IQ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TD9PZ8IQ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso1886209f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 10:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769797005; x=1770401805; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRDtc7+pH6qw1+quaRjh9oBVjXVe884KC2sSKvso1A4=;
        b=TD9PZ8IQu4iqRaUWbwJ8weXowiQg8za23rI5aSv7PgiwriYdkpI6N9ldw5eYn1SzhH
         gwIrGa268rewcV4nxIfranouuL4Qk7bkGKM8Pp2Yg3gQK+Y17foncuVoCtxjC8QArvoN
         F3CLfxZMZ/5EounwDcTfWJTH+H/dvvy0Bx0YzQkHQ0+sETJUT6ZetrerUj1LdATOWWzL
         qK72GCTAGk1rEQyR3ApxtXzRuoMK/PmL72xio+39CEqO2dsb0hN9www9RAw4AswY/hQc
         QmOgWP+MWsiGC432siogqVm2IaaXvvQLZdTsfwIK9yU1ZQrBs5uvaH5t7qwhX9xEEZRn
         4uBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769797005; x=1770401805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HRDtc7+pH6qw1+quaRjh9oBVjXVe884KC2sSKvso1A4=;
        b=nOCnto9oPtLxNa+cqP48tQU4gDSXw7j7ar0OMrlmqHJiidoeb2Qe/thTOgO7Y4LTTE
         4KDZbsHYt6MrqqjTYSg+af/1Z02yV3w/v4mKL+8UOqyKmH0I/fFrsfkOK3Mz/u9GayOl
         JgxAfaeoCRoDQl1/P+VpNiQObgZZp4385tfW1B0p2CUpiv8djVO91mqUYLOftzHZTtlX
         GwUiYYmd1vBO+R6m7OuU9MgFRUBEeN4iuZpxN5qVdhBt7ZH5NDf6vOIyJglDNfB4lt0s
         apzd5HLFSgKuQwlbQvAr2A8o4GXftZmcvUwAofY4XSWoUSuS7C60pGULcIuM4n2+4awI
         /o8g==
X-Forwarded-Encrypted: i=1; AJvYcCWQaSm112lfKtISSwqaISF9hb+PraZjhwdIVxn3X2sMjR3eeUN77k4QTHUa+HHkZAo0j4+iEjV3xJjXOXik@lists.linux.dev
X-Gm-Message-State: AOJu0YyIu8/3qmIMFplfi+p7gnF+RqJE0wxRLOMPD1nq/ge23yShZRGK
	KDSqhiUprbs3c77KCINAFMEOjwM4CbyCOnaahTLtDcKmQGzsEOZ6TcY=
X-Gm-Gg: AZuq6aKLCZQwYwhWYFR5+i7jkPbp4mKUTlh1O0EtlDyO4VsvNKrSmhw7vDIBA9WqLOv
	siWHHZIHBZIEfiRALcYhFXuzOkqneimzszVPLuocsmg/kB5BaRl15IYFDDHCRWEeLN6hIuBKFjg
	N1Hjb8tXWDMK9Paz/pfqQ4X9mPAJMt/iizqNEw4ciDZY3grzdP0/1F8ISlSE8yrcAh9G0ZlTnoq
	JGI0Ho0JQDBv4aRc22MBUppuCRTqZy6WEvsaQRWFD0n2osuX82nLyimlhzusUA43B5nSGiV70Y2
	xkAMUKQRym/E+qU7D5yqgSshGtmiIQO2mIQAoqUbZZmXgWBv2jJrlB+BThPpn/tML1lIEb4BhXZ
	zlK9cRzV6onKYlooss1Nj5gYVwnKer6fnOhv6H0Yy0EhFf+TAw1/MZvhZbLojWC1wpy5PpZLXdl
	401bEMyjUPfblzMV5cD1uNr6UxyGUogXfRPleHUBUwWeN4csPFLeYK08SHXrtU8w==
X-Received: by 2002:a05:600c:b99:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-482db49a407mr47035185e9.36.1769797004485;
        Fri, 30 Jan 2026 10:16:44 -0800 (PST)
Received: from LGPC ([31.223.131.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c40e04sm280571025e9.13.2026.01.30.10.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 10:16:44 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v5 2/5] staging: rtl8723bs: rename u1bTmp to val
Date: Fri, 30 Jan 2026 19:16:17 +0100
Message-ID: <20260130181620.199152-3-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130181620.199152-1-lukagejak5@gmail.com>
References: <20260130181620.199152-1-lukagejak5@gmail.com>
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

