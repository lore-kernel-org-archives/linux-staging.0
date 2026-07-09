Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F11D4DC520
	for <linux-staging@lists.linux.dev>; Thu,  9 Jul 2026 18:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621641; cv=none; b=nrDigv7LUHw5tZExAPavnOHYhgx4uACv/Oyv/mu4woAj3t6NnU4wR3fCeLDrrZm1ZdcUfQOYsoAYInfx2+wn7LpI7+R+TGfXbJdzqGetVACBlxyr1UDElh6ZByyockYhZWYEm7yCTnT4mjcMhlyKC49vGc6zhKEm322LWwzYbzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621641; c=relaxed/simple;
	bh=4mxFLD3nea/4Zjz1J4ThwaDurU+PJ4ODCnjdHS9MbDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cgwt2cwyQMIyp4ip91k3M74DjpJxPoN1mpHc6Ep1uBe9lqbZxKeUB/+wWYoUImy5fQxvr3VlHWQX5Lc4Sm4glDTx5mKJXWOyA7CqiT43ykX/pj7xgyCN1ZrbJ/o0usd5yAbTHhCjAhqxuquFTQA/oIkM0uBJcZixCMj+KXlR47M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQCkp733; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQCkp733"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15f360851aso31111566b.2
        for <linux-staging@lists.linux.dev>; Thu, 09 Jul 2026 11:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783621639; x=1784226439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9J8p6Mx9TbvhU1t9ukGP6Ije8Y+eDjjVzs/H8FWkTH0=;
        b=SQCkp733ln9eYl9hC+lu54OcGzbDKysagBX4EqKKjkGwk/ibQl1Y0IiHrCb4LoU+Q6
         xml0dKxqG0owsgwTQGwgcwyRkmPwggBxnf8YMQbfEYeAyC3xiSxBBwqKvPQC64sTpOrl
         penAIbpIo5OU0UfMDMqlYROtJehyzBr579lSFOZO4Fv09mKhOmYw8/HJUmdyGlwEfRin
         ON4W0+N34e7DkgGCfEX6ik/zw0fAXa/wGlKV0Cm1m64Vbq38fM13lp+uNB89UDXYAyKO
         umIrOns/6v9z/3laSK6pz0dqFW/VYO9ooiSQUIha2D9pLAdg1dgwxta+1HMNHlERq8zn
         fNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783621639; x=1784226439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9J8p6Mx9TbvhU1t9ukGP6Ije8Y+eDjjVzs/H8FWkTH0=;
        b=bnemArud2gi3cKVh4ijovq4o1h3MKNy8NAq0/yBlIvrGvVccNPrA9OsNQdlu4xIXr4
         ltx9XZ2ZO3/vQoIqlZFmrA65xLJXGbnQvbrpZP6i71u2lmVEduv03pBvRmrDJ5waiWLs
         3E8vepEVjg8uF3SQno70ZvS39624UIsuWDspPdx1XPQjRnzpFE0BXkhCVF2mW5+PNHtG
         kcRp8GDw3KQ/pXDdiW71UCuOYIMWYP3/Nt8gpUYp58hgINqGpnDiB6YIy48XvzbDhRAa
         F/TVJYrTPphoiMlJd6I1XSU1c627bwUp1BMMi5XqitugO4GBmDgDJOCat+UacIKu+a0R
         yyew==
X-Gm-Message-State: AOJu0YxEh3aXbEp1t8NHNM46vj56gngzJTj3E4a6+0cCuuqMUpAlawtm
	mLwJyajpkRFVWa8Y/MtL2TprRDApEoi8+PR6Q7ImPjGSp0a5chFzXhb8
X-Gm-Gg: AfdE7cmjOcKUA/iEb2AqZO4yiQczWl4JB6V4ja3vUEZG4XLjR34vvuWiWQjBz01u4bJ
	eKfT4/qHFAyEVYlY7MWAKFDOzTQ8fgj1UoHqydt+HLXaT8ZByepTs1VGB7eJYGhIhHGl1Vl79AC
	yQMewd0LdYRpp3r0RK+9sAAyhaBTyi3SeLNRKh36W8dFNDxyNsguoDoidJjyEi47Flcp8gU7XNq
	7UcmHY42ta5uOAZLFcbGmBXNDGTQPw2ZKKgIapRNp0ZIgctG+hkcLP2eenoTh+ejeiDcdk3K8Eq
	au/1t/VNC5aX1W9t7BT/J2Kg+SBFZkVBqxYcVFcBuFi1sl5X1ag2zg0JHKsN5yQsOSlQp0HWbya
	rymE2Thi+LH7gn/+gx/k2Ih4OTVxj0sIcGWaKwJ8BHLFXL/AO2ZfNLM3f9l0kNlz1y84WviG1l/
	H+NdyoIeDksQ==
