Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462E3298CAF
	for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 05:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776748577; cv=none; b=B2GAmBh5o8frFWgClEFhCqKq0Gekc2Cpv36uY3VMDfL36DHvTRZ8NDIXo79GMC/E8oaP4Lw/KMKG4hATMsuQH7mILq+BHJ6gjO0pvdMcscC4vHiauLOgMx/H6OlaIndPxQHj+aM7KEZVkX02yeKRAyIsWqT3GiRD7Znvw4ubkrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776748577; c=relaxed/simple;
	bh=VLyBPo2b5KQj9+G0CygHkv5u5UTnYyRpmDDs3a/Ey3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CiB5zJJ0zNNrkIq8PiILPnA1v8IBCi1Mam9Z+p9e/DCb6rELwnHrjrr4vujFTGYEoht7bWkBwH74qG60lsjPb0GHszvZaTOKoclOHDbTzZN/Ke2g96enqYfr2Uh5cZFJICPm4evPlrigQceaPvkjKUZ5rCrA9Jdifizyxa2B9d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTMKbhLX; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTMKbhLX"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79a2ee65171so51735627b3.2
        for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 22:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776748575; x=1777353375; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XOQdjbP3OWnapOg/8eOqYPjbA9DVFbS27DBNVX6gkUc=;
        b=MTMKbhLXyXv/kWKINB5JsMQ8+7y1O5ZZgrlirTJ/XzhV9uPoCeg3+TKsLVdalLmo6/
         2P/GwTbHYkPr0Q3hAwHtqZdzdNzbYRabpIXqyY25KhMwkPxYkVsc+OK9/oAqTb5KEqdn
         wb8YXgqASkhb+ndB+k8NPVKmQysEGeMVuW0ERZxGI+FsPdAfysnCINYT7AKuLdXpog8C
         qwOzaYQr/hWa6vsdqp5Ag9jG9iF189aJq78oNdWEIWjnR9fEaHk3lRBFWVDRYnRwLcuP
         Pn0kPKz373qGJ1nten8+Mgu17M/xlahF79cPb6b6jTrv+RrD8Lg7ayfODuTY9nLLQl5L
         RGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776748575; x=1777353375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOQdjbP3OWnapOg/8eOqYPjbA9DVFbS27DBNVX6gkUc=;
        b=pcJoZz5YXPtcg/cJnF6XMY/GJTW29hoxmKyOAYfv5kIjG4i2pEwNxpbf4YDSvKsPMe
         vTGhAVGmsu8Yspo5uIvzgYegH3lkvlf+Tv0hmr1IoujLJ2vZGRsmUtJ+XSaxzIM2TZdz
         moMl7Mg3tBj58x3HUoZhnsbxk/0dXUIhDFvpoCLm+4ddqczRLCsJ69oZA4XAcnBvrYBN
         IoWJE7LML6z6nDv5eJsnKvN7vY5O5SB0VyLeR/A22dDmhj2FPfV/BhEawwadhWv2yQZd
         scGc14/MFi+LCitVLNnOMt6wgMS/Ji2Z7oB87uL6/h4A3dulTXcme4/yC2ucuAZSYHty
         7MUA==
X-Gm-Message-State: AOJu0YxtKkag1x2XwPtMYCCXtgwlTx2WvcxdV6Iemv8wqcEmPgQ0wjD2
	NFPEPZUjsrmxDWm389wC1O7Q6XwOL6kRkoCmaNVrlquxRjifci3MhnhM
X-Gm-Gg: AeBDiet45VMVShLaJ9h7F9QyTuNdgrufmEJUqVeFL3OLVYrT3LPKom3ZKsrzp1+kYvl
	+sN4diLIIOj5J0BDiWXfyVAEPE1O/Ky2Jp54r6FmHXnqAmE86gJezTJUG6rpSS1ydkUYTM0RN7T
	4uAFW5HQNJppWAPVfKq2Y0/YD5kOE19SWY/4++pt883yyROu6Fr+BoRQd1GbRRpnydLLbREdwsD
	Ydy8JOCwXH2rpATS5X/P9S7eC9wa4MJP1TjBIG3fVLfAy64Y4jsNRYPi1dH/A2b3uXdR+EKcg5Q
	XRnyEfyt5wG3KMiKI+0UiS4ppKT3aRkT6IfSqxEfhFrwr2Aa+DVXDDQUGPe8NMPIgglOaj9u4wU
	5SFzxqMg6qbSnoAAICtNGPcOm7DorPWWNO8q6IdtYjg/+9kpx3bfGOL4D8SyfvaFoIbMb/DrA+P
	xn6Wv+x1sHOjAxKv6oXimYW/0KcK/zF0PDZD4=
