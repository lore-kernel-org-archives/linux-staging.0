Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3762E413
	for <linux-staging@lists.linux.dev>; Sat,  2 May 2026 22:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777759306; cv=none; b=NPcPKdI+A78mEr2gUdPKP+LoD2oWPNVN+b5br4IMvzQrcucerqvx5ju5pxdP/T8feRcoFKKvOrPjMW+EyDe+lLpae2f9SQPe8txnj7x2rDdnRXZz5+9zjSQPK2wGFak6CqsUGgzK6g44oL0/cFCMLCn0Lpw23/GMQydJ1nA121g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777759306; c=relaxed/simple;
	bh=R2NXK90mhH2FzFXDvHJA/vzjwORHXEb7BF4QcG+IEVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7jOaWGRDO/k7Tb48fRx7wi29EondtmixZCWzat8iw7HW4DMVZupLyc1taZ033/Tbh3TJCS0cU22JJi/RIXuQYq6yOc1ICV0Gp5gznOpVN/fx8BZ2p6AqB72vc3pb6nh75rYvQA4HjOZU2VuxgCfMqALi2864PlRfnEzmie8aF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCyJlWCl; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCyJlWCl"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-393800586aeso5207831fa.1
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 15:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777759303; x=1778364103; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGYOtomeuQ3qT9ZjPWg9vgnvxOf+hqy+2UfYBdISFec=;
        b=DCyJlWClOn0zKG983Qf7HkUk48Nl6ZfRApibea0k72EnndpmEtgrhfZi1AzV1vEP6H
         4b2cjEAcqtBhuwo4Y+bCE3LFCdHpocuVie4C21sms5Svz9Ru/TeJXDHhxeCKEhzBh0KD
         r7Fko50rpjZzBIR4JyOB59wSSsr2us7w/EdV/zveGITmcuOMpjroheJ+i8W1nPdK/0aD
         C07QxZbloMGKoYGvEh+uyz8Al0D9McqM34wbPV7YAiz6d9BxN57dAY5oWkXxKJ2SSmjQ
         j6ZtghDEonxzTY47OIvbsAVQ2RbeADMzhencfTg9ri/Xx0AChdtkCSRuDpmLd6n9EjOj
         6qwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777759303; x=1778364103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iGYOtomeuQ3qT9ZjPWg9vgnvxOf+hqy+2UfYBdISFec=;
        b=Pu9kV0zIFF5lZ72M6H8HGdd0QkvQiSC9Bn3ftscsomgJmhdmgPVUcn8eEhIwYxg0ep
         3Cf4AWzAgjQ+z2NJAop7fMH8NdgkzKBFuIzBnX89QpEOfbWbuxss3knVJE3I55IQpG+r
         2OWZFhDnOrUaIOemesULHjXLNNTEJBxELvA8r7wrJak1BKIgIzr/Bex4ZSXyX7WZMYI0
         5d9TdNfxQzMOXtfA9w5HqbQ+rIusnVmi1oWLMvUeXsd4r1OcNeUyGX53HaIZBHAyO11s
         4IUSTTadntEr4NwCAd1TTHcmrBmthG3ybpmTtOTwL8z2Vez9cMx4AuP22xUsChHgqyvR
         OxPg==
X-Gm-Message-State: AOJu0Yx9D+IMgAaFgdChijr2ydzCSt3DkQsq9t98EQaUhmBciAX51YsW
	EGj8ke8GWsZilBsLldBOWkJN4sP8q3/i7PRdVcZuqd1N5BTQ7b7YYb9/R9pu7g==
X-Gm-Gg: AeBDievs/vvQ1F7wVR4Acaj9Rvp6XwYFspS35bzYyEhJ1Z3fuxpW2LIKH9PIkqYIyCq
	2Pd1KcuJ8ruiBYnm8tTw86fUubPeCVqRBaNFSoyf9NvlVMgTGAzrGgahVG3dTsDcfOLudeXO4KJ
	aKjGFyVJlsHdhOt8J32FbZsFWVV5bottXgQg1zZcFKsMTOHN5QuNX2VU8//SQsitLs7n2pHvc+R
	g+p+/4sW4n/yTgcQAycXaiIDIWNEFoGE1GDbn3rX7R/SgJyLDdBQ62AnZNM+Pogpo4OwnQ2otb8
	PhgLFgFM004O+RiwDrjpita5q7iFhv5sfX4eiTyIp5SZ9yG31ej7Gmnv4C1X6wyUko+4l2Uvpz9
	8oU7/x3Bx8pMaMwAroiWlvURkVpf4SlSKxs3E0o9kzFGzRD9xvf6HIqTQJ3o/m/8Y8mC2Ayyo9L
	xD0wyghnG0ICgu44vA9W7mvf94gwXkS54EUOg=
X-Received: by 2002:a05:6512:3d20:b0:5a4:b02:66b1 with SMTP id 2adb3069b0e04-5a86212766fmr1621173e87.9.1777759303190;
        Sat, 02 May 2026 15:01:43 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230d6asm1539179e87.23.2026.05.02.15.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 15:01:42 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 07/10] staging: rtl8723bs: remove unused ROMVer from struct hal_version
Date: Sun,  3 May 2026 00:55:46 +0300
Message-ID: <20260502220056.59815-8-nikolayof23@gmail.com>
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

'ROMVer' field of 'sturct hal_version' never used anywhere in the
driver, so remove it to eliminate unused code.

Remove the related call to rtw_read32(), the result of which is only
used for 'ROMVer' and is no longer needed.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 3 ---
 drivers/staging/rtl8723bs/include/HalVerDef.h     | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 29b120e192fb..0818034563b1 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -840,9 +840,6 @@ static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 	/*  For regulator mode. by tynli. 2011.01.14 */
 	pHalData->RegulatorMode = ((value32 & SPS_SEL) ? RT_LDO_REGULATOR : RT_SWITCHING_REGULATOR);
 
-	value32 = rtw_read32(padapter, REG_GPIO_OUTSTS);
-	ChipVersion.ROMVer = ((value32 & RF_RL_ID) >> 20);	/*  ROM code version. */
-
 	/*  For multi-function consideration. Added by Roger, 2010.10.06. */
 	pHalData->MultiFunc = RT_MULTI_FUNC_NONE;
 	value32 = rtw_read32(padapter, REG_MULTI_FUNC_CTRL);
diff --git a/drivers/staging/rtl8723bs/include/HalVerDef.h b/drivers/staging/rtl8723bs/include/HalVerDef.h
index 249acd83c89f..90ef37b1ddae 100644
--- a/drivers/staging/rtl8723bs/include/HalVerDef.h
+++ b/drivers/staging/rtl8723bs/include/HalVerDef.h
@@ -43,7 +43,6 @@ enum hal_vendor_e { /* tag_HAL_Manufacturer_Version_Definition */
 
 struct hal_version { /* tag_HAL_VERSION */
 	bool chip_normal;	/* true - normal chip, false - test chip */
-	u8 			ROMVer;
 };
 
 /* hal_version			VersionID; */
-- 
2.54.0

