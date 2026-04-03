Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6C42D8DC3
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 22:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255629; cv=none; b=K3pUeSelbOWJw2ZwY2MC8DiIeuHJlGcKmtrKVcFJZL1r42O9dT+ERGWRAngCFvqI0COcM2BqgEaGfJXLoEL6MZux5uiFzNRMgt5eOtkcUe5+49CnlimN0rYbfdotP5lwHe6nWBJWhOkjHt6DFUTGrhG2duSuvVjSVI/t4Z0tRPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255629; c=relaxed/simple;
	bh=uITjYYq2+twtMg424d1ikVgYYdji1JLITnL/XKvGNLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fdZ34TaGdOWs1sbIYAsNMATluRfERJre5Tog8dLHR5pFeLCTAb5Pa5eMeKk3XtruMjOjY+YVTJiBorvI2INCvUgMLPBjxREPe9+4kJaPooGhwGBXjZM++osjGncbPyC5HB4UWwg3P978sUKEUwtFjjpGeJcsH67+YPTqp7eAcco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIr95tbJ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIr95tbJ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so2682818e87.1
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 15:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775255626; x=1775860426; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kW9EnK0M/RSycmUZj4EK+IuqJXzQZtp1nNERFbFXLy8=;
        b=TIr95tbJrJ0mX2RXxX4b1TCBBbkUL288LC4FXLeAnr27t9cbyVKN82e74A8Zz7ImgV
         YTtmLWxn16H/S49iB6d4GmKWoQmKglI5Jbe5UhwYYHIChm2XqWSMfOj6suMmVg6JVKqO
         cfaUQssiA+RX/1lP1uDLPM1VUDxFMsfPZVXEQTtcK7iDVnu9NlioHfeNkMSRjSac/YJ2
         FRhfTehk60bx50ZD+NtNnW8NBgwnn2DamkXnyRqVMKx2F7ICqaiBCFr0kPIbtHgvQPTI
         JobOxuPJOazxqnvg6f3d/rK1WD7tVr6hJjbqVlWFM90ChZyLSKsai+mEZX6FTXftnggB
         MONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255626; x=1775860426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kW9EnK0M/RSycmUZj4EK+IuqJXzQZtp1nNERFbFXLy8=;
        b=LES+8bvLyDq1PPevxitOhd42l+wy7sW/ZcnxVvfIqPWLGydIdtOjIrY/sWYxdygZ5r
         rmDnXO0cOPXH2KJocrRT9UDuGVXOYJNFWfTdOympCdzko2r9ELHEvB55ZXW3KeX56EKf
         EfIeOo82Q03zUIuWYtuBlDNxOb5hF0oa6yrSsECVkR2RLFWVK2PWVd8XgEO4D9za2RD8
         VuOx6g5HpLpl4GWDGmUWpNS5HMpqehqKZfeTTd+mNHGoitGAAzkkiy8sItksn0QKYwKV
         MOxhfvFCO1+INUzqjrVis6JZwAQ1Eth8lL6ORLTg0ypqvxvpSWwx7atmRScSTrv1Gz/J
         hPHA==
X-Gm-Message-State: AOJu0YxxetyTVIDPPUredWrYYENUDM9CLbUpEEvnssiArfdP1bVEW2su
	A8uuR/3BCm1Qws2H/5Ih1l7dET5UIrysKl0kmT1n9ZqC3FgtAm4FVGkW
X-Gm-Gg: AeBDietbqc4IG/iV2aa4QD1Q+XxUqrSzoC3szAkSFSpiO9vZwWFO/h5PPlfZ6E72jHI
	zLPYSq8GhmlpvI5X55jwiSYmck0GEsjzwxT7elvMsSeNp3yWmeFEDoqFv/JJXtAzFnSR1ZPM+RA
	Jq9RUGDY+IjyCaHV3r3UlzdZBIa59vUszFYBNnrkuBCVKo39rLhqMzV0M2TeQLSPb7j3ECCv4FM
	h1Kq7u3orcSf2KajtNL0+LO1I2IKgPPEZR3eoB1RFgSZFNzAplyXgIkBli/+7NWiNziHdaBdVPQ
	RDimhwqVtgGfxwDB9ntCM1F5D7TPe7/QyIfjUfvCWvI0HDazZQ51NLIkfxOHUFTW2ErnSW+DKhb
	JgxSSvDtVnEIZXIQFgGUgYoRvDv337WCtwkE/3axe4lxGn2Mn6eDApVCOUGpSby4kFVb10Vd4HA
	PhZBsb9+bfnPdznv3A+vda+00a1rP8og3qATbSBkLmgnQK9tIjBClb