X-Received: by 2002:a17:907:9607:b0:c15:ff19:15ee with SMTP id a640c23a62f3a-c15ff1924bamr10709966b.45.1783621638830;
        Thu, 09 Jul 2026 11:27:18 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15f272141dsm91168066b.59.2026.07.09.11.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:27:18 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 4/9] staging: rtl8723bs: remove unused 'MultiFunc' from struct hal_com_data
Date: Thu,  9 Jul 2026 21:15:11 +0300
Message-ID: <20260709182627.16327-5-nikolayof23@gmail.com>
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

This field is set during initialization but never used, so remove it and
related macros and enum.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c |  7 -------
 drivers/staging/rtl8723bs/include/hal_com_reg.h   |  2 --
 drivers/staging/rtl8723bs/include/hal_data.h      | 12 ------------
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h  |  5 -----
 4 files changed, 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 5548d1b449e5..a450ffcb60e7 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -828,13 +828,6 @@ static void ReadChipVersion8723B(struct adapter *padapter)
 
 	value32 = rtw_read32(padapter, REG_SYS_CFG);
 	pHalData->chip_normal = ((value32 & RTL_ID) ? false : true);
-
-	/*  For multi-function consideration. Added by Roger, 2010.10.06. */
-	pHalData->MultiFunc = RT_MULTI_FUNC_NONE;
-	value32 = rtw_read32(padapter, REG_MULTI_FUNC_CTRL);
-	pHalData->MultiFunc |= ((value32 & WL_FUNC_EN) ? RT_MULTI_FUNC_WIFI : 0);
-	pHalData->MultiFunc |= ((value32 & BT_FUNC_EN) ? RT_MULTI_FUNC_BT : 0);
-	pHalData->MultiFunc |= ((value32 & GPS_FUNC_EN) ? RT_MULTI_FUNC_GPS : 0);
 }
 
 void rtl8723b_read_chip_version(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/include/hal_com_reg.h b/drivers/staging/rtl8723bs/include/hal_com_reg.h
index 5b23a6ae6a15..4671fdfff916 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_reg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_reg.h
@@ -589,8 +589,6 @@
 #define C2H_EVT_FW_CLOSE		0xFF	/*  Set by FW indicating that FW had set the C2H command message and it's not yet read by driver. */
 
 /* 2REG_MULTI_FUNC_CTRL(For RTL8723 Only) */
-#define WL_FUNC_EN				BIT(2)	/*  WiFi function enable */
 #define BT_FUNC_EN				BIT(18)	/*  BT function enable */
-#define GPS_FUNC_EN			BIT(22)	/*  GPS function enable */
 
 #endif /* __HAL_COMMON_H__ */
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index fc6e1af24b9a..c93b21822ea7 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -12,16 +12,6 @@
 
 #include <hal_sdio.h>
 
-/*  */
-/*  <Roger_Notes> For RTL8723 WiFi/BT/GPS multi-function configuration. 2010.10.06. */
-/*  */
-enum rt_multi_func {
-	RT_MULTI_FUNC_NONE	= 0x00,
-	RT_MULTI_FUNC_WIFI	= 0x01,
-	RT_MULTI_FUNC_BT		= 0x02,
-	RT_MULTI_FUNC_GPS	= 0x04,
-};
-
 enum rt_ampdu_burst {
 	RT_AMPDU_BURST_NONE	= 0,
 	RT_AMPDU_BURST_92D	= 1,
@@ -149,8 +139,6 @@ struct dm_priv {
 
 
 struct hal_com_data {
-	enum rt_multi_func MultiFunc; /*  For multi-function consideration. */
-
 	u16 FirmwareVersion;
 	u16 FirmwareVersionRev;
 	u16 FirmwareSubVersion;
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index b6006110ad6b..5cf455142393 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -180,11 +180,6 @@ enum { /* tag_Package_Definition */
 	PACKAGE_TFBGA79
 };
 
-#define INCLUDE_MULTI_FUNC_BT(_Adapter)  \
-	(GET_HAL_DATA(_Adapter)->MultiFunc & RT_MULTI_FUNC_BT)
-#define INCLUDE_MULTI_FUNC_GPS(_Adapter) \
-	(GET_HAL_DATA(_Adapter)->MultiFunc & RT_MULTI_FUNC_GPS)
-
 /*  rtl8723a_hal_init.c */
 s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw);
 void rtl8723b_FirmwareSelfReset(struct adapter *padapter);
-- 
2.54.0

