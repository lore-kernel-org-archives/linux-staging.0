Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CEE2E4265
	for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 17:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751304829; cv=none; b=T/tGnllybNlmI7bYn9RPv6wcFq+yYulx5Ucn3bnPe206uq31vOhLxfGgQvJH46stf6zjjwFzcanN8cqzMpJaP+P8vHtZnWBkc3u4vol/7laFG03RVW1GiuF0pU6uVEZ5OffRgn+5aLvQMKPl5DwKiVZjaMpwsb2+uSA0nnrb3Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751304829; c=relaxed/simple;
	bh=WOgChIj8CdYn0jOoVt63RBLkUFDE8p+lFij2opL8/dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qDHRqx1j4mp5kbH6QCLjSUANBdnea5PTg5W6iMm72VxLTz2iedMHnRJ2udHN8s07iaUbS07bQPvytxl7HK2QcJ/5aLilnFcJSB5vuYsuOtZiWd23ek4lMWCykVrCamDZiLJKMtpwh8PYNRJcaciX7Wl/sud7u8cpaQXlhmvTlAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUBBDif0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUBBDif0"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450ce671a08so15834625e9.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 10:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751304826; x=1751909626; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ywKQCs/xgmEMMGX7vzOv8GIY/LFySjzj9TaSkXMmQo=;
        b=GUBBDif0ZGc5sAC9Iw/qJSOAlT1IGC1J7/LAvNHwBJ1/BPyWu+JrTEJkLBLV0BBjHJ
         QjIMq1kFJlWZHZpbyCQrjys/PbuhtQTpPhEhmzLZ1ZiV1g88S90dDZhdRYRIZl9cX0Gr
         +CCOI0eVddSu7Ej8TeC46yeI9swlrvZE2+H3JjAj4C8t7MkTWfY4ZGuoUyR8PLW53ur/
         ARf31gv+Vq21OXMXD2QGEp5ij0uj7XQtCvegZxJIKqfUcb8GIasDYpy/ABVGCBRcJBxo
         mbiSm0dL2afW59U7eJ414kssUqyrCtB5cYDzM2i45Sw2IaTqqqO8uyEbOr/7dE4gh3Vg
         2ZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751304826; x=1751909626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ywKQCs/xgmEMMGX7vzOv8GIY/LFySjzj9TaSkXMmQo=;
        b=PO5jBccPokwWH/7uHCmOM0E+5qclIB45/04wbEpNaNxNRmI8wkudznf5JTY0iUMFey
         CxeDeJEA/gKMLQy6cAU5yUwj8ArWlLEDu5ZCIZUwXwTCenV4DvjujJ5BI/8rI86FucRp
         JOYjzMM69KmiuFa2rTq7L4KtVz7hrCa5iTBSF8riIbFbgPR1laVumEgX9Bxdv7YDnmbe
         XQlIzzZYajcvDGAIPYtbfF+eR9ySdEGVyJtYq7gSJSN5HsaQDWn5A88zAjG1g3cM5qPG
         Iyv34JaDGZiUCLNW/m6PGe8J/sBU/asA5KW66k94a02srHqRwX0yOBpmBG4WVFuF7dSG
         LRaA==
X-Forwarded-Encrypted: i=1; AJvYcCX5p6ZJQl9Yo9RlcQ/fNKRyrShlFX02lohAQFFWO8fHnmxoBtYG+49U5SXBBgUXjF+85Ipit9fOmBOcGm/j@lists.linux.dev
X-Gm-Message-State: AOJu0YyFCcPFGm78yVoyE0HN0JuMX/zYhb/tEILPXICkdK2qqWxQoxZU
	LlSOP1xluvTX58fxhmncwRwBOcHbBRcC3tff5LsLEquGqv7TNvzyFMzj
X-Gm-Gg: ASbGncuRLE+CoIV2e1Rv5eTSjzflwBh6nMr23jw/KsXv9Nx/5XdQO1uDcNmZalxTYqY
	1lNFREtxBllBbjkSfWSHf0uS9PV3ty3dP7YNFN9CTviZQ+W7Y+A8/VCwILsjrexiulStsRFtRE7
	6APc4SIijjyWLI88jj48P3NWzZjvHiMxa8VC0XDvEGmfdomr+QKt0XX+Ywl4hTIQD0NA3U90nJF
	+sPAlwLdIO9eAlP3mWqWT/5yh5rdYt/d29dv30DRai1MjyDAzYpRYvEb7veQZk1hG2bh1La39RA
	BRLYk8/DUpH6qkpGkwUn9tv+Imgn6/AURW6YEtTFn46MxcvmUjTCide2VqaT0VKoKx8Z6EY2zkJ
	wGeQx4w==
