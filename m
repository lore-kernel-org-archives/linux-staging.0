Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5734230BF6
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 17:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769620638; cv=none; b=Jsm6ECWIxgukwIGfTepp7UouE/Zf5p0is6LShaEE2EuskLzLN55hbKhQ/JhJO8huorhtEHAHrbng7jHK8g54gtxkcCq3J4uFPKxuMGEfEetw3dtiDf3CtRVson78HXnS6PGtJwvDgBibcbBMSh6wR6klSMdqdONdN/Y8WHONDDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769620638; c=relaxed/simple;
	bh=1fZluT9AOhdd0Vu8WqUfN5w5aO08WRwYHDac6zoiwNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E90Srx6YeenuFrlvY6VOkbVXq9u37tnC6IQHxHGU4ObgmZ6hQlBhYJvjAdH8XZmkIMffRsqglPvFTF2eYWf4i24ao1NR1C6z5zNPKP9g6F4GF+x3RyRplH7NsCrpdnjFKdjXg8lLvFkSYz0PWKxLNA8A+Lp44bnjLbbXXix7RTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUQ7uq6G; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUQ7uq6G"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4359249bbacso793767f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 09:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769620635; x=1770225435; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=esaD8Y2gLORyr/EQWFjBVfH9AhGFhd7/IBRCw617ixs=;
        b=MUQ7uq6GTcbeCXxyMuMq4Jo3uSWDhu0M/fl2Q168+4otiPCmA+6lpjNyz/bJtkp0jQ
         NAwhHzwG417+2NqdMdI10EWFwwm1tzjOTPXZQAZ93P3lX2ixoo71NC3OgeZ2wZYe0y6M
         3Q3KQ+o6e9hGaK682+Dr8n1KOuNEGAjiGrIvUq+eLpuIe8ns8qqPmG1SC0Xr3+Hv6qdh
         hjzI0gjLlIGxT/SY61XurPnwiBrY0wBxEpcU7XYRrWNEyC0ApXTbt4jXPr63i0M48UWA
         zZDmxyDUxyz8z349KGUjQ5Mlb3QhlUyMP9DAsRbPl+d0TbeRRjJfPCRerQaRI816pJc+
         N1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769620635; x=1770225435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esaD8Y2gLORyr/EQWFjBVfH9AhGFhd7/IBRCw617ixs=;
        b=MgMGV67Sh99HBX2CXA7Oal5tbyAGDn/l6pMWkjoJ9JsMqQ+/gP3nJapByyl9HPKdbV
         sc1PVtm9PKCMu6f3mKUHPAB2EhuMrU18Vm2s4q47KvyL0IXL+ZkIth/BBaSYQrhw2KJ+
         WZLV99ZZhgq1Jen2jAzu2Ya2c3f7fpKKzCm5znytc3jMxlSYhrChPHcUcrUd5ulAMlfJ
         NjBB7+PyGasKyRR+FE6RjVKYVu8FSABF33ubBRKORWQVJdeCEwsfs74r4R/vtjvStDpz
         YI4jeT5BehX8UceAa7NDt9ew90LkEuDalxNnIl4HSGquegJTkmwWhdp7SDzFhkbkNHE3
         kJiw==
X-Forwarded-Encrypted: i=1; AJvYcCUi/ThTIwLl2poznXKYC3vsZgDXKj90lbju0giTwAUV0fj7AmN0tz6NXRRbdutQa9NBpumGfZhSOjVq3gFT@lists.linux.dev
X-Gm-Message-State: AOJu0YwwoCOfUzSutzV0SPLUw4Rix+cLdUJ4zmUpwY4NthmSYtberMl9
	gs7+5iIYzmUccYPJdXpjm6pqvery9B9LBTDqaMr5XcG5btmbx6NHoGw=
