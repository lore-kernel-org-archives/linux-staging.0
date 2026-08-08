Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A013A9D84
	for <linux-staging@lists.linux.dev>; Sat,  8 Aug 2026 18:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786215334; cv=none; b=e61Oc44QEqOK1Dzz+gebunSnfRdIbSIG6anw1/G10OWpCMFyfbmXuvBTuRTFZZZbRwUhrNFDqk+2JdSZirlu0Wl79Pwp4rYL05KBXI3R/ZKJhqZk8INPvSkhad1A1yQ5ToMkqmCqRDsyt+nnCiWoIUG37BL6E7NveQu1yXzyclY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786215334; c=relaxed/simple;
	bh=V7YvHYMb5ddxIvvnMHPY6ZgKf6bTBpA9t73up12PLcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fh3dmVfS7PcCLwF9a8x9Bxa6WI2Dexjnj2eNJKx3aLLVNFsOd/0go3dGQO6yqAs0snPoFcF+MWDG3Z8fZZ1f2llr639FeKE/NZfaLsfLFS2VFZ2nbpSWzXShhhBm17Z8lIqkHn8O/5hJ60laeyErCmTWDku3vJufcby9MMo8QhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjcznIcq; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjcznIcq"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c7ed5410bso2314241fa.0
        for <linux-staging@lists.linux.dev>; Sat, 08 Aug 2026 11:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786215331; x=1786820131; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jaL0+BIDNSFkuj07Uyj8QdpIAZkBHvQd3SBnoAer9KY=;
        b=bjcznIcqww8qr8W08l5PzEq1t/ykb6HW6mF/JK8H7QjZhsyV4V2vtgYMjxLxgdDFz0
         15kkqCEsLMHabI4Zc8qRkgXlzJlyOt7UdjAuZnuEkAOBRGoSe+0/9VLHuDBj3meE/wiN
         LFBHLkMdY6zMCzpmkOBoc6j/sdoD0bfhTO9AX7VmDY4qHpCTy04PMZ2z3JIXfjs8ZSAc
         mTCxb3sV8vYhxsq7bnt2HdzlaCGe3mca1P9KHtbvhv0NVf7lCG45Y7bax1B1DG55lgIg
         4OwbLuNSYvckrx2Tw0H3SNgLfjOVTxScqPJr7iOXwokIIvcF3VfpP6z1Gulcg1joD8Ri
         Itpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786215331; x=1786820131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jaL0+BIDNSFkuj07Uyj8QdpIAZkBHvQd3SBnoAer9KY=;
        b=iC+davE62/i1Cdt1CLdUIV/7NUMVKp2OUoJdYr9dj634bDH+XB1w2dEvkAqc00KFfO
         vyczjSie6eFv3eExX70q/MeAi8FXYTgjCvo8psu2xd0gtbrQMVCX/ROXhhlJmVVMpIwV
         l/tyn4IUp1rQgkOEuNPVVJnj8GwVOYr1y+dizFf3Rhkws+KIHu3zH7PC/tYPwyEV8DpZ
         04EF9yoeaTlATGJRsr22uv0YYIH8M/rnz9TjEgYPY8z/LmcfZB6/kVSaWdopSliGC2AF
         0utY8yFtuWLBRh0YSoZt6AeYm7URwU2zFXRlYBozSFZ3wynP7UycfmYa9AoRnKVTdLO0
         2ZYg==
X-Forwarded-Encrypted: i=1; AHgh+RpWGtDIhBYiqYKmM4dAM7tpaaKnmNotmom2qc0Yx6QP+nb4TSUFiMkV3qkooUtcvAArnUSo8vnlxtrsy7hS@lists.linux.dev
X-Gm-Message-State: AOJu0Yyy6HHKOYme8V5saBHg9ljmgS5OxKztVfBDclPtKiNqvUiXeTzl
	kuCnSTe4ZiOowyaeF92KUZfc7s4YbkO9p/1yk5404QztzrCMJ+G6hWeixjAFyQ==
