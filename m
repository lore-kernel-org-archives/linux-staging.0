Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511B53128B0
	for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 14:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776953543; cv=none; b=E5Eu7ya5WtKGCMNY6+POJTNA4jlXGjakawm8cF08BX75z2yNGg+xNtoz9GHlFbgw0zJ0OEG1u2cuvJLQy6G181po6mN2AU4YofJBHfUFXL32A7C/d5VvAwBXLOQ0wK7RBV31DLSJI16KQ2D3pKLTMT704g2BXkEuFOAM5s/Pwlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776953543; c=relaxed/simple;
	bh=iVrkHiNJtk11/d6znu434sP8113VKra75dP0FGhd3Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OS1GviTZ1Wx/M5FRiC+VM9kUlDshqllul1drNP7NE/2+KMgb+9V07GJEjbXfahS2G8tqhm4ME3JEfmWaX+YxJKhAXA+yeyItIoHzknMyEfrwMkPbOgFyM/tU6PRTqg6JMdpDNVsybqHghlZtvmGLlebn9aU7NQgTTSaFqCUMEtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so48119805e9.3
        for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 07:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776953539; x=1777558339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkYiVKOb59tbNbvDJQOayIgdouD2dKpDo5ApOq9VXn8=;
        b=rDJHq2Tp5KGvLjCgkBpuaNVNU6tBzAbxBynEY/8tpAfC3RwaBrsHrPx3Zh/pU7FkQE
         buZgqfw1t7P+mJef3cdKNfMGV9lr5qro2DhIrHpRHJ5F6dUkrY1mhgaPGssT80M7Wxt5
         pWb13Yd7pqE5J1jYKHJ1lz3hAeMAZBhfguG9Ii67jAGtTLytm1o6KbrQlGCh8lDkCWsV
         hY/EBzq1QP8UKnb4dT3q5ASA8wXbO4WpNAv4b1DeSM9HRwH5OL/hkwk2a+kP7wS+LNMX
         tnwFWZNiehK/OZKF8JvTXEX8cCdnbWK0Roxcp0nP43kvTQUNqGSiezc9VmP548wdSvsN
         kHWg==
X-Gm-Message-State: AOJu0Yy31NLAn8yxZFkfdAJgYmxWsZOMAdY1Vk9XyQaUSZ5IZJXdJC8J
	piWxGB9LoheOJtlkeZPhw0mFMFG+OxuC5LOina3Fp5XP979Nke185540
X-Gm-Gg: AeBDiev3f5zGkv1l7iO5v5WjdlcQTr6N24Uiksj5s/KsnNGGRRwLC++BzLivOvV1YQK
	meE+kDwTPu+hgbzmWsrp+AEVD78DrGBW+GVo0G1VRHH/LP5fXagbTMxX1G9l8QIJ4hX8kPFeGYP
	OBCDoNsj6QRktDH5l9ZLAZyXbzNEHtgg3vl1gLnGJEAUghV2P689otroQ6+TlRCgrWcPJ+uXqsT
	NxZF4TF+Lh2771oKp21Xex7ATdGsii5ICmfJzp4RwMIn0OJtZj3Ff3K2ad8ucXPtk7qoUd2CKFt
	EbyDCTYyAu8v8vTRvF1xtqUsyshlDe4d9/avJuMVkv9i0TtqGgKoH5Ce+L4I4EDjIdz7cMWLW7Q
	gQHcr6qTfQKmxsxR43J07OCJ9YeRvZIn+m3gZhcfMF7OpAInPkCO20jemllAclT96LIFP8VKUj+
	GTl5er0jfVVLLFMooK/T9qKIUeDBlScjZI0pLlcfV2/d6Yj0FTVSJSCdRVU8xpSyjdebOeHfC5c
	aNy2YMsCDOhThyM8gtrUIO1YQuhnD1GS8OYg0s+6Y2W
X-Received: by 2002:a05:600c:8b84:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-488fb76e4aamr426214135e9.17.1776953538310;
        Thu, 23 Apr 2026 07:12:18 -0700 (PDT)
Received: from localhost.localdomain ([151.41.34.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a55dc9f58sm452394575e9.6.2026.04.23.07.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:12:17 -0700 (PDT)
From: deep@crimson.net.eu.org
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kenet Jovan Sokoli <deep@crimson.net.eu.org>
Subject: [PATCH] staging: rtl8723bs: replace TBTT magic numbers with macros
Date: Thu, 23 Apr 2026 16:12:13 +0200
Message-ID: <20260423141213.720643-1-deep@crimson.net.eu.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kenet Jovan Sokoli <deep@crimson.net.eu.org>

Replace magic numbers related to the TBTT prohibit settings
with descriptive macros in the header file

Signed-off-by: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 7 +++----
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h  | 6 ++++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e794fe3caf9d..1461166c5231 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -878,8 +878,7 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 
 	rtw_write16(padapter, REG_BCN_CTRL, val16);
 
-	/*  TODO: Remove these magic number */
-	rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x6404);/*  ms */
+	rtw_write16(padapter, REG_TBTT_PROHIBIT, BCN_TBTT_PROHIBIT_VAL_8723B);/*  ms */
 	/*  Firmware will control REG_DRVERLYINT when power saving is enable, */
 	/*  so don't set this register on STA mode. */
 	if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE) == false)
@@ -928,7 +927,7 @@ static void ResumeTxBeacon(struct adapter *padapter)
 
 	pHalData->RegFwHwTxQCtrl |= BIT(6);
 	rtw_write8(padapter, REG_FWHW_TXQ_CTRL+2, pHalData->RegFwHwTxQCtrl);
-	rtw_write8(padapter, REG_TBTT_PROHIBIT+1, 0xff);
+	rtw_write8(padapter, REG_TBTT_PROHIBIT+1, BCN_TBTT_PROHIBIT_RESUME_8723B);
 	pHalData->RegReg542 |= BIT(0);
 	rtw_write8(padapter, REG_TBTT_PROHIBIT+2, pHalData->RegReg542);
 }
@@ -939,7 +938,7 @@ static void StopTxBeacon(struct adapter *padapter)
 
 	pHalData->RegFwHwTxQCtrl &= ~BIT(6);
 	rtw_write8(padapter, REG_FWHW_TXQ_CTRL+2, pHalData->RegFwHwTxQCtrl);
-	rtw_write8(padapter, REG_TBTT_PROHIBIT+1, 0x64);
+	rtw_write8(padapter, REG_TBTT_PROHIBIT+1, BCN_TBTT_PROHIBIT_INTVL_8723B);
 	pHalData->RegReg542 &= ~BIT(0);
 	rtw_write8(padapter, REG_TBTT_PROHIBIT+2, pHalData->RegReg542);
 }
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index ffd03927841c..13f77c2bf442 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -72,6 +72,12 @@ struct rt_firmware_hdr {
 #define DRIVER_EARLY_INT_TIME_8723B  0x05
 #define BCN_DMA_ATIME_INT_TIME_8723B 0x02
 
+#define BCN_TBTT_PROHIBIT_INTVL_8723B   0x64
+#define BCN_TBTT_PROHIBIT_OFFSET_8723B  0x04
+#define BCN_TBTT_PROHIBIT_RESUME_8723B  0xff
+#define BCN_TBTT_PROHIBIT_VAL_8723B \
+	((BCN_TBTT_PROHIBIT_INTVL_8723B << 8) | BCN_TBTT_PROHIBIT_OFFSET_8723B)
+
 /* for 8723B */
 /* TX 32K, RX 16K, Page size 128B for TX, 8B for RX */
 #define PAGE_SIZE_TX_8723B 128
-- 
2.43.0

