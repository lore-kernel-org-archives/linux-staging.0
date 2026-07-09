Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0559A13DDAE
	for <linux-staging@lists.linux.dev>; Thu,  9 Jul 2026 18:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621650; cv=none; b=FTM5ooy054OxLFWycxvnE5onn6+YqVnQJY+b3rwyKNayiObyYBi7VRvHDlwmzAp2yPh9Giu7JBSly53CpA5Yple0WBBq0eYvPLyblXhCPpIw/5UIgjBRIGg09m2ip9/KC10m81pg+cBqJPWA/Gu/OXcOQbvyGj2CQhDs7SfLI8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621650; c=relaxed/simple;
	bh=/soZCwi4E6h7Tkyi88WG+EFBbqEJsg//gV8LH9dYsBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LGwi1ZwX0tfNcs26dNXgB0JuSaY12EnkH/cKLmQV+lHU/GOD4RWz8hV2c9sO8Zz/WWFY4uOpCgH2tB+kmz9keC7nJW/ptAHmGoGl396Icy/iOreyEvZm2KJVQkVuNCbVJgVCqb2Yz1KdcBReQOY2hnx3ydvS9+yA7yveH8fGboM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAkgvJFQ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAkgvJFQ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69c20ba892eso368104a12.1
        for <linux-staging@lists.linux.dev>; Thu, 09 Jul 2026 11:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783621647; x=1784226447; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVt11RrP/KJvYGosJeufzJDsDa8L4Xsmog5SjtRxI/k=;
        b=AAkgvJFQ6qsrfvEWfMtvcGDsVuPFwY6cVLaaMR3gvhhSa24hgIegAXvYyKeRj2X+79
         NnGWLtUpF1tpMEmFJ4SY89HRTEzuIL7rJIiZgxN17AfYDKXqGqqHBCmz7tnUxzM8OIiH
         PCedJLmu8s242YCkUYwI9RthrvjveXc1bLTAhVUg1sKu/+ihQz+Q/yVfBjMkgL4mjn5n
         C380wmdheMQqrRRRX+LQ9+C74oJXFn4eEJZ75JadwRhQ+2YqUvC/mUZBkLyrwq9MsBvp
         h6LBmjCOA/FiUtaNhYDvSpYW+jUTxXw9HBb1gsegFbKKrXv6Ez8XfmzJrJ7xs9AyR+yJ
         i3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783621647; x=1784226447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kVt11RrP/KJvYGosJeufzJDsDa8L4Xsmog5SjtRxI/k=;
        b=PoMGshLx3E6aaW97NkU5amiJS7eBvPjIm8jr7eUFKEsz7J2zeAj7E/Milho+votZWm
         waPsoW0Jyv9O/dr6INnkIbGQiIbIyU7Sc0MKdrOXbdV0anyf3zItCYqRZ/7cQUvl2Hfq
         vU6jaW/o18gC5r6TsAbxqSJdfhY9GHyJZOzapuEnT4jIdcyh/9XiQDLtpuDVc6ULvR/Y
         bjGFAmXMhJamBu2Q9MOOsFv0MrHHqfF06IGryP9vSq+5cBGI77Bf+mPX1mxL8CK0xN5F
         +KUionGkuT6beyfXgmsdcGLIztNaZEsDsvSuCfvYYFSa+NuVrFSVhShu3Cv/0vI9G6s3
         8OPg==
X-Gm-Message-State: AOJu0Yydx+SX+EGIMXWtZhKMIfm1OaeJ7QNg+Vzlc+DWiKKcLaL0H2G+
	2S346LFtnIhNqzQ++kW3Cp1Et7f84D9iG7I93Nn+IzA7xvZMzssq52KsmbN3dg==
X-Gm-Gg: AfdE7clzy6sHUth1X+4i9HWCXBOevowECYI8+UOlKCuuAZH4WtnjRLLdULpV+iuc+wm
	ZaJGMqS44KmtC1YY8SvbEd4oIXHlFVHKqmv2ZKSfnm1EMvOw1ZZyef0IYkf4izsZZV/4DG9Y4sz
	6Ig7eYW0THedm+/Om3tGZHJoairWZTQtMukrcQHHpwf+DRgJJ32OJkiaL7UtmNvyNUJ5kM49EpZ
	bJMMXqx1tqT7d0pivELKNVAptuKyHKG4st3TXRjz8z1uebcBma75JCP/XEr2BcqDfYSDu7OcaCZ
	jJ7ERQ/KPyI+oSWuDWwGrTrBlhQ1Di1ItdZMWFkatn9Wv1rUBoxq/JIk4XC4zUBeAc53g8fktVe
	vNF0QtZNXM+k5G7BtQrtzHgAo+0TKBeK232uNHv1gaoby5r/3FxW2aUnF9L6ob3kjKdrVitAI6y
	gur9cPs0rGxRHLTgdFNN46
