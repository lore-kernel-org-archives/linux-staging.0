Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA555345CDC
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364503; cv=none; b=WI+6qh6e9e843KqsYgnFV4bBRoTj4k1AL3lloywAhnUPcqbqiYPQsXcX7FZZUxoLiCFCH9QU0xifiP5Zr0U/om2DalIl0KGbHkh8IdT2ZS+wKU6DXsh7h4nNxSI361Agjt2eMwEet8vrnvXmp0RdUI1z6BbOeMrPaLZk1iUsfY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364503; c=relaxed/simple;
	bh=NnZB31Y4W3GvdHsE/z64093AWpt9r8mlKoM7d/nRwII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZZKwyiFONg1j6iFhOSaM7wfWZIn6ulZfeoSU/YLuv8iC/mBuQftlR1E6xfefgY9wKOhOrTk5xmMMEWvyzG52NJ6wgJUPXglcmy21Y3zqg63f+YH/DJ8H1860ATnAV2qR6ZfiFBjtvSlkR5AFI80AShIkjSEVGGYCsw9nsZGbUNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFcpJzjs; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFcpJzjs"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4362d4050c1so79377f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364501; x=1770969301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Qy8Dg0Z8L1ZvD1RAmGsWTraTWkcFbqS+ohdUNoSFHo=;
        b=mFcpJzjsSQUXQJPc3LbV666PJ/Gl6qkLP0Dw6fpLI0knRFMAaRVP3plRgy6F/F8c+2
         vl4jEIvjzq97M/nsU99Rvi1Y4QdlODK6nVpadgNHfLRez1gcp7FHsHFuCku9bTHqKgOp
         j1fQuTtr+QcZomiM1hejcym4wUUYB1bUqqT7MFcrCjwfmMsa/xrA7GR4fTWbUdmnoFhK
         XuzPKWljR0Dyur7djPL0ByWcsDRUEGHh98XixiBscT7C/SHdnciDR/5HDoTRBPy5h+6x
         c38Cw2psW7WGR0ScGhW7vibvze6JW+3n4EbgFd5Oc21NlFiPN9yxJdXD4uXAxyBjqxwz
         GYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364501; x=1770969301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Qy8Dg0Z8L1ZvD1RAmGsWTraTWkcFbqS+ohdUNoSFHo=;
        b=g1YrPTMn/GRXlvrBlbAlY0EFLeC+FNUpvSH1UcarhkrR9JbOuQ9HVN/omnU7coMOMx
         EvnKG1p9P/pvZ5FnsYuaJaA8BDvOhZlYI8ibeQpGGGKqe61liiPF81z7bfnLNTwXjKba
         tOWOPzwmYoEaHT/PW0nLiFGtefdJlwBcOZc8PfRnMU7A4Q3VrTp2PXDprsdkNDan0w9L
         IZtGsw/NPgW4xTj0Q5ocaVjUoNWvYiG8Lhk4hnYakqMN89B8lLChoH+RVCI/Rd3x0ZE7
         nGzlSk/Zb/PbPcCJjlG1FYs8ovL3V32wij8ePZUgO4GULYl65sXTYWo7f+Mvb/S0xiLk
         /jFg==
X-Forwarded-Encrypted: i=1; AJvYcCUtrupgmmU865ONHWjpmWvhCc61BxKf1QfeH6slv1d6jhNxbwlrKVCHs1DjfSLgDvCcXEaC2sMWZriqDsre@lists.linux.dev
X-Gm-Message-State: AOJu0YyLlaSi5o9XhbGx7UrxJBK7aXsDCOB2B7Bqzuq97pfaqVdrB4r3
	scb+IUMOwYpeR7dNpBMlSCN/BeulmyNBJuDDC+jySxNI88KGUvsw46M=
X-Gm-Gg: AZuq6aKBK8NoMq4aRMT9acA44J1KpPhS7YOnH4SM9d67Cg+BMnVzTXXsfhc0UfRbTqU
	9BPJQek2+u4MIfjcRwU+35KURWiq9GZChcHryXldS/xwgAxil8v96udJR+jE1dYbJ8p9XdRXcP/
	HdfqaX09BVWLDMRqBEwmlMjRhnkxGcZ6RrkS3AcwDzrIxXwJ2URyQy08CZ+fNQ2LgQTyIQymJ4m
	EOYPDaqlrH/pvqDFIObFRgdj8Cy0gsLmQEJi/zpQqs/+yW9JVEVDD6WBjLc+QtJSwBPyshUODjA
	BfCUtlh72MZbftLeU7IqtdPQKtNwau657fxxfRV+E/4xZwGeQwhI+xzqav391d2l1UYruJcVVms
	NRUHzVofQwF36aRbwV1OhVxHY+CWiWaGsOX6fIR6U7kWLfz/dwSU8qALQKBfuL7L6KfsJbKHpZ/
	A1SLz3WvNDZQrQ8ltwAdV3HgNqTRLtoWHjm6F/6zg0R/Zr5OjA5ik2JPruuskE+2A=
X-Received: by 2002:a05:6000:2681:b0:435:a4a9:6f67 with SMTP id ffacd0b85a97d-4362938feb7mr3038219f8f.42.1770364501154;
        Thu, 05 Feb 2026 23:55:01 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:00 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 02/26] staging: rtl8723bs: rename u1bTmp to val
Date: Fri,  6 Feb 2026 08:54:15 +0100
Message-ID: <20260206075439.103287-3-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Rename the variable u1bTmp to val to remove Hungarian notation. This
improves readability and aligns the code with kernel naming standards.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 12 +++----
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 32 +++++++++----------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 054e2c2eab02..b2803b33a0f0 100644
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

