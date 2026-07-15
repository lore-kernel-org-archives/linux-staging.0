Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1D147D93E
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119863; cv=none; b=DtvfhI0wbXF1dUSTU/YcoCChumwR/Bs9vAEkHxdyZiCFK/nN388ZgcW+6KxOVVhB6KCcXcdUlZWbnyGOG8C4s5mIZbKYJ/ST5WqzKzHm3xQK5opilKGRy8J7e5TxQd/SQLLR8fI9t/nKNU5STH5v5sMNi4if8AQXYUL6a5uvUqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119863; c=relaxed/simple;
	bh=4DrCfHnIpAyGRaLpeOr3u+19Ov3yL4KLG8DwfvSN2VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tyWjM6mqzUNFIRwJJ+FqbliEj8p5hZbcwWb61gKyWuRYhhpQvwpzpD7JlgBaLeLsHKOHuSSQ/PfAs7Kkj1N7zl1ciZiwB9MRyaUIjP9XU0MZcw/9uZTA/QL8S9gb2Kh0wYgEnyPCcY/70II656IVWD2QqHF/3k1iG9bXASNW71I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2V9DECn; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2V9DECn"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aec6360133so4139878e87.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119847; x=1784724647; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/w2vN7/LdKDkjSqI+o8a+JfZVKzIaUaCo4avd9EKLI=;
        b=Z2V9DECnoQko/F5R9mpRc0eJULz4ogvWBuT8L2hMWJPg/ByxBTL25nUinfQV6HhGac
         khDv069J8pjyWTFMeL9QF9M5k2XIn/3nmDRBGhx2+B9mlm0FpYverA/LP02tXoEke7ai
         MFyaCCxmCSu0JtuXivyzlKkcfZ7M/GQH2/QZIynizBGCsvIjB4c0bhWHtqBCRMTBZktu
         2GZk8+UUH1ar7fz4fcwbJehaPSe2doEACstA+80VKf11MF5j8dCI7kACYtmqXnr/NRTj
         FSK9N9I6gEuO0fGqBSt1god7WsZCzmvozjzEZ8gB3qug2dIFy4bRTjpb4YYGtkm+haHF
         47UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119847; x=1784724647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m/w2vN7/LdKDkjSqI+o8a+JfZVKzIaUaCo4avd9EKLI=;
        b=W1GoT+W3ozGzFhKMZvTDgJY/5bgxM3o/DHWLtRcKPo5WtuFGTKUadpzDsMOvFpTFX7
         xOmbTkJ+1b5MFhej/H6z8bl8qbPW+WhVn+cBfLRjzI7BtKJ/17foxbQGoyJM3TCFxb+E
         aAmiz0EE1LXqlgj4lzFvYEgVN8yeEqAp2cjYVPqwGu0DDk15LLjlJLBLtBFjDptmrgJ6
         w1Iszw5GCYHmcXaub8kKL3rDSGZEXi8+T2sK6XNcYObiOGsUsL5sxff6bIgE+AegWQHk
         vXU1O1Ijj59HW0XcWPixWCF/R/nIrReKxZx1l9QtLe4JwxGkVAHtKUMfqeHE1sO9nKZR
         yHDQ==
X-Gm-Message-State: AOJu0YyDX2wsPoceagObbCHLMw1peP0pHbS0oKMr5RM5FvRODopIjunw
	DDCgpcmvasYxfYDIqHBZ0w/hpwRvmn4qBp+V2/i+aaqFOfq0RYzLRD5F
X-Gm-Gg: AfdE7cmcrBmUsIGVll+iBdCV2XjjtuF4Hk19exjfzMeHMIwMIA1Sq8sXNPVsr1Ty/3M
	SQKnV9UqQ4Xzq+IkPNBapV1AixVNmBBNi8fmrMddauOfE2PVKRFU/r3zEdw4c9QVQlh9uTHjLiK
	ZDlg4C5CM1rJ/1kIs0hSspK+WeQ5vveCZeVBaDR0XksGtrB4eDfbBTGQctE8sB2NDavYqlSiLEs
	0uf8oWcxnVQWad9SWFgNMbsTf2Ik06SCmKbIM0dVXODpUacRC/8gboykcNr+1BAIZlMzUu6fiQF
	/tKjoxv/cVD61T+mK5EYozni+0AdxogqzKvH2GZCKhYE6PZSVeFe1v1WPHQH9OqxT+AJAesKMd0
	BR6Gu4LBvBnnmhVt3v4Ih62AJDwXSAbSntOBmn0Y1Ch6Tir+fUjPLE11fhyewRQ6dSsmPELcFUF
	256rX4H1GCYKhqtmY2rBKs+M7yPtfDsz+fdADlKMRg/NLF32oJtQ0EeoDmVoFfV9eoIIwRVpWHC
	J4gZTzmP7hgrw==
