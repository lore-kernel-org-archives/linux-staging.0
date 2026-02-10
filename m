Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33472D97B4
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 03:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770692830; cv=none; b=H3eF4/LiT1GCA5hUO7tKnz5zZAeS7Ki7KFyFRIEUaLvbYInHrSOuoRxNG6i6S+e6znyVlB6fFVXDmz20WaM0iQ3nYytGLVwLPjU1aSadqf7Vh8BW7KtUvV6BKDCLJLtB+1h5umva6UxYet9ShZ818s4JSk4nssdaIfOzujDSQ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770692830; c=relaxed/simple;
	bh=okwdrdD8lgpoZ7SGkCLDFlnyyV1j42Lz/LKXWqHBKfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u9q2GGv7DRRnMIeMbkht3beCux/VDeC9SioHjO1d8UsH0Ci6a1qIl1jd8S2dS/y5M2swbCpRWtPrNa0w7iLx3KHVc4CBVsPqkMZkBNAYostoUWNpWMuImv0TEe839ub1syiVWMEWmyauBH6oE4roCCgZ/AbL5ziQ4B4PA9dgCmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yjq0sXWJ; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yjq0sXWJ"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a9042df9a2so19338125ad.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 19:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770692829; x=1771297629; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYuM+Vr4Kloc7D1FBfKI9pNOBsiEqD7j0ggz186C5JM=;
        b=Yjq0sXWJDFf+57inPSvNJeymUcU8qtGoKQKCPvAKkWIyv/JZfESJtPx3LeaT34vyJ0
         gNbNU4LMhSMAknvk0WsqOgPTBggRsEOdi7edcqcu3Di+XI1p/K0h/MgRAWUm23gtComC
         0WuhO1/3LkniZnR+ygt7eoJJo0rWwy8AQ9UnZxKDaSVFQBy1LWyk6VX3cl9sopl2ABoy
         4GrJSjhAkIIlLuDl8ogg1VAazb2z0ukL6d+0NiBDSEpTZMc4fBPAN8Wot1kWT6m3pc55
         zVmKtJAtqAQGkEuHnhhku4rtiPzI0AJ3iztTs+wra8qOe7EYjyOfXFDw8cG12h00WyV1
         G8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770692829; x=1771297629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MYuM+Vr4Kloc7D1FBfKI9pNOBsiEqD7j0ggz186C5JM=;
        b=xA12f+PSoW4JpFFXKIhI8rMMjK70WoZ8u8Z3oIv+3uHjpFhCMNRlnwtrVYYtDarXP4
         Lc45wNFLygSe0fvunJYmxLgwwa6qssFKtYbs8L2zx43cWPIhv/kpS3FlqrmDEXOFlURu
         9sxKBA+A46IpY1z08ZqmIjbFGw1TZw667PsUtCVJeDZaXX3n0z94jJxnTknvQbzKg8Ou
         B2DlINiNYiF3NJ5SNCzRF6mxBDJRq1a1CQYgJ1T/7AGZNVYpyrbIFcnbhTzQDow0i8s8
         amNdN8oTn+2QK3xLW0WjQ13yQ5JIPRd+jGChYh3YLGHMoelsTBc4v7evDIx6Eu8o4F4Q
         MXbw==
X-Gm-Message-State: AOJu0YwB4qlx723hQnigYMOK52sQIZWhvx1pgx0JkGJBomQXcwHqBSi3
	KNuGnJaALJ3d7wdGOY6ZG176PSVq7V9BJy7eB9n93IVqxlX0/6iPH8Uc
X-Gm-Gg: AZuq6aKP3j3qTLctJYcxVPMVcVJeoZ3gi+DHQrDcUvqA9Ozwyxhnaxj2IeP7F3WcMtb
	lljAb+RxV1/1vUGMIElqNB9ESMAVvaqxETbjnqEPPFCaucnWO+iR4SactXYUVED/ottbe378s7u
	sr3V6Bjc1apsScI3adAWxn/YXmFTnGl/KOA8yledqm2kVfHLfqaHhxKrX6iEOo5WgFFKbQ9lcPr
	gT7t4z35bJVlEVHbRNcBz3C8xtjIivY0bH+ie90A6+45XQtrqS7Fz7kl7/ObgDp8skz7oRLYpb4
	jalFrKgDEoNK3J1JREUFd9hmCnTLOiaxtNl2s5aJ+Qsq33awj2ddeucQt1bAi0LVb+AW1ABY2E3
	ajhOooie6WOCiRTPHP+5D6wqXTRA343I0Vzj9gZmNpRvizcjqJs2Tej13JMUZNPRbEr6k9f7B+E
	Sko/ALGB/so/FWt9nR84f3bcCjbKMdXw6r11RZsNFj
X-Received: by 2002:a17:903:acd:b0:2a9:616c:1705 with SMTP id d9443c01a7336-2a9616c21e0mr87637835ad.22.1770692828684;
        Mon, 09 Feb 2026 19:07:08 -0800 (PST)
Received: from Horstaufmental ([1.47.25.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c809desm116248265ad.30.2026.02.09.19.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 19:07:08 -0800 (PST)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH v2 2/7] staging: rtl8723bs: remove unnecessary void * casts in rtw_efuse.c
Date: Tue, 10 Feb 2026 10:06:02 +0700
Message-ID: <20260210030607.1430567-3-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210030607.1430567-1-horstaufmental@gmail.com>
References: <20260210030607.1430567-1-horstaufmental@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant (void *) casts when calling memcpy/memset and
other helpers. These casts are unnecessary since C implicitly
converts to void * and they only add noise.

No functional change.

Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 98b15ca10074..d1150da50260 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -69,7 +69,7 @@ u16		Address)
 	u32 k = 0;
 	u16 contentLen = 0;
 
-	Hal_GetEfuseDefinition(Adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, (void *)&contentLen);
+	Hal_GetEfuseDefinition(Adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, &contentLen);
 
 	if (Address < contentLen) {/* E-fuse 512Byte */
 		/* Write E-fuse Register address bit0~7 */
@@ -163,7 +163,7 @@ static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse)
 
 	Hal_EfusePowerSwitch(padapter, true);
 
-	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen);
+	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, &mapLen);
 
 	Hal_ReadEFuse(padapter, efuseType, 0, mapLen, Efuse);
 
@@ -239,7 +239,7 @@ void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType)
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 	u16 mapLen = 0;
 
-	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen);
+	Hal_GetEfuseDefinition(padapter, efuseType, TYPE_EFUSE_MAP_LEN, &mapLen);
 
 	if (pEEPROM->bautoload_fail_flag)
 		memset(pEEPROM->efuse_eeprom_data, 0xFF, mapLen);
-- 
2.52.0

