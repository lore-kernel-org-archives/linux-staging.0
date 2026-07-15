Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ED447ECC2
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119830; cv=none; b=A/7lNH19ukzjTQ7dxosuMhRirgYtJVMyogYz3GoMt6QFlIVwMXBiR91nkK/qGKHAQ3Kau5Wpu4WaKgwj2g94VBJxVcpVntnnF5mmyHra6eSbg4OgAFOrArlQ94If/LvEycEfPidL80yfGXW0ve60BoDw7aKlvfehP+jZL5bxgnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119830; c=relaxed/simple;
	bh=O4GCA9dncFpjvEFsosHxcw7KoGXzfJdJTyHWVOQIRVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YuyN4vxFoZGDnvkkFrnlYsptUpjX8sAbLwVTkdrZVWgPkB0bq/RA8tGDLn4k3HgJ4NEI67GUzFDReFVwAyc1GxQpd6DChP7dc0eu30T9gnk0Zy/SeXQXWAImOwbLOFOjn9/f3lyI3AhGlAluYTXAFfotGcMsKI6w0p4jtRn59q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioaigIlv; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioaigIlv"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b01910b499so1871664e87.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119826; x=1784724626; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1azHGGJy3K9uDsx0DgVKa5M1cFQOMhZnbWAiiL9xWBM=;
        b=ioaigIlv2EtxFAS1lJJ5UPRF3BEqgRiH4qjDOvefeByNvmoX6FVIMuSLn1k3f8BaJr
         FgMQ0mc7l0VykrrWHnTcNr8n6pvZrCg3OaShuOd0+wv+xBuGT+TMrMQVUyMfWsuL/wIs
         vGxpbGy711xjKB28e28je8N+8+BmfeXLjXPEA/X85JQsnb5j7vyo4X8+vSOGwlO7EWIm
         sPrVQCuErzy3PUBW2B9/oE9CaXOUDpGj9gXewL+xuZme7Pw1YhzT9bLOpVt5sAYsknO8
         TJs5Sa8jIJCzrjeqKzmwmiqUoOzYiMTBAQXwNmET42xIsYR8Lp3uZ/PFpoK6nzvI2wew
         4kJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119826; x=1784724626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1azHGGJy3K9uDsx0DgVKa5M1cFQOMhZnbWAiiL9xWBM=;
        b=VQytQvXsdyUAXQfU84bm6lvj5VVBvt9RytyG6gbbRI1GhmWa45ICNZ+RdW45VlBWDr
         DFt3Qx2AtvKMyQalqR7R8W+i2HJ1MdSxSVApNws2sWO9QXK9FCo5sDhmj8BXurO9mcmy
         9VIYxunC7CIyVTOyRooB539zj/iVokheTt0sEM51xyoUSS3kVIVhR2sMXIHDPB2vAAtF
         gS7Mv7INP9gGig8k1/nZYO/b/jWSarfvSTofCzL3gi514ofIJgJmwRFV2kdpnpau6Ivm
         RX9My7euUIO9uHjSJtbjNNju0TZM+Zaiv+8WJXYI3lwy+1+a12vz4K8rbR223IOLC7zv
         ltIg==
X-Gm-Message-State: AOJu0YwVF21Y7w/8v8cai78FCvRVXE8f6mHTzoVB6azcU4z5Z7WbwYpk
	59/NAag7Fyrq+WxE5HGvoaSajNjZKgcGDz6cwmbF+UU+V1DNJ6wsn11X
X-Gm-Gg: AfdE7cls72aWZRUWBTdC8baoSpTP9auW3I7VK6fbGuHfkDd7foQGn4eYS+ZW75IAxTH
	BcSne86S3HkwVPgRdZwUbeumVTIl8gjGq5xGm8WbJVaF009okHbWZVR+30aFZcf2dm2C8aDHya1
	vgjQ4/4P/HiMN582jbk8QgOnrsBOdJPPPi1fZLUemcgbfpzfydx8/nMpDido5n61Oacy0TjGzdB
	tZnxNvgOgPdIxtf6+aMf6MVuJhJl190IQ6pxveAjObmAn3Igwwojf89gUbhNL+RQ7FkNHA4dNGp
	pc3BJf75pwUrofb8KydvLgLiLrA5GlYoB3UpN07me5MIni+gOue3gSDHtNxdmW5aTmoIS9WSyXJ
	j9iB2xQBO7pIOMNA82AvH2yid/ATSQqx29TcW3Y5kNrefIk12aCj1hEsFwD4+RQkSUo5IskjKGF
	0BdUz2+7Jjve4DPjzLaweCdS71iy9nUpMKpYv6gP3gsvNFh7aW+xzW8byHqC+AYfwqyRD6ocWOc
	qjYTe0H5xU+nw==
X-Received: by 2002:a05:6512:3182:b0:5b0:227d:cef9 with SMTP id 2adb3069b0e04-5b0227dd3ddmr4759402e87.3.1784119826203;
        Wed, 15 Jul 2026 05:50:26 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:25 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 14/61] staging: rtl8723bs: remove ODM_CheckPowerStatus and dead branches
Date: Wed, 15 Jul 2026 19:47:42 +0700
Message-ID: <20260715124829.90290-15-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete the dummy ODM_CheckPowerStatus function from HalPhyRf_8723B.c,
which always unconditionally returned true.

Since all of its call sites across the driver checked for the
negative condition (!ODM_CheckPowerStatus), the corresponding
if blocks were unreachable and never executed.

Clean up the codebase by removing both the obsolete function itself
and these dead conditional branches to reduce code bloat.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 70b68f473..b77598287 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -1077,10 +1077,6 @@ void ODM_SetIQCbyRFpath(struct dm_odm_t *pDM_Odm, u32 RFpath)
 	}
 }
 
-static bool ODM_CheckPowerStatus(struct adapter *Adapter)
-{
-	return true;
-}
 
 static void _PHY_SaveADDARegisters8723B(
 	struct adapter *padapter,
@@ -1093,8 +1089,6 @@ static void _PHY_SaveADDARegisters8723B(
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
 
-	if (!ODM_CheckPowerStatus(padapter))
-		return;
 
 	for (i = 0 ; i < RegisterNum ; i++) {
 		ADDABackup[i] = PHY_QueryBBReg(pDM_Odm->Adapter, ADDAReg[i], bMaskDWord);
@@ -1556,8 +1550,6 @@ void PHY_IQCalibrate_8723B(
 /* 	u32 		Path_SEL_BB = 0; */
 	u32 		GNT_BT_default;
 
-	if (!ODM_CheckPowerStatus(padapter))
-		return;
 
 	if (!(pDM_Odm->SupportAbility & ODM_RF_CALIBRATION))
 		return;
-- 
2.55.0

