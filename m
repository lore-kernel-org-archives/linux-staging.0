Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4B325E44E
	for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 12:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755953024; cv=none; b=jAav9YQvTONUAyHvB5HrViaLudSfWF0G4nDstpECyGeCA2J+VcPQsuRXln14CSxzXT6or/uxZyVMSq0CWxHq5lygbL38TOwDMqPpKAO4smwyAVNIuJQk1ahDS00iXw+EH0wGsbPctoT5cLt96cnLJguZSF1M7rZGqr4yza4WQVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755953024; c=relaxed/simple;
	bh=XYDT8ZOTnQxbxYmv/f6mFEmi+5cv/e0YHVfg05WEN7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TiZCxz/LtlOMTlJCKGAGKIdPGml/WqheQPDOtegiUlFw3aRSIXagL0Dh1zhK07295w2bFa5J4GzVxCuVqS4VAUl0ij1XCdb3Q0Ja+0ISt0FYx6iTHFsfCNBxRrEVBxREZSksf2kB9AL6MKZ75/AgakYFFpWe3/nmtR9M9Bptpng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2KnGayQ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2KnGayQ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb7a7bad8so411956366b.3
        for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 05:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755953021; x=1756557821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8yurgLbPr3IHtTft2ct/QRPqVcIbgbSyThd3cfoEIM=;
        b=d2KnGayQVNnYL6C/TQhgZ5hCPUdC3AdKSRCjUrAzeDecXdssSkloOqX0HsrxmZOcws
         WjakGzk3Y0uLM/Fer9uX+vDI/3kvfVpRyspYj0xZ8H+dsrn18a9jkoJJKW90X2pReG/P
         z1eU05ca6ILeidubC7rOXzL6+eh1sqrEYITmPuV5EaKAjdWrY2U3S7uAiDpWy0x+Gsek
         cEsPVbVSNuWD95Rtf1DaV9uevWnIATD1SKyAxE56NkH7WXrfqjJ6WEuRbHlB1s+WvLQk
         NuKLgfhbOw+JJx2KpiXXIUwZ5EJNmbQubAEMROyClzFHgVEOdbstpLwvr8R+2oabRSYw
         Fm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755953021; x=1756557821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8yurgLbPr3IHtTft2ct/QRPqVcIbgbSyThd3cfoEIM=;
        b=q9dPfTJiO2Waro0r5UaPsroT+UdGMaIo78Sz/ajI7pmMtMs7qG+c+xsk+/0niDLnel
         Wh3YKsfw6/PZusmEPYXAKQJawAPgGiAzgI4pCvBL9aswcqdOCDq6/emvJ/ce9S3A0WcU
         31CNwkNBxDtK75cgOnBEOLrMsqRJCNR2AZkxIy6IZfWOQcLFF1r69JtSX68gbK471avN
         YB/eSDCWi1cy1gs9wPjItYB+nHhJW7rd5g71MLWzfwhcAwb/X3hplKAgCVomepS+Goas
         7378nEwTUcQcycvWPxJQzEaoI5ek1yXoF9Jzraeh9nP6cDBeRWsHXw/0Srrm6r2duK5+
         HK0A==
X-Forwarded-Encrypted: i=1; AJvYcCXc7g2itVYdUPKKoIZPTO+Zmk4NGtf57XLOmDuj0bwQcA0RLdvHlfTmqNeNUFUa5y64p3GNLWalmEHPa/ix@lists.linux.dev
X-Gm-Message-State: AOJu0YyiJirUdJ/fk734aLCiUvewjdxVInOoZ7esggQuq8+3Gssf09cv
	m+q0uZSyS0UGW6nmeF3ZkNnDArycsXqRdjHrtjIPuUUiPpw9pKpFCN2h
X-Gm-Gg: ASbGncvUjQmyVFgdvxcggmF8M8kVvkIuhlz6jUaPQsjNT6gh+JKbaccXO/LodkjCl9N
	+cneVxojIwrqBY4M/2PDLssy7yyx/wtPaurZocMtoh+iCFzPikpN3XF+AG6ovQdrx9nXc6r694u
	tWCVrFx/djlVFphUFq++bz0HJqWCh1IKtftJIzqOMzLazaOHs6Ck4lYXO7ReWbCQFGWnaz+SA6k
	DkYfmIceX0fLybL+cwg0j1HvBjjXd7IxKUEH6DEyDmg4Mz5GkaWTZ50u3Pqbk515lNJU3wBdqsQ
	HN1Cp7dn8M2uGPf/e2MroGnQdGHcB2/Wy4sFiSoYDgXqlAPs+CxVqNjMVACHtGVXb9xqVV9lfvt
	zmIXRg72Iv6pSVf2OBuNO6dxCLQ==
X-Google-Smtp-Source: AGHT+IHAzv1MMgc0gFfWXhwPq/A8HO45MupcnjPCPrRmtfDqTvL16u2WrA1HnUyNcdS27dCv2oYpNA==
X-Received: by 2002:a17:907:972a:b0:afd:d62f:939 with SMTP id a640c23a62f3a-afe29047b3emr565020366b.36.1755953021120;
        Sat, 23 Aug 2025 05:43:41 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe49a1f5a6sm165076466b.111.2025.08.23.05.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 05:43:40 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 07/14] staging: rtl8723bs: remove bPseudoTest from hal_ReadEFuse_BT
