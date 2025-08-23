Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FF725F790
	for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 12:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755953025; cv=none; b=Mq3WQ1WIn6mtkKsb6WsTCwS+7kb3aBUFazs61rYgl9E4ab6U+2ZSz85CVtUC6KQszi+6W4rNh2AR7kjZYNZ6KxXZJIzBHF0k56SPKEpZ5bjJgPFel/5PS+FvUreGbQ/chpciZaYCPKSklgHOQHYeokvGZPllC8VhkztaossHobI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755953025; c=relaxed/simple;
	bh=PkXGQpIu3CT9MkDPjbhrfHERe13KeKCUlk4Eka85HsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l8l6m2ekuGQ4h4yJnIb0ArO95fqHdowVy5RQ1QLnLj8CU2l05yE/G4D48NH0L/oMp0oA8Z3gluz/0L/kYYusQgPr34D+ZbKfN2MdQTVCOFSnfp5Pw8Pvddx5gwFmiCMKkTe2wXsRWfXNwzyhGsDVS4g+5n7ZMvxPm+KSBeZ1qNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeX6/TGr; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeX6/TGr"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb7a0550cso502987966b.2
        for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 05:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755953022; x=1756557822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBvCvb23Z+9Bc2OcwtiN+FlqbAuREfquDJGcbDfAlSY=;
        b=IeX6/TGrqQv53WWrT73JsNd3zkzh9EC7FUQvvwZcylfnhLn1FlEWgG3KBoQ/vwZwLD
         ugLNqXKlDvZoickmNV053puwm8auNC65aFN/8Y31zhl8LGAumUEYznY2QdpoQ5Bq3hl0
         Le6jNtln2YSkYnMJz4FNhOWC90Pp5/POgdHPfMkhtdLt7UdEDrjM53iQEagM85BgknWp
         731dNQv0WtYwAWI228114Abq5bpWujT2kGlepjvU/PQkHaX3luPcYU4MvED/rrK51Tqq
         QD+eBBPkucL55pMUJ7EFPvlux/HJZ/j+kFHcXytxsXv1bP2bI+jCQfBWufbIC8lg4gsl
         SdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755953022; x=1756557822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBvCvb23Z+9Bc2OcwtiN+FlqbAuREfquDJGcbDfAlSY=;
        b=rguMTMV0GRnmYiqg7CJ0UzVvKQPFTmny7kB8FZ2+OFjH3yhCaRc8YpAQihaNJGpZbf
         nBDjp2Oa7T6SDliORCeAku6psnlqhQqtu/VDQmXCc68iValr4jhxYZmCMfUzxDIaqt4l
         VCm6NavCue4YIoozm728EGtRIXZEHnVUEDSBwOqgxoxFgoR9LenMYE7Ri8xM1aGHR4Jd
         62Yr38B2Z+MKCeM5rqTdL3h1UyD+3oA02UQVAWKbVaZYqE/338ogNzACqo6E+dCcE78t
         Lc/0lMQJE82LKkgCPWFJsJO7v8Qnbe4z5mBWBiHOX8U7xT9mHm3qvqDweRnvFl2k3rC7
         tEyg==
X-Forwarded-Encrypted: i=1; AJvYcCWoLTASRhUjzH5+rM7P1ZWFso6lqeX25AA0CqjxgxFh2X5wsiNm/ctMdxs05jhH7jLCDdPUBWRvsoa3+nJH@lists.linux.dev
X-Gm-Message-State: AOJu0YzPEJwdeg/EgWU3lA2F/f6HQ9n8NYal1Qrf0XQUdGdi/6bV5iaB
	gK037KTFJhOE916ULOfRpj8bsIKZc4nL5VRSes553ABDzXhmqT3pz3AP
X-Gm-Gg: ASbGncuhecuoukzlFw1apNPczqODUGEViuVXBq4YLryJbCs6w3n3ahXUuzl56gTUR5F
	nRv/bnsmsuffc/oVFiYuwrOeRPexjdTpgPxTl1UELdbaU/T10yajMWxR4CanYhq46jMcMLbj/4e
	HYHQEpuedlkjQK4YRs7/G9dwRh+79TCPA4LWE47hSwSZwMGu2lJF7DRFrLZ06KuJf6SPq57KopV
	yNQPUhUmdjXdb73Pk9K/XBF8uP7T354d56el/UV3G30G2mXytgtRVWhrNmkiX6shyjsJAw6Xiak
	n7VULhXeuNWGHF998DeHWcYkH5kYWPImJVC1c/+7tufi6MSCguYByE1JMxLzE0XqyOcWfB3R4JU
	Js1Ykjzj/hH+oPwd0LoSbmUEJFg==
X-Google-Smtp-Source: AGHT+IGcDrKg1c3I3k2qWHrMI/GPriAUQeuJB2oG7JtfMQiUYFwCepN5YYM9fY0UzXW4NF+sHAPPMA==
X-Received: by 2002:a17:906:491:b0:afe:57e0:e421 with SMTP id a640c23a62f3a-afe57e0e9c1mr111976566b.26.1755953021752;
        Sat, 23 Aug 2025 05:43:41 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe49a1f5a6sm165076466b.111.2025.08.23.05.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 05:43:41 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 08/14] staging: rtl8723bs: remove wrapper EFUSE_GetEfuseDefinition
