Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6143A2E413
	for <linux-staging@lists.linux.dev>; Sat,  2 May 2026 22:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777759294; cv=none; b=lX/OsIowHUTK6NJqT4n+FpZLeb0f24y1t6m/Ep43qAtPqHx/Nuzyq5JUXhN9FurbyKwWSYVnCW/azbJO9RJpEAKsMOvTNzbaho96VfFYeXAXM/h/nJFNjzj/MZZrHrXEjOwEO5tGNkXtSi4W9eEiJmPB8RuBbGs9MXLxP6VDdo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777759294; c=relaxed/simple;
	bh=Sc+A0Jhez7MctEkwwizkhoJGyCXF6otilLjeCUpzofQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qn35k0KcUq8jn6ZLdw/V1TeH1guFmQKso8S3W5gF/1D/iyHOMloogAE2LuPQvApc1jBzU9M1qNyzm889uSIBFOypk6E5cNEi/K8kilUlVQYEtOfbc5AvAZ5n47JAj8zlNRGASb42btZVXpT4b80c0uOtvJirHrpmfsnoq4mrOBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjcJlcJL; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjcJlcJL"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38e8292423fso24973351fa.0
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 15:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777759291; x=1778364091; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ndk3HjK2YmGz2iPdx9jlRNln0xTlHK+LntnQ7zz6N0=;
        b=bjcJlcJLQd48wp0WoBWgSIBmLxGBQUuEnA6ttphFtrG/uc6xtccal61qjcsFy39wjE
         /Rp+TEh5iy4LipAiMU4JcopVDlxJ5CGJFY4NuA3N4jcsMq965I0JBaSWLauXGEWO0Kou
         6Ut8djPRPjxLVY2X6dkj/TNlHKgX6v3OBPn8tLmz6YK+IvjUyTftrOXZR8BPQZBV48GN
         J6UeJm9wNk3I2GmT57Egf2njBvtC9KbIU71oEkaLltHSrArp1679vdxKC1gjuvfRu1+p
         dXyif5e9hM8e13LYpTJkKmayy1kLO7CjQ9nAXkKuCG/sa6rCHiyDuzCz+Bp54Pn3N14m
         y29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777759291; x=1778364091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ndk3HjK2YmGz2iPdx9jlRNln0xTlHK+LntnQ7zz6N0=;
        b=Q8tsPg0Ab4xoQyELHHXQ9G6F1MKJwlBW5DzZtR8wk2NruOGZkFXu1rtxnAYvfQV1Re
         zPfBQveJNeXHBveBIf4+AHUb2XeuJhCL8Ab/VkpOrmay+GpOs59flv1o7sy09HLCaL1X
         c5CyrGwld1gC2YCem4Ic7Al9rG5hdbMWYcLbRdWj7jeGhBVnX9FsK3C78fxfCfjAO2SC
         mkg30/58spQ+Ga8tQTx/7a40lnioefnREKjk9h0LTjr4tOBOV1NrRMAu+YCmKYSNQ+xK
         nWXGtxkRKKd9cDOHk7ecTfc772WaQhOI6UkXkKXcr4QpD7geJfOwqr8yOj4iRNfT2cy7
         p2nQ==
X-Gm-Message-State: AOJu0YypP76Hap5Ee0nKPsMpKMrE0h06HD/Hc5+AIfDcu91tB+Em8Nm1
	jDYxPcD8pn4e+v1dikEQLA4p7oPqEho4JFy70qLkSOqbwnSRfkcfZVxW
