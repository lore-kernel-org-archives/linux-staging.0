Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C34E39F169
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 10:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830622; cv=none; b=N1MasJFAtTT9ewXZ2eET5RsYjkSspk7+I9RB/BkiHW8mqA4U4CZ78XA6Boz/5geoDVs4Wi0Dydty13ZlafVRYfMp7aVF4rlC3jsVQNAr1CsU69axW/QmxtPQNbKJaEB6b4FwLnhEMPtFOlBrRXvLCGs+5HT+bnI3Z1zOGO8HJck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830622; c=relaxed/simple;
	bh=tSa75DmNBHgxIb32B87y+FuiHh+IeKhT3d3d0ekigNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y/QkaER+QkPKQaDRtBcJpXsLV2qZ9mp/dxH5EyLfNW0pqp69rSYmQg7f8z4O4z1rEml0MdD8W29cZnrLZJeQ8P7Uw8refV4VEbFECD/NKnpG8hdmvBDj2YffDDR3ZiSTymp9/xXuNkf1rwMCLeQuVKMa8TMM1Gm5rH9r5Q6dgEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9/ZLF4Y; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9/ZLF4Y"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c73bb6662d8so153099a12.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 03:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773830621; x=1774435421; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nbNr8wX19bOhUdlfTnz9xtLljp5bOx+5VOL73PtMdU=;
        b=G9/ZLF4YgXhRNZR/PCiqqu3gCOdwTzoal9a+tYaM0uncCMg9DlclMJN7GFlrQ/xwiN
         pfgy8U+G0F9yg4mmoi0OtytFP293gTqt1fNZ+kb1CgvrhL6jhKgtnXDNXMUzBjs9U7E8
         32/Jc1MvSsZwy+m0lNYtf2Iz8wwzAWUz78C8X5cM/bGKRbienudXZorEBC0pwFXbUz3y
         eyatEyEH+g7npWsCod1vuPAWCMn5P45OPNG+lacvQsYZgu0kHBtWcCO3gZxD32043ovL
         1GXfaVYkKCXSVTCFJQdsy/bg3pu3y2Nne7qPh4amIzkHQUi/qIQPVGSmeytjoOz6bEBX
         JLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773830621; x=1774435421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3nbNr8wX19bOhUdlfTnz9xtLljp5bOx+5VOL73PtMdU=;
        b=IAOvGwoF6IPMhobu3++pKmuArUCNs+xFK1rUDv4KKbqieWnHV0Q8CBYqk/KJEufBId
         osPchKbdiGwGrIKbuOmGVm322z/IDaF/qv4l3AjAwtvKnUu+DMGhpX3xzPnRyoK/Y8jE
         EYBFc9k6cT27nSe9MxOXm4O+0pVWmi6Ju+mldBWUSRlkc/VULDmpdoeOfy3IpulBUgGs
         0Ajo+XRwaG40q3LwPv2RRYf0L+MHYPRjWpYj16+3Sitt0aZoykGzeJYNK7Pjz65id+Zz
         Qo6uEqQPcVT9DLOYJlEtQ4FjgfxR+AGaGsJLzr13KyPw5j1S43Zh07lbEGqqWZTRljcX
         rJGA==
X-Forwarded-Encrypted: i=1; AJvYcCUDwzrtbJB00EleyzmvD5ugMaBpMmb8YeBh3A09HktS7yxlJ1iIXLWA8xjWyo8553++ZwN1MoOuhXCFAH1X@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9n/otr8TKvEKKCxe9C9J50q2YhJqsBuO4KtJGucsFtw2QZzpm
	QRlSXCFQ+2iOLeHdtmSsDPRN9rXp28Hstgk4wh2/iiR1K8NA+gWTzqUV
X-Gm-Gg: ATEYQzygDfulfn23zqmv/OHY0yLk5d3E+Kz4K71K9qwz2/EkqzP10TnC3QA3Ndy5rqE
	TJak1gQEFUzJDDg8FQZ6++CTgP9skKc7ZumP/bJCCx/LVyrNhSb3pO7FSdVwyK7Z30CcrRIGGkD
	cznACAgqyhbgdGTSy0hrrB2vSGCRnfhOxsWA1CaTmKGBixpYfVuWdUAVJRmZL+ay2Joq4sBeKc6
	2yNx/K+UqZbXJT3WeCvPnLir1bdV/POhviVUbBAnpdmCGctCmGy6Yf++VrYrIU+Pf1sD3roj9kY
	0lLzhbB9yrJ0yEMIOIo9YZ7ZKFQGFlxCZZtw+8VYS9jt5sxXrGTO2e91cZ+eWHxL0M9VzqTUbtQ
	3PeQVn28b8WUxUAYAefeRpUwDiXlZAhTzcl5U1nxttBbZgltMrUMj3c1MMqtQMu5aUbE6/78b8B
	trqpsIJfxMdKVQ4l9chMzDoEJ1qcHS/0/V8g==
X-Received: by 2002:a05:6a20:3d90:b0:366:14ac:e201 with SMTP id adf61e73a8af0-39b9a084f60mr2912713637.63.1773830620538;
        Wed, 18 Mar 2026 03:43:40 -0700 (PDT)