X-Received: by 2002:a17:907:6ea5:b0:c12:a556:6713 with SMTP id a640c23a62f3a-c15fe836cc0mr19867666b.31.1783621647315;
        Thu, 09 Jul 2026 11:27:27 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15f272141dsm91168066b.59.2026.07.09.11.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:27:26 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 5/9] staging: rtl8723bs: remove unused 'EEPROMCustomerID' from hal_com_data
Date: Thu,  9 Jul 2026 21:15:12 +0300
Message-ID: <20260709182627.16327-6-nikolayof23@gmail.com>
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

This field is set during initialization but never used, so remove it.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 12 ------------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c      |  1 -
 drivers/staging/rtl8723bs/include/hal_data.h      |  1 -
 drivers/staging/rtl8723bs/include/hal_pg.h        |  1 -
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h  |  2 --
 5 files changed, 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index a450ffcb60e7..9c8bab512f2b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1460,18 +1460,6 @@ void Hal_EfuseParseChnlPlan_8723B(
 	Hal_ChannelPlanToRegulation(padapter, padapter->mlmepriv.ChannelPlan);
 }
 
-void Hal_EfuseParseCustomerID_8723B(
-	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
-)
-{
-	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
-
-	if (!AutoLoadFail)
-		pHalData->EEPROMCustomerID = hwinfo[EEPROM_CustomID_8723B];
-	else
-		pHalData->EEPROMCustomerID = 0;
-}
-
 void Hal_EfuseParseXtal_8723B(
 	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
 )
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 6f2aea984b30..80119559664f 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1046,7 +1046,6 @@ static void _ReadEfuseInfo8723BS(struct adapter *padapter)
 	Hal_EfuseParseChnlPlan_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 	Hal_EfuseParseXtal_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 	Hal_EfuseParseThermalMeter_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
-	Hal_EfuseParseCustomerID_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 
 	Hal_EfuseParseVoltage_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index c93b21822ea7..273080ae62d1 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -162,7 +162,6 @@ struct hal_com_data {
 	u8 PackageType;
 
 	/*  EEPROM setting. */
-	u8 EEPROMCustomerID;
 	u8 EEPROMVersion;
 	u8 EEPROMRegulatory;
 	u8 EEPROMThermalMeter;
diff --git a/drivers/staging/rtl8723bs/include/hal_pg.h b/drivers/staging/rtl8723bs/include/hal_pg.h
index 7cb9c441fc01..c0fca8fc7270 100644
--- a/drivers/staging/rtl8723bs/include/hal_pg.h
+++ b/drivers/staging/rtl8723bs/include/hal_pg.h
@@ -39,7 +39,6 @@
 #define	EEPROM_RF_BOARD_OPTION_8723B		0xC1
 #define	EEPROM_RF_BT_SETTING_8723B		0xC3
 #define	EEPROM_VERSION_8723B			0xC4
-#define	EEPROM_CustomID_8723B			0xC5
 #define EEPROM_DEFAULT_DIFF			0XFE
 
 /* RTL8723BS */
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index 5cf455142393..80cbf619e312 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -202,8 +202,6 @@ void Hal_EfuseParseEEPROMVer_8723B(struct adapter *padapter, u8 *hwinfo,
 				   bool AutoLoadFail);
 void Hal_EfuseParseChnlPlan_8723B(struct adapter *padapter, u8 *hwinfo,
 				  bool AutoLoadFail);
-void Hal_EfuseParseCustomerID_8723B(struct adapter *padapter, u8 *hwinfo,
-				    bool AutoLoadFail);
 void Hal_EfuseParseXtal_8723B(struct adapter *padapter, u8 *hwinfo,
 			      bool AutoLoadFail);
 void Hal_EfuseParseThermalMeter_8723B(struct adapter *padapter, u8 *hwinfo,
-- 
2.54.0

