Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363882E413
	for <linux-staging@lists.linux.dev>; Sat,  2 May 2026 22:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777759301; cv=none; b=gl38Zj6fhyvJS/yZ80GjVIDSWZEIHaLS7mbYkidGhxYaayY71mJVaN0r7Y9vg3mntO9wd9Eivg7uh9h34as0fRxoLkOzyYV6DT/51f/9jJ8VL4xiXySU2wmoi1d/L3DVzOSTS8SMU3y6nBDqPuVeK+sAzhb3tCQuXoMe513xoE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777759301; c=relaxed/simple;
	bh=paLc0p8YIWmvl3ASwEOT/zhYddbcNMIsIHq0im4UMUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BL0Spm8V2+EJHH/4Ty07q8EIODEh0emtjpw56Av3jEtk17/Nf1SmapPhj09VAWijwDM9veEV42AjH5heWrRAwODoY9zLa0KmWKfAcRPrILCQm2ZrLThKo4jRZoQcgyIk5wHUwuXEA99fsqzbolXdIKjIGlcty+6N8bV8LoOPWBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBiaEE1K; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBiaEE1K"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59e4a04f059so4134674e87.2
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 15:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777759298; x=1778364098; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SaCzWS/h57pCptYg1VZVHnV7HxyQctz0wjW6NNcnfo=;
        b=aBiaEE1KlMBbRzPh7fU4i87eDfFRUWg5rSoR1qMYx6oxZXmcB/uJUW1/Pyzt71bYnY
         v36txy5+LCJk5IxPXt0mDj+RPJCmntu62FVlsaBUc/MbmCos2LP6Ku3qLM418oeJh6pI
         KznuYMPbRDDdCCKz4DKw4QXpvzzGc4Paqpdquof5LH+bvRPNMGFQ0dpjH3BqB828ePhs
         R9o1v+beb50AuF6mDAqTzzDy96pqJfzzjNL2UvpZnBuwQyfgOTZP97+Mi3BeMADvNJ6N
         wN3x9JDVWlkMEhuJ7kJIXYlGf8OymNbJfyak/5LTDfvHo/7AC+yelyP6M4nAGv5A2yoL
         Lk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777759298; x=1778364098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7SaCzWS/h57pCptYg1VZVHnV7HxyQctz0wjW6NNcnfo=;
        b=ToKSa64nuVEcYpfPjq/Qi98qcoG4fc17mHUgIdQZNGBizNgN/bCkNpP+ucMafLIV15
         gHQthO5MN09odH4NFgwuLRfI5B0Y6ZTIppcySLJnYtnRQpDK73jQDyvNBgQXBXFlwZWJ
         AjYj6M2dpy9ix+sg/2Fs2rja2GHjVv2ivGmyTlpb04EBN6wItIYbPt/r9KAFWTQidStF
         s0hf8BxYNb4GLDGyk5+Bn63kec+bQOgBfDvklLPL4m5UaSAtlNwaJwdUxATbAYrsUyEP
         Yq9j0gLgQ++8glvVUzd8vY3kHxNzBVrUr606jSbUXomUwagUkKR1ZML2/oZ+HdtRpNv0
         Od2g==
X-Gm-Message-State: AOJu0YyE1A7PzJMWOIcG3Ji/xQx83kQ1OmXck5gN5xfltFYA/+Vd8nJh
	24lMUGD6HFR3XhflZaGdjD8QajcgRWlTnjkurYWsKhAyAVHRQkUa6aRz
X-Gm-Gg: AeBDiesqyhM7leM1pkYEondVqPJCIZPjZCEOhPq7liuwubGkLEr7GJ/3B0/e9ysqDke
	S37KSYz4b6Y9ZyqL6EdpCMCp+FP5o2QOHOiKl9uZzEOYf/btPyt0ZADb5oLPP/HAuJqsVKTz+wt
	KhPK3WHoo1YeMkILBBz3Hyw1WeivHL9nBOIFFgupdRAAfGa2MMCOCMJu8AkCLPZoGlcRjnv8bfa
	gioIa9fmb/k5NhPPYDUT42u2+aGEbBHbuTIuRI0NpeNFtFjtiv8AjBho7FyNdvRGaRnajnuYTVp
	BK5demrWU5npHvMrsrcgQqIY8H6YvI/Xnqkb+Oga4o8KtenVi2VQKSIKj7v0gcvQgeKNJyWpzn+
	93+jTPX/Vr+luWNuXGHG2oekvS2WVuY3VPQuemQv6U/CzfaH9uDyX+9cAer+ANmBkkBhpZfbpvp
	9lwHnHGCPthA94CimdpPVFEjPluZZDXMrfgtxtmCAoj5E/8Q==
X-Received: by 2002:ac2:5336:0:b0:5a8:691e:a97 with SMTP id 2adb3069b0e04-5a8691e0bc2mr576316e87.21.1777759298244;
        Sat, 02 May 2026 15:01:38 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230d6asm1539179e87.23.2026.05.02.15.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 15:01:38 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 05/10] staging: rtl8723bs: remove unused VendorType from struct hal_version
Date: Sun,  3 May 2026 00:55:44 +0300
Message-ID: <20260502220056.59815-6-nikolayof23@gmail.com>
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

The 'VendorType' field of the 'struct hal_version' is set once when the
chip is initialized, but no one ever reads this data, so remove it to
eliminate unused code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 1 -
 drivers/staging/rtl8723bs/include/HalVerDef.h     | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index be9082aa89b7..6828db1e3eed 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -836,7 +836,6 @@ static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 
 	value32 = rtw_read32(padapter, REG_SYS_CFG);
 	ChipVersion.chip_normal = ((value32 & RTL_ID) ? false : true);
-	ChipVersion.VendorType = ((value32 & VENDOR_ID) ? CHIP_VENDOR_UMC : CHIP_VENDOR_TSMC);
 	ChipVersion.CUTVersion = (value32 & CHIP_VER_RTL_MASK)>>CHIP_VER_RTL_SHIFT; /*  IC version (CUT) */
 
 	/*  For regulator mode. by tynli. 2011.01.14 */
diff --git a/drivers/staging/rtl8723bs/include/HalVerDef.h b/drivers/staging/rtl8723bs/include/HalVerDef.h
index c9c7bc369fa9..9428f82c248c 100644
--- a/drivers/staging/rtl8723bs/include/HalVerDef.h
+++ b/drivers/staging/rtl8723bs/include/HalVerDef.h
@@ -44,7 +44,6 @@ enum hal_vendor_e { /* tag_HAL_Manufacturer_Version_Definition */
 struct hal_version { /* tag_HAL_VERSION */
 	bool chip_normal;	/* true - normal chip, false - test chip */
 	enum hal_cut_version_e	CUTVersion;
-	enum hal_vendor_e		VendorType;
 	u8 			ROMVer;
 };
 
-- 
2.54.0

