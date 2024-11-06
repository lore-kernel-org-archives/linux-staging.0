Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA8B20969B
	for <linux-staging@lists.linux.dev>; Wed,  6 Nov 2024 18:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918043; cv=none; b=ccwxG/kIM1JAKZzi6qMZBDnZGXTng2bDskdO3p8AAdUbKGk5PJkrJKKsIXk5GaMt2otiufhwB50sJIdFrxUvAlpgefSmoY/R11IRfRVPzjA1F4vvehe/CYet6mrkWA04WZx8URP9bdMDeSf7hcKpfDxFhcbrJECJEhmYEwaMoWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918043; c=relaxed/simple;
	bh=IJ9mErZ+wjZe0e8iHAOjHtSpQtOzNRQC61CyRrvR6jI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O08mcbijxdpTOC++k2KUvI6uYFBlX7nTMbToCKkUqYWuCEM2cIIcC7sKcM4UqdKXaT7hZaJH30hhrgt1ydJnry7JMpvQEp3bl/CsnHjiFeBSJ0w9twpDHyTtJr3sHSrg2c6J1wakzbkMFu37DiCHEGfdM7GPynJzMyRLetIvi1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYHmVIbN; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYHmVIbN"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c9404c0d50so46709a12.3
        for <linux-staging@lists.linux.dev>; Wed, 06 Nov 2024 10:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730918039; x=1731522839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5u87ZDZXHLhJLgQfuKPLFTHmzXxPMt5bGm3IUjt/TE=;
        b=dYHmVIbNtIs07dxTx0rmDNgpS1fgVSdDLko6FhZUmN6aoS8XGiE5vkQS0WFc8XZ7zw
         YB9/lnub2fG5lSa+riyh9bL/A2OSVv0aq2MRGWcsE6zeWDB3kut7HLvvVCtYCEwULOE4
         UlyFZ1vicvwpqeDa5IRKrqjdKokPR+X2snFULB6rafIPP1ZQ9/19HfVGWAm/6Cxv+Baz
         6RT9lqTvrtsmqAmnuSky2/ejfXIiDV+KPHcO6AsChZAGXc6xRyfW9ylJI0zGfzpsjlpO
         1+Y8YP4CvMRMnIFv9eKnjZYm/ImFcpzMoZonH0WF/3MsT6p2X7tka5EN74/IljTj9bHf
         Adbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918039; x=1731522839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5u87ZDZXHLhJLgQfuKPLFTHmzXxPMt5bGm3IUjt/TE=;
        b=c4gG+JH/Oo8eadMrKBO+lvbrGw46so23KcikSEqXYclMatdhcZzxCi8F0eXpqy9mNe
         itLzD8hx693mRZzuDAii5G3CQuZf8Qr3CQt1Sp6lPgDyzyeOmaGGJEoRu7OA35BvequE
         BvOkfyN56Pt8VsHO91gaEYnEZcGmFw6p7Vz/nOqr1h1dOzEKw6/CYVexd0y79BkeJoPF
         Ami1dMH94ZAOtB3anICBUNWZHZfpvugE+mqmxD9z2x3im2mGz931frTPk/WopfBmi++a
         6eXgxbWm1j9kVWopaAGDTm0LDb8NZADhg2/osAnfao+8EFCeI4iXqZS1gABn3672QoaJ
         0Dig==
X-Forwarded-Encrypted: i=1; AJvYcCVgw8RsKABqi0P5ZzyQlE+tL+ZE84j+rrFc90CcIs5YJk98jvEx1jwaBBGd9Bq0mYJUUYuXvcJYdghD/k13@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo0RZbKnpQq09P5cIIfyilZgfgV+K4ekggjEpA8G/DlLvL9lv6
	jHoMDVjlRxL9CeTiWGswNALwQWtyyF+8QHX8VS0uG4DiXGr52jy6
X-Google-Smtp-Source: AGHT+IHYy2VySTnPh8gxEKmv6duxrP601dNn8Ig2ukpuelHF7dc3COAkuPS7xj8/7c0/8R0Na+qHdA==
X-Received: by 2002:a17:907:7d8d:b0:a9a:1e4d:856d with SMTP id a640c23a62f3a-a9de5edb084mr4099385166b.22.1730918036582;
        Wed, 06 Nov 2024 10:33:56 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1813a07sm315298966b.190.2024.11.06.10.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:33:56 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 04/16] staging: rtl8723bs: Remove unused function Hal_EfusePgPacketRead
