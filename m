Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC693B0AFD
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 09:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773826012; cv=none; b=rfrd2FtpB8JWH1Pyw9Vb9BVW68BOp1j5T91Mktzw5i9buFrI6VH3MPutydZ+jZ8NDsRD/dsHhzKF3wTJA/9emzUzxS7QPWMamsXGNs3+rgo+DK+VLeFiMBHdZAfg/fxJng24u5kHvcy0TVI3znDTVJlbOET3bohJp1NnSQsr2WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773826012; c=relaxed/simple;
	bh=cGygfkCQFVabXszbYQGaScrXMljmgLedI1p+DCKgSOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iXJrG7tRVLQgeDcVoEACn4gW0iPwXRd1e1PS/I0mfzwNs7iEgsqm+WAWDG5qVmHWQ3L+TEeMWMQjoY4jtxNcljKZNY8xNofWz+lph8IAk2blt+n8r82+OvdW6Q/nLd486eIyyg7OkutZchhpLC/wcZb+H/IhAJ3UZWTs9Jg3rlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8G/rUhw; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8G/rUhw"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-829781b2b01so4171457b3a.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 02:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773826009; x=1774430809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMl3hlIlWaAHl8bntMlv1enQWEzCzJ7B18VMZsPBu5A=;
        b=e8G/rUhwgp1PqY9pTToyKqKtuJroLV7vkbegQIF/UeBBhgYmV87Mh7i5+/OsZeKnE2
         UFIfFltLP4Uxr+OlWWXOWphll763sAgRYl+QvP8GyNXpKzvg6We3iIsB300YYqSok9M1
         a/GeDxL+XDxih/4hnotl2DUsNBNRs/yhGvpLizAVXACCOkGA2A8cS7X91VPJfQjaKHlp
         6zg4W+ZDGUOLlt00SJL5TaKRc6oKaqLynaa68DyelLrB3EPaxw5dUf8m+VaDTvY3f/xU
         jCzufYmKhkxuqT8yOIgkCRa9Bx7Fm5e5Ij+L2AoQVHBMvnYffRSpg6O5T+hF7YU6UWsi
         j7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773826009; x=1774430809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MMl3hlIlWaAHl8bntMlv1enQWEzCzJ7B18VMZsPBu5A=;
        b=tRJq26aa5Qi9Izt9FoJi2HHrx083LTQ/iNEmM79D6vO0PAHAVKzGnwPqeBxwI5nxBb
         EC6IsOoLNpFLkRVhZYQdGtUmPcTE07wA1GNBZPqJfSUqjbEHHu75jc1lIHsQaKgGT71P
         K2FQnBG5lQ8gZrsQnjrEdDjJ2KtjE89R0z4gTIR2elV/UODW9bZRgmvF3cBu8VWX/dcu
         0t607LPGVJG+CW2kuAMuBVflGdYiwwM+XxdiRwpbUz5fPk9sH9ACQv0DcQ4G2bQLcxor
         26M00mYsuK7eqVoay5Nykedu7YBImr9L3RIElUiGLgyCAXBUN/J2ZGTWUnFSepVtIC+M
         1RCA==
X-Gm-Message-State: AOJu0YyrITHp0rAyoHzgZ2AdEpa3ZgAnSMHxKNWlPDEpZdYQiSUMglcF
	k986cE5be+PBy/0So//Z/Z9UI+B520o7RPkrDlJh7g0ecM0cLmbYCZ2W
X-Gm-Gg: ATEYQzwAeaoXiVMS2X5gufONFUTu2P79Q8D2kgGtJhVX+tgnBHr8s5uwPeVHJszWHHe
	2UytuyvJgLA8s7Mo8oj+8pQqrD/JSTBFN/6SNYw35VzxIbDOsW7Y9jO0kGzFFBj9/g+8SeydKCu
	MevT+Jz921Bag2gOol45BiZASqN0MunqlXMne4FSe73ud4S0Y8NNvTvI+8iIj/kk9w/LUGClAdd
	v6gHgTfu4zX7+xRld91otHzboDJG6YosvhvwX/KzsrqqbdQrehpfdJGiQ87vKUDO3QiX8xL8vqQ
	CjMIdiKozXtqg6adFU3kdHDutPVwV/nOLUK2jK1RaFl3udlpdHvxobi6sa21OBnyg8bvvQ+ab0K
	szDt0cqEMUFp5rLyWPjl7bdHGyCDHceJZMHltBxphM0SiY4p1MDHPo+qvTu2TcG3so6iedgZCxN
	c57xwYeKgtyRjyYfU2LlXt0F07otnyY2irKg==
