Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDD0372EF5
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 05:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775108560; cv=none; b=IeLImvEglOa155AGiqnqsH1Nh8L/VboRm0ociFB+HdqEc/997JcSQCqfBntPIhPZbU5FLDuEM4oOYjEOgkK/kvnWc8/qmfCMCtNi+/Vc1rKpDYHw4VUvyPVJAXZ17GV4j/EZ1v3cf2SGw4ThpRzKt/8ysBOl3ArPJbNUClkMakg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775108560; c=relaxed/simple;
	bh=5EugYv/hk5fHXMqpOxvsXIhI4PH+kItJEXXNeX5NR08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hNAzTOdDmbtuW0LmA/cyN5TsbY8fOLnziC8o/vNfk0AUzDUM+vnVsT8QVfAhtOXfMvHGbkwe/2Wd8H5ZyYzfKRmoZaMpdcVAU+wE7z/wS+roxavVN+GXlZnWmIIJAUxTqFlqSjzgSgtXjgzdLTVm4h4EbT8S3OirMosY88VmfiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WTeCsS5X; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTeCsS5X"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38a67221fe8so3662001fa.3
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 22:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775108557; x=1775713357; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyDNPtJ0NQsmpyh5bupIHdoXCNIRJUzpbXAkWq1pAQg=;
        b=WTeCsS5XJPuzkbv/GyyNcdt/gdRBlsb3OIT7obW1CrL83EkdrR+vRX0MOF6CmuvSey
         lHLIz+M+a80Y2E/IwZWYEuDWj/s8z4Yr6asdUuEjC4FKQ02YkMU2vRPEd+ZjzzbUCseZ
         7ve//Xgr2qtfW6Mr3ez9W2URA4Xq168QqTaEby8aTP6qkpD7PvZ1BGONvH9/xvAcwqfj
         2OOGohb+1qTdPlJ0U0YMjdzx8x2N8g6ujO55wK1EZRj40Rzchr+Yb0fwGMiXjASECUuF
         l4xl9yr5waJBxVRrnNR9lcqo7/T4PJywwsT+4xFf/OfJ2nxRg3f/q4Pe38ri6qM4nPnp
         Fa/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775108557; x=1775713357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZyDNPtJ0NQsmpyh5bupIHdoXCNIRJUzpbXAkWq1pAQg=;
        b=UT4ZhHP+xNk2JpV2HV/DH/ShQKZfFdSK8p/0d3fLrMiHJw4bSM4YUeo80Ii1zuf23f
         5oW0WCKsLeAm7Rg/zlso/wbUhhEAYgD/YX5Nk1qsm1Q2/IwJtyeKFuvN02MLw7G1KNUk
         O8zlm15GZOh2/LL90gky7y7Ku6qejBhO1UYvSoViMwqq25KH+rO6ioAMZXLgdUSG0f/A
         EB63TFuZ2cE5tgEec0Xeh8nSwbF0yi5P8ZKLf26melPUHOQsfUiX47Q6bbDvBVJYK1JP
         7aqNTdybJNQKmfw8w9i8kCrM2Rm3+lsW3312PSLHMxq4eUFmtG5X0Vn2+ycZ8gC7YAKI
         KgvA==
X-Gm-Message-State: AOJu0YyeH9yw1GY3oLrTVW9AWmHsjZeMC1CEvYSrxCvhKAC0lvgkrbgE
	a3xR62Iwjh3bzU4pOw0Mo73EAUG5Ge0w5XDkGgLgLL5AA/eNs6skRppdnkowyP+U
