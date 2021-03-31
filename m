Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E586F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:40:50 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id b16so21518952eds.7
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LUp51mU59dmrlVCNWZI0afQnRaVG017xy+2y+GjxxSk=;
        b=NIMGFqZJt+Fo4VT2x7Qx5Vis+8qJJB66+g09feSWyFssDFEsWnN/RWKYfE0pyYwba0
         JEeg36M2nSirdjCEcLeRePGtiCsmhbatxBY7MyKmDNWO+SNsE1IdveV+dqlgrpOdY4l0
         UgcfZczm9dqKS++TuVTFAiUeCKFGNQ8zV0gQIb6/ljXbdCHRvzue2X6q4I0eNBEbWm49
         ZCa8TKVFPWmOk/d2En7Ra6Mb0fmTudrfKZ63HFdBNumknE9Ml06+Hwc2Yi3EhFirVhc9
         kkuA2nj/dmoaw1ByrZiShcJ1CUPKvgeCvAie/JUFXyLcuQ0IUTWD8tpulS+JoCXE//FN
         H+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LUp51mU59dmrlVCNWZI0afQnRaVG017xy+2y+GjxxSk=;
        b=BdlpUna3WNYXmEt2f0L1Etae95ujMO2G9oV+Vr0qVSNyfK1P1lfEEdItVUFJSIxy0o
         pPW0GskUS0gvFR4CjUmHLxGBAFp4EZlWJkeLOViemicEEDcFgYmUUN4jOe3uAy1VcNac
         ZWOQfaqOIWYNVHRpySTR4RHIr1KcYF2Lf85nDYU/pe9REV5lhSzbLkbyInEC5pDM6w3H
         qHEZyxCpuDwJxtMHJEJRHnFk739g0FD1o6IZwqKLsRmgbjZwr/bFbkxj4wNLqLpAypF6
         Oxs6vAnKohXm0eFH802iiP+hr4nufKIlHQzZTg2OoYhLw61BEcq0qyAfvCoMWUHjmAZH
         rkFg==
X-Gm-Message-State: AOAM5301LT6jm5W9JExuWLOYUq3k4MX7Lceh1ZhoiTQVs2NlYRZJvFGg
	+I3rGxeLQnvSZVmmRcf4Tug=
X-Google-Smtp-Source: ABdhPJw9iSbdp9g4ujMfN83Q6AZJAHF52/UFmXo+c6eO+ad7/q4QbE/KvESLYr3bcSeeCmIZ1OcKYw==
X-Received: by 2002:a05:6402:4407:: with SMTP id y7mr2558182eda.247.1617183648780;
        Wed, 31 Mar 2021 02:40:48 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id f9sm1102068eds.41.2021.03.31.02.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:40:48 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 19/40] staging: rtl8723bs: remove commented RT_TRACE call in hal/rtl8723b_hal_init.c
Date: Wed, 31 Mar 2021 11:39:47 +0200
Message-Id: <c1976332fc181196f47c7b03dbd05c2f7f24847b.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented RT_TRACE call in hal/rtl8723b_hal_init.c

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 7b92bc5ed1c7..e9d107093942 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2656,7 +2656,6 @@ void Hal_EfuseParseEEPROMVer_8723B(
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 
-/* 	RT_TRACE(_module_hci_hal_init_c_, _drv_notice_, ("%s(): AutoLoadFail = %d\n", __func__, AutoLoadFail)); */
 	if (!AutoLoadFail)
 		pHalData->EEPROMVersion = hwinfo[EEPROM_VERSION_8723B];
 	else
@@ -2739,7 +2738,6 @@ void Hal_EfuseParseCustomerID_8723B(
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 
-/* 	RT_TRACE(_module_hci_hal_init_c_, _drv_notice_, ("%s(): AutoLoadFail = %d\n", __func__, AutoLoadFail)); */
 	if (!AutoLoadFail)
 		pHalData->EEPROMCustomerID = hwinfo[EEPROM_CustomID_8723B];
 	else
@@ -2762,7 +2760,6 @@ void Hal_EfuseParseXtal_8723B(
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 
-/* 	RT_TRACE(_module_hci_hal_init_c_, _drv_notice_, ("%s(): AutoLoadFail = %d\n", __func__, AutoLoadFail)); */
 	if (!AutoLoadFail) {
 		pHalData->CrystalCap = hwinfo[EEPROM_XTAL_8723B];
 		if (pHalData->CrystalCap == 0xFF)
@@ -2780,7 +2777,6 @@ void Hal_EfuseParseThermalMeter_8723B(
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 
-/* 	RT_TRACE(_module_hci_hal_init_c_, _drv_notice_, ("%s(): AutoLoadFail = %d\n", __func__, AutoLoadFail)); */
 	/*  */
 	/*  ThermalMeter from EEPROM */
 	/*  */
@@ -3084,7 +3080,6 @@ static void rtl8723b_fill_default_txdesc(
 
 		ptxdesc->usb_txagg_num = pxmitframe->agg_num;
 	} else if (pxmitframe->frame_tag == MGNT_FRAMETAG) {
-/* 		RT_TRACE(_module_hal_xmit_c_, _drv_notice_, ("%s: MGNT_FRAMETAG\n", __func__)); */
 
 		ptxdesc->macid = pattrib->mac_id; /*  CAM_ID(MAC_ID) */
 		ptxdesc->qsel = pattrib->qsel;
@@ -3868,9 +3863,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 				ulCommand = ulCommand | CAM_POLLINIG | CAM_WRITE;
 				/*  write content 0 is equall to mark invalid */
 				rtw_write32(padapter, WCAMI, ulContent);  /* mdelay(40); */
-				/* RT_TRACE(COMP_SEC, DBG_LOUD, ("CAM_empty_entry(): WRITE A4: %lx\n", ulContent)); */
 				rtw_write32(padapter, RWCAM, ulCommand);  /* mdelay(40); */
-				/* RT_TRACE(COMP_SEC, DBG_LOUD, ("CAM_empty_entry(): WRITE A0: %lx\n", ulCommand)); */
 			}
 		}
 		break;
-- 
2.20.1