Received: from aadarsh.. ([2401:4900:8811:147c:fe7f:9683:3d75:702e])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82a6bbe7cc9sm2342886b3a.48.2026.03.18.03.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 03:43:40 -0700 (PDT)
From: Aadarsh Mandal <aadarshmandal9354@gmail.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	dan.carpenter@linaro.org,
	ethantidmore06@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	straube.linux@gmail.com,
	Aadarsh Mandal <aadarshmandal9354@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: remove dead code
Date: Wed, 18 Mar 2026 16:13:31 +0530
Message-ID: <20260318104332.32093-1-aadarshmandal9354@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318092639.27055-1-aadarshmandal9354@gmail.com>
References: <20260318092639.27055-1-aadarshmandal9354@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused and commented code 
no changes in functionality

Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail.com>
---
v3:
 - regenrated patch from the clean tree
 - removed unwanted addition
v2:
 - accidently added the functions in the {} blocks
v1:
 - some commented code wasnt deleted.
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 21 ++++++--------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 063a0737933e..8fbb46b3019d 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -68,8 +68,8 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 	rtw_write16(padapter, REG_APS_FSMCO, value16);
 
 	/*  Enable CMD53 R/W Operation */
-	rtw_write8(padapter, REG_CR, 0x00);
 
+	rtw_write8(padapter, REG_CR, 0x00);
 	/*  Enable MAC DMA/WMAC/SCHEDULE/SEC block */
 	value16 = rtw_read16(padapter, REG_CR);
 	value16 |= (
@@ -210,7 +210,7 @@ static void _InitNormalChipOneOutEpPriority(struct adapter *Adapter)
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
 	u16 value = 0;
-
+	
 	switch (pHalData->OutEpQueueSel) {
 	case TX_SELE_HQ:
 		value = QUEUE_HIGH;
@@ -338,7 +338,7 @@ static void _InitTransferPageSize(struct adapter *padapter)
 	/*  Tx page size is always 128. */
 
 	u8 value8;
-
+	
 	value8 = _PSRX(PBP_128) | _PSTX(PBP_128);
 	rtw_write8(padapter, REG_PBP, value8);
 }
@@ -482,7 +482,6 @@ static void _initSdioAggregationSetting(struct adapter *padapter)
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 
 	/*  Tx aggregation setting */
-/*	sdio_AggSettingTxUpdate(padapter); */
 
 	/*  Rx aggregation setting */
 	HalRxAggr8723BSdio(padapter);
@@ -636,7 +635,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	}
 
 	/*  Disable Interrupt first. */
-/*	rtw_hal_disable_interrupt(padapter); */
 
 	ret = _InitPowerOn_8723BS(padapter);
 	if (ret == _FAIL)
@@ -656,8 +654,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 	rtl8723b_InitializeFirmwareVars(padapter);
 
-/*	SIC_Init(padapter); */
-
 	if (pwrctrlpriv->reg_rfoff)
 		pwrctrlpriv->rf_pwrstate = rf_off;
 
@@ -742,8 +738,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 	/*  Record original value for template. This is arough data, we can only use the data */
 	/*  for power adjust. The value can not be adjustde according to different power!!! */
-/*	pHalData->OriginalCckTxPwrIdx = pHalData->CurrentCckTxPwrIdx; */
-/*	pHalData->OriginalOfdm24GTxPwrIdx = pHalData->CurrentOfdm24GTxPwrIdx; */
 
 	rtl8723b_InitAntenna_Selection(padapter);
 
@@ -786,7 +780,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	/* ack for xmit mgmt frames. */
 	rtw_write32(padapter, REG_FWHW_TXQ_CTRL, rtw_read32(padapter, REG_FWHW_TXQ_CTRL) | BIT(12));
 
-/*	pHalData->PreRpwmVal = SdioLocalCmd52Read1Byte(padapter, SDIO_REG_HRPWM1) & 0x80; */
 
 	{
 		pwrctrlpriv->rf_pwrstate = rf_on;
@@ -1068,20 +1061,18 @@ static void _ReadEfuseInfo8723BS(struct adapter *padapter)
 static void _ReadPROMContent(struct adapter *padapter)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
-	u8 eeValue;
+	u8 	eeValue;
 
 	eeValue = rtw_read8(padapter, REG_9346CR);
 	/*  To check system boot selection. */
 	pEEPROM->EepromOrEfuse = (eeValue & BOOT_FROM_EEPROM) ? true : false;
 	pEEPROM->bautoload_fail_flag = (eeValue & EEPROM_EN) ? false : true;
 
-/*	pHalData->EEType = IS_BOOT_FROM_EEPROM(Adapter) ? EEPROM_93C46 : EEPROM_BOOT_EFUSE; */
-
 	_ReadEfuseInfo8723BS(padapter);
 }
 
 /*  */
-/*	Description: */
+/* 	Description: */
 /*	Read HW adapter information by E-Fuse or EEPROM according CR9346 reported. */
 /*  */
 /*	Assumption: */
@@ -1144,7 +1135,7 @@ void SetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val)
 	case HW_VAR_SET_REQ_FW_PS:
 		{
 			u8 req_fw_ps = 0;
-
+			
 			req_fw_ps = rtw_read8(padapter, 0x8f);
 			req_fw_ps |= 0x10;
 			rtw_write8(padapter, 0x8f, req_fw_ps);
-- 
2.43.0

