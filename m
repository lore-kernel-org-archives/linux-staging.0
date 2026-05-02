Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254D62E413
	for <linux-staging@lists.linux.dev>; Sat,  2 May 2026 22:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777759291; cv=none; b=U9tVuEsMEyfH5nGGkSHObzNjCuWelAtjNHaYGWn1O7Jby60hGDKGUr7prbnzCwViSYwYzrKkl2QWFC1jgrWo5SdfmgbljcTKtEVCO+OVcrlnjteECiOOhQOHzp1YZOAjBcwFQmfYm8x7Fe058VDz9XXqmU4DOTsGEHWDwIMQ4SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777759291; c=relaxed/simple;
	bh=gNRmC/kwPwO3FGAEv/L7zGT4z7PaiTuJjNAGbLFUgFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EalO3Cmqk9rCri3tjyAeojzL8k/6k6KSwbFB/FD6vEIvnwmNUeM//2sP3QmKxn/DGssbcIkbIBE8feLbKTH1+F6szDM0uijLNDEx6EOgWi4mqBbqu8qUFZ3qmt1kWSAdU/putJa6gAw5Cp3/wI7DRfW8yXT/h4GwuusnJyQ6Pt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHJIvBGv; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHJIvBGv"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so4462957e87.0
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 15:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777759288; x=1778364088; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeP0fqDO2LI2IgRiTb3cwvnKTWissB5Ld9tLXdO3C2g=;
        b=cHJIvBGvUvyZTxc6GByEykwsFUGzauZNUT0iCbFEkSYOEZVxuUqLqtq7UzZ7dxJeQe
         jZ/HQ4CWiPjZI+QvgT8To8bNmvdbJ674lDpnsGOEBV1AZWIVpEIagPz7TNCFDCCNpNJW
         H4yGezt7ne/2qrhGpYb2yymiKb6u6JKnsNQ3lGMoCKwRD3zdd26gxUJbffOrZsg5oLbe
         fCTYBSswjG0qIku+IhMRQ3syil99/z6lF3FjpApBE9Ai2SRS0QVXbTprZrgncunTDizi
         x+JpFN5SSkPYWDX8OdXJ1/riLp+MFOuTfRowzg2Ck9sblFQlmHHLrkqpSMwZ6QyQtmzf
         T7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777759288; x=1778364088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AeP0fqDO2LI2IgRiTb3cwvnKTWissB5Ld9tLXdO3C2g=;
        b=jGQobcBCW9ZfsAT4qY/xrbXzdlMfH6t+SY2QYTzR2Apa9IzcCgRLVYEPaNv15kMSJV
         /S7h6kWPsyEH8+4Mi1g7SH+Jvezi1DSefDz0Nt6njs9uH9iPtEqDJ88dyn0i0ZoCsGoa
         LjNYthNY0DSVybHOGSaGJ1dUkNwisrI0BiA1YrleDOQb/linoO+vOlng4UtUSRyA7vQs
         Aumnd0v/XqMS4inRtjzAi2SXf2zK9cJdkPN+Fj+FudGrLOkdk/xZR73PO6NJVPWukBXU
         u4E5Acb14mQqErLialUWmlWEP4sR8Eq/eInecpHyU7r3vtxCIgDD7DpOyGp6I3HJkMJH
         eU+w==
X-Gm-Message-State: AOJu0YynJa3tfSrPo1CkpW9cszpduXFaePGD7mPbD2R5zb6MPpjvuxAy
	rmRmAe+5cbBkfoWO4OPv9JUElACFIVaWDzuOOClquFsVdAi95YJp6Qqs