X-Google-Smtp-Source: AGHT+IHIh7wbjK1QsmtU3xg5nvAfhJT61IhHRyatqBPKjN7paC+Er9mKD5tayLFBbp8+UXK6aQyJ3A==
X-Received: by 2002:a05:600c:1907:b0:440:61eb:2ce5 with SMTP id 5b1f17b1804b1-4538ee61fddmr160509985e9.17.1751304825838;
        Mon, 30 Jun 2025 10:33:45 -0700 (PDT)
Received: from cachyos.customer.ask4.lan ([89.26.177.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c1easm170493485e9.3.2025.06.30.10.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 10:33:45 -0700 (PDT)
From: Marcos Garcia <magazo2005@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	dan.carpenter@linaro.org,
	karanja99erick@gmail.com,
	rodrigo.gobbi.7@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Garcia <magazo2005@gmail.com>
Subject: [PATCH staging] staging: rtl8723bs: replace magic numbers in beacon init
Date: Mon, 30 Jun 2025 19:33:39 +0200
Message-ID: <20250630173339.3828756-1-magazo2005@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hardcoded register values in rtl8723b_InitBeaconParameters()
with properly named defines documenting their purpose:
- TBTT_PROHIBIT_DEFAULT_MS (0x6404) for 100ms interval + 4ms margin
- BCNTCFG_AIFS_LARGEST (0x660F) for maximum AIFS value

This improves maintainability while preserving the original behavior.

Signed-off-by: Marcos Garcia <magazo2005@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 27 +++++++++----------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 893cab0532ed..cc7886d75a0b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1183,31 +1183,28 @@ void rtl8723b_read_chip_version(struct adapter *padapter)
 	ReadChipVersion8723B(padapter);
 }
 
+/* Beacon Configuration */
+#define TBTT_PROHIBIT_DEFAULT_MS	0x6404  /* 100ms interval + 4ms margin */
+#define BCNTCFG_AIFS_LARGEST		0x660F  /* Max AIFS for beacon priority */
+
 void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	u16 val16;
 	u8 val8 = DIS_TSF_UDT;
 
-
-	val16 = val8 | (val8 << 8); /*  port0 and port1 */
-
-	/*  Enable prot0 beacon function for PSTDMA */
-	val16 |= EN_BCN_FUNCTION;
-
+	val16 = val8 | (val8 << 8); /* port0 and port1 */
+	val16 |= EN_BCN_FUNCTION;   /* Enable prot0 beacon function */
 	rtw_write16(padapter, REG_BCN_CTRL, val16);
 
-	/*  TODO: Remove these magic number */
-	rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x6404);/*  ms */
-	/*  Firmware will control REG_DRVERLYINT when power saving is enable, */
-	/*  so don't set this register on STA mode. */
+	/* Fixed: Replaced magic numbers with defines */
+	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_DEFAULT_MS);
+
 	if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE) == false)
-		rtw_write8(padapter, REG_DRVERLYINT, DRIVER_EARLY_INT_TIME_8723B); /*  5ms */
-	rtw_write8(padapter, REG_BCNDMATIM, BCN_DMA_ATIME_INT_TIME_8723B); /*  2ms */
+		rtw_write8(padapter, REG_DRVERLYINT, DRIVER_EARLY_INT_TIME_8723B);
 
-	/*  Suggested by designer timchen. Change beacon AIFS to the largest number */
-	/*  because test chip does not contension before sending beacon. by tynli. 2009.11.03 */
-	rtw_write16(padapter, REG_BCNTCFG, 0x660F);
+	rtw_write8(padapter, REG_BCNDMATIM, BCN_DMA_ATIME_INT_TIME_8723B);
+	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_AIFS_LARGEST);
 
 	pHalData->RegBcnCtrlVal = rtw_read8(padapter, REG_BCN_CTRL);
 	pHalData->RegTxPause = rtw_read8(padapter, REG_TXPAUSE);
-- 
2.50.0

