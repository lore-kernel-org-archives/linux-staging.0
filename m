Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E99258EE1
	for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 12:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755953024; cv=none; b=m9X+DYdXIp3MRcULHu3DpOqZXs+JSuGi6mMuXysXdY8uU6wRgHSaWIY6E84OOAoFCZ8Rnatt1GuPZFBxOGgdDAZRntJNTbT436gMuWdWMRdXvyF9H09fjYo6B22Nk0Id3GlEOIMBCH2IlZynu/Yzwim0tOiEemq+4UzC/Vf4L6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755953024; c=relaxed/simple;
	bh=99WVo19afdz1JIRRG4oj49qBaDsrneCNsX5B1FHuSy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bkcDPG55yoDXk5ax5dKrubDOPx6ZKCgK8QEUPOvDqEuWR1CGFdPvuc3C4uWuoeKnDcmAT7YISOU/T1mH5wipx4g3APAXd2yX7pmBJa9ItCmV2T0edwi/sMEZ3rUVHVsHPfVOmaiUYTcZ0DdMwrFCRN9f38yr5uqXgnrZsUmzGxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MS4j1K8T; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MS4j1K8T"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb7a16441so451953466b.2
        for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 05:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755953020; x=1756557820; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oh3OTq9cM6mb9Y0x2jVB+Qtv+usV8rcusK90cvfpk5c=;
        b=MS4j1K8TIL+6cuKuQyahGgLAC4DT6RcgFgx8/GGk/z2WluH8fb6M1zowkVILVx07cc
         28NdHTOX7Bd70mmsWMqOjpcCw3GCRb1y1Hae1mGjguYJXqgYbSj/fNQpEhwqW1KuqcdH
         wGOASxeT8KC7i8LjzQalBBPOIyXpXyGcJVrPKK4D0H5zkrGAz9f1RWD3QJ8sTTjNnDcc
         eUN+SxEKZQDjx7UTq+IXTxj0R569+xn2QOdKjzs6h59RqnuXU07pRa69U5gu9uXhnoas
         L/xhCQZG1KRkNZWjT8+i2alyp7uDXT2Yh9vuAoR+DQy7BohncRf+U6gw8ZVNr0iApjKd
         o3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755953020; x=1756557820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oh3OTq9cM6mb9Y0x2jVB+Qtv+usV8rcusK90cvfpk5c=;
        b=E54Z0/XeWvVKErCZFiM5tnvlvCaXuXi9xAYSS7p9tfp/1OKWALhhYTPegT4gdsR5f1
         kn5iD0ck3q3StZhOZCR8BPRndru231/itYGz/vV0V2v1HQkKbRLzKZ0Tbvob4veaxroo
         MAH/KQFDi6kCZQ5/+9wZU1LDwt1SVqeSozn2GT/hUlq5WEqmOdoSVF1SVaaR3TjRyQY+
         WLoAnKzmwK+rVELN9mkik7pJOwSkQ+SI/Oqjrtq2JwJx9kBjrNq+dc7GEWwr609GWvsK
         yRp0aMDhB/H2DY2gUVPKP7PGv4FE4GtdiXyea9iRSD5sHdqfDZlh5xek/wy32jXIgXZX
         p91Q==
X-Forwarded-Encrypted: i=1; AJvYcCWm9g82Apkq+NIm8cObtQCi+p6qMhkakusocAcOGxtJTGrV7CCDdtMBuSzultlsrw5dI56l78QtjcT1nyIp@lists.linux.dev
X-Gm-Message-State: AOJu0YyPZl92TrZFRL0IEeoCoIQuQX0YKJg6kxbKEuYEJzgYlLG/65LK
	ye7z348ntMKYM4OaBz50Y4trePSOPFGE0P3ak/PDBLlWyLIVk1qDfLg7vl54Ig==
X-Gm-Gg: ASbGncsCd0qzmJtv9SQXZBc+HOEORiza78WxFj4h7l0wAmDfarOMDS6mM1CpzN1pi2Q
	z2g1YRvz4LIRU7WLm4paPv31eNvIHbEkygAK56Ab/8h6XuLDluGzbZ51RbjPQMTEunb6HulOFc5
	9V+G3eB3shB/+n+ocdgPxanDDLOvaCu7NtV+e/64Lm/6Z811hLdXR1hxUQd5cgyIeLxUJftrWFg
	TAl5HwIoEHXEwDV+B3jcWwTI3Ru92k+ek2I91mB63qy/GZOlR0pzWYv6mbicjhxLTWEf2GAxEux
	wcrU+4vt7KvKCLXRzsiZV6rb3k5UB8iUxTOmPNrqzhLByTSifHWrC5jGHjrmo0FjCntyAcNMpbv
	JP1nGcrurqnzz5KSYjbEg9kyfIaKyzfzcDF3j