X-Gm-Gg: AR+sD11vSYPf8VZqF7mvJ1A+xqbRFAmcv+SL4b/JSKL+MLIMVXt6Q424owiz/AMn2TE
	YU/qlilCfcXpzKqVdjlQ1nrGBZ8WSUuK1NJZ/vBbJ+b+784HMc1djg+IR1fl9YuRxzsilmfmdCQ
	E+I/hMXsbP/XUoug5Hb8gNmq/bpX4xH1XFqx22q4a+J+fPtbqAYRtWbM5CLohoHivYKR0Bb3HT6
	DvGlYAfSnwzj/KKXJbiJ1hZWIPzqptb5VgzLDnL8EOyAnG1bJ8imPr9Fsuh6/zy38WyHJdJ5Uo0
	1dvbwlkOLTEoeTTn2Kh1We6WXpV5gFH68H6E9vSWCNiKvaXPqzvuaoFqFEbYB5ZwOBXog1jcFld
	0v5ivXXfphM27+nI1MwvAoZ0RKttxWxOnz38JHsyZ9oavCIMmXZ27Vw4R9uUME+4sCOFdZkELP5
	LLRfGZe3fzuGVIicZP7WiqFyY0k+QC42T5KxzXxZ+CeAgYI2zKkgVkRnJvxlZpjvvi5cIHlg==
X-Received: by 2002:a05:651c:a210:20b0:39c:7859:a2d8 with SMTP id 38308e7fff4ca-39fbb2db42fmr27240261fa.27.1786215330584;
        Sat, 08 Aug 2026 11:55:30 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fdda80e00sm11770001fa.9.2026.08.08.11.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 11:55:30 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Sat, 08 Aug 2026 21:55:18 +0300
Subject: [PATCH v2 2/2] staging: rtl8723bs: remove static
 HalDetectPwrDownMode() function
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260808-rtl8723bs_efuse-v2-2-54488b13d554@gmail.com>
References: <20260808-rtl8723bs_efuse-v2-0-54488b13d554@gmail.com>
In-Reply-To: <20260808-rtl8723bs_efuse-v2-0-54488b13d554@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786215325; l=5416;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=V7YvHYMb5ddxIvvnMHPY6ZgKf6bTBpA9t73up12PLcA=;
 b=7DsVJv7p+4uSg9pzCwgvZThSuhRxGQwwcYLiSat0vMy6Mu5EWex9RVAdPOQCslRPJwwJOaTIo
 DBxMdsETQcPBi2oIjVml4LXW02d29vxxncMywzuzigtOaGzlYZ5vOWA
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

The return value of this function is ignored at the call site, and since
the function has no side effects, it can be removed.

At the same time, remove the efuse shadow functions, as they are
becoming unused.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 75 ---------------------------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 18 -------
 drivers/staging/rtl8723bs/include/rtw_efuse.h |  1 -
 3 files changed, 94 deletions(-)

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
index b9a7b03e2586..001b4b32c02e 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -538,20 +538,6 @@ static void _RfPowerSave(struct adapter *padapter)
 /* YJ, TODO */
 }
 
-/*  */
-/*  2010/08/09 MH Add for power down check. */
-/*  */
-static bool HalDetectPwrDownMode(struct adapter *Adapter)
-{
-	u8 tmpvalue;
-	struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(Adapter);
-
-	rtw_efuse_shadow_read(Adapter, 1, 0x7B/*EEPROM_RF_OPT3_92C*/, (u32 *)&tmpvalue);
-
-	/*  2010/08/25 MH INF priority > PDN Efuse value. */
-	return (tmpvalue & BIT(4)) && pwrctrlpriv->reg_pdnmode;
-}	/*  HalDetectPwrDownMode */
-
 u32 rtl8723bs_hal_init(struct adapter *padapter)
 {
 	s32 ret;
@@ -626,10 +612,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
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

-- 
2.55.0

