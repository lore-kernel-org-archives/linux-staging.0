Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB70F2C17A0
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 22:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255623; cv=none; b=f46FG+PNE7Z8599MtsbsjCzIwItZs2ff25K4zry6vpkJZeXhF6l8P0atJ3uG+UPI4dbbJ3zW52Yj6fpVOdvT9tOgeTMsBNWwl+hFYZrAGf3oWJW69g9aVLwk1AYuugYOocYMnbaOjtpEPz3LiiGGKWSbLbxJfuJzNB8qsZX4MV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255623; c=relaxed/simple;
	bh=DxGG+lY0uBfYJe0RB/Qsc+cNkSbfUJs6ifXXFgLUlxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i815t4xjV+wwlb/AaUjoEqRO1xbhkzMxWQSF4uz5fQX6KazIlqP/jZo1SGquFe69SmGbqtXBesgoI9zeSdF5JHVEg/CCWPPLqwdmZr/OheMoNr9iGM7G4rtKDY0UbUYQwasCUH6T6ADWxkUsXNGiJcIDYMH3yoEKlTcrjVCy8Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3zkh1Nu; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3zkh1Nu"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a2a70bb66aso2225294e87.0
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 15:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775255619; x=1775860419; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szkfddAH71Ms8/viy7Rf7Ei/MzE2n7W9NdHGM2rdz7g=;
        b=o3zkh1NuWFWJILUJr5Yel/+LQeVxRK7TZVjb7ZIyfbb78vI+gEA3Ot7ZAvDpkX9ym/
         ePizrEW7rqEeRdbbwrUyPCbYFvK6XqZ5hfESjjYRIOSGMzv+a4T/zcCM72nEiz2vcOJK
         gS5M4vSvG6UCkcCSqmihlm9ungHUK5KQ5UyTHZD0jj3/LBlLP3GR8MF1pTDEPXC8BG6u
         kZH/7+rJWomU6Lnkf2kJ8bebWIzR6DgE5PtCjF8Tw8L48ZHnQe1Vrt7WNU5aAUZ9Kr+s
         Iso7jW+ttJMuHLygclF70Y7WuaKAeWbe1+oAlqEaybm3pkZQfaLZeXb6SNUNYY8z3mSG
         WIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255619; x=1775860419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=szkfddAH71Ms8/viy7Rf7Ei/MzE2n7W9NdHGM2rdz7g=;
        b=Ra18mn4PbnuFttacCst5LqUOWMzYfnvkHVUkFhfMR+hGCa4XREIByZgmgMztm6TCCQ
         wGrktfS4M7Jb3NFNJewez5r/p+B47woqttSdty3hTzXtTcyHKcGzaIImDBnWol9n1/pb
         Cg0Lx9BdU7Vbkm/YLaIv4+Vk11ubNbaSp4PmAiUMwQ7QCh9l3q99Ff1CtOZ2nvjZj8cZ
         qvbew3qPVkcZAJR4Ksxq9gFNzC6Q+RxBPsGcZLC57mq8zepKPSgK/E4TTCFWDruI5oFW
         Wjh7pyLV0ZQ4yGdVngLd3ckR1ZmHn2fp9IkhfzzEjcwJ5E9FExiS5Zd+8XLomV75MPW3
         m+cw==
X-Gm-Message-State: AOJu0YxAzyFck2FDNuAsUE4jCbbBRdbTeKxIxIhsrTooxXwaYATXlzh2
	dOMFhCcDsM9MycCziysnJTQ+2w2/qfOef3vtSHlaLETxbZ+X/jciAPw+hVFwjtlG
X-Gm-Gg: AeBDiescb3k1XoxqptADlfvQQ/3D6wVcm4Aipx/y3RV2Nx9vVxie1gSFRlGv8B2GsGf
	j36AMZBwvbj7bCjVo/4X7g/4pNmrOMquLNNXevlbnscmgH7QqCgmsItNKcZsv6WXMQzOSbuHrC2
	xfIfGv8mgBVdHDvF4PJx1Q+fcNp3UqjEkoN/YM1LMJZ2mJw1HNJa0zRG5ub/o1Wibf0z2bzSevX
	GUVIOaLUedCNmSiwzhpgFXk9DabjAlUTmXBV7pfaXY2xsHxwDN2LijO+VxBtF/kCZTKDuynyAbB
	Hefp3hvdHnkKP2q42EHXVPrvYfihDRVPLein82ygadapqEbfa8wA9IqP/0r6GULgGeHYjSZfpne
	cFxyzY6V9P2VYYX/9JN85zGli8LZYFJbeq0VjzGUZopeI2kJL7KqdKqc+EM049Yz/PJLO2MQVVC
	TtXU+76t6tqHoX/5Leg9NjeMmFadF9vqBv7ywSEvKn9w0IqBBdyjsE2UV/weBq2vY=
X-Received: by 2002:a05:6512:2201:b0:5a1:3d21:7b55 with SMTP id 2adb3069b0e04-5a33778569amr1420249e87.43.1775255618556;
        Fri, 03 Apr 2026 15:33:38 -0700 (PDT)
Received: from localhost (94.191.136.33.mobile.tre.se. [94.191.136.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9cd43sm1675632e87.24.2026.04.03.15.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:33:36 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v6 2/7] staging: rtl8723bs: efuse_OneByteRead() -> rtw_efuse_one_byte_read()
Date: Sat,  4 Apr 2026 00:33:22 +0200
Message-ID: <20260403223327.1831215-3-linus.probert@gmail.com>
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

Renames efuse_OneByteRead to rtw_efuse_one_byte_read in order to conform
to kernel coding style.

Discovered using the checkpatch.pl tool.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
v6: no change
v5: no change
v4: distinct subject
v3: created

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