Date: Sat, 23 Aug 2025 14:43:14 +0200
Message-ID: <20250823124321.485910-8-straube.linux@gmail.com>
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

The function hal_ReadEFuse_BT is always called with bPseudoTest set
to false. Remove the pPseudoTest parameter, replace its usage in the
function with false, and reomve resulting dead code to reduce code
complexity.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 38 +++++++------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index c40d447c04d2..fe6a3dd84aca 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -755,14 +755,9 @@ static void hal_ReadEFuse_BT(
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
 	u8 *efuseTbl;
 	u8 bank;
 	u16 eFuse_Addr;
@@ -785,16 +780,16 @@ static void hal_ReadEFuse_BT(
 	/*  0xff will be efuse default value instead of 0x00. */
 	memset(efuseTbl, 0xFF, EFUSE_BT_MAP_LEN);
 
-	EFUSE_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_BANK, &total, bPseudoTest);
+	EFUSE_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_BANK, &total, false);
 
 	for (bank = 1; bank < 3; bank++) { /*  8723b Max bake 0~2 */
-		if (hal_EfuseSwitchToBank(padapter, bank, bPseudoTest) == false)
+		if (hal_EfuseSwitchToBank(padapter, bank, false) == false)
 			goto exit;
 
 		eFuse_Addr = 0;
 
 		while (AVAILABLE_EFUSE_ADDR(eFuse_Addr)) {
-			efuse_OneByteRead(padapter, eFuse_Addr++, &efuseHeader, bPseudoTest);
+			efuse_OneByteRead(padapter, eFuse_Addr++, &efuseHeader, false);
 			if (efuseHeader == 0xFF)
 				break;
 
@@ -802,7 +797,7 @@ static void hal_ReadEFuse_BT(
 			if (EXT_HEADER(efuseHeader)) { /* extended header */
 				offset = GET_HDR_OFFSET_2_0(efuseHeader);
 
-				efuse_OneByteRead(padapter, eFuse_Addr++, &efuseExtHdr, bPseudoTest);
+				efuse_OneByteRead(padapter, eFuse_Addr++, &efuseExtHdr, false);
 				if (ALL_WORDS_DISABLED(efuseExtHdr))
 					continue;
 
@@ -820,10 +815,10 @@ static void hal_ReadEFuse_BT(
 				for (i = 0; i < EFUSE_MAX_WORD_UNIT; i++) {
 					/*  Check word enable condition in the section */
 					if (!(wden & (0x01<<i))) {
-						efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData, bPseudoTest);
+						efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData, false);
 						efuseTbl[addr] = efuseData;
 
-						efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData, bPseudoTest);
+						efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData, false);
 						efuseTbl[addr+1] = efuseData;
 					}
 					addr += 2;
@@ -839,7 +834,7 @@ static void hal_ReadEFuse_BT(
 	}
 
 	/*  switch bank back to bank 0 for later BT and wifi use. */
-	hal_EfuseSwitchToBank(padapter, 0, bPseudoTest);
+	hal_EfuseSwitchToBank(padapter, 0, false);
 
 	/*  Copy from Efuse map to output pointer memory!!! */
 	for (i = 0; i < _size_byte; i++)
@@ -848,19 +843,12 @@ static void hal_ReadEFuse_BT(
 	/*  */
 	/*  Calculate Efuse utilization. */
 	/*  */
-	EFUSE_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &total, bPseudoTest);
+	EFUSE_GetEfuseDefinition(padapter, EFUSE_BT, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &total, false);
 	used = (EFUSE_BT_REAL_BANK_CONTENT_LEN*(bank-1)) + eFuse_Addr - 1;
 	efuse_usage = (u8)((used*100)/total);
-	if (bPseudoTest) {
-#ifdef HAL_EFUSE_MEMORY
-		pEfuseHal->fakeBTEfuseUsedBytes = used;
-#else
-		fakeBTEfuseUsedBytes = used;
-#endif
-	} else {
-		rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BT_BYTES, (u8 *)&used);
-		rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BT_USAGE, (u8 *)&efuse_usage);
-	}
+
+	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BT_BYTES, (u8 *)&used);
+	rtw_hal_set_hwreg(padapter, HW_VAR_EFUSE_BT_USAGE, (u8 *)&efuse_usage);
 
 exit:
 	kfree(efuseTbl);
@@ -877,7 +865,7 @@ void Hal_ReadEFuse(
 	if (efuseType == EFUSE_WIFI)
 		hal_ReadEFuse_WiFi(padapter, _offset, _size_byte, pbuf);
 	else
-		hal_ReadEFuse_BT(padapter, _offset, _size_byte, pbuf, false);
+		hal_ReadEFuse_BT(padapter, _offset, _size_byte, pbuf);
 }
 
 static u16 hal_EfuseGetCurrentSize_WiFi(
-- 
2.51.0

