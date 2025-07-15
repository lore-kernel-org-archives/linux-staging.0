Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636E02C08B1
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 18:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604120; cv=none; b=sWiRQIgjf1U1WWJP4beZfMDtiB+NBHbUDIItPgiFc2032STzC5hIgWCsz72HlUfPyUqNR9qGktWHERyth1rSgrR0jir0jFki3rz8nK1sGZMlabtWDBpcZ+Qjpk3mgxZBeRYDoGSqZKlgvER2V/NISx635UwoplsIWUJXv8Xvr40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604120; c=relaxed/simple;
	bh=mpU5R7KnzhOMbd4mN29cmChRyB3oADBmJ7JKuMhNmkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qUtWEKeRAL0JmtXKgavkLs3qSRhLnxucJ8S+Pb9JTqattSMazdyE2Ji23vB8QLlO/oCJ2GEntU7M/WpoTcjjJL4zTgVyiJnQghHNvBixuGcbRQm4tM6/mu3Ag4QDsuk0DSYoRtK9S+/8cg3yg2VPtM8+e8YrDKyWxIvk8GnMib8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQPEt5BT; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQPEt5BT"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60c79bedc19so10219842a12.3
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 11:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752604117; x=1753208917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DpYsszl2QuakqvLkMzTig3n2mo4OvaOkwLGvJ5A63Q=;
        b=nQPEt5BTfO0HAKImkpqinGE/LmUP7d9J8MeWYMnPNI+WW0A5zelMsPD4bB6Ifb/bER
         ItVHO8AJxxDEEg0Uznh0D1hchWNkGEb18yFfWTVTK6dRxCB+mDhji0NDrcNV5YPpnP8h
         mm/etbzEGToQ+cqOwmDFykqdgA4FgKqLtpFn9IZgjHv6NULdc18LZwc0C5l8mOEV+die
         UZ8PC9Rhb8OT4AAfFE8bz7pWoRLR516iUW9zciTm/KH3fNSM6OfvDryl6pqcQjFgCnhD
         fXXaBwNFs+ebUX9ezAxAhs9PFKZlF+XRvrfzXoIoGjZhUYC+V2psDwid/qEAFwsKNhYK
         p/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604117; x=1753208917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DpYsszl2QuakqvLkMzTig3n2mo4OvaOkwLGvJ5A63Q=;
        b=e6oCLp1zNH5EeD8E3Gudtdbc03o7/Z66M+IWRivoQAtNyE2GBUQmcjaRXoXfP6LZ66
         P35I3cCz7f7+3lCRCizCg9VULR+JjkUXGcSYQD/ukzBrcdotHHWx2ouySj6lXHWCXPxU
         a9v3qfmyTSmgZB8fkGYIvvcT5TRccGIt/MVcPfPD2SZ4YMrEXKkCsF63NVEGEgTD/7SY
         eQLgl00FOxtnycaDpS2WEADpZwhm8U6qljxYovaVBZUh5EBj+/1lZB9JtRkZ8Zl1oOMN
         coiUERUzqggMFGX8G1JuaM7gfV1G2QHSdqrLrmGUFi1kApSiMeR4Q/AYm4C4i9tc8b1p
         jSwg==
X-Forwarded-Encrypted: i=1; AJvYcCVZj5sJiHewdkMrTCZypdF0iWH0/AT4DJ4loeIFDizmSS/pQPAsvxffCoMVvmpBqp4sNbz8XzdRAr5erLRE@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6slywJ+KQ/EoVM8Wramr2fc2vjS6RXugkk7/zraQ1zm7pWseV
	uyWs70cHhEp9vTA2gNbyqIMXjW7JNgU1ONdyaWvvE/p/QWbMDtzbMShp
X-Gm-Gg: ASbGncsV8fBdXoY1z5iFdmUKpZI125I3ZkcRNJ9hyzVZqRNYF28RiafwsZ+U6HoQqyc
	Julylzo3O1WOW3Rn5DCDosXs8vzZ5sXMeB1XdcLO5CKrYDV7ADjw2Zrgx1jSSVzHYhO2lhYwU8n
	JOj8Nx3G8c9NO6SSIStzpxNWq6x66+UM2we2EqMbLnt6YBXt7eG3VlhUPBmuCUFUBvUL/EYxuYI
	fhA9aApEHDIRbduN5VogF1sw+clPh/PIn+2GwTVseblNYlnH7t3XQLxxy2Cwq1fgzFytluol3Hn
	P16A6MB4mpXdW14Z5e9Ly7ngiUkz7MmtrNJlO8ReCI+xozo5EvbPY9zoavlfkisrFFiX8VMMdDY
	B7KLYpjjnR2LlXIm+RSLNa7c=