Date: Sat, 23 Aug 2025 14:43:15 +0200
Message-ID: <20250823124321.485910-9-straube.linux@gmail.com>
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

The function EFUSE_GetEfuseDefinition is just a wrapper around
Hal_GetEfuseDefinition. Remove the wrapper and use Hal_GetEfuseDefinition
directly.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c     | 18 +++---------------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c  | 10 +++++-----
 drivers/staging/rtl8723bs/include/rtw_efuse.h  |  1 -
 3 files changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 388d885c938f..25ec7278b815 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -97,18 +97,6 @@ Efuse_CalculateWordCnts(u8 word_en)
 	return word_cnts;
 }
 
-void
-EFUSE_GetEfuseDefinition(
-	struct adapter *padapter,
-	u8 efuseType,
-	u8 type,
-	void	*pOut,
-	bool		bPseudoTest
-	)
-{
-	Hal_GetEfuseDefinition(padapter, efuseType, type, pOut, bPseudoTest);
-}
-
 /*-----------------------------------------------------------------------------
  * Function:	EFUSE_Read1Byte
  *
@@ -135,7 +123,7 @@ u16		Address)
 	u32 k = 0;
 	u16 contentLen = 0;
 
-	EFUSE_GetEfuseDefinition(Adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, (void *)&contentLen, false);
+	Hal_GetEfuseDefinition(Adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, (void *)&contentLen, false);
 
 	if (Address < contentLen) {/* E-fuse 512Byte */
 		/* Write E-fuse Register address bit0~7 */
@@ -269,7 +257,7 @@ static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse)
 
 	Efuse_PowerSwitch(padapter, false, true);
 
-	EFUSE_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen, false);
+	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen, false);
 
 	Hal_ReadEFuse(padapter, efuseType, 0, mapLen, Efuse);
 
@@ -345,7 +333,7 @@ void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType)
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 	u16 mapLen = 0;
 
-	EFUSE_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen, false);
+	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen, false);
 
 	if (pEEPROM->bautoload_fail_flag)
 		memset(pEEPROM->efuse_eeprom_data, 0xFF, mapLen);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index fe6a3dd84aca..5355bb80b676 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -741,7 +741,7 @@ static void hal_ReadEFuse_WiFi(
 		pbuf[i] = efuseTbl[_offset+i];
 
 	/*  Calculate Efuse utilization */
-	EFUSE_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &total, false);
+	Hal_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &total, false);
 	used = eFuse_Addr - 1;
 	efuse_usage = (u8)((used*100)/total);
 
@@ -780,7 +780,7 @@ static void hal_ReadEFuse_BT(
 	/*  0xff will be efuse default value instead of 0x00. */
 	memset(efuseTbl, 0xFF, EFUSE_BT_MAP_LEN);
 
-	EFUSE_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_BANK, &total, false);
+	Hal_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_BANK, &total, false);
 
 	for (bank = 1; bank < 3; bank++) { /*  8723b Max bake 0~2 */
 		if (hal_EfuseSwitchToBank(padapter, bank, false) == false)
@@ -843,7 +843,7 @@ static void hal_ReadEFuse_BT(
 	/*  */
 	/*  Calculate Efuse utilization. */
 	/*  */
-	EFUSE_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &total, false);
+	Hal_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &total, false);
 	used = (EFUSE_BT_REAL_BANK_CONTENT_LEN*(bank-1)) + eFuse_Addr - 1;
 	efuse_usage = (u8)((used*100)/total);
 
@@ -952,7 +952,7 @@ static u16 hal_EfuseGetCurrentSize_WiFi(
 
 error:
 	/*  report max size to prevent write efuse */
-	EFUSE_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &efuse_addr, bPseudoTest);
+	Hal_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &efuse_addr, bPseudoTest);
 
 exit:
 
@@ -984,7 +984,7 @@ static u16 hal_EfuseGetCurrentSize_BT(struct adapter *padapter, u8 bPseudoTest)
 	efuse_addr = (u16)((btusedbytes%EFUSE_BT_REAL_BANK_CONTENT_LEN));
 	startBank = (u8)(1+(btusedbytes/EFUSE_BT_REAL_BANK_CONTENT_LEN));
 
-	EFUSE_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_BANK, &retU2, bPseudoTest);
+	Hal_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_BANK, &retU2, bPseudoTest);
 
 	for (bank = startBank; bank < 3; bank++) {
 		if (hal_EfuseSwitchToBank(padapter, bank, bPseudoTest) == false)
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 7bc8de3af1f9..a5c338c67245 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -91,7 +91,6 @@ extern u8 fakeBTEfuseModifiedMap[];
 /*------------------------Export global variable----------------------------*/
 
 u8 Efuse_CalculateWordCnts(u8 word_en);
-void EFUSE_GetEfuseDefinition(struct adapter *padapter, u8 efuseType, u8 type, void *pOut, bool bPseudoTest);
 u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data, bool	 bPseudoTest);
 u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool	 bPseudoTest);
 
-- 
2.51.0

