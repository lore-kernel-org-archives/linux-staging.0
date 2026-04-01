Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C97947DF8E
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 19:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775070508; cv=none; b=YZQo90NjQrS+i85Ijuktv3TqhxQjmF7qGn3NzvQvgcMbOKnEtfFyUaG4Ix9nG6XBlgASax9XKCliazA7NApL5YIwaFDQdGv9fyvJnJGq1/cpB3KAYEsI9T9TOOnWXEpKR8k6brVc+D2AWmlwKBDbcbimUZZsbtM5cZHFWvbM2g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775070508; c=relaxed/simple;
	bh=DlTzWCR9dp1ktUqva46+irHpkbHIA64tPnZi9QqzsC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TokqOTxZUjn51j2liuAqW+/VJoPmeX39i0Ih4nrw/UIXhlVQ5X5vNoF9fXPs7wmFo649SPXCVNxZk0yTTCJl5i68oCeXOvJGdAKnbl1b/lxROnglv5oScsEHYfS7ciTn2WNQ0roI0zo438e6mFr9rxxysBUkqQ6Db+JIuBYeeoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8FfLTSC; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8FfLTSC"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a2beae348eso188195e87.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 12:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775070505; x=1775675305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTwaEO4DYw6wKY+xv1L09gHJJLQTGr3pGjT4LYD7Cp4=;
        b=Q8FfLTSCckkw/hr+pA08MKIAZlMGwFNYHquIPQWaUK/LXSdUkkL0gm0qCkNGYYWm75
         oielWLk+hTK5ie1/Osyh8IPxAkZhG+wNK9heiRKpD0Po/oPLJoJAK5sWl4OOofohbDPK
         tX5FPZJEFnmxz+k7wmRiLLsGPh/hqcXIpUq63I07lARrxYH4UHMB8b+rOLK8ZxKKkfZS
         HhvHCyacQtVkl+W4QFvRxhLJwHZwsp7oo6pbzFGCvlIyURttomXNnYyc1JpnahLllJQp
         1eFK0vQwq1JjSvEt4qONntcPlAIWbW8D7tU4FNeHq/n7T/F7VGKCLQHJIqO16XjCDekL
         R9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070505; x=1775675305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nTwaEO4DYw6wKY+xv1L09gHJJLQTGr3pGjT4LYD7Cp4=;
        b=LDXa/SgdiUJZVTmBKKYIx8BJI29Mc+al8vjvYIGreJPE8r+rn5NG5xfkvfi4siGMVO
         ofkzTz1e0WCX1HKcdB1pfDstbAIpksAt9aDgzW+Hszo08KIj7TcP+wsz5dfWgn9CEVNY
         7GqsWSsIMP/JwXbLt6Czdv/VZwsX5VcNH7E95+Dplq0ey8PfZKo+UVL+kerzdc19TpAL
         SEjFhL5eGIXW/iHttdmiCjCRVBn2v83Enm54gP5zQZY8/RLj1Xa7vBG9ZeLw4+cX2m0e
         SlyXGxz3a7PONgC4TdEww5OJpUaSN6P0vqfa7biDwtcjMPW1nkCMgPIGaKh2H8kvGQ1K
         L0fg==
X-Gm-Message-State: AOJu0YxLqA8Si8ohVw4INcbS6xNsVEuw2/Fkxmz6m0+To7O898d60wcY
	XnBplO9dIEI7sGsDkNU05EpYM988QUo5HMOgNBYyu3b1csZhP1dVDWk4
