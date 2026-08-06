Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E81B2E54D1
	for <linux-staging@lists.linux.dev>; Thu,  6 Aug 2026 19:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786044900; cv=none; b=L2oq7UlvrsHqkJsDORPne12wfHYBbfwYE0LO3IpxICYgJeJ5L5aX8TIMFs8lTgbocIGlnOODpNBW6FBlHaLhBpGFCSVZpqLz/mHUul2iYgofgwK9okNPVmHLsWoLqxWCuEGg+2ve1g0GOJw/jW24fUe3V/m1IXa112Kjbe0E2dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786044900; c=relaxed/simple;
	bh=sdXT9c2wPF3G1nUhhkO3syrJn8drvLfExg0K7M4rsfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lrZ6tFxdA+xrOk7Hmluouu6EdSFCPnQJ0bFQ23DBm7kxzjUkKocl4h3+JIxGQ06h+Ltys+u/1v1kGBKaeR4XthM6E/B8ZQs8wmWcDWGIr25GRxv6w5rp1Md7jJWv2msHYLYFO1FWrr/bc9l6Z9gl4Da6W4Wfe49+lO1LsUY0434=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cgbVGL+7; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cgbVGL+7"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b013aa02b2so1498911e87.0
        for <linux-staging@lists.linux.dev>; Thu, 06 Aug 2026 12:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786044897; x=1786649697; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U6ydmo3pNJnvQwPiXyo6A+XjC6JbIUSh589g1ZCJdIs=;
        b=cgbVGL+7Yvp5uzb3zJSlW/u5ZP6aBYFhPGr/8/rx4yMVm7qs8TimM4UFfVq3e2WmkS
         30/ihrcxYJWmQZVcBEbZLxfxbpwhUjbuNThZ3ZOcOOYELC2N91xdfYslagHWMBiNJlDC
         jCZouBV/Qv61+wNQyA82L2XIlydH9PVL/ImtOfXBbs4kSTRitytP4uHvV71wCnP1mShh
         AEJ0lgLKCip93bnzkTZJkSdqNG8z+P2i6fUanIbdzY4D7VUkdy/2Cxo3DbE2BmaIK6ex
         VyUlcFSQtUFjyS+NZPyD5yufhy7thNnZTFL5YrVoAWR+IyJeNJhdJvpuKhseqOiOuwbN
         QVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786044897; x=1786649697;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U6ydmo3pNJnvQwPiXyo6A+XjC6JbIUSh589g1ZCJdIs=;
        b=NM5ASV61m/qpjsH1FZUc5Kz4NgFHHnq3RimOYEc1YPVT1PDWnailUbKXz4t/Y1alDZ
         g7fFO5JJfa2+mHbE5JBJpH/u5fjpAj7ixeC9UEDXt2yBVMw0yeMP+VyEgCXtbnjGeDc8
         gD6aLRS2lL8DZKvDUjWi6eukPQpmtUfD7152wfJyJzMNc8R6l9ECzdXRSylyDjRNQQnf
         5Eu3cc6AaE+SYJw7VnhKBQKIO+tQxJd3eIG3QiXulXn1XQwVkhXVbNRqjw9AAyMPWPJc
         y8e21C5qUE8aHGX8Vd3frEUzS//GNhqwtPYpQxyGLXFgjRGSkD7qMXE7fAGejK5TQ0nA
         wWpw==
X-Gm-Message-State: AOJu0YzvpS+zI87mLeM1vJTEmr25Pa4yOnh8HIoV/eS3YbFCmUzXx+Sf
	9KtltiA31gQ6DbzM9pqnFNDuxqsuHZGLNdTO6e+5L6X887U73rdW4tYWsbZnjg==
