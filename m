Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311B627816C
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 13:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769693060; cv=none; b=F9ZfrNzhdT4eVZlO489INe2Orz+t0jozavhxZxkyRwW2SvRGWSx8t9FJ6NdEUSsnRbnhzOEcsKfjI96KMahZPIxLMJLTe5wuytfiib+rde1ujC6myCo8fVWWzrUXk3oGae/Hf5G2XlCxtCDmsNAUjfuRLnnNxArp7M1rxcU0LBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769693060; c=relaxed/simple;
	bh=gtRfArYMpYtR3Wwdb2Q6o7l+m0XA7ZJ5Jw1ZMR1mG3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMkFGDZNMmZ5nmlIsDgxl9+9fxmATJ/+oAtvOgIAIYq7nKKTYswFwgFcDM1Chzrf6qQQhDf8yfIK+oY3S07PvMnjlWQm2y93770l+WYFJcAVBnwsmdIcNF9wmfh3oJSwfmAC+sYYGFZ/CdI6/LtF7YozPNJfHvkoLcC3hoR4n/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPDkTdh8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPDkTdh8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4801bc32725so7369935e9.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 05:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769693057; x=1770297857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsaA9RaWnt72GW7j0IMh4QTElhYpzUgcR96rkJIP9qQ=;
        b=VPDkTdh8VlCKkG63sxRyzzRijTAqcVNZq2plSn5Tp7NKDRTvg3qXxonbqW76rbv2RE
         nx52F/NuhRYP8XHPtkqkWsu01hzh+J48DB9Z1ECkljKQTKOswPMV0N8/4mamNJIF7n5M
         cBdK9jwvFA9xYGxTWS3h6sD4R75/BV107PfulXtNu7DeGWwyxMTd+KZ4tLlfb3L+SNKd
         aT5ejAntOeAnkmO30iLFZnQcnBVKhr7A68JQR3mR4nMLTxQdfXS9gRJ9aXf8BK7TRACF
         JLiwx5J4gPkPkKrOtijoJow8ja4aPcealhuhwS/kX4I/X41fof+ZU64/2TAaA00zx2G7
         4Erg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769693057; x=1770297857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SsaA9RaWnt72GW7j0IMh4QTElhYpzUgcR96rkJIP9qQ=;
        b=JAGgVL05TVRZV2RnRStVUGD4efb2dWyFYRCSq0j7H1i6Avn2meqtxgfyyhVqn48gBG
         1axJ4T192r0lv0ea45BLcd/JItqr/1Y9P+/LMXncnCn1/WIjAgrXd2mjieHhCkMoag4S
         Sc0+MBRHNlF0zD8Vn8Mah/tXcTXVmdtndMzffsknvPz3za5wi+l2hLJbk3JT3Gzi7B8O
         +ZPbqtpVcaGtke1hljyi6h5/7iQXib8CfyUlK2tq+W5A+TibRDxU/YbXGUgRbiKLx2X+
         oBpkWTq4mWZNrLUREF6vQgc5dSuknXbQr4RF1666JVdZc5i7kKxezCA7Y7mfFP62v1Lr
         Xo4A==
X-Forwarded-Encrypted: i=1; AJvYcCXezbmYDS7u5KrzOg57WI3vQMeDn052vNYNhDxlg/dSVzJ42w1zQCDyrAGW6/90mFEesjLb2h0K1koxRJML@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/rPLYC5EF64BlhIr5FBdhQ5yNKQm76aJAKmITBKzw9bNumDNv
	2tgKGkegXwiJiklK916AOxLrFWlbmj3sHBHsVeIocaa/SYnL2EAGsOw=
X-Gm-Gg: AZuq6aJ/+0fDfVZc1S7BVn8CJZTzDowQWExZmS5QJPAu7YdtJk77KXjl1DvgRJNcMqV
	Qzm79yhLcquWbMOGdhoiIfDc1nmtSD2QpF+j+Tf3bRVFga+et0uFMmtu8QGE3XoEvsA8QZuPCJC
	3dpDkDDKLTzNrmR1QfxpuZQ/0qSxJYEFQumC17AHA3elPlJyX041k0ptkzlAFM2Ypl5s0sCPLWP
	fNeKcQCoKfaIIR5a0abKPYPQbRkTYofGKI6bsf1WAAdgw2AANNbNj3PU+zuU1yKx6Ir8QDZy3nt
	35gSWuxHNjDgrVAs2w8IK0T7M7fyQBcKG1l/SRAs7IAuy41EYbXCaBxQ7sJk8cZVoeJmH3wQRax
	jZRBRIY9B2ePv9/dBh3yglRCOHUC++VmpRrlWRXjuWkStrnkHgJ2AVeJ2IUv7Qs6wsZ42rjwtvS
	xP
X-Received: by 2002:a05:600c:1d16:b0:47a:8088:439c with SMTP id 5b1f17b1804b1-48069c9ec08mr127130445e9.35.1769693057452;
        Thu, 29 Jan 2026 05:24:17 -0800 (PST)
Received: from LGPC ([31.223.131.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be7404sm217492315e9.1.2026.01.29.05.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 05:24:16 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v2 1/5] staging: rtl8723bs: rename u1bTmp to val
Date: Thu, 29 Jan 2026 14:23:48 +0100
Message-ID: <20260129132352.14615-2-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129132352.14615-1-lukagejak5@gmail.com>
References: <20260129132352.14615-1-lukagejak5@gmail.com>
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

