Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD3171
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:23 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id bf3so1151910edb.6
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OGhEGWInUsXSqDlvWslem4HSRe4n5xdbdM62/pWaaMk=;
        b=H+Kqiuuqol0efhKDxjK4kTMA4uIFcZK2Zl0ohDcNrODqu4NtRYs7ysW1SL1CNm2f1M
         K5DICut4Uot2tlU2r1bPSUCJ5Cg38zUu9xrnoNaAZ1QpZ0NrTx/61k3GVuviq7HEzw8+
         6pWBRKOCNVZMnNW5tJcCQkYiM/IZjw7CvS/YSqqH0vHLcf5sYmiEN8rtjnQ4yTUxm/pw
         0E7Ds2ZjAvTBYK4Rny3W0rfq9kU5VJ/R+ofCAZ5+5AVUJu21vp0HVXB3tZSyQIgztIKX
         gz6YOXMbrIZ40uWGGBNBORaERz9Fo/xrBgwAXwhqec/TzOtGh12/toKP3n2k2sEIMnY0
         pgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OGhEGWInUsXSqDlvWslem4HSRe4n5xdbdM62/pWaaMk=;
        b=a20b3rKSRMtzRhY4I9ru/TD/eJEkm57MMu3CVXM6fzHVxnbvL93K6dKM226pjk7/JV
         qD+Ix8MOzzppvqui+MTsfN5/if/t17hbnKL9g2kSEbPRFIv69jTabt5xpGkREpiuk6dI
         +L5nhc6w5nyOQfPEafEHC0PNyDDO070u9Ity7vVIyllw8wkg5+GoazMaxDU/dMWflWYi
         io3CcHxh9DDN7M+S4c4ElEUd6I1li5e8LbDNc64/djZ9uQEbXDHKFfTX6hvnyD8H4LNW
         LS2kQs8DCaFVvlWHsvc+xm4zU3ANVp/jvxmnDqyUwTmEDKGZ+NQRyTRGi2nx1h9a/VQK
         8ZlQ==
X-Gm-Message-State: AOAM531Bzn8WU1cg7daNtso/h6deVHAuF/YKxvSzZsyYWJOdRALjssWB
	TCj4ol6cb8B0RdiKqKs1AFs=
X-Google-Smtp-Source: ABdhPJzYRPU2b4eGy/5KPeI4yRj6f8sG/ku0vm9PZVQ3/uVzvEahhesSYOxACUyXucG2kEmxFkXSLA==
X-Received: by 2002:a05:6402:354b:: with SMTP id f11mr8637236edd.361.1617268942253;
        Thu, 01 Apr 2021 02:22:22 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id yk8sm2552378ejb.123.2021.04.01.02.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:22:21 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 36/49] staging: rtl8723bs: remove RT_TRACE logs in hal/sdio_halinit.c
Date: Thu,  1 Apr 2021 11:21:06 +0200
Message-Id: <eeb98371a5a6feea56882218405723adbcde3209.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove all RT_TRACE logs

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 30 --------------------
 1 file changed, 30 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index b1c4bbf29790..8bfe807d89f1 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -57,11 +57,6 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 	/*  only cmd52 can be used before power on(card enable) */
 	ret = CardEnable(padapter);
 	if (!ret) {
-		RT_TRACE(
-			_module_hci_hal_init_c_,
-			_drv_emerg_,
-			("%s: run power on flow fail\n", __func__)
-		);
 		return _FAIL;
 	}
 
@@ -680,7 +675,6 @@ static u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 	ret = _InitPowerOn_8723BS(padapter);
 	if (_FAIL == ret) {
-		RT_TRACE(_module_hci_hal_init_c_, _drv_err_, ("Failed to init Power On!\n"));
 		return _FAIL;
 	}
 
@@ -688,12 +682,10 @@ static u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 	ret = rtl8723b_FirmwareDownload(padapter, false);
 	if (ret != _SUCCESS) {
-		RT_TRACE(_module_hci_hal_init_c_, _drv_err_, ("%s: Download Firmware failed!!\n", __func__));
 		padapter->bFWReady = false;
 		pHalData->fw_ractrl = false;
 		return ret;
 	} else {
-		RT_TRACE(_module_hci_hal_init_c_, _drv_notice_, ("rtl8723bs_hal_init(): Download Firmware Success!!\n"));
 		padapter->bFWReady = true;
 		pHalData->fw_ractrl = true;
 	}
@@ -719,7 +711,6 @@ static u32 rtl8723bs_hal_init(struct adapter *padapter)
 #if (HAL_MAC_ENABLE == 1)
 	ret = PHY_MACConfig8723B(padapter);
 	if (ret != _SUCCESS) {
-		RT_TRACE(_module_hci_hal_init_c_, _drv_info_, ("Initializepadapter8192CSdio(): Fail to configure MAC!!\n"));
 		return ret;
 	}
 #endif
