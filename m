Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961BB28E594
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 11:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752665866; cv=none; b=p8YtVNxe7gkfXXI9QOkVdAEvm35c6QRUswlJc4D8zQfB0c6UFh0xB/jOUp3YrCLfZjZGf8E0rBThi3J+AGN3mWCsTMFeTyAuVFJj1a3qryRFCUQNiR62dwiK+WZAsC5li++SF7R8Zc0CEkUOYMgN0e8Te0Q95DVZhb7+TG3H6OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752665866; c=relaxed/simple;
	bh=B/FWwHiJAuRaOs8LfHgtKvsU1Q2wvpaDa7hEKJBDY8E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uBfJqTf58wOfHJWOJZXb3g0Z8bGufVSMt3MQkGq1pnDxMxN6IwFyq/KEH6KTfuYp4x1u6GeOO9pyLoMitfG7cf+Q/C+nKckP7A4She8GtfLqZK+VGsJmVxR+NEeeW2DhOFCvrt8tlM8/Dn8KUtQwHKZPxL7b9Vq9RvWFCrK8SSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXG/kOgw; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXG/kOgw"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-73afbe149afso3448939a34.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 04:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752665863; x=1753270663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nTddVZc4mlVbcdS8ngZRorNxT3vBrk9xLWSImXOgo0s=;
        b=NXG/kOgwm9DPY0qdU/XfnHWJCYZwS6d/H7rIDVdckD3oQHJkJy0wEsCGVG/pxNvU1M
         kTxY3818cR/C2ZEO6y7CKEW4noZcUttqYzYODYXBuDASu3yQehO0ZpcDc9bGVOEeUo20
         E/z7ZG5/RhRgKH0R6opghwAsgQ4wNPYD4W+DlpyY5hIxZSA7tD+5h5QZ3kUIuZB4wi7/
         vjguAkYqqVt5D0OFAxffNwJyIefj0sLx6Drz+7og1q9g3NUjGrzI1KfPVvqxJjJlJ2WK
         fq00vjctRoDRXJXw3NANScenDvl/kQ1zJILK0U65Ic+srpDQ2aq1RoCfpSDmyWZgBpjd
         b6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752665863; x=1753270663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTddVZc4mlVbcdS8ngZRorNxT3vBrk9xLWSImXOgo0s=;
        b=FGFuzkNZQ2IaxuBae7zpbeSSaN+jLY3yH/5dVQqQC76KGAm7oPEmJssa2Ibn0FPSKd
         EOG3sBz4cc9W91gGXb/ItMsrGJwsShDhxkOxRtvAdgsqHwhWzisZAaDJxbmcF35FXVRF
         yEBB3e+FGHB47g4ysle2qFiDdJPUhnIQaX7sTAkX9ftK/rRtF63qafXjDuroMSGKkQXH
         cJsGf6t9PyeBAQcZPG4YUxuJ+wEcoaJhiezqzYPh3JE1A5JiIZ+EHJWhZnUMUbecoPiU
         sQNkGC5lJV0i5Sgo2GSR4uolEV7yPNI1KLoc2XRvICK7e1eFL3mcNiw/Kt9ViCUxjUHM
         heyA==
X-Forwarded-Encrypted: i=1; AJvYcCVuEptRUlXWZscUlEToDBRb9SJ2Qa1vkw49u081FMfe6RDXQdzzQ5MuTT1g8F1CSOT0iBL9DgbByVTSB2Ty@lists.linux.dev
X-Gm-Message-State: AOJu0YwMac7y5PZ3YVNBXzwYDZBPSdn2G3sQpRwo8iUraJVEK88D0Mlq
	WrAhfFDtCryPdInLP2vdx1XQE5mISMnKaBtj/+hmdm1D8uYdn7oMDNPV
X-Gm-Gg: ASbGnctpkgvJ4BJYRQAtyd/XoZ0q9L6EUi1m1GaJZ7Wfju3xXRWVXQZPdaF+jIzv7KO
	oa7t9zRPVxtDwGoW0yXcs6xAuDPkW0WTI3f6bTP/xklqFm9kyEBYdc5tAMdeb1insfG/LxCweiN
	9ZuQU+gG3HSEup7pPbNrX8tc+m1/84eNR1HaUDV4IdnHwnEKQsaQ8GCjOAZ+pwOThSuv97P6ySy
	NeD+wdm1A99IPEBpJbQzinVFNR0rmeIAihr1Elx97p19unImMIlSLbxIUG66cRl1UZXpWMnWNG1
	JlRaT3WWd4Yydz5yFSg6BRg+Pa0Ou7NEm+JKuC4oAhr7UiT7WPQa6gZICZ36H9YssDZPjI+SWSZ
	FZiGW+jJkEhIEhmHFMvpYlMcgwoRSLluidD+Of33KjEQkHPR94EFA
X-Google-Smtp-Source: AGHT+IFI+B4+Leos1xqHDNvMp2AaPbRLHCknBIiRrgo9SUVzN2lC0R6PgRTc5PZVDN+KGaXeRE8wxQ==
X-Received: by 2002:a05:6830:808a:b0:73d:95d2:d560 with SMTP id 46e09a7af769-73e665db818mr1350723a34.26.1752665863454;
        Wed, 16 Jul 2025 04:37:43 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73cf12b62e8sm2904769a34.60.2025.07.16.04.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 04:37:43 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: Ignacio Pena <ignacio.pena87@gmail.com>
Subject: [PATCH v2 1/3] staging: rtl8723bs: remove unnecessary comment separator lines
Date: Wed, 16 Jul 2025 07:37:38 -0400
Message-Id: <20250716113740.73025-1-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ignacio Pena <ignacio.pena87@gmail.com>

Remove the long dashed separator lines from block comments as they
don't follow kernel coding style, as suggested by Greg KH.

Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 7a74b011d..abc123def 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -70,7 +70,6 @@ Efuse_Write1ByteToFakeContent(u16 Offset, u8 Value)
  * When			Who		Remark
  * 11/17/2008	MHC		Create Version 0.
  *
- *---------------------------------------------------------------------------*/
 void
 Efuse_PowerSwitch(
 struct adapter *padapter,
@@ -163,7 +162,6 @@ EFUSE_GetEfuseDefinition(
  * When			Who		Remark
  * 09/23/2008	MHC		Copy from WMAC.
  *
- *---------------------------------------------------------------------------*/
 u8
 EFUSE_Read1Byte(
 struct adapter *Adapter,
@@ -313,7 +311,6 @@ Efuse_WordEnableDataWrite(struct adapter *padapter,
  * When			Who		Remark
  * 11/11/2008	MHC		Create Version 0.
  *
- *---------------------------------------------------------------------------*/
 void
 Efuse_ReadAllMap(
 	struct adapter *padapter,
@@ -350,7 +347,6 @@ void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse, bool bP
  * When			Who		Remark
  * 11/12/2008	MHC		Create Version 0.
  *
- *---------------------------------------------------------------------------*/
 static void efuse_ShadowRead1Byte(struct adapter *padapter, u16 Offset, u8 *Value)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
@@ -396,7 +392,6 @@ static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Val
  * When			Who		Remark
  * 11/13/2008	MHC		Create Version 0.
  *
- *---------------------------------------------------------------------------*/
 void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType, bool bPseudoTest)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
@@ -429,7 +424,6 @@ void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType, bool bPseudoT
  * When			Who		Remark
  * 11/12/2008	MHC		Create Version 0.
  *
- *---------------------------------------------------------------------------*/
 void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value)
 {
 	if (Type == 1)
-- 
2.39.5
