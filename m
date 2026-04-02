Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7648370D5D
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 05:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775108558; cv=none; b=Gm3CCB0DUsIoyzk/NIXH2N9l2ycozkNWiHmaGGJBz6uzSLLhRlXlXpjfCrWzwq0uMIXR0D+aBj13RdC79fK15UuKM9l9bRCDUr7ZkY4aYr2ODunwGLlqr/297PlVkuVGWgw/JRM8lLGVsi9f86S+8T+U7Honbw+tyHJB3VpLHDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775108558; c=relaxed/simple;
	bh=/+U98wu7C0+VphvLVO4D5HgBd22An/E42VfMq9cjFkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVEzlwYbWC3DKuN2wXLnJn1Cr90wfiRrNQGbfmy8oIN+keL8SU61YBbmJyIVwBIwxVjTcPzOOAP/UXtYPF57mO8mlqIBGEXiWnkqJ2CyXCgl2LkUiWGwuQ89xS6lqc+EXfPa+NYxZL6ocjaE8EfTQMxD12JB8nskquWMTnkGdmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrSskEPU; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrSskEPU"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a2beae348eso655750e87.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 22:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775108555; x=1775713355; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezxT9cwl6iQtEIV5rPyte3gXkQrn7u/td0/V1YEwxoA=;
        b=FrSskEPUZSBqYUw9Dy552UdN/XkSWZrOaAHDXuMBq0TLZxrnwJUBUQGVpAgCA8W0rB
         7LXhtDN1JaCb1PF5nOQjXqiGic6ffON00Tz9aX1vIaSVMKNk4sQO7QICOL5+ju7w3VVG
         e6eKudOanQdVoTaocbcqeV5hhr3iaV01OUyEKRL2b3+ZusCbnZAATXbngTgDkIbPma5l
         /WPr9rWh2epQcTIEe1CUOkIPZ85WrVpQh42b1rfPG6bROHXZuosM2JRxugQ4JW26eCxm
         mBQDgP0tTB+qpeF8nUtRpfHBiDZ89XWGKcuB0b1rzlr36gaaIv3zQ3LAJUqHE1UaCCx8
         nv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775108555; x=1775713355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ezxT9cwl6iQtEIV5rPyte3gXkQrn7u/td0/V1YEwxoA=;
        b=BiwE5m4neWUtXNQFaSZ3poNltoyzSw4TIThWnjiWQdvx11c3c/ULmLelz5pKKy5SgE
         HR0g61CEeVzTaFr8E4KqrmP3AjYh1Cklrfmwj0Qwgn4wVy1qvc827TOxFtNWkRpsIWYD
         BMcWL1Gz/EU2GiNIIqxvsG1bf+HMMMntWVKE36k3zYVENgak7/A/e5IkmF1zKS4F83VU
         QrfFNptHGSWpQ8XprAdTOvoPV+apj/TD8VYzc7btSg4KlxCSpKldPYTR/1SrtscntJ7N
         BS23VA0uQxA3kstLTbLRNZ0FOrILmSrk4tPsBkSPZ0trJzl69oovyX+ylfKKsCB8xUuP
         YDvg==
X-Gm-Message-State: AOJu0YwIVtUZ6fw/xwVJw+WqiNAqaKwBZh/3qjEeDqXy0B66aYI61gtw
	bbucYGiaFND0o8XOizHeyepZkcQB7kEJOAjjM/ti1DDGAU4V9QDnQRUO
X-Gm-Gg: ATEYQzxBJSX0d+PLnzOiytdfx8w8iiVLa4JthqTGvsB7UkSd5LjZFXUUDCXz0ZNixVc
	Bwknbv2geZDCbWvHP4ieui25E5VdFdSo8teZBbPehf1ClCJrISMebYDN0hbsxGOsRUgiDwKk0Qb
	HwXnVYw73B8G6f6xBa6FKO6hnAzaViQ51Hzm79k65QqtSnF0K3TaEm7PyVG7Ww6STxNuiXS542R
	PBT2u547iwP1V7gW5OBftSYwgOgjrTQgMDgqWP7ugQMiSqIG+PCT/Iw8Ra9uYy18mAyvBIA4yZG
	bTZ3PybYZzE11lqtA9oXipsScOPxizKIPocuQjBU5485N+DOJXxsoGkft/Zm0Nh6sPQW3ZxuegH
	EnMAd5NIZ3e40cMn1mdG1iI3fZR0Sk2Whgb+VWiowWMTl+OqYx5XidyDOHDVGrMmygJqxz9EMLD
	/oOm2Ykyhsi5hYvLBsQXcivLvRlOYx
X-Received: by 2002:a05:6512:400b:b0:5a1:4017:18d1 with SMTP id 2adb3069b0e04-5a2c1f2c5f5mr2538200e87.37.1775108554664;
        Wed, 01 Apr 2026 22:42:34 -0700 (PDT)