X-Gm-Gg: AZuq6aKUsibM3j8PSlnJSjl9xZIH+axcYg9qOssCdV65jS+qoq6/GkF3hbMrmxk77Sj
	4tnj6hUO0WyrU4/1N8heYw+Qs2j6jXBMaQYLr3c8yfJ6gVWT4JjS1YH3ammdxxqH2yJFCKhdJXT
	NL+qF2IwObS6HJ8eEIDaYtEcq8Sb1cVOQFto/wv5Mjo/k40WB9gk5XyCpSXRP2VtMRh2JgIAHEQ
	hHcLcJWPnIgIENym8x50fKq1vL+vXwm8iH2LTZgVLGQuqptH5U44eRdxrH9Ng4KthtsrzOgXqcr
	vCtkCHlkwN3whZimQDXPGQ+NSxqxj7FiMGaWkBpgyJDMJVsLvVk8yAWKkBgPmISK7uP0tmM/aPg
	s8Qj8MdvIYB9MxUB1OP0Yte25wg3Xk+LSuZLuop51vkJJE0hKum5P5nBunZ+/8WTWiMa/Z5dDsH
	G1Mg==
X-Received: by 2002:a05:6000:220d:b0:435:924e:3d6d with SMTP id ffacd0b85a97d-435ea0e62c9mr211323f8f.26.1769620634857;
        Wed, 28 Jan 2026 09:17:14 -0800 (PST)
Received: from LGPC ([31.223.131.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10f82aesm8758853f8f.19.2026.01.28.09.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 09:17:14 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: rename u1bTmp to val
Date: Wed, 28 Jan 2026 18:16:33 +0100
Message-ID: <20260128171635.39879-1-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove Hungarian notation by renaming u1bTmp to val.
Also fix spacing around operators in the affected lines 
to comply with kernel coding style.

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 24 +++++++-------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 32 +++++++++----------
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 57c83f332e74..a4ebf9182f5b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -17,8 +17,8 @@ static void _FWDownloadEnable(struct adapter *padapter, bool enable)
 
 	if (enable) {
 		/*  8051 enable */
-		tmp = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
-		rtw_write8(padapter, REG_SYS_FUNC_EN+1, tmp|0x04);
+		tmp = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
+		rtw_write8(padapter, REG_SYS_FUNC_EN + 1, tmp | 0x04);
 
 		tmp = rtw_read8(padapter, REG_MCUFWDL);
 		rtw_write8(padapter, REG_MCUFWDL, tmp|0x01);
@@ -162,9 +162,9 @@ void _8051Reset8723(struct adapter *padapter)
 	io_rst &= ~BIT(0);
 	rtw_write8(padapter, REG_RSV_CTRL+1, io_rst);
 
-	cpu_rst = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
+	cpu_rst = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
 	cpu_rst &= ~BIT(2);
-	rtw_write8(padapter, REG_SYS_FUNC_EN+1, cpu_rst);
+	rtw_write8(padapter, REG_SYS_FUNC_EN + 1, cpu_rst);
 
 	/*  Enable 8051 IO wrapper */
 	/*  0x1c[8] = 1 */
@@ -172,9 +172,9 @@ void _8051Reset8723(struct adapter *padapter)
 	io_rst |= BIT(0);
 	rtw_write8(padapter, REG_RSV_CTRL+1, io_rst);
 
-	cpu_rst = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
+	cpu_rst = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
 	cpu_rst |= BIT(2);
-	rtw_write8(padapter, REG_SYS_FUNC_EN+1, cpu_rst);
+	rtw_write8(padapter, REG_SYS_FUNC_EN + 1, cpu_rst);
 }
 
 u8 g_fwdl_chksum_fail;
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
+		val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
+		while (val & BIT2) {
 			Delay--;
 			if (Delay == 0)
 				break;
 			udelay(50);
-			u1bTmp = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
+			val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
 		}
 
 		if (Delay == 0) {
 			/* force firmware reset */
-			u1bTmp = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
-			rtw_write8(padapter, REG_SYS_FUNC_EN+1, u1bTmp&(~BIT2));
+			val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
+			rtw_write8(padapter, REG_SYS_FUNC_EN + 1, val & (~BIT2));
 		}
 	}
 }
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 4e81ef53dc47..668616efa68a 100644
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
+	rtw_write8(padapter, REG_RSV_CTRL + 1, val);
 
 	/* 	==== Reset digital sequence end ====== */
 
-- 
2.52.0

