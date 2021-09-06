Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F1972
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:25:07 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id h9so14987637ejs.4
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QXVzeoyjMV+agTPaWJLE9UNLbNfSwKQpfreP1FngznE=;
        b=iLVUmjwbuS8oAZZ7VbzwuKStVt8xXSgXQEdDVbOuasR34srTMPeQWQQScxCuOZys+M
         1rijm9/utaRLBMzHvIjTA91c0mycKSghFWdhBxgg9Ik9LIUNBRR1t5i1SRj91AjYATSL
         S+a++XgRoEXfN8yOE4X3rkqC9T3rGjNr+0uwuVz0Vt3/kBuR/brP8OM2E5ivEwEXJQBE
         dOi6H9hP9iQv5DuRKgIak3gzBCnrjYTtB3snyFsTYNJqdE8ThwIU4Z17I/3Zgk3kn6DP
         pUH5MyXbwmpxc9EXYFafl5OafTk4pEGAjPbbEeK6bDXbzs6z2gdGDKh0DAxoto02fTye
         0m/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QXVzeoyjMV+agTPaWJLE9UNLbNfSwKQpfreP1FngznE=;
        b=abGh3hdyrPQ1y+ID4cWmgVn7Bm8KXyWbf1y54pW725jd1jhRBI6foXnWTZBoBmW1Zw
         Fma1eB7Hol2Fwa38Q+p7tRDJSeNltr/YjohMQ+PArW7oabb0aX264YwnlY91B4d1acfN
         ror/KAOMKVCmbhmpGOuDPUZdpCPtUnY9vH4OD+Fa1eeUgiFi1VbttQI98JzYgKTRWWj9
         VUhWLPwE3nDgLyvJi4fe07zELJj+eE5NyrSGal5TI91YSV06/TPbrip0LIrOCoCYdym8
         gxTjHmsJXi77vMMH1b9Ym/ps8fqYpNge8ou/32eh6/vJ5RqSStcRP1s0DGULwpxjzdOb
         o/fA==
X-Gm-Message-State: AOAM532+rUAImXR+K9ex//vqrz0FZQDmgizJETFB3gR8u1sztvrT4A7j
	k95GIgX7rWiRSYhQ73nwBE8=
X-Google-Smtp-Source: ABdhPJwXQqOcvfXSz8smRmHNfjJ9DuZNhgMqwD1kBXRqSRhyRIUyd+kDoV+IMmJtHY1bCw2S/aDAVg==
X-Received: by 2002:a17:906:26c4:: with SMTP id u4mr14526413ejc.511.1630952705973;
        Mon, 06 Sep 2021 11:25:05 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id s25sm4284492ejq.17.2021.09.06.11.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:25:05 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 06/40] staging: r8188eu: remove empty functions
Date: Mon,  6 Sep 2021 20:24:04 +0200
Message-Id: <20210906182438.5417-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906182438.5417-1-straube.linux@gmail.com>
References: <20210906182438.5417-1-straube.linux@gmail.com>
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