X-Gm-Gg: AR+sD117G5VIwoP60rqwXo1MIvyhtGGP2Hm39Oq8jNYf0cJkYGrwKRMdaDq4SkptG+R
	HzNa+LIFtAjdgg2UMhG26V62bXHDcMj1phwnWrHyjpXDZOmOS3vGQJPfcAqdeFSxdKGOYwoGKN1
	4tU0uxyNGdd6mKfdHVeM5wFGd6MWVj0P2IQ0ZRCUF0kWTNlLw8PIT7j5L8WlFKttwxeT+txX1gi
	zuD9/+c0ZHoWQomEWiT7Z2AMz/lCfbFe5JG64jT38b3nniskYP4J4yTE6Tlv2nJ9C8V/DFCU4YY
	TNaXkZceRqJwL2qemkLapOKtnJr/myKq4Pd2DCxDxKzz+Zbug2/gnn6VCvk/g2ZyTX+0DGHDOEh
	H1sApyKnbgJnuWd9n3R3deHmqIiTnKI8dYZpsY/Ih55z9iw0xuJ0ISFm77eAtbT8SrnA6nlltpW
	Bl9kwOHyYo5pwH6SAjDaTmbLeMO75HzuYG98SHmppu67O+KtaZHRQapUQhWfxz/rvDsU3QNQ==
X-Received: by 2002:a05:6512:3f19:b0:5ad:68aa:8a78 with SMTP id 2adb3069b0e04-5b2fe39cd94mr1759088e87.5.1786044896948;
        Thu, 06 Aug 2026 12:34:56 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3050cfa65sm64444e87.20.2026.08.06.12.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 12:34:56 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Thu, 06 Aug 2026 22:34:48 +0300
Subject: [PATCH] staging: rtl8723bs: remove static HalDetectPwrDownMode()
 function
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-rtl8723bs_efuse-v1-1-fedb8b91f346@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM2wpAQBCA4VfRXNvaQw55FUmWwUhoZ0nJu1tcf
 hf/fwGjI2QoogscHsS0LgEqjqAdm2VAQV0waKlTmctEOD/nmTaWa+x3RpGqxpjEyk5ZDaHaHPZ
 0fsey+s27nbD17wbu+wGcmipLcwAAAA==
X-Change-ID: 20260805-rtl8723bs_efuse-61a335b0d1b2
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786044895; l=5817;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=sdXT9c2wPF3G1nUhhkO3syrJn8drvLfExg0K7M4rsfA=;
 b=N4B0F+JDpDAgEmlqNgHeisPn5v6V9gTyT8Kgjl9BwlHRwkRu2z1TUW3US+CC7SEJVMzJH64wD
 PHzirJ2TKdeC8H9HCBylcYCf0HnJnHxo95qQj2aZ7X/jLU/kaSMtQng
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

The return value of this function is ignored at the call site, and since
the function has no side effects (except for the assignment to
pHalData->pwrdown, which is not used anywhere else), it can be removed.

At the same time, remove the efuse shadow functions, as they are
becoming unused.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 75 ---------------------------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 24 ---------
 drivers/staging/rtl8723bs/include/rtw_efuse.h |  1 -
 3 files changed, 100 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 168ecb7a998f..7e215c9845f6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -145,54 +145,6 @@ static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse)
 	Hal_EfusePowerSwitch(padapter, false);
 }
 
