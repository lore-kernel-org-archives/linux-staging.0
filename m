Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78DE265637
	for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 12:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755953029; cv=none; b=gzrmINiY+HWBaCWl+0+Cn3kTRXEe5oc8X3sGcJLYe5B1Q425SJ73/nAJpRtUTxdD8Y4PiZpza8ismRW6xHbsR/ZEYuIWIj9kLhaJUOXxogWn/uYvHEnr/PA6XpYRkZ/Ft7gDvNZQvTaKrUjzvA255wWwf62eDXPIkWSke7buvQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755953029; c=relaxed/simple;
	bh=h6WCjiBW+6Abga5OJ3bJ1nYtqaNiePuXBUvjxd/SJ2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+KFE1mzTT+qP4h1SB04t4zzB7VAj/sMf5vZ7vQimocx3lKRSiLTCt1MjGfg+qOQIr2wRn3ilQrk/g6uE1N/fkh9Y5XvSNp/5UTvPIz7C9xFamCjAUHGcFFqvRmmmCLac1vZ5CR3f5thH0KEjTcowktzSkoS4lrwOBhxIsdmwnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2IFybEl; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2IFybEl"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb7a0442bso475347666b.2
        for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 05:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755953023; x=1756557823; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlbqi7N+RKHadOcJXN6QLsUwNa0JB43/lNVhOpXVRbM=;
        b=k2IFybElXzklbb6ISNWClK99xwuG02y5isc7tK6JMc4ZfjMDafgVOju/xv64OiTdac
         uFf4kyFdDDaFnws3+Ol7fvI09PIbIsYh/ScxG4rjVPmBaGz161V1yz+dw3SkRc0hAGyW
         aFXLAZJIenraLuwvih7x84lRY0t6+MSpl4EaqbW6BDMn0/NPV/VjH1t1j9STijSYnHKR
         FpwDkg/6lxD98o4aI2cCaP3hkfqWuMNFWjxBWpembUQrODFSw8cDsEBuunjKwX8RFQy4
         exnpE4DXdi2Qrv+ukgMYRbBXfu+x/GGt4JOXoNe3GxRGLTYJT/kTg4rmhckeOnhAd0VK
         1LjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755953023; x=1756557823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlbqi7N+RKHadOcJXN6QLsUwNa0JB43/lNVhOpXVRbM=;
        b=YAmsbeAAC74DMaZ1FtqQ+vj6lBRep4qEMXXP2ggnoHTKUG5A1BPyTs3Oy0eIJrjVMj
         An6V90fKPTfRMqRAxnRgxDyZ0R4iZnWEmCDykNsIogULA/zotjdD5lgEhZHBlK4vEI1V
         8LCOJpq4StvqUW/Ot2/xI5N9MkX6I+tnn+2NJiclhgwhmYxjEHvvhX6fs4XjZ/k+6f52
         sy2iFM000E6IbpvPHws2l6I8PlGS3x8mxfqfZe+fTZN53AgGyQ340mcoJQeVxn3L9AUf
         aHFUSqpEp4ZAzHzJY0AuMNIHlxjKnfqNNqy26d7eefz2lxLfLAXYRE1tWbe9QXI16+rH
         FSJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM3vXE7MaQGOYYor8VqL0cIt3gcIR05ywmAf2zqN4tSYAFAPk+JVGmmq/WewErpdsTdFjZHHB88IEDrO37@lists.linux.dev
X-Gm-Message-State: AOJu0YxMjrswVnrzLcU8fwsRuqhRLVnO9bxNu17mV7KwHqbG8T32+hG0
	ijNYmvoKMt/cn025YEtobJogAkJOFeXSnUx5gtOb1tI5wfvzJdj26Cwf
X-Gm-Gg: ASbGncu0ArLV8UZjqT8FT5HWn6/SLJWOo/gMAsV2YE/SSOkxY+FynEeh+tp/DUeWpNi
	R+I2cv7XUL5jweKLHEjJUk0hbXFJxj2yoDApwwJRDbrUZ6sXYLI7N6t+jDpe3i3GvIJd81JSqRp
	INWNKhK79OMCCZVT35rILzCLdawhkPD7oJK0odRiC0MGcRFheHL7bsZ4X5ZlLYnrkS3rKBFtYKD
	PdX5suUvm0Aewo/Sdh2e3m7lIb1PqC6s1I+GD7G+lX71/m8617I1qF3/r7CK3T35QLZG8CtzwOs
	AJnvvA6fYBcIzuGcDLC7qzUSUb4RdOyTLO2qe/pvPb5dqUIHRpTpkr7uE4+aUwGyiAh0NrsmEmz
	Mbt+OE19ZR4VsqyUL21RCOtR9pw==