X-Google-Smtp-Source: AGHT+IE8n4m+meZknAuGPSp9YYvhKmxlh6lB/MpTdULlL3Gv7pr7EZXuT1CXGj7hXfxa41kGFnpMQA==
X-Received: by 2002:a17:907:728d:b0:afd:d9e3:9540 with SMTP id a640c23a62f3a-afe296b1f49mr523921366b.64.1755953020458;
        Sat, 23 Aug 2025 05:43:40 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe49a1f5a6sm165076466b.111.2025.08.23.05.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 05:43:40 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 06/14] staging: rtl8723bs: remove bPseudoTest from hal_ReadEFuse_WiFi
Date: Sat, 23 Aug 2025 14:43:13 +0200
Message-ID: <20250823124321.485910-7-straube.linux@gmail.com>
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

The function hal_ReadEFuse_WiFi is always called with bPseudoTest set
to false. Remove the pPseudoTest parameter, replace its usage in the
function with false, and reomve resulting dead code to reduce code
complexity.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 34 ++++++-------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 002648a8fd81..c40d447c04d2 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -669,14 +669,9 @@ static void hal_ReadEFuse_WiFi(
 	struct adapter *padapter,
 	u16 _offset,
 	u16 _size_byte,
-	u8 *pbuf,
-	bool bPseudoTest
+	u8 *pbuf
 )
 {
-#ifdef HAL_EFUSE_MEMORY
-	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
-	struct efuse_hal *pEfuseHal = &pHalData->EfuseHal;
-#endif
 	u8 *efuseTbl = NULL;
 	u16 eFuse_Addr = 0;
 	u8 offset, wden;
@@ -698,10 +693,10 @@ static void hal_ReadEFuse_WiFi(
 	memset(efuseTbl, 0xFF, EFUSE_MAX_MAP_LEN);
 
 	/*  switch bank back to bank 0 for later BT and wifi use. */
-	hal_EfuseSwitchToBank(padapter, 0, bPseudoTest);
+	hal_EfuseSwitchToBank(padapter, 0, false);
 
 	while (AVAILABLE_EFUSE_ADDR(eFuse_Addr)) {
-		efuse_OneByteRead(padapter, eFuse_Addr++, &efuseHeader, bPseudoTest);
+		efuse_OneByteRead(padapter, eFuse_Addr++, &efuseHeader, false);
 		if (efuseHeader == 0xFF)
 			break;
 
@@ -709,7 +704,7 @@ static void hal_ReadEFuse_WiFi(
 		if (EXT_HEADER(efuseHeader)) { /* extended header */
 			offset = GET_HDR_OFFSET_2_0(efuseHeader);
 
-			efuse_OneByteRead(padapter, eFuse_Addr++, &efuseExtHdr, bPseudoTest);
+			efuse_OneByteRead(padapter, eFuse_Addr++, &efuseExtHdr, false);
 			if (ALL_WORDS_DISABLED(efuseExtHdr))
 				continue;
 
@@ -728,10 +723,10 @@ static void hal_ReadEFuse_WiFi(
 			for (i = 0; i < EFUSE_MAX_WORD_UNIT; i++) {
 				/*  Check word enable condition in the section */
 				if (!(wden & (0x01<<i))) {
-					efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData, bPseudoTest);
+					efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData, false);
 					efuseTbl[addr] = efuseData;
 
-					efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData, bPseudoTest);
+					efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData, false);
 					efuseTbl[addr+1] = efuseData;
 				}
 				addr += 2;
@@ -746,19 +741,12 @@ static void hal_ReadEFuse_WiFi(
 		pbuf[i] = efuseTbl[_offset+i];
 
 	/*  Calculate Efuse utilization */
-	EFUSE_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &total, bPseudoTest);
+	EFUSE_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &total, false);
 	used = eFuse_Addr - 1;
 	efuse_usage = (u8)((used*100)/total);
-	if (bPseudoTest) {
-#ifdef HAL_EFUSE_MEMORY
-		pEfuseHal->fakeEfuseUsedBytes = used;
-#else
-		fakeEfuseUsedBytes = used;
-#endif
-	} else {
-		rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BYTES, (u8 *)&used);
-		rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_USAGE, (u8 *)&efuse_usage);
-	}
+
+	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BYTES, (u8 *)&used);
+	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_USAGE, (u8 *)&efuse_usage);
 
 	kfree(efuseTbl);
 }
@@ -887,7 +875,7 @@ void Hal_ReadEFuse(
 )
 {
 	if (efuseType == EFUSE_WIFI)
-		hal_ReadEFuse_WiFi(padapter, _offset, _size_byte, pbuf, false);
+		hal_ReadEFuse_WiFi(padapter, _offset, _size_byte, pbuf);
 	else
 		hal_ReadEFuse_BT(padapter, _offset, _size_byte, pbuf, false);
 }
-- 
2.51.0