X-Google-Smtp-Source: AGHT+IHtnmNRdfCGqStJ0TqWPul3dFG2M+jv02OtQnl6sKNpCpopF13wAyUpSNMo9xJuANuxI+0E9w==
X-Received: by 2002:a17:907:c8a8:b0:ad5:27f5:7183 with SMTP id a640c23a62f3a-ae9c9b1ca9bmr44967866b.39.1752604116436;
        Tue, 15 Jul 2025 11:28:36 -0700 (PDT)
Received: from tumbleweed ([95.90.185.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df2fbsm1039562766b.158.2025.07.15.11.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:28:36 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 11/11] staging: rtl8723bs: remove struct hal_ops
Date: Tue, 15 Jul 2025 20:28:14 +0200
Message-ID: <20250715182814.212708-12-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715182814.212708-1-straube.linux@gmail.com>
References: <20250715182814.212708-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After previous patches, struct hal_ops is finally empty now. Remove
the structure and related initialization functions.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 5 -----
 drivers/staging/rtl8723bs/hal/sdio_halinit.c      | 8 --------
 drivers/staging/rtl8723bs/include/drv_types.h     | 1 -
 drivers/staging/rtl8723bs/include/hal_intf.h      | 3 ---
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h  | 1 -
 drivers/staging/rtl8723bs/include/sdio_hal.h      | 2 --
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c      | 2 --
 7 files changed, 22 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 1e9447633465..a9f33444aec2 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1312,11 +1312,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 	pdmpriv->INIDATA_RATE[mac_id] = psta->init_rate;
 }
 
-
-void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
-{
-}
-
 void rtl8723b_InitAntenna_Selection(struct adapter *padapter)
 {
 	u8 val;
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index af9a2b068796..35f48b564199 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1251,11 +1251,3 @@ u8 SetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariabl
 {
 	return SetHalDefVar8723B(Adapter, eVariable, pValue);
 }
-
-void rtl8723bs_set_hal_ops(struct adapter *padapter)
-{
-	struct hal_ops *pHalFunc = &padapter->HalFunc;
-
-	rtl8723b_set_hal_ops(pHalFunc);
-
-}
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 7b0e824e05a9..080c321665c0 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -350,7 +350,6 @@ struct adapter {
 
 	void *HalData;
 	u32 hal_data_sz;
-	struct hal_ops	HalFunc;
 
 	s32	bDriverStopped;
 	s32	bSurpriseRemoved;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 248f54f04c5e..67d51e55bd44 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -160,9 +160,6 @@ enum hal_intf_ps_func {
 
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
-struct hal_ops {
-};
-
 #define RF_CHANGE_BY_INIT	0
 #define RF_CHANGE_BY_IPS	BIT28
 #define RF_CHANGE_BY_PS		BIT29
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index a4a14474c35d..40ff96d3cf74 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -223,7 +223,6 @@ void Hal_EfuseParseVoltage_8723B(struct adapter *padapter, u8 *hwinfo,
 
 void C2HPacketHandler_8723B(struct adapter *padapter, u8 *pbuffer, u16 length);
 
-void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc);
 void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val);
 void GetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val);
 u8 SetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable,
diff --git a/drivers/staging/rtl8723bs/include/sdio_hal.h b/drivers/staging/rtl8723bs/include/sdio_hal.h
index 024acf9b530d..6538253765f1 100644
--- a/drivers/staging/rtl8723bs/include/sdio_hal.h
+++ b/drivers/staging/rtl8723bs/include/sdio_hal.h
@@ -11,6 +11,4 @@ u8 sd_int_isr(struct adapter *padapter);
 void sd_int_dpc(struct adapter *padapter);
 void rtw_set_hal_ops(struct adapter *padapter);
 
-void rtl8723bs_set_hal_ops(struct adapter *padapter);
-
 #endif /* __SDIO_HAL_H__ */
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index e735747f2000..f3caaa857c86 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -216,8 +216,6 @@ void rtw_set_hal_ops(struct adapter *padapter)
 {
 	/* alloc memory for HAL DATA */
 	rtw_hal_data_init(padapter);
-
-	rtl8723bs_set_hal_ops(padapter);
 }
 
 static void sd_intf_start(struct adapter *padapter)
-- 
2.50.1