X-Google-Smtp-Source: AGHT+IFEWdtvLaf9Gdw4oi4jZxvxE286Zlt9Kn5xDdd7umB2HylCgAGuay9Q64yUjphtsNAfkce+7A==
X-Received: by 2002:a17:907:94cf:b0:af9:c1f7:802 with SMTP id a640c23a62f3a-afe295d2502mr640932766b.31.1755953023059;
        Sat, 23 Aug 2025 05:43:43 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe49a1f5a6sm165076466b.111.2025.08.23.05.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 05:43:42 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 10/14] staging: rtl8723bs: remove Hal_EfuseGetCurrentSize
Date: Sat, 23 Aug 2025 14:43:17 +0200
Message-ID: <20250823124321.485910-11-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250823124321.485910-1-straube.linux@gmail.com>
References: <20250823124321.485910-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function Hal_EfuseGetCurrentSize is not used in the driver code,
remove it to get rid of dead code. As Hal_EfuseGetCurrentSize is the only
caller of hal_EfuseGetCurrentSize_WiFi and hal_EfuseGetCurrentSize_BT we
can remove these two functions as well.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 184 ------------------
 drivers/staging/rtl8723bs/include/hal_intf.h  |   1 -
 2 files changed, 185 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index af61730cff14..0679f77e3498 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -867,190 +867,6 @@ void Hal_ReadEFuse(
 		hal_ReadEFuse_BT(padapter, _offset, _size_byte, pbuf);
 }
 