X-Received: by 2002:a05:690c:f06:b0:7ba:f712:95e3 with SMTP id 00721157ae682-7baf712ba0dmr51649177b3.1.1776748575018;
        Mon, 20 Apr 2026 22:16:15 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee9b28a9sm52075647b3.39.2026.04.20.22.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 22:16:14 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove dump_chip_info() function
Date: Tue, 21 Apr 2026 08:15:15 +0300
Message-ID: <20260421051551.1694-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dump_chip_info() function formats chip version information into a
local 128-byte buffer using the scnprintf(). This buffer was previously
passed to the DBG_871X macro.
Commit 968b15adb0ea ("staging: rtl8723bs: remove all DBG_871X logs")
removed the macro, leaving the buffer formatted but never used or output
anywhere.

dump_chip_info() is now useless, so remove it and its call from
ReadChipVersion8723B().

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c       | 42 -------------------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  2 -
 drivers/staging/rtl8723bs/include/hal_com.h   |  2 -
 3 files changed, 46 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 728a2171fbcb..0cafebd7b0c9 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -30,48 +30,6 @@ void rtw_hal_data_deinit(struct adapter *padapter)
 	}
 }
 
-
-void dump_chip_info(struct hal_version	chip_version)
-{
-	char buf[128];
-	size_t cnt = 0;
-
-	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "Chip Version Info: CHIP_8723B_%s_",
-			IS_NORMAL_CHIP(chip_version) ? "Normal_Chip" : "Test_Chip");
-
-	if (IS_CHIP_VENDOR_TSMC(chip_version))
-		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "TSMC_");
-	else if (IS_CHIP_VENDOR_UMC(chip_version))
-		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "UMC_");
-	else if (IS_CHIP_VENDOR_SMIC(chip_version))
-		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "SMIC_");
-
-	if (IS_A_CUT(chip_version))
-		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "A_CUT_");
-	else if (IS_B_CUT(chip_version))
-		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "B_CUT_");
-	else if (IS_C_CUT(chip_version))
-		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "C_CUT_");
-	else if (IS_D_CUT(chip_version))
-		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "D_CUT_");
-	else if (IS_E_CUT(chip_version))
-		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "E_CUT_");
-	else if (IS_I_CUT(chip_version))
-		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "I_CUT_");
-	else if (IS_J_CUT(chip_version))
-		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "J_CUT_");
-	else if (IS_K_CUT(chip_version))
-		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "K_CUT_");
-	else
-		cnt += scnprintf(buf + cnt, sizeof(buf) - cnt,
-				"UNKNOWN_CUT(%d)_", chip_version.CUTVersion);
-
-	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "1T1R_");
-
-	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "RomVer(%d)\n", chip_version.ROMVer);
-}
-
-
 #define	EEPROM_CHANNEL_PLAN_BY_HW_MASK	0x80
 
 /*
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e794fe3caf9d..95bc4e73f512 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -852,8 +852,6 @@ static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 	pHalData->MultiFunc |= ((value32 & GPS_FUNC_EN) ? RT_MULTI_FUNC_GPS : 0);
 	pHalData->PolarityCtl = ((value32 & WL_HWPDN_SL) ? RT_POLARITY_HIGH_ACT : RT_POLARITY_LOW_ACT);
 
-	dump_chip_info(ChipVersion);
-
 	pHalData->VersionID = ChipVersion;
 
 	return ChipVersion;
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 483f0390addc..cf775585c8e2 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -92,8 +92,6 @@ enum rt_media_status {
 u8 rtw_hal_data_init(struct adapter *padapter);
 void rtw_hal_data_deinit(struct adapter *padapter);
 
-void dump_chip_info(struct hal_version	ChipVersion);
-
 u8 /* return the final channel plan decision */
 hal_com_config_channel_plan(
 struct adapter *padapter,
-- 
2.53.0

