Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF7243C057
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 16:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702361; cv=none; b=Np9fKlEOFWeNOu/wpFC9RHPeJzrhNbWpKW8O/p7blfF8ApF7if+9PoBfFGQQy/s6zKAEnAPooaISH9uAd7tTid4vMqZxaafxTTIpJCp8WZy3LkoRG1nwy58pa6JQD96lEtPFAb/+Zuis3S0S+Dr8Op/dPTrqmrPNu98YhLA+7fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702361; c=relaxed/simple;
	bh=w7qYgHmBCYnmGAAdlL6ZzIKJht9W/NA3vBD+MSlnzXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SUsBn35hCgk2JlBp0FLlD86ypNQpCYAbfU7WCYMrjC1URCTI70FFOZw6AQ8vn/oYobs4HKY6FgOk9U5lMf6eWd0NulbICGuHcBcmhqCOFpArlEv5orvAPWr/fV+QmXBvQXpnuG1OLl00jeVT1Stlk4KJb4P8Zy9plsAGwb2tyN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwG6bfMc; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwG6bfMc"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69532288224so2109456a12.0
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 09:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783702355; x=1784307155; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VyqgudlK7PtzlY5XfTDbaEXiA2IaHw8yzSZqP6LUQC4=;
        b=lwG6bfMcR7eLcJTXOuiY2h8JyzPpThkZc7+ppSJ1FCx85mU1tD5w3snej/NmAryoDQ
         JwC4zoQUq9paq7xas6HniZwP0Nb/zotxTdgkrqKWK95lsl4Dq2HsKFUNy96NnIO+G4BD
         3/3BXZOZNDitSbLR4/ssEX/gupTN1/kksrEuOqwiCuPyDiG1dueH0KmrgvnTIZFvoRdn
         q4QWYED4Ggp4aaEBH9u1yyhNRIlBqHC6U0lJk//ThWYANhreIRTw+W2CiCEE7W3oe+7Y
         j2/QtbwrCiwxisgk6rgSbi9WBsALaCuN+edlUbs0938Xiy+0aymGM16m2lAtikLi/75M
         latA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783702355; x=1784307155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VyqgudlK7PtzlY5XfTDbaEXiA2IaHw8yzSZqP6LUQC4=;
        b=gjAlM5Jy1H+lBhbI19FM/9m+qek55cZae5zhgyliQSHLlVKSqgJLhy7P8PDFgj1meC
         0l125JBUyT8oL2KKIoLMoALjEuYY78WNiC2etNY1nhFrFHwdq9MYRwEk2FVq3ZwMUZGa
         R9GJEjN4pJh47kLPdr0n8SESq0jtl7WodqZA28glEqfEn95BXF+hKLNKXgo74yV/ADG8
         LhcfDREWcvB4KyQL8firP/ak1Wj2DRQGOGkZ0LFbfu3B+d1WkODtj++1vhpZ2pxi9PAN
         KFfOOcz5QL6wizopHpQicQDLBMFfSnM0rOcHiNE+akHaN2Gojhjo95FZRp8ebWsxFd7Z
         HUCQ==
X-Gm-Message-State: AOJu0YzX/zdlJau9WYQYxjeQMMgOX+OJtLYF1n5NXKpMyJ33jlTw7TPt
	KGIBLu2cfzD1/75T2WpFwbLpNOi/lFtunmT5htYihXMtF3D5hZNh3NTf
X-Gm-Gg: AfdE7cnHNAr4JX6AmNWlfuWtKBuWfeFuo3Z5PaUKL3FDLkA+KbttcK0e4WrkAo7cQjR
	PUZyoJgFe6LwJW02247VQ3bW5iOwz84wNeNJsDvGmOrOgULlX/hYJLju7f+J0RxddRD8MkBHdxK
	U0nOv8CBDC/ymPB0Ns+D4yo4KAHVDRJQ8rFYRI2FtLYmDm+dJtgMCXByUhKBB5oqh0LbFzKuMQg
	GI5z2H5SPWrDqAnhznCAyso/un7z5isAktQ12RYfGR0wGPsKVtHtgwQ82X1pEJkCrXbkv8wM0VZ
	4wLAbyKZGAqRoTQpVsdEYqGWGIlOupF3IdrpVLJx1/QUoyfKdZYQ+t2XTeNXa0hIuphxoFLFfH9
	pJ4Ktm90J2FtTLYAsR8YYRrxmk2B+kblBB+PuVDvcFF+mXUJwy6Zy7nK8sn+UHWmwn/BuUw6JLG
	6WK4jBJtd2eA==