X-Gm-Gg: AeBDieuy1/l1Xg442HtKJec7BwycfGsjpBq30OkLEXD0DKHV+/g1Cjmtt7h/BBqbdsE
	9cWT/5m+XJ8PFT5UCC6t6UZx55Fg8Dc105ip1ZrgwZoKXA8fNBg+FXQYMLEQE9d3InBaee835Sw
	n99WiAwjGmWkwVF2XSy+P+zTqTcN+1zqTQueYc3ohWnjcAzMLwlfG8khUdoQ5Lhf1iSNx5m2Kvc
	8EYI45g3WWGY/AtcQU5PF6fu+9LuqlF5pkFmgkRCXTcxthPmDaPdtZhPgFZR+Tm7d+SNdMz34Qi
	2hLU/v0/gsrGQlS+FpQ2NTCvL94zPpvHHYAQfupfUXo51x2dL4vQ3QhDWxCzSLkWw7rJyX6ofk6
	gHSHQ4o+PWWAwOY8CkYJ6eCeiDuTTBxNS9tfdJhvGDBT1Gj0UN7MtAgA2pCqbb+pW8cPGTJacnt
	O4cWIcdVCLYva7yTAYcUZ8AsOJd7NjMPmB0Hc=
X-Received: by 2002:a05:6512:39c5:b0:5a3:e7d7:c67 with SMTP id 2adb3069b0e04-5a862ebc037mr1303394e87.5.1777759291166;
        Sat, 02 May 2026 15:01:31 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230d6asm1539179e87.23.2026.05.02.15.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 15:01:30 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 02/10] staging: rtl8723bs: replace type and rename the chip_type field
Date: Sun,  3 May 2026 00:55:41 +0300
Message-ID: <20260502220056.59815-3-nikolayof23@gmail.com>
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

The 'chip_type' field always accepts one value from the
hal_chip_type_e enumeration: TEST_CHIP or NORMAL_CHIP (FPGA is never
used).
Changing this field's type to bool will allow it to be used directly in
conditions without the need for wrapped macros.

The new type requires a corresponding variable name, so rename it to
'chip_normal' to improve code readability.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 ++--
 drivers/staging/rtl8723bs/include/HalVerDef.h     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 4f25c621b1a0..7ca328019386 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -836,7 +836,7 @@ static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 
 	value32 = rtw_read32(padapter, REG_SYS_CFG);
 	ChipVersion.ICType = CHIP_8723B;
-	ChipVersion.chip_type = ((value32 & RTL_ID) ? TEST_CHIP : NORMAL_CHIP);
+	ChipVersion.chip_normal = ((value32 & RTL_ID) ? false : true);
 	ChipVersion.VendorType = ((value32 & VENDOR_ID) ? CHIP_VENDOR_UMC : CHIP_VENDOR_TSMC);
 	ChipVersion.CUTVersion = (value32 & CHIP_VER_RTL_MASK)>>CHIP_VER_RTL_SHIFT; /*  IC version (CUT) */
 
@@ -912,7 +912,7 @@ void _InitBurstPktLen_8723BS(struct adapter *Adapter)
 
 	/*  ARFB table 9 for 11ac 5G 2SS */
 	rtw_write32(Adapter, REG_ARFR0_8723B, 0x00000010);
-	if (IS_NORMAL_CHIP(pHalData->VersionID))
+	if (pHalData->VersionID.chip_normal)
 		rtw_write32(Adapter, REG_ARFR0_8723B+4, 0xfffff000);
 	else
 		rtw_write32(Adapter, REG_ARFR0_8723B+4, 0x3e0ff000);
diff --git a/drivers/staging/rtl8723bs/include/HalVerDef.h b/drivers/staging/rtl8723bs/include/HalVerDef.h
index bf4716ec18e8..fbdfb690b73b 100644
--- a/drivers/staging/rtl8723bs/include/HalVerDef.h
+++ b/drivers/staging/rtl8723bs/include/HalVerDef.h
@@ -43,7 +43,7 @@ enum hal_vendor_e { /* tag_HAL_Manufacturer_Version_Definition */
 
 struct hal_version { /* tag_HAL_VERSION */
 	enum hal_ic_type_e		ICType;
-	enum hal_chip_type_e chip_type;
+	bool chip_normal;	/* true - normal chip, false - test chip */
 	enum hal_cut_version_e	CUTVersion;
 	enum hal_vendor_e		VendorType;
 	u8 			ROMVer;
-- 
2.54.0