X-Gm-Gg: ATEYQzzEoyX77K/qn2HyJ/wBS2zcTRbYdcqXW12XcOASoCISzV3qwZ9IPiHxQA8nRPQ
	1f8F8ChRE9usCcDuuZnlucy5nasPuQiV7/ZIYeLLbXXedm8zrBaiN9eK/lAa/dwUqbnRSwiqQKh
	0z36FFkjEk0CjPIYGYcBfKf7BFvLusThxEL/+wQHwRaX57xwdvbzmrcWRwvZ3OJdeZYkUojKK7/
	B3ZQDTJdn9k19wAYpFThoqCuXKVlWuaVNJIlzxhOA0iroCvRVHKR3yZj0lO2a85E1xO1KB9q2L/
	LGIHL26Yb6TqtY4X/yqmlKC6Jb3qkTt+0MpYyHDZzTMBLoi5/5Osut7SddhDcTTphSvIzNC3ZcY
	+vKrOR0kweK2xCPlhR2H6ABBYtDgXbnMEcD7RxFuGLwTMEIbZAUeqw99mc1UQw+fsrSpPi39qzx
	mBhR6c2MOXWhoXQF64NbJU+83egPDR
X-Received: by 2002:ac2:43ca:0:b0:5a2:c914:8af6 with SMTP id 2adb3069b0e04-5a2c9148b33mr279147e87.3.1775108556750;
        Wed, 01 Apr 2026 22:42:36 -0700 (PDT)
Received: from localhost ([2a02:aa1:115f:85c8:99af:b9fd:7f92:d8b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c95294sm458331e87.12.2026.04.01.22.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:42:36 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v5 3/7] staging: rtl8723bs: rename EFUSE_Read1Byte() to rtw_efuse_read_1_byte()
Date: Thu,  2 Apr 2026 07:42:11 +0200
Message-ID: <20260402054215.271981-4-linus.probert@gmail.com>
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

Renames EFUSE_Read1Byte to rtw_efuse_read_1_byte in order to conform to
kernel code styl.

Discovered using checkpatch.pl tool.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
v5: No change

 drivers/staging/rtl8723bs/core/rtw_efuse.c        | 6 +++---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 3 ++-
 drivers/staging/rtl8723bs/include/rtw_efuse.h     | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index a7b120cc70a3..d6212b3b0b1d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -26,7 +26,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
 }
 
 /*-----------------------------------------------------------------------------
- * Function:	EFUSE_Read1Byte
+ * Function:	rtw_efuse_read_1_byte
  *
  * Overview:	Copy from WMAC fot EFUSE read 1 byte.
  *
@@ -42,7 +42,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
  *
  */
 u8
-EFUSE_Read1Byte(
+rtw_efuse_read_1_byte(
 struct adapter *Adapter,
 u16		Address)
 {
@@ -79,7 +79,7 @@ u16		Address)
 	} else
 		return 0xFF;
 
-} /* EFUSE_Read1Byte */
+} /* rtw_efuse_read_1_byte */
 
 /*  11/16/2008 MH Read one byte from real Efuse. */
 u8
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 355167883f08..941c2ebef9e2 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1559,7 +1559,8 @@ void Hal_ReadRFGainOffset(
 
 	if (!AutoloadFail) {
 		Adapter->eeprompriv.EEPROMRFGainOffset = PROMContent[EEPROM_RF_GAIN_OFFSET];
-		Adapter->eeprompriv.EEPROMRFGainVal = EFUSE_Read1Byte(Adapter, EEPROM_RF_GAIN_VAL);
+		Adapter->eeprompriv.EEPROMRFGainVal = rtw_efuse_read_1_byte(Adapter,
+									    EEPROM_RF_GAIN_VAL);
 	} else {
 		Adapter->eeprompriv.EEPROMRFGainOffset = 0;
 		Adapter->eeprompriv.EEPROMRFGainVal = 0xFF;
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index b8cd9e694f56..7b78fd5e583b 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -71,7 +71,7 @@ struct efuse_hal {
 u8 rtw_efuse_calculate_word_counts(u8 word_en);
 u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data);
 
-u8 EFUSE_Read1Byte(struct adapter *padapter, u16 Address);
+u8 rtw_efuse_read_1_byte(struct adapter *padapter, u16 Address);
 void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType);
 void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
 void Rtw_Hal_ReadMACAddrFromFile(struct adapter *padapter);
-- 
2.53.0