X-Received: by 2002:a05:6a00:1a8d:b0:823:b39:779e with SMTP id d2e1a72fcca58-82a6af0cc4cmr2480800b3a.62.1773826009024;
        Wed, 18 Mar 2026 02:26:49 -0700 (PDT)
Received: from aadarsh.. ([2401:4900:8811:147c:fe7f:9683:3d75:702e])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82a6bbb522asm2065793b3a.37.2026.03.18.02.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:26:48 -0700 (PDT)
From: Aadarsh Mandal <aadarshmandal9354@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	ethantidmore06@gmail.com,
	lukagejak5@gmail.com,
	Aadarsh Mandal <aadarshmandal9354@gmail.com>
Subject: [PATCH] [PATCH] staging: rtl8723bs: clean up coding style in sdio_halinit.c V2
Date: Wed, 18 Mar 2026 14:56:39 +0530
Message-ID: <20260318092639.27055-1-aadarshmandal9354@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <46281493-328B-478A-985D-8F7A9218441A@linux.dev>
References: <46281493-328B-478A-985D-8F7A9218441A@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

update since v1:
- fixed the changes mentioned by the Luka Gejak
- removed the commented code and space

Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail.com>
---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 163 ++++++++++++++++++-
 1 file changed, 161 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 1026554bcff0..063a0737933e 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -6,7 +6,6 @@
  ******************************************************************************/
 #include <drv_types.h>
 #include <rtl8723b_hal.h>
-
 #include "hal_com_h2c.h"
 /*
  * Description:
@@ -69,8 +68,8 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 	rtw_write16(padapter, REG_APS_FSMCO, value16);
 
 	/*  Enable CMD53 R/W Operation */
-
 	rtw_write8(padapter, REG_CR, 0x00);
