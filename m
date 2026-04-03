Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6156285CA8
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 22:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255634; cv=none; b=eUOrJPa2CUJ7EJxMfuzx1/pYu/5uFAuXC1fFk9J8ju+wb+9Ps+If5o5DUvekOAWLokm4EzKPCyKYwk6wLlB4umtIIpA6+QbMPt76F6raUgDstJaTJjDYmd0CtScaSrOV0KqWueS2IoRHgEbR77WDgl1nLymUvElfbXG3e2tJcYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255634; c=relaxed/simple;
	bh=5//L7lu03RjsKkvACQPN87WA+4Iv/i0UAJbOSwCwXLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D7KyBn77aQ6Lh9jLuU3Ova0mqvMVpk222FUfM/5rTyDaso4kKpz+AmBuxL0HB5CP4RsvPnp/ep/Kk7YHG7qacqdicR6x5813uaHBEAB9cbR4ccK8t0bHV6c1HfFF4cBH2cCNzfZaYE0eTrtMu1uB7KQzgmEURJa8mUPXXIfWWaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4SqQ0lD; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4SqQ0lD"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a3d2824e4bso9502e87.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 15:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775255631; x=1775860431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALj3d7cqRFhL1K+Fn15fiQjYxFLPBCGw4qwIak2lxTA=;
        b=W4SqQ0lDeDCHS6c/rgNOsVB8LS9fmrwzd2CV45OTOg8XtO8fPjOfUW3ebjEXnPvlnB
         ykjasQeWMasikG+teP7uWo6Cew7XctdFhmuH7opngS9Z8GaeDsZPSLawR9MHSY0Bppp7
         Axh+qgxjuvbkbEHuSyuPNztGtArzdrfOHtcBl0QVbNnyqU57x1vAhSqlkMiF3cPmNf3+
         fF85Mx1yjjLiCRAqDEeGz7nzFuW7PGZf/9nSxb5YJrU+5OBhV2rCPFG2YfFT/LAknWSq
         RkjcHZp3wWXJN4t0PJACvT05Qd74OjcnrKiy6rhY8fcMmfoVvBSOhRskPFWx5pyDC7Mz
         Et2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255631; x=1775860431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ALj3d7cqRFhL1K+Fn15fiQjYxFLPBCGw4qwIak2lxTA=;
        b=EelVQVaJhQEKe866AdC/wAzBaRUm9eMrKkla7h1OsbfMv4GrNX/f6lWSEvXgAF7p0I
         6NxMPBpMeSXdyXYn7BTTSxpUZBGV4J0Clv+ysa6zzAJ+TpHsJe+xNK7226KMkCqwrJri
         C66PNmEW3nXS0AbfpAfDrXeoDA9nrfU4eMQ/bwwLZCAIwsjBk5OTMuoeNn5cm9/8EGdG
         hcwmxvi7JWEKhVMHPYa+1csGOwkF89alIUwRb6KtMvkesBNLMfyA+MkxJFJFH7nNlM2h
         XJQEtRwfck7+0BzCeW9VOIS853+9RzPJjYsRpsPO2BccuZ7kirOGRR7Uo+pwe1v2NEA0
         gVUw==
X-Gm-Message-State: AOJu0Yz+fDZ+fYVFUpZm1+G2TphsXfAGk+w1cAqgjStHjq0BL3YWNlji
	GrGQyPRik9H4VePpaBNQvcloJtrCY8ULnCpdMIfiyWn4eMgk2IoM0Ec6
X-Gm-Gg: AeBDies0OErfNk4NfDNnIQzJKBwyvIB3+zyzw5zbfR/O0AZaswvC9zpC3yNIjicI/yW
	jiXX+OSp7bN+SSJMD9o7gfBGi1U2BRUEr7hxmhyUgUjEfyAaNCwcMu9pt30X5eWt9TJeJlRVTDc
	o2FajBWBptK5aDfLuAncxtJfLkIKxyLwnK/0dX5SyYtzc0EcsgTOZzA4PFmLigpudAeS3F6PcEJ
	A1NYbQT4fLTLfvXVcG5Zz+GmByrke1Af04T5zYTugVXDnr02SmTSQOIqntXQbtsQlbi+gpA4cSv
	WNQiFsJVhIemDRpKZ73dt8FVOYiN/lePKOBQ246QlaNdnSv+Ka441WrvVBmpPuC3VwcP4x0K7Xp
	XgBoHW0Uzr5jSsbsbeZFxNFDwQqTq2XE5NnIquEpdL6VDfXf6qdJcdThqeJBjTnSD21mtGbUdcA
	dm46kF69alKhFGM0T+SGfAK/umKvjkmSjz4jAki/pC6+/NLSyKmHL6
X-Received: by 2002:a05:6512:1295:b0:5a2:9635:b1e0 with SMTP id 2adb3069b0e04-5a33755d87fmr1430991e87.16.1775255630687;
        Fri, 03 Apr 2026 15:33:50 -0700 (PDT)
Received: from localhost (94.191.136.33.mobile.tre.se. [94.191.136.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd15f8sm1686042e87.69.2026.04.03.15.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:33:48 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v6 5/7] staging: rtl8723bs: rename EFUSE_ShadowRead() to rtw_efuse_shadow_read()
Date: Sat,  4 Apr 2026 00:33:25 +0200
Message-ID: <20260403223327.1831215-6-linus.probert@gmail.com>
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

Renames EFUSE_ShadowRead to rtw_efuse_shadow_read to conform to kernel
code style.

Discovered using checkpatch.pl tool.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
v6: no change
v5: no change
v4: distinct subject
v3: created

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