-static u16 hal_EfuseGetCurrentSize_WiFi(
-	struct adapter *padapter, bool bPseudoTest
-)
-{
-#ifdef HAL_EFUSE_MEMORY
-	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
-	struct efuse_hal *pEfuseHal = &pHalData->EfuseHal;
-#endif
-	u16 efuse_addr = 0;
-	u16 start_addr = 0; /*  for debug */
-	u8 hworden = 0;
-	u8 efuse_data, word_cnts = 0;
-	u32 count = 0; /*  for debug */
-
-
-	if (bPseudoTest) {
-#ifdef HAL_EFUSE_MEMORY
-		efuse_addr = (u16)pEfuseHal->fakeEfuseUsedBytes;
-#else
-		efuse_addr = (u16)fakeEfuseUsedBytes;
-#endif
-	} else
-		rtw_hal_get_hwreg(padapter, HW_VAR_EFUSE_BYTES, (u8 *)&efuse_addr);
-
-	start_addr = efuse_addr;
-
-	/*  switch bank back to bank 0 for later BT and wifi use. */
-	hal_EfuseSwitchToBank(padapter, 0, bPseudoTest);
-
-	count = 0;
-	while (AVAILABLE_EFUSE_ADDR(efuse_addr)) {
-		if (efuse_OneByteRead(padapter, efuse_addr, &efuse_data, bPseudoTest) == false)
-			goto error;
-
-		if (efuse_data == 0xFF)
-			break;
-
-		if ((start_addr != 0) && (efuse_addr == start_addr)) {
-			count++;
-
-			efuse_data = 0xFF;
-			if (count < 4) {
-				/*  try again! */
-
-				if (count > 2) {
-					/*  try again form address 0 */
-					efuse_addr = 0;
-					start_addr = 0;
-				}
-
-				continue;
-			}
-
-			goto error;
-		}
-
-		if (EXT_HEADER(efuse_data)) {
-			efuse_addr++;
-			efuse_OneByteRead(padapter, efuse_addr, &efuse_data, bPseudoTest);
-			if (ALL_WORDS_DISABLED(efuse_data))
-				continue;
-
-			hworden = efuse_data & 0x0F;
-		} else {
-			hworden = efuse_data & 0x0F;
-		}
-
-		word_cnts = Efuse_CalculateWordCnts(hworden);
-		efuse_addr += (word_cnts*2)+1;
-	}
-
-	if (bPseudoTest) {
-#ifdef HAL_EFUSE_MEMORY
-		pEfuseHal->fakeEfuseUsedBytes = efuse_addr;
-#else
-		fakeEfuseUsedBytes = efuse_addr;
-#endif
-	} else
-		rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BYTES, (u8 *)&efuse_addr);
-
-	goto exit;
-
-error:
-	/*  report max size to prevent write efuse */
-	Hal_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &efuse_addr);
-
-exit:
-
-	return efuse_addr;
-}
-
-static u16 hal_EfuseGetCurrentSize_BT(struct adapter *padapter, u8 bPseudoTest)
-{
-#ifdef HAL_EFUSE_MEMORY
-	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
-	struct efuse_hal *pEfuseHal = &pHalData->EfuseHal;
-#endif
-	u16 btusedbytes;
-	u16 efuse_addr;
-	u8 bank, startBank;
-	u8 hworden = 0;
-	u8 efuse_data, word_cnts = 0;
-	u16 retU2 = 0;
-
-	if (bPseudoTest) {
-#ifdef HAL_EFUSE_MEMORY
-		btusedbytes = pEfuseHal->fakeBTEfuseUsedBytes;
-#else
-		btusedbytes = fakeBTEfuseUsedBytes;
-#endif
-	} else
-		rtw_hal_get_hwreg(padapter, HW_VAR_EFUSE_BT_BYTES, (u8 *)&btusedbytes);
-
-	efuse_addr = (u16)((btusedbytes%EFUSE_BT_REAL_BANK_CONTENT_LEN));
-	startBank = (u8)(1+(btusedbytes/EFUSE_BT_REAL_BANK_CONTENT_LEN));
-
-	Hal_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_BANK, &retU2);
-
-	for (bank = startBank; bank < 3; bank++) {
-		if (hal_EfuseSwitchToBank(padapter, bank, bPseudoTest) == false)
-			/* bank = EFUSE_MAX_BANK; */
-			break;
-
-		/*  only when bank is switched we have to reset the efuse_addr. */
-		if (bank != startBank)
-			efuse_addr = 0;
-
-		while (AVAILABLE_EFUSE_ADDR(efuse_addr)) {
-			if (efuse_OneByteRead(padapter, efuse_addr,
-					      &efuse_data, bPseudoTest) == false)
-				/* bank = EFUSE_MAX_BANK; */
-				break;
-
-			if (efuse_data == 0xFF)
-				break;
-
-			if (EXT_HEADER(efuse_data)) {
-				efuse_addr++;
-				efuse_OneByteRead(padapter, efuse_addr, &efuse_data, bPseudoTest);
-
-				if (ALL_WORDS_DISABLED(efuse_data)) {
-					efuse_addr++;
-					continue;
-				}
-
-				hworden = efuse_data & 0x0F;
-			} else {
-				hworden =  efuse_data & 0x0F;
-			}
-
-			word_cnts = Efuse_CalculateWordCnts(hworden);
-			/* read next header */
-			efuse_addr += (word_cnts*2)+1;
-		}
-
-		/*  Check if we need to check next bank efuse */
-		if (efuse_addr < retU2)
-			break; /*  don't need to check next bank. */
-	}
-
-	retU2 = ((bank-1)*EFUSE_BT_REAL_BANK_CONTENT_LEN)+efuse_addr;
-	if (bPseudoTest) {
-		pEfuseHal->fakeBTEfuseUsedBytes = retU2;
-	} else {
-		pEfuseHal->BTEfuseUsedBytes = retU2;
-	}
-
-	return retU2;
-}
-
-u16 Hal_EfuseGetCurrentSize(
-	struct adapter *padapter, u8 efuseType, bool bPseudoTest
-)
-{
-	u16 ret = 0;
-
-	if (efuseType == EFUSE_WIFI)
-		ret = hal_EfuseGetCurrentSize_WiFi(padapter, bPseudoTest);
-	else
-		ret = hal_EfuseGetCurrentSize_BT(padapter, bPseudoTest);
-
-	return ret;
-}
-
 static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 {
 	u32 value32;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index fbf0b01780ea..4fe48cccb889 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -270,6 +270,5 @@ void Hal_ReadEFuse(struct adapter *padapter, u8 efuseType, u16 _offset,
 		   u16 _size_byte, u8 *pbuf);
 void Hal_GetEfuseDefinition(struct adapter *padapter, u8 efuseType, u8 type,
 			    void *pOut);
-u16 Hal_EfuseGetCurrentSize(struct adapter *padapter, u8 efuseType, bool bPseudoTest);
 void hal_notch_filter_8723b(struct adapter *adapter, bool enable);
 #endif /* __HAL_INTF_H__ */
-- 
2.51.0

