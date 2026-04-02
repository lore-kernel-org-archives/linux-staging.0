Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F656379EC8
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 05:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775108565; cv=none; b=NskfgyvRsxv44mnupZw/mhrgu8a+xuW4youBbID08cftGBs0BcXFU/H7eLpZYUJnamzFiTvZLtj8dNMHocr49eWyJbL5uhP58Ybvh8uSOzTO1K9VniqzRovwCUSkiyOXYjpkHjFnMC/q22GKrSgP8F+qNiS0fUVJ19hMYD100X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775108565; c=relaxed/simple;
	bh=nDO/0+BPV4qmMcFRgC9Rt4E356dFnZx3qCPBUivIz0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J/RWclNi1LYbLrQxZ4jPEtRzGITM2utZQZd9tUQac+VdymIwWi4roUDCArwauGRxTWRqleLsR/HDlqjyqPl9sv3QSTxCrkkhLZJko0Xsdf/E20Y9CTpJqNLWXHgBG9DzTFrkV9jtZqiUrNSkeoErkaY8b58ZXDndHZy9jqwOues=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8noJ1j1; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8noJ1j1"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a12cd0bcd8so623866e87.3
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 22:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775108562; x=1775713362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JejQ1SzaR6fVTUzK1ujXybjzURUXpROQ8m0vezwQ2Xs=;
        b=W8noJ1j1KGLg5lK90EHImFXH5+acv3alDUiAkjw4YgRI2VBmOMK/kzVzhN4+tvqT77
         36dfeAdY4Kf6zo7TrEnDNlFUlJZCJBCsk1g3cs9MePogWQXzLC5Cv6IxPqyvWet1EUBc
         48dvxxWXiA2+rgXfHDSbiDe6nSEvH+kCNtFvtT+8IxpQ6+VUQ6ZEK7FbfUza80DzqyjH
         X2oHlBi8tOvPwtY1+97I1lqGYoBvg9qAIhfK2jwM90Y1Y5zHS9kHoMsKbqXNBKZCLCku
         uizRfNIzONEDgm/M1aRhXeWBQXBzPQWD04389ck7ADY6qWFUaX+gqbQ3jmmFhKT+9dFl
         gIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775108562; x=1775713362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JejQ1SzaR6fVTUzK1ujXybjzURUXpROQ8m0vezwQ2Xs=;
        b=pGldDKZ1Rt0aVLXYzRRUAWHFgjqP4LobiJeByQovPsOqma6SAe88+xV1a8w4n4htqp
         0gb38f//NbM7eS9QBBIJP5u1AHCgNAqo6rx5MfbEzoBN0JeUyQ7hBceEAVUP99Wp+qjS
         HbR2MiLCgrwAiqh4A1rUkdxCFAogJyGJ3FEfNyyTJSM27ftMuzi/hIy6tJeaJb3od+H1
         5sOzmGfM873RSVlvZ/tfXYNCxV5f+dM/3fvo7ud0hZJruEQ4SwgkvaZ1wU1ISkAjXFL2
         YxHmjzTBO0oBZJmapOiJaEtSN6fFOPVduD8bArVn0ltHCKloFeixmqPORizb12EaHjcK
         Q2yA==
X-Gm-Message-State: AOJu0Yz9yFe9E6a70BrCvcTPRh9LqL/lXyOK4VXu1844SaXDhal2JXMW
	N/C/e/cUe29LaW5xvWLiAM7HMw9n8y9q0FNS1Rifwz69SitQ/s50W6Sn
X-Gm-Gg: ATEYQzzlSNXlJOEnIhz3WNBwSyj44eSDaGtxatdeZVjtvlwG29IOefTOvcIMpCkgAZa
	HTTYg53c9QAPtm+0fxGDEBpP39yVBndNSSVUzmVSPzuRQFPv+2aPofxczSFjVJQxfknd4b80dLM
	c5VZdtxer3kIZL9c3JcVuoxOlqz2wQnDWt43dJU6MHDL4aHotJzd1bvvs341m03MEiSBU5CnwyJ
	xZjkTvBj+8Arrla5zBiCyvMTzg1ahGDBESlI5B/RDDtCHdn2LXRRxFf8n6ejXLcku2jQq4WU83T
	sohGsCpgy8xg48FdwqufqY9VqxpRDuRgznd+hYMw4v7waoh7u5erdHOmxR3RNYa1u/R6SN5Vft/
	f2j6DjtpOI1pq7E70slvvuf+67gLQxjZZttiUbiqhIAarHQ08zgCnOYarYygePmvtJesEjKHJQV
	HlK99aydXsRYL32bURvYiS3aTaQYUE
X-Received: by 2002:a05:6512:3d0d:b0:5a2:c453:3658 with SMTP id 2adb3069b0e04-5a2c7676383mr684966e87.43.1775108562210;
        Wed, 01 Apr 2026 22:42:42 -0700 (PDT)
Received: from localhost ([2a02:aa1:115f:85c8:99af:b9fd:7f92:d8b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9c3b6sm438438e87.19.2026.04.01.22.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:42:42 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v5 5/7] staging: rtl8723bs: rename EFUSE_ShadowRead() to rtw_efuse_shadow_read()
Date: Thu,  2 Apr 2026 07:42:13 +0200
Message-ID: <20260402054215.271981-6-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402054215.271981-1-linus.probert@gmail.com>
References: <20260402054215.271981-1-linus.probert@gmail.com>
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
v5: No change

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