X-Gm-Gg: AeBDiesWEDn1GNc2pAAV4QqXkfmuGiHt1s3x56Afw4+7/xp5OXKJLXb/5Nq+joqldAM
	RVbvD9UWZdpOcmoz9E99E5ro/DBD8eOUy0PkxRwQurLaW/JNdWUvKDUuoP/I1fjWuw3HizC20cw
	MjdIgOGLy5Y3dRiulN7vXlcr6YGbxXuqRhPR9U3zHVu1nd5gpYs1Vo1IcPoNtz0bT8TZ3K3enSu
	d51uQ/XXOrriaMOd2g7dLMkAiT+TrYYl19EtR8MP0eJWjgmRB2P94xoAwl6tMdNOsRRgE+jYOYO
	zlmivvea8694jqdlkpZNn3UMKPoniVE0pt++8AewpxfNN+l0oI/NWbYa73+WjW4QWIRm+0D21mB
	DFTA80KhhoYe1QenE+4gbBc5lO/7WdzMqq+7vVU8IzDImciW4Rsl5rOIYFFLDG5+rzrVhyC3zKb
	CNJYJDRy3CynHhzXLaH88s9lxbPbwx/J0Ag3w=
X-Received: by 2002:a05:6512:3d15:b0:5a3:eb4b:37a7 with SMTP id 2adb3069b0e04-5a862ebc57fmr1030724e87.6.1777759288103;
        Sat, 02 May 2026 15:01:28 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230d6asm1539179e87.23.2026.05.02.15.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 15:01:27 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 01/10] staging: rtl8723bs: rename ChipType of struct hal_version to snake_case
Date: Sun,  3 May 2026 00:55:40 +0300
Message-ID: <20260502220056.59815-2-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502220056.59815-1-nikolayof23@gmail.com>
References: <20260502220056.59815-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename 'ChipType' field to 'chip_type' to comply with Linux kernel
coding style and fix checkpatch.pl warning.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 +-
 drivers/staging/rtl8723bs/include/HalVerDef.h     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 9a91fd0a96eb..4f25c621b1a0 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -836,7 +836,7 @@ static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 
 	value32 = rtw_read32(padapter, REG_SYS_CFG);
 	ChipVersion.ICType = CHIP_8723B;
-	ChipVersion.ChipType = ((value32 & RTL_ID) ? TEST_CHIP : NORMAL_CHIP);
+	ChipVersion.chip_type = ((value32 & RTL_ID) ? TEST_CHIP : NORMAL_CHIP);
 	ChipVersion.VendorType = ((value32 & VENDOR_ID) ? CHIP_VENDOR_UMC : CHIP_VENDOR_TSMC);
 	ChipVersion.CUTVersion = (value32 & CHIP_VER_RTL_MASK)>>CHIP_VER_RTL_SHIFT; /*  IC version (CUT) */
 
diff --git a/drivers/staging/rtl8723bs/include/HalVerDef.h b/drivers/staging/rtl8723bs/include/HalVerDef.h
index d0ce21ccc1cc..bf4716ec18e8 100644
--- a/drivers/staging/rtl8723bs/include/HalVerDef.h
+++ b/drivers/staging/rtl8723bs/include/HalVerDef.h
@@ -43,7 +43,7 @@ enum hal_vendor_e { /* tag_HAL_Manufacturer_Version_Definition */
 
 struct hal_version { /* tag_HAL_VERSION */
 	enum hal_ic_type_e		ICType;
-	enum hal_chip_type_e		ChipType;
+	enum hal_chip_type_e chip_type;
 	enum hal_cut_version_e	CUTVersion;
 	enum hal_vendor_e		VendorType;
 	u8 			ROMVer;
@@ -53,7 +53,7 @@ struct hal_version { /* tag_HAL_VERSION */
 
 /*  Get element */
 #define GET_CVID_IC_TYPE(version)			((enum hal_ic_type_e)((version).ICType))
-#define GET_CVID_CHIP_TYPE(version)			((enum hal_chip_type_e)((version).ChipType))
+#define GET_CVID_CHIP_TYPE(version) ((enum hal_chip_type_e)((version).chip_type))
 #define GET_CVID_MANUFACTUER(version)		((enum hal_vendor_e)((version).VendorType))
 #define GET_CVID_CUT_VERSION(version)		((enum hal_cut_version_e)((version).CUTVersion))
 #define GET_CVID_ROM_VERSION(version)		(((version).ROMVer) & ROM_VERSION_MASK)
-- 
2.54.0