Received: from localhost ([2a02:aa1:115f:85c8:99af:b9fd:7f92:d8b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc5fbdsm431650e87.43.2026.04.01.22.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:42:33 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v5 2/7] staging: rtl8723bs: efuse_OneByteRead() -> rtw_efuse_one_byte_read()
Date: Thu,  2 Apr 2026 07:42:10 +0200
Message-ID: <20260402054215.271981-3-linus.probert@gmail.com>
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

Renames efuse_OneByteRead to rtw_efuse_one_byte_read in order to conform
to kernel coding style.

Discovered using the checkpatch.pl tool.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
v5: No change

 drivers/staging/rtl8723bs/core/rtw_efuse.c    |  2 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 22 +++++++++++--------
 drivers/staging/rtl8723bs/include/rtw_efuse.h |  2 +-
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 7fb0c4ad7583..a7b120cc70a3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -83,7 +83,7 @@ u16		Address)
 
 /*  11/16/2008 MH Read one byte from real Efuse. */
 u8
-efuse_OneByteRead(
+rtw_efuse_one_byte_read(
 struct adapter *padapter,
 u16	addr,
 u8	*data)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 652127af736d..355167883f08 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -651,7 +651,7 @@ static void hal_ReadEFuse_WiFi(
 	hal_EfuseSwitchToBank(padapter, 0);
 
 	while (AVAILABLE_EFUSE_ADDR(eFuse_Addr)) {
-		efuse_OneByteRead(padapter, eFuse_Addr++, &efuseHeader);
+		rtw_efuse_one_byte_read(padapter, eFuse_Addr++, &efuseHeader);
 		if (efuseHeader == 0xFF)
 			break;
 
@@ -659,7 +659,7 @@ static void hal_ReadEFuse_WiFi(
 		if (EXT_HEADER(efuseHeader)) { /* extended header */
 			offset = GET_HDR_OFFSET_2_0(efuseHeader);
 
-			efuse_OneByteRead(padapter, eFuse_Addr++, &efuseExtHdr);
+			rtw_efuse_one_byte_read(padapter, eFuse_Addr++, &efuseExtHdr);
 			if (ALL_WORDS_DISABLED(efuseExtHdr))
 				continue;
 
@@ -678,10 +678,12 @@ static void hal_ReadEFuse_WiFi(
 			for (i = 0; i < EFUSE_MAX_WORD_UNIT; i++) {
 				/*  Check word enable condition in the section */
 				if (!(wden & (0x01<<i))) {
-					efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData);
+					rtw_efuse_one_byte_read(padapter, eFuse_Addr++,
+								&efuseData);
 					efuseTbl[addr] = efuseData;
 
-					efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData);
+					rtw_efuse_one_byte_read(padapter, eFuse_Addr++,
+								&efuseData);
 					efuseTbl[addr+1] = efuseData;
 				}
 				addr += 2;
@@ -744,7 +746,7 @@ static void hal_ReadEFuse_BT(
 		eFuse_Addr = 0;
 
 		while (AVAILABLE_EFUSE_ADDR(eFuse_Addr)) {
-			efuse_OneByteRead(padapter, eFuse_Addr++, &efuseHeader);
+			rtw_efuse_one_byte_read(padapter, eFuse_Addr++, &efuseHeader);
 			if (efuseHeader == 0xFF)
 				break;
 
@@ -752,7 +754,7 @@ static void hal_ReadEFuse_BT(
 			if (EXT_HEADER(efuseHeader)) { /* extended header */
 				offset = GET_HDR_OFFSET_2_0(efuseHeader);
 
-				efuse_OneByteRead(padapter, eFuse_Addr++, &efuseExtHdr);
+				rtw_efuse_one_byte_read(padapter, eFuse_Addr++, &efuseExtHdr);
 				if (ALL_WORDS_DISABLED(efuseExtHdr))
 					continue;
 
@@ -770,10 +772,12 @@ static void hal_ReadEFuse_BT(
 				for (i = 0; i < EFUSE_MAX_WORD_UNIT; i++) {
 					/*  Check word enable condition in the section */
 					if (!(wden & (0x01<<i))) {
-						efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData);
+						rtw_efuse_one_byte_read(padapter, eFuse_Addr++,
+									&efuseData);
 						efuseTbl[addr] = efuseData;
 
-						efuse_OneByteRead(padapter, eFuse_Addr++, &efuseData);
+						rtw_efuse_one_byte_read(padapter, eFuse_Addr++,
+									&efuseData);
 						efuseTbl[addr+1] = efuseData;
 					}
 					addr += 2;
@@ -1447,7 +1451,7 @@ void Hal_EfuseParsePackageType_8723B(
 	u8 efuseContent;
 
 	Hal_EfusePowerSwitch(padapter, true);
-	efuse_OneByteRead(padapter, 0x1FB, &efuseContent);
+	rtw_efuse_one_byte_read(padapter, 0x1FB, &efuseContent);
 	Hal_EfusePowerSwitch(padapter, false);
 
 	package = efuseContent & 0x7;
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index df430c9fd25b..b8cd9e694f56 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -69,7 +69,7 @@ struct efuse_hal {
 };
 
 u8 rtw_efuse_calculate_word_counts(u8 word_en);
-u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data);
+u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data);
 
 u8 EFUSE_Read1Byte(struct adapter *padapter, u16 Address);
 void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType);
-- 
2.53.0