X-Received: by 2002:a05:6512:61c2:10b0:5ae:bb19:1864 with SMTP id 2adb3069b0e04-5b15827bc4amr1312427e87.21.1784119847191;
        Wed, 15 Jul 2026 05:50:47 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:46 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 40/61] staging: rtl8723bs: remove EXhalbtc8723b2ant_InitHwConfig
Date: Wed, 15 Jul 2026 19:48:08 +0700
Message-ID: <20260715124829.90290-41-ulijg308@gmail.com>
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

Remove the useless external wrapper function
EXhalbtc8723b2ant_InitHwConfig. Call the internal function
halbtc8723b2ant_InitHwConfig directly with a hardcoded true
argument to match the original behavior and clean up the code.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c | 11 ++++-------
 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h |  3 ++-
 drivers/staging/rtl8723bs/hal/hal_btcoex.c      |  2 +-
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index f1d8e01bb..efb0ffd54 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -2289,7 +2289,7 @@ static void halbtc8723b2ant_WifiOffHwCfg(struct btc_coexist *pBtCoexist)
 		pBtCoexist->fBtcWrite1ByteBitMask(pBtCoexist, 0x67, 0x20, 0x1); /* BT select s0/s1 is controlled by WiFi */
 }
 
-static void halbtc8723b2ant_InitHwConfig(struct btc_coexist *pBtCoexist, bool bBackUp)
+void halbtc8723b2ant_InitHwConfig(struct btc_coexist *pBtCoexist)
 {
 	u8 u1Tmp = 0;
 
@@ -2373,10 +2373,7 @@ void EXhalbtc8723b2ant_PowerOnSetting(struct btc_coexist *pBtCoexist)
 	}
 }
 
-void EXhalbtc8723b2ant_InitHwConfig(struct btc_coexist *pBtCoexist, bool bWifiOnly)
-{
-	halbtc8723b2ant_InitHwConfig(pBtCoexist, true);
-}
+
 
 
 
@@ -2389,7 +2386,7 @@ void EXhalbtc8723b2ant_IpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 		halbtc8723b2ant_CoexAllOff(pBtCoexist);
 	} else if (type == BTC_IPS_LEAVE) {
 		pCoexSta->bUnderIps = false;
-		halbtc8723b2ant_InitHwConfig(pBtCoexist, false);
+		halbtc8723b2ant_InitHwConfig(pBtCoexist);
 		halbtc8723b2ant_InitCoexDm(pBtCoexist);
 		halbtc8723b2ant_QueryBtInfo(pBtCoexist);
 	}
@@ -2596,7 +2593,7 @@ void EXhalbtc8723b2ant_PnpNotify(struct btc_coexist *pBtCoexist, u8 pnpState)
 {
 	if (pnpState == BTC_WIFI_PNP_SLEEP) {
 	} else if (pnpState == BTC_WIFI_PNP_WAKE_UP) {
-		halbtc8723b2ant_InitHwConfig(pBtCoexist, false);
+		halbtc8723b2ant_InitHwConfig(pBtCoexist);
 		halbtc8723b2ant_InitCoexDm(pBtCoexist);
 		halbtc8723b2ant_QueryBtInfo(pBtCoexist);
 	}
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h
index b0e24c69d..4043e4e4d 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h
@@ -130,7 +130,6 @@ struct coex_sta_8723b_2ant {
 /*  The following is interface which will notify coex module. */
 /*  */
 void EXhalbtc8723b2ant_PowerOnSetting(struct btc_coexist *pBtCoexist);
-void EXhalbtc8723b2ant_InitHwConfig(struct btc_coexist *pBtCoexist, bool bWifiOnly);
 void EXhalbtc8723b2ant_IpsNotify(struct btc_coexist *pBtCoexist, u8 type);
 void EXhalbtc8723b2ant_LpsNotify(struct btc_coexist *pBtCoexist, u8 type);
 void EXhalbtc8723b2ant_ScanNotify(struct btc_coexist *pBtCoexist, u8 type);
@@ -143,3 +142,5 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 void EXhalbtc8723b2ant_HaltNotify(struct btc_coexist *pBtCoexist);
 void EXhalbtc8723b2ant_PnpNotify(struct btc_coexist *pBtCoexist, u8 pnpState);
 void EXhalbtc8723b2ant_Periodical(struct btc_coexist *pBtCoexist);
+
+void halbtc8723b2ant_InitHwConfig(struct btc_coexist *pBtCoexist);
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index a975e3393..c2d355ef1 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -833,7 +833,7 @@ void EXhalbtcoutsrc_InitHwConfig(struct btc_coexist *pBtCoexist, u8 bWifiOnly)
 	pBtCoexist->statistics.cntInitHwConfig++;
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
-		EXhalbtc8723b2ant_InitHwConfig(pBtCoexist, bWifiOnly);
+		halbtc8723b2ant_InitHwConfig(pBtCoexist);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_InitHwConfig(pBtCoexist, bWifiOnly);
 }
-- 
2.55.0