X-Received: by 2002:a05:6512:a94:b0:5a2:a5a5:5247 with SMTP id 2adb3069b0e04-5a3375849dfmr1600473e87.32.1775255626212;
        Fri, 03 Apr 2026 15:33:46 -0700 (PDT)
Received: from localhost (94.191.136.33.mobile.tre.se. [94.191.136.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc6010sm1775166e87.44.2026.04.03.15.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:33:44 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v6 4/7] staging: rtl8723bs: EFUSE_ShadowMapUpdate -> rtw_efuse_shadow_map_update
Date: Sat,  4 Apr 2026 00:33:24 +0200
Message-ID: <20260403223327.1831215-5-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403223327.1831215-1-linus.probert@gmail.com>
References: <20260403223327.1831215-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames EFUSE_ShadowMapUpdate to rtw_efuse_shadow_map_update in order to
conform to kernel code style.

Discovered using checkpatch.pl tool.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
v6: no change
v5: reworded subject
v4: distinct subject
v3: created

 drivers/staging/rtl8723bs/core/rtw_efuse.c        | 6 +++---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 ++--
 drivers/staging/rtl8723bs/include/rtw_efuse.h     | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index d6212b3b0b1d..f873250e0f7e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -201,7 +201,7 @@ static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Val
 }	/*  efuse_ShadowRead4Byte */
 
 /*-----------------------------------------------------------------------------
- * Function:	EFUSE_ShadowMapUpdate
+ * Function:	rtw_efuse_shadow_map_update
  *
  * Overview:	Transfer current EFUSE content to shadow init and modify map.
  *
@@ -216,7 +216,7 @@ static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Val
  * 11/13/2008	MHC		Create Version 0.
  *
  */
-void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType)
+void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 	u16 mapLen = 0;
@@ -230,7 +230,7 @@ void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType)
 
 	/* PlatformMoveMemory((void *)&pHalData->EfuseMap[EFUSE_MODIFY_MAP][0], */
 	/* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], mapLen); */
-} /*  EFUSE_ShadowMapUpdate */
+} /*  rtw_efuse_shadow_map_update */
 
 
 /*-----------------------------------------------------------------------------
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 941c2ebef9e2..3dff8aa2badb 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1188,12 +1188,12 @@ void Hal_InitPGData(struct adapter *padapter, u8 *PROMContent)
 	if (!pEEPROM->bautoload_fail_flag) { /*  autoload OK. */
 		if (!pEEPROM->EepromOrEfuse) {
 			/*  Read EFUSE real map to shadow. */
-			EFUSE_ShadowMapUpdate(padapter, EFUSE_WIFI);
+			rtw_efuse_shadow_map_update(padapter, EFUSE_WIFI);
 			memcpy(PROMContent, pEEPROM->efuse_eeprom_data, HWSET_MAX_SIZE_8723B);
 		}
 	} else {/* autoload fail */
 		if (!pEEPROM->EepromOrEfuse)
-			EFUSE_ShadowMapUpdate(padapter, EFUSE_WIFI);
+			rtw_efuse_shadow_map_update(padapter, EFUSE_WIFI);
 		memcpy(PROMContent, pEEPROM->efuse_eeprom_data, HWSET_MAX_SIZE_8723B);
 	}
 }
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 7b78fd5e583b..e73f9396e9ca 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -72,7 +72,7 @@ u8 rtw_efuse_calculate_word_counts(u8 word_en);
 u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data);
 
 u8 rtw_efuse_read_1_byte(struct adapter *padapter, u16 Address);
-void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType);
+void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType);
 void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
 void Rtw_Hal_ReadMACAddrFromFile(struct adapter *padapter);
 u32 Rtw_Hal_readPGDataFromConfigFile(struct adapter *padapter);
-- 
2.53.0