X-Received: by 2002:a05:6938:a08f:20b0:c16:165e:c3ab with SMTP id a640c23a62f3a-c16165ec52bmr20266566b.7.1783702355039;
        Fri, 10 Jul 2026 09:52:35 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad694736sm643050266b.0.2026.07.10.09.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:52:34 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 3/5] staging: rtl8723bs: remove unused EEPROMVersion from struct hal_com_data
Date: Fri, 10 Jul 2026 19:51:10 +0300
Message-ID: <20260710165220.68599-4-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710165220.68599-1-nikolayof23@gmail.com>
References: <20260710165220.68599-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A value is written to this field, but it is never used. Remove it, along
with the associated functions and macros, to simplify the code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 12 ------------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c      |  1 -
 drivers/staging/rtl8723bs/include/hal_data.h      |  1 -
 drivers/staging/rtl8723bs/include/hal_pg.h        |  1 -
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h  |  2 --
 5 files changed, 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 367f3facb255..20ee21c83500 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1389,18 +1389,6 @@ void Hal_EfuseParseBTCoexistInfo_8723B(
 		hal_btcoex_SetSingleAntPath(padapter, pHalData->ant_path);
 }
 
-void Hal_EfuseParseEEPROMVer_8723B(
-	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
-)
-{
-	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
-
-	if (!AutoLoadFail)
-		pHalData->EEPROMVersion = hwinfo[EEPROM_VERSION_8723B];
-	else
-		pHalData->EEPROMVersion = 1;
-}
-
 void Hal_EfuseParsePackageType_8723B(
 	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
 )
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 80119559664f..a08f7c78a921 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1031,7 +1031,6 @@ static void _ReadEfuseInfo8723BS(struct adapter *padapter)
 	Hal_InitPGData(padapter, hwinfo);
 
 	Hal_EfuseParseIDCode(padapter, hwinfo);
-	Hal_EfuseParseEEPROMVer_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 
 	Hal_EfuseParseMACAddr_8723BS(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 578cff14adc5..0a25688de041 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -161,7 +161,6 @@ struct hal_com_data {
 	u8 PackageType;
 
 	/*  EEPROM setting. */
-	u8 EEPROMVersion;
 	u8 EEPROMRegulatory;
 	u8 EEPROMThermalMeter;
 	u8 EEPROMBluetoothCoexist;
diff --git a/drivers/staging/rtl8723bs/include/hal_pg.h b/drivers/staging/rtl8723bs/include/hal_pg.h
index c0fca8fc7270..3362b349904d 100644
--- a/drivers/staging/rtl8723bs/include/hal_pg.h
+++ b/drivers/staging/rtl8723bs/include/hal_pg.h
@@ -38,7 +38,6 @@
 
 #define	EEPROM_RF_BOARD_OPTION_8723B		0xC1
 #define	EEPROM_RF_BT_SETTING_8723B		0xC3
-#define	EEPROM_VERSION_8723B			0xC4
 #define EEPROM_DEFAULT_DIFF			0XFE
 
 /* RTL8723BS */
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index f2979cde78e5..c442f01aa585 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -211,8 +211,6 @@ void Hal_EfuseParseTxPowerInfo_8723B(struct adapter *padapter, u8 *PROMContent,
 				     bool AutoLoadFail);
 void Hal_EfuseParseBTCoexistInfo_8723B(struct adapter *padapter, u8 *hwinfo,
 				       bool AutoLoadFail);
-void Hal_EfuseParseEEPROMVer_8723B(struct adapter *padapter, u8 *hwinfo,
-				   bool AutoLoadFail);
 void Hal_EfuseParseChnlPlan_8723B(struct adapter *padapter, u8 *hwinfo,
 				  bool AutoLoadFail);
 void Hal_EfuseParseXtal_8723B(struct adapter *padapter, u8 *hwinfo,
-- 
2.54.0