+
 	/*  Enable MAC DMA/WMAC/SCHEDULE/SEC block */
 	value16 = rtw_read16(padapter, REG_CR);
 	value16 |= (
@@ -483,6 +479,158 @@ static void _initSdioAggregationSetting(struct adapter *padapter)
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 
 	/*  Tx aggregation setting */
+/*	sdio_AggSettingTxUpdate(padapter); */
+
+	/*  Rx aggregation setting */
+	HalRxAggr8723BSdio(padapter);
+
+	sdio_AggSettingRxUpdate(padapter);
+
+	/*  201/12/10 MH Add for USB agg mode dynamic switch. */
+	pHalData->UsbRxHighSpeedMode = false;
+}
+
+static void _InitOperationMode(struct adapter *padapter)
+{
+	struct mlme_ext_priv *pmlmeext;
+	u8 regBwOpMode = 0;
+
+	pmlmeext = &padapter->mlmeextpriv;
+
+	/* 1 This part need to modified according to the rate set we filtered!! */
+	/*  */
+	/*  Set RRSR, RATR, and REG_BWOPMODE registers */
+	/*  */
+	switch (pmlmeext->cur_wireless_mode) {
+	case WIRELESS_MODE_B:
+		regBwOpMode = BW_OPMODE_20MHZ;
+		break;
+	case WIRELESS_MODE_G:
+		regBwOpMode = BW_OPMODE_20MHZ;
+		break;
+	case WIRELESS_MODE_AUTO:
+		regBwOpMode = BW_OPMODE_20MHZ;
+		break;
+	case WIRELESS_MODE_N_24G:
+		/*  It support CCK rate by default. */
+		/*  CCK rate will be filtered out only when associated AP does not support it. */
+		regBwOpMode = BW_OPMODE_20MHZ;
+		break;
+
+	default: /* for MacOSX compiler warning. */
+		break;
+	}
+
+	rtw_write8(padapter, REG_BWOPMODE, regBwOpMode);
+}
+
+static void _InitInterrupt(struct adapter *padapter)
+{
+	/*  HISR - turn all off */
+	rtw_write32(padapter, REG_HISR, 0);
+
+	/*  HIMR - turn all off */
+	rtw_write32(padapter, REG_HIMR, 0);
+
+	/*  */
+	/*  Initialize and enable SDIO Host Interrupt. */
+	/*  */
+	InitInterrupt8723BSdio(padapter);
+
+	/*  */
+	/*  Initialize system Host Interrupt. */
+	/*  */
+	InitSysInterrupt8723BSdio(padapter);
+}
+
+static void _InitRFType(struct adapter *padapter)
+{
+	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
+
+	pHalData->rf_chip	= RF_6052;
+}
+
+static void _RfPowerSave(struct adapter *padapter)
+{
+/* YJ, TODO */
+}
+
+/*  */
+/*  2010/08/09 MH Add for power down check. */
+/*  */
+static bool HalDetectPwrDownMode(struct adapter *Adapter)
+{
+	u8 tmpvalue;
+	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
+	struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(Adapter);
+
+	EFUSE_ShadowRead(Adapter, 1, 0x7B/*EEPROM_RF_OPT3_92C*/, (u32 *)&tmpvalue);
+
+	/*  2010/08/25 MH INF priority > PDN Efuse value. */
+	if (tmpvalue & BIT4 && pwrctrlpriv->reg_pdnmode)
+		pHalData->pwrdown = true;
+	else
+		pHalData->pwrdown = false;
+
+	return pHalData->pwrdown;
+}	/*  HalDetectPwrDownMode */
+
+u32 rtl8723bs_hal_init(struct adapter *padapter)
+{
+	s32 ret;
+	struct hal_com_data *pHalData;
+	struct pwrctrl_priv *pwrctrlpriv;
+	u32 NavUpper = WiFiNavUpperUs;
+	u8 val;
+
+	pHalData = GET_HAL_DATA(padapter);
+	pwrctrlpriv = adapter_to_pwrctl(padapter);
+
+	if (
+		adapter_to_pwrctl(padapter)->bips_processing == true &&
+		adapter_to_pwrctl(padapter)->pre_ips_type == 0
+	) {
+		unsigned long start_time;
+		u8 cpwm_orig, cpwm_now;
+		u8 val8, bMacPwrCtrlOn = true;
+
+		/* for polling cpwm */
+		cpwm_orig = 0;
+		rtw_hal_get_hwreg(padapter, HW_VAR_CPWM, &cpwm_orig);
+
+		/* set rpwm */
+		val8 = rtw_read8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HRPWM1);
+		val8 &= 0x80;
+		val8 += 0x80;
+		val8 |= BIT(6);
+		rtw_write8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HRPWM1, val8);
+		adapter_to_pwrctl(padapter)->tog = (val8 + 0x80) & 0x80;
+
+		/* do polling cpwm */
+		start_time = jiffies;
+		do {
+			mdelay(1);
+
+			rtw_hal_get_hwreg(padapter, HW_VAR_CPWM, &cpwm_now);
+			if ((cpwm_orig ^ cpwm_now) & 0x80)
+				break;
+
+			if (jiffies_to_msecs(jiffies - start_time) > 100)
+				break;
+
+		} while (1);
+
+		rtl8723b_set_FwPwrModeInIPS_cmd(padapter, 0);
+
+		rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
+
+		hal_btcoex_InitHwConfig(padapter, false);
+
+		return _SUCCESS;
+	}
+
+	/*  Disable Interrupt first. */
+/*	rtw_hal_disable_interrupt(padapter); */
 
 	ret = _InitPowerOn_8723BS(padapter);
 	if (ret == _FAIL)
@@ -588,6 +739,8 @@ static void _initSdioAggregationSetting(struct adapter *padapter)
 
 	/*  Record original value for template. This is arough data, we can only use the data */
 	/*  for power adjust. The value can not be adjustde according to different power!!! */
+/*	pHalData->OriginalCckTxPwrIdx = pHalData->CurrentCckTxPwrIdx; */
+/*	pHalData->OriginalOfdm24GTxPwrIdx = pHalData->CurrentOfdm24GTxPwrIdx; */
 
 	rtl8723b_InitAntenna_Selection(padapter);
 
@@ -630,6 +783,7 @@ static void _initSdioAggregationSetting(struct adapter *padapter)
 	/* ack for xmit mgmt frames. */
 	rtw_write32(padapter, REG_FWHW_TXQ_CTRL, rtw_read32(padapter, REG_FWHW_TXQ_CTRL) | BIT(12));
 
+/*	pHalData->PreRpwmVal = SdioLocalCmd52Read1Byte(padapter, SDIO_REG_HRPWM1) & 0x80; */
 
 	{
 		pwrctrlpriv->rf_pwrstate = rf_on;
@@ -918,6 +1072,8 @@ static void _ReadPROMContent(struct adapter *padapter)
 	pEEPROM->EepromOrEfuse = (eeValue & BOOT_FROM_EEPROM) ? true : false;
 	pEEPROM->bautoload_fail_flag = (eeValue & EEPROM_EN) ? false : true;
 
+/*	pHalData->EEType = IS_BOOT_FROM_EEPROM(Adapter) ? EEPROM_93C46 : EEPROM_BOOT_EFUSE; */
+
 	_ReadEfuseInfo8723BS(padapter);
 }
 
-- 
2.43.0

