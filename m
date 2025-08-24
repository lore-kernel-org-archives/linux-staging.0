Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D7926A08C
	for <linux-staging@lists.linux.dev>; Sun, 24 Aug 2025 09:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756029523; cv=none; b=u1NTgbEU3/UiGHAZPn4kcfvWy5uDCE775u3XN+wmQ+93sE2eoBvC34enQ4X7HHXYufbd/wcY+Cnn94AI8C+dasn5gLIH9w1eyVDsmNmbL80A3IH63QepslJE65p/UUQucorJu2villkS48Jc9XsvDt3GSf1K/dQrCyALmFvZOdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756029523; c=relaxed/simple;
	bh=qCuohedTig+dBflD+bJqbTY8MVe0rkaexM5kYM0D4ww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VGk2U7kIbiMcXoLfXMYlgV8Oj3oP0cvIpmvNMojYXqG6EdUXFg/yk7otU+UlFfO90FrntFPQ0qDWsJRfmLCoOzSZwLS0ABED4/OC0cIPTUBw25aGWI9cd8sp42LY2g6/AvyoHhACrgIl50bQm9+qzGJ0mLchebLReHD9wTMH9hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRD3thMP; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRD3thMP"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb7322da8so543422066b.0
        for <linux-staging@lists.linux.dev>; Sun, 24 Aug 2025 02:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756029519; x=1756634319; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvYsuGKgwDJ3CdZTywUVsaFMO2gJDf2toz0PGf3ll9M=;
        b=QRD3thMPOVQV1mXTflzQVaSANxq5YmGpZHPO7GSfC6laxTY33bQZRsofv3KpS4G1pq
         Jc3xG/7RCJfCS5iZhMUSMrbgRYf7SVJ1Ln3lFUDxRzYoxeuKuyFRLFEJq1XPEl0F6bIW
         SIHQEjV/qeIRRHjdtVt8nJ9rwJrARCEyroGZ7KlGI8dqPFDspj0TF7tYXKgIGEaNrqrS
         54mJPjFIy1qxucicmDnUD6HT03vCG3ceSgab+xwDyroDc8eK/0vjV1mU38b6aeZgn/tT
         trTnnf3f5CbuiXLdueJjT97A+PRJbv3ajCYKXmqCmqEOrzbPTCR1FFm7LyQYpEaXDMJH
         9Dbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756029519; x=1756634319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvYsuGKgwDJ3CdZTywUVsaFMO2gJDf2toz0PGf3ll9M=;
        b=wbiUmajofjA1ekopklMw1TABiW+wRlV4wEjSeltbHNsgZROCFjBvUMwXCulYFoIjGj
         b7dJnqLVLeKm2Pm4iWLVRtAWez9/SXuaOm8h3QqpTVLM8/D4S5taOgKoFBfvnDoRqhBS
         EluSvH4Ig6MbAtr3roL0CJOwX2mIiO0FbE/IKRidAkDXwNrTsHi+mdoN831E4Lk3pnrp
         GKxbMpa6D3WeZKKc3COJhJfauZw8kTNCFYiw1fLASARLrUTq6D3KHAd/tXPSuZ8s40O2
         04YmOkYZSPkE5pK/7hKOL9GsXyQABf6wYbc1lBKKJGyDFx1TTyZZAuJUsMTZVuzg7Isc
         nEcA==
X-Forwarded-Encrypted: i=1; AJvYcCVfKylikQhn3m805Oirh+MLeD5mWucJyPMU9hLzEgB1MckK/FeY9teiCAc0+rIjeP8zw2IM9npuvWuEOC9a@lists.linux.dev
X-Gm-Message-State: AOJu0YwFoP7c6bnj3i1AbnVzViJbB9LSxx3jJ0GT9L092RyU3LnPe6d9
	hlFT5LIU9Fk9qtpGqWTcx99g6Cdmwu1zzDEtRidVgciWaDVJ71ezcvOK
X-Gm-Gg: ASbGncv15X37aJcpcJUdnLlUB7gnYixeyIrOp6bZvLFsInP4lf6bKbd1JmpNDHAgBtr
	Bd++vijnWtjGiYEQHiF5MFWBYfK38CFN31HJOwu0Va4+nKcbqPHw+xVbsUmypD0mmW84fAtlo13
	O+2Ox3Xf4QWpr3UFjQP4HjEmCw6FWutvpluSsTeOLEQId0MtYhdCcqixSGoK3IaUEd9vo0kEZsU
	BHrK2tthCBgoOpyfFdJ2Sko89mLfDUWTmePFAusVc0DUJsSCM4WDZZPMYuI6fbF8L4nAgfMO3A7
	1k62xgLYmHck4ZgKZs0xNylRQS6XVhMgYVhaV8qshXekumt8D0trNeD4erFEcBlppAoeBibQgVC
	/bY3AHnpYofGhNEYEVOiZ7/rskw==
X-Google-Smtp-Source: AGHT+IHUgjHdJG8CmX711Go0qGjiVzBIzdUGCqALRPhnVIpluUA/K+SKc88aZMbU60nTK1rgX0/ztg==
X-Received: by 2002:a17:907:3f08:b0:ae6:f163:5d75 with SMTP id a640c23a62f3a-afe28ffbfcemr819307966b.11.1756029519535;
        Sun, 24 Aug 2025 02:58:39 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe79fba62dsm41314766b.100.2025.08.24.02.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 02:58:39 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/4] staging: rtl8723bs: Hal_EfuseParseAntennaDiversity_8723B is empty
Date: Sun, 24 Aug 2025 11:58:30 +0200
Message-ID: <20250824095830.79233-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250824095830.79233-1-straube.linux@gmail.com>
References: <20250824095830.79233-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function Hal_EfuseParseAntennaDiversity_8723B is empty, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 8 --------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c      | 1 -
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h  | 2 --
 3 files changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 45cd2291f83d..18244adad9e0 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1511,14 +1511,6 @@ void Hal_EfuseParseCustomerID_8723B(
 		pHalData->EEPROMCustomerID = 0;
 }
 
-void Hal_EfuseParseAntennaDiversity_8723B(
-	struct adapter *padapter,
-	u8 *hwinfo,
-	bool AutoLoadFail
-)
-{
-}
-
 void Hal_EfuseParseXtal_8723B(
 	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
 )
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 73561a63401e..7fcb874d0eb3 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1071,7 +1071,6 @@ static void _ReadEfuseInfo8723BS(struct adapter *padapter)
 	Hal_EfuseParseChnlPlan_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 	Hal_EfuseParseXtal_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 	Hal_EfuseParseThermalMeter_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
-	Hal_EfuseParseAntennaDiversity_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 	Hal_EfuseParseCustomerID_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 
 	Hal_EfuseParseVoltage_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index 40ff96d3cf74..2ed1fc8549ec 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -210,8 +210,6 @@ void Hal_EfuseParseChnlPlan_8723B(struct adapter *padapter, u8 *hwinfo,
 				  bool AutoLoadFail);
 void Hal_EfuseParseCustomerID_8723B(struct adapter *padapter, u8 *hwinfo,
 				    bool AutoLoadFail);
-void Hal_EfuseParseAntennaDiversity_8723B(struct adapter *padapter, u8 *hwinfo,
-					  bool AutoLoadFail);
 void Hal_EfuseParseXtal_8723B(struct adapter *padapter, u8 *hwinfo,
 			      bool AutoLoadFail);
 void Hal_EfuseParseThermalMeter_8723B(struct adapter *padapter, u8 *hwinfo,
-- 
2.51.0