X-Gm-Gg: ATEYQzzweZVA+OJ8qtWK4E0wMbbRDLEiquEo4Q2tcfDy1Wq7Y1DGzRmUqGJipxSqTqs
	zfgDR75q2L4hFIFt3TRAuQSNF9SOS5iqRi3TaqhH1z8Ts6yrI2HvOvs/ANCTug9ZaH83Szlp/Qe
	V2DUR+qmLgXT/7Ew6QVdDuywPyioEWx/rRfYnfJzHelllW8UJ9gBFS/dI3VgOAVXn924hHgXuet
	y5Kuzp1lC7dl8TpU8nKBgpMAvD4fzq18GMuaQtNIuHh/K9wGE193ZLBtcPz5bkq5YgemD/CmsyO
	nhTmHAfJ2bg1ldByBWOxGkSEelwrkJwWMmZ5i1bArQERJCbocjMQa3qmTGt4itLsQGa1l1HUgb3
	4qqT3AdNlCaD9wXOzGsz7hVw7e+6fVgf/JTPHm6BFQeQF4wJv/zZA+D7HQjLUGkm+hYX5NPpIvB
	mJUEDZnrHP979opaQdMSVkMNrS3glk
X-Received: by 2002:a05:6512:61a2:b0:5a2:8433:af35 with SMTP id 2adb3069b0e04-5a2c1eebb1cmr1832382e87.13.1775070505212;
        Wed, 01 Apr 2026 12:08:25 -0700 (PDT)
Received: from localhost ([2a02:aa1:115f:85c8:99af:b9fd:7f92:d8b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccc962sm133245e87.61.2026.04.01.12.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:08:24 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v4 5/7] staging: rtl8723bs: rename EFUSE_ShadowRead() to rtw_efuse_shadow_read()
Date: Wed,  1 Apr 2026 21:08:12 +0200
Message-ID: <20260401190814.216333-6-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401190814.216333-1-linus.probert@gmail.com>
References: <20260401190814.216333-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames EFUSE_ShadowRead to rtw_efuse_shadow_read to conform to kernel
code style.

Discovered using checkpatch.pl tool.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
v4: More descriptive subject

 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 6 +++---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 2 +-
 drivers/staging/rtl8723bs/include/rtw_efuse.h | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index f873250e0f7e..94b00d3c61cf 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -234,7 +234,7 @@ void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType)
 
 
 /*-----------------------------------------------------------------------------
- * Function:	EFUSE_ShadowRead
+ * Function:	rtw_efuse_shadow_read
  *
  * Overview:	Read from efuse init map !!!!!
  *
@@ -249,7 +249,7 @@ void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType)
  * 11/12/2008	MHC		Create Version 0.
  *
  */
-void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value)
+void rtw_efuse_shadow_read(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value)
 {
 	if (Type == 1)
 		efuse_ShadowRead1Byte(padapter, Offset, (u8 *)Value);
@@ -258,4 +258,4 @@ void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value)
 	else if (Type == 4)
 		efuse_ShadowRead4Byte(padapter, Offset, (u32 *)Value);
 
-}	/* EFUSE_ShadowRead*/
+} /* rtw_efuse_shadow_read*/
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index f2f73c65a636..3b3fac981a27 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -574,7 +574,7 @@ static bool HalDetectPwrDownMode(struct adapter *Adapter)
 	struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(Adapter);
 
 
-	EFUSE_ShadowRead(Adapter, 1, 0x7B/*EEPROM_RF_OPT3_92C*/, (u32 *)&tmpvalue);
+	rtw_efuse_shadow_read(Adapter, 1, 0x7B/*EEPROM_RF_OPT3_92C*/, (u32 *)&tmpvalue);
 
 	/*  2010/08/25 MH INF priority > PDN Efuse value. */
 	if (tmpvalue & BIT4 && pwrctrlpriv->reg_pdnmode)
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index e73f9396e9ca..1012831c7eb5 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -73,7 +73,7 @@ u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data);
 
 u8 rtw_efuse_read_1_byte(struct adapter *padapter, u16 Address);
 void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType);
-void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
+void rtw_efuse_shadow_read(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
 void Rtw_Hal_ReadMACAddrFromFile(struct adapter *padapter);
 u32 Rtw_Hal_readPGDataFromConfigFile(struct adapter *padapter);
 
-- 
2.53.0

