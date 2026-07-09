Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98AD13DDAE
	for <linux-staging@lists.linux.dev>; Thu,  9 Jul 2026 18:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621657; cv=none; b=VG77fiC0P0sXo4NX8TC8MOQasukRnobWWIvD754eWFP47fBCd9dQr6ona6XEX3VIoCCFgDwWrvdHurSIvc/pNXaEhw2EyZ2MZ+N+vAz/+WnOrnVUnTdM4Kk+G1R+rsm/b7c4dxfMPvrOyNXYyfSIOK6a9V2yKiCOYctakz8fVlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621657; c=relaxed/simple;
	bh=uVJ0QdB8lwnDmDnmv2AF+BF1j4ERxKdpr71UdD7HlAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cj4MzaezkkaSSvT+LPnDM1CGnmJRfFMI4G65VYFvAwr/GVM4znY6EVOUUKDQgI7xCPoyxmRzauIlBJq0uP7P2hW7u1K+PQYSff5kB67NJfifpRK5RRROmO8oLQn1Kjk+PNkbmfhgLEemuGZw4mkMHwl8djVtJVexr3C/pqk0EUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4xP4+4Q; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4xP4+4Q"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c125c082ee2so22822666b.0
        for <linux-staging@lists.linux.dev>; Thu, 09 Jul 2026 11:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783621654; x=1784226454; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lEUlCgrjX6a9PppmjNq5rF+BJRfmUvLdrD/MA8NpMOg=;
        b=J4xP4+4QQ2OO7AM7r0XSLxpZk+V0GexKwkKKkkx0SQ/ySMuCui2Jypy6xJf599vu30
         f1Rb89yEkAWv7ME6j8szyhQ9eOCt01Rpa3scO/oioulXgbgpAGSHuiV4d1v5v0G60py4
         Sk4JJzoPKrvvRlHt7bxXwffWCZskpebIcGXn0KI9No3D+0DOnid/Z8ZQLwUjOKfLOo/A
         s/6EK1/hF2QNn8nLtu2PYlcPK1sL9Ln1FgiC8dL/YgEFjwoCPFFGh3aKfkyyDTAxPNYK
         ZbjIHSMBIypNvdJNg3uuXA7kov5CGP78pH2zrlEpSKzsDzwf5yXjxrtT068JIKuMaH+1
         cjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783621654; x=1784226454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lEUlCgrjX6a9PppmjNq5rF+BJRfmUvLdrD/MA8NpMOg=;
        b=rKFu48hyXIc1ojndGWCpK3ULoUwVWazkrHkqAmA02iIHq4BmsmGJ8WwRD2EdjPhG/u
         ebYMV/M6gQNpYJChLzVQee6AlC9Xmgjkg2o6WAS1Ywd2NN/hkBxGVo46vsc5kOq2eW8+
         dZ0hnEQ6DS+bqaJmBaGYyZ9m14WHgdQeruC/XIMxYWruV1XpLGplIfn+uDROoYJ5h2KE
         +GvP+P8H/gfv9Pfbr78bCaZ5WvUjs8G1QpZ/5k0dA0vDCW2uVslXkRqsVXHES/NxO0a0
         Po8lLsnhJ3yR69B+todFJOAlkuZ3ZlH2exMFwGCLczZsU8iZevlKWh/qT5ttczxXvzvH
         q/Kg==
X-Gm-Message-State: AOJu0YxPLtV/PBuryPcpi4gSpG7fnpK4PmwNH71DLCcDXuIRgW8KgCvK
	5hVBSVlEPodaUeuUGpkbsxpJ/AAHY+SeU9IbodZJXk+rkt8lo47/0m1Z
X-Gm-Gg: AfdE7ckFAwf1kK+Z/WY3GZI9uci9hhBf4a3do+ZROMkJ/RaWu8rVM+68Isy1r543Amy
	+s7mw23sZgD8G8/YsRYTofICZwvCQ8nmTZKzYMKtcwMpP06gfnAxy4wRzq8mkB5lnO8EXVR0UYR
	GMATGuFUcTiVcsKDW6L983oXQhkuASqaKiJzL9UGjbeZQeHHXo1WGGVqOtS5ax/YzuM6pE3fwzB
	s3hAJSC3vAWM5M5meuJO3jmDjUKL0hR6nVV7dA7vHqrS0vfAeKiy5DXWTRda35I8BX6+t4cIHAf
	dz61WKRGG7UyKgbKjpl79mDStKIEtoeRLSvVuFORRLnMRyzqq26lW3E7KurCmcuSSaTy1Y8NyFu
	xmRxy8AUK/WKZ2o0eSqXpQQjlbA9oFkYb+HPxHQunI2yUk7I7uoIgqaOD9cmsZf2Urrpb+P7YiF
	t4tDBsKk2Txk8ur+6gfqf6
X-Received: by 2002:a17:907:a286:b0:c12:6f98:d6a1 with SMTP id a640c23a62f3a-c15ce133324mr403269366b.62.1783621654031;
        Thu, 09 Jul 2026 11:27:34 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15f272141dsm91168066b.59.2026.07.09.11.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:27:33 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 7/9] staging: rtl8723bs: remove unused EEPROMVersion from struct hal_com_data
Date: Thu,  9 Jul 2026 21:15:14 +0300
Message-ID: <20260709182627.16327-8-nikolayof23@gmail.com>
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
index 9c8bab512f2b..6b495e24e259 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1390,18 +1390,6 @@ void Hal_EfuseParseBTCoexistInfo_8723B(
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
index 80cbf619e312..bb98f8a55a0b 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -198,8 +198,6 @@ void Hal_EfuseParseTxPowerInfo_8723B(struct adapter *padapter, u8 *PROMContent,
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

