Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76873FC7
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:54:08 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id t19so15069216ejr.8
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QXVzeoyjMV+agTPaWJLE9UNLbNfSwKQpfreP1FngznE=;
        b=WVBmsxHE5Ih3h0xyt/RXaD+ADF5npyi6MVpJ0GohA5ufC3QSlTp83IUz9R8hyV9hCl
         3oOLepmiswje0xQ9Am7IrAZA/OqQgx1MoE+p4qI+Gc3EEZYTXJQRA0rU7fxIPVucRlEG
         71D9Izl2Y+oz4gAWOWCj0MHdCNGeyhsYBZIBzk4nLPPmKLUHLJRTuXBjcKtqM9DbbBi9
         3xVCIM3+wK1OGMeDM6wWMy+QKRU/Li1utXrzc8G4G/oxZ1euG71bo00SE0dcsrLjy7Sq
         UGIHQGbuS42+zk3p/4gSDVgfkwvQo8Hrr/aJAoH5g0kHWYaLpJ3uvPf8YBWWlDOd6iqL
         Xd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QXVzeoyjMV+agTPaWJLE9UNLbNfSwKQpfreP1FngznE=;
        b=HoDdkJO06u2CXbi21dkcL04sSQwT1UsOQUNZ5mjGOXti35e4uMl90VV2bmxRqHwFjl
         ARLoj1ygbSTjTAQnYfbAE6kTmv/Qs0us5V0Goy5WpFHhfTTxPGIbTn0dDLYJQ6jWeiT7
         q4p9TdioiOQ32CCkTegjoULUoiE1T2gt5fajYEsAOkLhvJFpaQTvsObPqy1jKRY5r9bz
         kNzR8fpAiuB6a7VBKCVvdn7a+z6MWG6PhSeW2s9RHHlLiYLTLQzluwfMGtrj25P1FXof
         SchU78lfEemQO6hLdYS4lwAsxe5DfTVVcdU/QkgbZ935qWjB7v05dOP5i4S42NznmfQn
         6sWQ==
X-Gm-Message-State: AOAM5334svDyi8jobvjRK8lj7dxdec/qtV80IuBjv9SK3ukwcFnqTmFs
	SUGvFozFDZFGuKGpN2jGX6w=
X-Google-Smtp-Source: ABdhPJzY1H3mKqAxAcKUk6/NqYzlLfUZU3GdGYHs4sP/x2DAI4e/CpaKtIJX+DxcqB7526nVPNR28Q==
X-Received: by 2002:a17:906:26c4:: with SMTP id u4mr14618004ejc.511.1630954447116;
        Mon, 06 Sep 2021 11:54:07 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id kk2sm4329128ejc.114.2021.09.06.11.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:54:06 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 06/40] staging: r8188eu: remove empty functions
Date: Mon,  6 Sep 2021 20:52:53 +0200
Message-Id: <20210906185327.10326-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906185327.10326-1-straube.linux@gmail.com>
References: <20210906185327.10326-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following empty functions.

Hal_InitChannelPlan()
Hal_CustomizeByCustomerID_8188EU()
_InitBeaconMaxError()

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c |  4 ----
 drivers/staging/r8188eu/hal/usb_halinit.c       | 15 ---------------
 drivers/staging/r8188eu/include/rtl8188e_hal.h  |  1 -
 3 files changed, 20 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index bed89a1234bd..ca020f2ed7a2 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -2242,10 +2242,6 @@ void Hal_ReadThermalMeter_88E(struct adapter *Adapter, u8 *PROMContent, bool Aut
 	DBG_88E("ThermalMeter = 0x%x\n", pHalData->EEPROMThermalMeter);
 }
 
-void Hal_InitChannelPlan(struct adapter *padapter)
-{
-}
-
 bool HalDetectPwrDownMode88E(struct adapter *Adapter)
 {
 	u8 tmpvalue = 0;
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 87aa12a6b5ba..65f68f35b611 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -403,10 +403,6 @@ static void _InitEDCA(struct adapter *Adapter)
 	rtw_write32(Adapter, REG_EDCA_VO_PARAM, 0x002FA226);
 }
 
-static void _InitBeaconMaxError(struct adapter *Adapter, bool		InfraMode)
-{
-}
-
 static void _InitHWLed(struct adapter *Adapter)
 {
 	struct led_priv *pledpriv = &Adapter->ledpriv;
@@ -819,7 +815,6 @@ static u32 rtl8188eu_hal_init(struct adapter *Adapter)
 	InitUsbAggregationSetting(Adapter);
 	_InitOperationMode(Adapter);/* todo */
 	_InitBeaconParameters(Adapter);
-	_InitBeaconMaxError(Adapter, true);
 
 	/*  */
 	/*  Init CR MACTXEN, MACRXEN after setting RxFF boundary REG_TRXFF_BNDY to patch */
@@ -1140,10 +1135,6 @@ static void Hal_EfuseParseMACAddr_8188EU(struct adapter *adapt, u8 *hwinfo, bool
 	}
 }
 
-static void Hal_CustomizeByCustomerID_8188EU(struct adapter *adapt)
-{
-}
-
 static void
 readAdapterInfo_8188EU(
 		struct adapter *adapt
@@ -1166,12 +1157,6 @@ readAdapterInfo_8188EU(
 	Hal_EfuseParseBoardType88E(adapt, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
 	Hal_ReadThermalMeter_88E(adapt, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
 
-	/*  */
-	/*  The following part initialize some vars by PG info. */
-	/*  */
-	Hal_InitChannelPlan(adapt);
-	Hal_CustomizeByCustomerID_8188EU(adapt);
-
 	_ReadLEDSetting(adapt, eeprom->efuse_eeprom_data, eeprom->bautoload_fail_flag);
 }
 
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 5cd441e8e16b..bb5620a9b17b 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -434,7 +434,6 @@ void Hal_ReadPowerSavingMode88E(struct adapter *pAdapter, u8 *hwinfo,
 
 bool HalDetectPwrDownMode88E(struct adapter *Adapter);
 
-void Hal_InitChannelPlan(struct adapter *padapter);
 void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc);
 
 void rtl8188e_read_chip_version(struct adapter *padapter);
-- 
2.33.0