-/*-----------------------------------------------------------------------------
- * Function:	efuse_ShadowRead1Byte
- *		efuse_ShadowRead2Byte
- *		efuse_ShadowRead4Byte
- *
- * Overview:	Read from efuse init map by one/two/four bytes !!!!!
- *
- * Input:       NONE
- *
- * Output:      NONE
- *
- * Return:      NONE
- *
- * Revised History:
- * When			Who		Remark
- * 11/12/2008	MHC		Create Version 0.
- *
- */
-static void efuse_ShadowRead1Byte(struct adapter *padapter, u16 Offset, u8 *Value)
-{
-	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
-
-	*Value = pEEPROM->efuse_eeprom_data[Offset];
-
-}	/*  EFUSE_ShadowRead1Byte */
-
-/* Read Two Bytes */
-static void efuse_ShadowRead2Byte(struct adapter *padapter, u16 Offset, u16 *Value)
-{
-	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
-
-	*Value = pEEPROM->efuse_eeprom_data[Offset];
-	*Value |= pEEPROM->efuse_eeprom_data[Offset + 1] << 8;
-
-}	/*  EFUSE_ShadowRead2Byte */
-
-/* Read Four Bytes */
-static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Value)
-{
-	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
-
-	*Value = pEEPROM->efuse_eeprom_data[Offset];
-	*Value |= pEEPROM->efuse_eeprom_data[Offset + 1] << 8;
-	*Value |= pEEPROM->efuse_eeprom_data[Offset + 2] << 16;
-	*Value |= pEEPROM->efuse_eeprom_data[Offset + 3] << 24;
-
-}	/*  efuse_ShadowRead4Byte */
-
 /*-----------------------------------------------------------------------------
  * Function:	rtw_efuse_shadow_map_update
  *
@@ -224,30 +176,3 @@ void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType)
 	/* PlatformMoveMemory((void *)&pHalData->EfuseMap[EFUSE_MODIFY_MAP][0], */
 	/* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], mapLen); */
 } /*  rtw_efuse_shadow_map_update */
-
-/*-----------------------------------------------------------------------------
- * Function:	rtw_efuse_shadow_read
- *
- * Overview:	Read from efuse init map !!!!!
- *
- * Input:       NONE
- *
- * Output:      NONE
- *
- * Return:      NONE
- *
- * Revised History:
- * When			Who		Remark
- * 11/12/2008	MHC		Create Version 0.
- *
- */
-void rtw_efuse_shadow_read(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value)
-{
-	if (Type == 1)
-		efuse_ShadowRead1Byte(padapter, Offset, (u8 *)Value);
-	else if (Type == 2)
-		efuse_ShadowRead2Byte(padapter, Offset, (u16 *)Value);
-	else if (Type == 4)
-		efuse_ShadowRead4Byte(padapter, Offset, (u32 *)Value);
-
-} /* rtw_efuse_shadow_read*/
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 57d2925642e7..001b4b32c02e 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -538,26 +538,6 @@ static void _RfPowerSave(struct adapter *padapter)
 /* YJ, TODO */
 }
 
-/*  */
-/*  2010/08/09 MH Add for power down check. */
-/*  */
-static bool HalDetectPwrDownMode(struct adapter *Adapter)
-{
-	u8 tmpvalue;
-	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
-	struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(Adapter);
-
-	rtw_efuse_shadow_read(Adapter, 1, 0x7B/*EEPROM_RF_OPT3_92C*/, (u32 *)&tmpvalue);
-
-	/*  2010/08/25 MH INF priority > PDN Efuse value. */
-	if (tmpvalue & BIT(4) && pwrctrlpriv->reg_pdnmode)
-		pHalData->pwrdown = true;
-	else
-		pHalData->pwrdown = false;
-
-	return pHalData->pwrdown;
-}	/*  HalDetectPwrDownMode */
-
 u32 rtl8723bs_hal_init(struct adapter *padapter)
 {
 	s32 ret;
@@ -632,10 +612,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	if (pwrctrlpriv->reg_rfoff)
 		pwrctrlpriv->rf_pwrstate = rf_off;
 
-	/*  2010/08/09 MH We need to check if we need to turnon or off RF after detecting */
-	/*  HW GPIO pin. Before PHY_RFConfig8192C. */
-	HalDetectPwrDownMode(padapter);
-
 	/*  Save target channel */
 	/*  <Roger_Notes> Current Channel will be updated again later. */
 	pHalData->CurrentChannel = 6;
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 808ba94a5998..a60e05cf699c 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -73,6 +73,5 @@ u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data);
 
 u8 rtw_efuse_read_1_byte(struct adapter *padapter, u16 Address);
 void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType);
-void rtw_efuse_shadow_read(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
 
 #endif

---
base-commit: c6eb4dc5964fdf4086b73b7f0f5dc0d595fb5cf3
change-id: 20260805-rtl8723bs_efuse-61a335b0d1b2

Best regards,
--  
Nikolay Kulikov <nikolayof23@gmail.com>