Date: Wed,  6 Nov 2024 19:33:33 +0100
Message-ID: <920a7fdca106fc21e845f9ceba3f38bcfa9fa547.1730916582.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
References: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function pointer Efuse_PgPacketRead and unused function
Hal_EfusePgPacketRead.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 73 -------------------
 drivers/staging/rtl8723bs/include/hal_intf.h  |  1 -
 2 files changed, 74 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 11969a90a5e5..13fe77f84cc9 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1151,78 +1151,6 @@ static u8 Hal_EfuseWordEnableDataWrite(
 	return badworden;
 }
 
-static s32 Hal_EfusePgPacketRead(
-	struct adapter *padapter,
-	u8 offset,
-	u8 *data,
-	bool bPseudoTest
-)
-{
-	u8 efuse_data, word_cnts = 0;
-	u16 efuse_addr = 0;
-	u8 hoffset = 0, hworden = 0;
-	u8 i;
-	u8 max_section = 0;
-	s32	ret;
-
-
-	if (!data)
-		return false;
-
-	EFUSE_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_EFUSE_MAX_SECTION, &max_section, bPseudoTest);
-	if (offset > max_section)
-		return false;
-
-	memset(data, 0xFF, PGPKT_DATA_SIZE);
-	ret = true;
-
-	/*  */
-	/*  <Roger_TODO> Efuse has been pre-programmed dummy 5Bytes at the end of Efuse by CP. */
-	/*  Skip dummy parts to prevent unexpected data read from Efuse. */
-	/*  By pass right now. 2009.02.19. */
-	/*  */
-	while (AVAILABLE_EFUSE_ADDR(efuse_addr)) {
-		if (efuse_OneByteRead(padapter, efuse_addr++, &efuse_data, bPseudoTest) == false) {
-			ret = false;
-			break;
-		}
-
-		if (efuse_data == 0xFF)
-			break;
-
-		if (EXT_HEADER(efuse_data)) {
-			hoffset = GET_HDR_OFFSET_2_0(efuse_data);
-			efuse_OneByteRead(padapter, efuse_addr++, &efuse_data, bPseudoTest);
-			if (ALL_WORDS_DISABLED(efuse_data))
-				continue;
-
-			hoffset |= ((efuse_data & 0xF0) >> 1);
-			hworden = efuse_data & 0x0F;
-		} else {
-			hoffset = (efuse_data>>4) & 0x0F;
-			hworden =  efuse_data & 0x0F;
-		}
-
-		if (hoffset == offset) {
-			for (i = 0; i < EFUSE_MAX_WORD_UNIT; i++) {
-				/*  Check word enable condition in the section */
-				if (!(hworden & (0x01<<i))) {
-					efuse_OneByteRead(padapter, efuse_addr++, &efuse_data, bPseudoTest);
-					data[i*2] = efuse_data;
-
-					efuse_OneByteRead(padapter, efuse_addr++, &efuse_data, bPseudoTest);
-					data[(i*2)+1] = efuse_data;
-				}
-			}
-		} else {
-			word_cnts = Efuse_CalculateWordCnts(hworden);
-			efuse_addr += word_cnts*2;
-		}
-	}
-
-	return ret;
-}
-
 static u8 hal_EfusePgCheckAvailableAddr(
 	struct adapter *padapter, u8 efuseType, u8 bPseudoTest
 )
@@ -1745,7 +1673,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
 	/*  Efuse related function */
-	pHalFunc->Efuse_PgPacketRead = &Hal_EfusePgPacketRead;
 	pHalFunc->Efuse_PgPacketWrite = &Hal_EfusePgPacketWrite;
 	pHalFunc->Efuse_WordEnableDataWrite = &Hal_EfuseWordEnableDataWrite;
 	pHalFunc->Efuse_PgPacketWrite_BT = &Hal_EfusePgPacketWrite_BT;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 48305cbf9929..c320795f3fd4 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -164,7 +164,6 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 struct hal_ops {
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
-	int	(*Efuse_PgPacketRead)(struct adapter *padapter, u8 offset, u8 *data, bool bPseudoTest);
 	int	(*Efuse_PgPacketWrite)(struct adapter *padapter, u8 offset, u8 word_en, u8 *data, bool bPseudoTest);
 	u8 (*Efuse_WordEnableDataWrite)(struct adapter *padapter, u16 efuse_addr, u8 word_en, u8 *data, bool bPseudoTest);
 	bool	(*Efuse_PgPacketWrite_BT)(struct adapter *padapter, u8 offset, u8 word_en, u8 *data, bool bPseudoTest);
-- 
2.43.0

