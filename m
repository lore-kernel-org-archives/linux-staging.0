Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461AB4779BD
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 19:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775070505; cv=none; b=CYL0XW1VANoaBi+Tv0yM3ZsCqBN/fljJbKbMOiyt2tKSk4WaWVvTxbBT6k3AFAQBTWsu6E5B1/kpoLhCVyom5S/M5mcaXoUDPor9AEXbidfuR1BhnTvvw1zOdvq/kchcYXd30FJ5P0heVgXPq09jVUYx5wANuptEZZwFHsjCUvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775070505; c=relaxed/simple;
	bh=Td/IvjwGiD0zDBogEuAdILr4wYKS1KzIR9Jf/xIb87w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qyYiVP0XafN3EdVE/cs6XiYG4wW8m0O2wOBzmq7dVkeNxq3QF/lUxBq59ryfARf83vwt4quPdkfyU4mNH71zr/5dNKKhsPPHhYtny+m30Fjb97GWqeRt4HIIWj7KYLOkt3J/d5nG39mvCHeMVAiFJSZUl3kCei+6oMKkl3xefRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhnMe25h; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhnMe25h"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38be66a9fc0so1853671fa.1
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 12:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775070502; x=1775675302; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ml2MTmV2kCgF8Mzd22GVQrPCe0V7R4g1Z6fI2tnLv2c=;
        b=KhnMe25hlvdmm0ByVlV/JOIfPKNa4hrLkx0IGQ7eSI+gWOK+aDUQgo9oarfICyVazc
         vXmBeBzsZ4d3fxwRUSDl8qJkip4MMIsvdXu0b3exQsdUM4yQYmvFNJPMvECV++K+Zacu
         NpvlzARV4E4oVQZfNiIr7wS0nhN/Tl5o6lGSAekfMEfSTXVgPnHWiDboEf9tN/zgq1sx
         DC9BsedvBodWUi7WuwwXu4lxABMwEpi+4Jd2Spc1HwV35MX/MsEfzrOvvnioRktD8zNK
         bcZONbi6kK98hohN/2LKsN+0UWLcGdCThFI4tekDJ9I36PklmNUXUiuTGa8Kmzm6Z7nW
         hssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070502; x=1775675302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ml2MTmV2kCgF8Mzd22GVQrPCe0V7R4g1Z6fI2tnLv2c=;
        b=ltr7PZzAsJSxCkABAWQtkoA1F26EphB0G/lG7wpLxuVKdS2REaMTYhtRWR8MQ39G2B
         H01WxoUv/2+k4h0YSTszPv68WkJDpJO2+Na3zVdCXOHUOy9p56fTnmMIqVJ15vrIFjDF
         l322QRfgzF1KkaYGHxO/ESmLOpBheYqmkUL0dRPm8eNIeUHyBqwqBxwmpXeQpoPW4wWl
         FfcuztaXiasJqY8tb2TnINM6DDp17rlvJaiCRt0IXDjlaSitJniP6WQc3Cbhfr8JfElx
         054Xc83uavWOnn9rCmzh1uBKFEr7ZgjPdQY1cgDm/KXkvKttHgyANfp330XgX5yROXtm
         RC1w==
X-Gm-Message-State: AOJu0YyKlttv+p+k+saSbKSVt3QL8buVBqbMWq0Qt28q034vD6dq7XfW
	8fE7R7I9gIUnBSV81NdmFyPe/+DviNOCRkThpSpxLG1oQ8JhgmizDRtQUBQsXg==
X-Gm-Gg: ATEYQzzxGnMcaPg8N7k6yHbnCgesN8+GKoY6rZBWDz/TwpgzLPZX8ig38GwRUqQnYCj
	aw2e+E98t2iIFEf6cZA29jF0JipakxsjKk9VLuYxVI7Mq2BiBDVGBsKBTw1AanLNPYJ9mFK379X
	wWLRTkkoNZbRDtOUnDfyiVdIMRtJ7syGoaRiOwlEVkyKbbRN/oQDlMLDgsWSZOdZIFkxxkzlGQt
	fVWapebFjuHggXoRvzcizADr/EdOfFJGNgg55k84toOETMx72r7wT07p6wvsaqgH2INvOSyoz8J
	aY+a7ijRBmnXEKsmOTcIfljs8cgiYttMRK2XlKvA8ERVcTQIY2YGCqHbXhKA7lLCbYSVv4cUaoL
	BofotHmoTp+GPoL8NIRarAXOqqQSACcgXz8AuU4JXdsrl0B8fKCFDNaPs+XlZnSEow/ntf+q6ns
	ZM95KN5RbRMQB+CXcX+OLY4DoaOlU/
X-Received: by 2002:a05:651c:3258:b0:38c:4231:91c9 with SMTP id 38308e7fff4ca-38cc2f5b2d4mr18305931fa.7.1775070502335;
        Wed, 01 Apr 2026 12:08:22 -0700 (PDT)
Received: from localhost ([2a02:aa1:115f:85c8:99af:b9fd:7f92:d8b4])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217d85asm1479511fa.41.2026.04.01.12.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:08:22 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v4 3/7] staging: rtl8723bs: rename EFUSE_Read1Byte() to rtw_efuse_read_1_byte()
Date: Wed,  1 Apr 2026 21:08:10 +0200
Message-ID: <20260401190814.216333-4-linus.probert@gmail.com>
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

Renames EFUSE_Read1Byte to rtw_efuse_read_1_byte in order to conform to
kernel code styl.

Discovered using checkpatch.pl tool.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
v4: More descriptive subject

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

