Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F0A13DDAE
	for <linux-staging@lists.linux.dev>; Thu,  9 Jul 2026 18:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621659; cv=none; b=i+weIC/HzFdQkQeonPjkNI+W++5UkxJUU99Psg6oeeQQ4GXt8IZ04kJMgsygWRCzd+h16PT6zgVv9pBvF+Zj7An/HsBW0T3U6EEZrLaLyH2BqmoLNP1FjKaiLIq29ThOnRTmlOZkpL6HPrMifMtTl2xwFrJpIRpMPmfHcj11+uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621659; c=relaxed/simple;
	bh=1wiq2bsfdJR77WGtF+Mqy35UlyF/pRJNwRZTgT4kOG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VTKcyGBYjWF5eTeqRN5hRiyf+dnVoPSf1vapkHyI0euLcQ8wjCUb3kSpnN6/YTBI4ceEH8ASgYKxgfl6Aoyv3exzWPL0mfB0okiLe5l9BP5JfD4KNaNUjnsNoRPrUWh19we0VvsxlLyiRwR2QSa8ppRbU5yxPcWDjvs6GtUypwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPwf92tu; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPwf92tu"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso199947a12.2
        for <linux-staging@lists.linux.dev>; Thu, 09 Jul 2026 11:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783621657; x=1784226457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7SbBD+yWNI0Jlnnqcb7Lu1Uu+bgvBnUrlWOoGv+TTTs=;
        b=hPwf92tuYvQ8gDosR9pMIxxyLQlteMVz5LXdDAPdqHi+o1FPRkUDj2SpZHSCQHg+nI
         ZzIzkQhanVtX4Xu8kF+j8+DqtMvBVB3sax8FppqN2I3LmNPhe2yeAl7oe74AQ/xoFWen
         /gTqmOvLNJykNKOxFP01Yabg38VwTTnLqe4tieE2nUpJX9zjtkFPSUIBKwNQ5o2hsOVY
         yqilMeol/ZoB069CfW3piYQjk9UD3SyB3rZhyq6nOdUh8oSGHsJQRnKs2STyZiBGgf/G
         aSN3jtBExdFHr+9h9EQrR6gmyJC0onxU8THG7wAn+drMyXsrcO3IDivRMVvs+vwDGA37
         xZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783621657; x=1784226457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7SbBD+yWNI0Jlnnqcb7Lu1Uu+bgvBnUrlWOoGv+TTTs=;
        b=WPRSLMZnMZP+as2UGkhO7TZZSu0QZVOIFQg6k3q79iIcNmtOmURb8SfUwcHOnMWq9i
         jyeFY2G36CIQWZ5K4y2VOHNIwm+mMJMAIcAVI9yrWGPxMT7Rq9PoSTTdi7XA+1H4MhjD
         t1NfYFFfoWaRIzzunHJkIpOqQRXeb/nlFcyXWVwMgQqo9vhHcW7ZimArUEuOokWbkW4S
         KKOds9i3XUGWuzj4a6Gybjx7OEgL9pOScBb8/VOgBXPZrxEt1R8iX3Fte7a3OTy+pT8p
         WP62NisLxTaDg9jwZqF93Der+VeMe27/EsyPX0E0GkFd+d+IEqaD+cnRclWzO0bQopQv
         7l7A==
X-Gm-Message-State: AOJu0Yx14QizgyHQRIUod/Ywp49+8f6pCXOMUjS4LX5qoDCk/Yf0wA4p
	TCtJ6I+R7fSpeD1nDBd9baNz3JCr69pVaU3+MrG7TJYTqsD7usf2OrRO
X-Gm-Gg: AfdE7cns8qmxyqT6txibbKnEwb+JIZ9RL12ILMr0uhTG5Td/MHizMlNkcpTJ+mxFfdK
	KI7H2klPza+/lMLlfaVD9EjnLYybu0NDvjdR+r/eORVWbGBjV3Dtd7p7xCWoLwuyGroDUdczmgY
	iqo4RzYtDmiQRpPzzNSCIazPDoCSIYHP5wRVltIAMdvIak3lBAMa9YWG0yDML5UOI/m39I2YvDg
	wBCRtfOA763T1p2IYJqYEjBmYenQpfHr3FrMGZ5B/pZFpcf4EDtvg/nVn2QNu3DAQjh1t72xADc
	bW8VZG11wI/+HxN6TdpCFh6YNo4oNte2S5rRPyknTXjHfDrc2dQR1EdLaTHP+aiUZVxtk86IPwa
	SLV8Ij4kl7xHBY94aEvWaNzoyLuheUpFOH/AfXGaph56VTgDGvKRjTlj4kUvTiQT61DIcFcWPyN
	xqNH38gjPn3w==
X-Received: by 2002:a17:907:d23:b0:c15:f4e0:72a7 with SMTP id a640c23a62f3a-c15f4e074c3mr71221166b.39.1783621656718;
        Thu, 09 Jul 2026 11:27:36 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15f272141dsm91168066b.59.2026.07.09.11.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:27:36 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 8/9] staging: rtl8723bs: remove unused EEPROMBluetoothType from hal_com_data
Date: Thu,  9 Jul 2026 21:15:15 +0300
Message-ID: <20260709182627.16327-9-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709182627.16327-1-nikolayof23@gmail.com>
References: <20260709182627.16327-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The value 'BT_RTL8723B' is written to this field, but it is not used in
any other way, so remove it.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 3 ---
 drivers/staging/rtl8723bs/include/hal_data.h      | 1 -
 drivers/staging/rtl8723bs/include/hal_pg.h        | 4 ----
 3 files changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 6b495e24e259..2ab456a806b8 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1346,8 +1346,6 @@ void Hal_EfuseParseBTCoexistInfo_8723B(
 		else
 			pHalData->EEPROMBluetoothCoexist = false;
 
-		pHalData->EEPROMBluetoothType = BT_RTL8723B;
-
 		tempval = hwinfo[EEPROM_RF_BT_SETTING_8723B];
 		if (tempval != 0xFF) {
 			pHalData->EEPROMBluetoothAntNum = tempval & BIT(0);
@@ -1366,7 +1364,6 @@ void Hal_EfuseParseBTCoexistInfo_8723B(
 		}
 	} else {
 		pHalData->EEPROMBluetoothCoexist = false;
-		pHalData->EEPROMBluetoothType = BT_RTL8723B;
 		pHalData->EEPROMBluetoothAntNum = Ant_x1;
 		pHalData->ant_path = RF_PATH_A;
 	}
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 0a25688de041..f4d4127ed5a1 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -164,7 +164,6 @@ struct hal_com_data {
 	u8 EEPROMRegulatory;
 	u8 EEPROMThermalMeter;
 	u8 EEPROMBluetoothCoexist;
-	u8 EEPROMBluetoothType;
 	u8 EEPROMBluetoothAntNum;
 	u8 bTXPowerDataReadFromEEPORM;
 	u8 bDisableSWChannelPlan; /*  flag of disable software change channel plan */
diff --git a/drivers/staging/rtl8723bs/include/hal_pg.h b/drivers/staging/rtl8723bs/include/hal_pg.h
index 3362b349904d..32e66fe451b0 100644
--- a/drivers/staging/rtl8723bs/include/hal_pg.h
+++ b/drivers/staging/rtl8723bs/include/hal_pg.h
@@ -60,8 +60,4 @@ enum {
 	Ant_x1	= 1
 };
 
-enum {
-	BT_RTL8723B = 8,
-};
-
 #endif
-- 
2.54.0