@@ -729,7 +720,6 @@ static u32 rtl8723bs_hal_init(struct adapter *padapter)
 #if (HAL_BB_ENABLE == 1)
 	ret = PHY_BBConfig8723B(padapter);
 	if (ret != _SUCCESS) {
-		RT_TRACE(_module_hci_hal_init_c_, _drv_info_, ("Initializepadapter8192CSdio(): Fail to configure BB!!\n"));
 		return ret;
 	}
 #endif
@@ -741,7 +731,6 @@ static u32 rtl8723bs_hal_init(struct adapter *padapter)
 #if (HAL_RF_ENABLE == 1)
 		ret = PHY_RFConfig8723B(padapter);
 		if (ret != _SUCCESS) {
-			RT_TRACE(_module_hci_hal_init_c_, _drv_info_, ("Initializepadapter8192CSdio(): Fail to configure RF!!\n"));
 			return ret;
 		}
 #endif
@@ -893,8 +882,6 @@ static u32 rtl8723bs_hal_init(struct adapter *padapter)
 	/*  Init BT hw config. */
 	hal_btcoex_InitHwConfig(padapter, false);
 
-	RT_TRACE(_module_hci_hal_init_c_, _drv_info_, ("-%s\n", __func__));
-
 	return _SUCCESS;
 }
 
@@ -1030,10 +1017,6 @@ static u32 rtl8723bs_inirp_init(struct adapter *padapter)
 
 static u32 rtl8723bs_inirp_deinit(struct adapter *padapter)
 {
-	RT_TRACE(_module_hci_hal_init_c_, _drv_info_, ("+rtl8723bs_inirp_deinit\n"));
-
-	RT_TRACE(_module_hci_hal_init_c_, _drv_info_, ("-rtl8723bs_inirp_deinit\n"));
-
 	return _SUCCESS;
 }
 
@@ -1132,8 +1115,6 @@ static void Hal_EfuseParseMACAddr_8723BS(
 	}
 /* 	NicIFSetMacAddress(padapter, padapter->PermanentAddress); */
 
-	RT_TRACE(_module_hci_hal_init_c_, _drv_notice_,
-		 ("Hal_EfuseParseMACAddr_8723BS: Permanent Address = %pM\n", pEEPROM->mac_addr));
 }
 
 static void Hal_EfuseParseBoardType_8723BS(
@@ -1148,7 +1129,6 @@ static void Hal_EfuseParseBoardType_8723BS(
 			pHalData->BoardType = (EEPROM_DEFAULT_BOARD_OPTION & 0xE0) >> 5;
 	} else
 		pHalData->BoardType = 0;
-	RT_TRACE(_module_hci_hal_init_c_, _drv_info_, ("Board Type: 0x%2x\n", pHalData->BoardType));
 }
 
 static void _ReadEfuseInfo8723BS(struct adapter *padapter)
@@ -1156,7 +1136,6 @@ static void _ReadEfuseInfo8723BS(struct adapter *padapter)
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 	u8 *hwinfo = NULL;
 
-	RT_TRACE(_module_hci_hal_init_c_, _drv_info_, ("====>_ReadEfuseInfo8723BS()\n"));
 
 	/*  */
 	/*  This part read and parse the eeprom/efuse content */
@@ -1192,7 +1171,6 @@ static void _ReadEfuseInfo8723BS(struct adapter *padapter)
 
 	Hal_ReadRFGainOffset(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 
-	RT_TRACE(_module_hci_hal_init_c_, _drv_info_, ("<==== _ReadEfuseInfo8723BS()\n"));
 }
 
 static void _ReadPROMContent(struct adapter *padapter)
@@ -1205,12 +1183,6 @@ static void _ReadPROMContent(struct adapter *padapter)
 	pEEPROM->EepromOrEfuse = (eeValue & BOOT_FROM_EEPROM) ? true : false;
 	pEEPROM->bautoload_fail_flag = (eeValue & EEPROM_EN) ? false : true;
 
-	RT_TRACE(_module_hci_hal_init_c_, _drv_info_,
-		 ("%s: 9346CR = 0x%02X, Boot from %s, Autoload %s\n",
-		  __func__, eeValue,
-		  (pEEPROM->EepromOrEfuse ? "EEPROM" : "EFUSE"),
-		  (pEEPROM->bautoload_fail_flag ? "Fail" : "OK")));
-
 /* 	pHalData->EEType = IS_BOOT_FROM_EEPROM(Adapter) ? EEPROM_93C46 : EEPROM_BOOT_EFUSE; */
 
 	_ReadEfuseInfo8723BS(padapter);
@@ -1233,8 +1205,6 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
 	u8 val8;
 	unsigned long start;
 
-	RT_TRACE(_module_hci_hal_init_c_, _drv_info_, ("+_ReadAdapterInfo8723BS\n"));
-
 	/*  before access eFuse, make sure card enable has been called */
 	if (!padapter->hw_init_completed)
 		_InitPowerOn_8723BS(padapter);
-- 
2.20.1

