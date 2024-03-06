Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD04129A84;
	Thu,  7 Mar 2024 12:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709814050; cv=none; b=SyPACrjw1kw/H+tqAaEckdafScn4qvv0QZc39E0n/+wnqXzaizLvS8spwCCncHYZ3rCUFtf83pJktZ2MuMuU22tv2VslU+jmLDKdfpjZ9Ey+URKknQuvtlxz3X7dKglyFPbKSFs4XIG8ZI5j9XsFUOLAwnmjJPNgise5i0CMRIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709814050; c=relaxed/simple;
	bh=8vruxDJAKjz+zbG1pRnLqaS/5qp4OQ6JBF4OrGic14Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d6gf87ZXbftSivsoB92SwECNqOmfrgCL5CC9571Oi9by0MYs736Eo8wVLHKGXv0+tsT0yNj6GfDdZa5NKjBcxkMAtSxyeW21eaV6Xd444ln2N0qLga2NKdv0VMgwqHv3Mf2kvT3EO5nMoDR3VCUtrLKMDNFXn5qprjGrk7J9WSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbhr7OtP; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbhr7OtP"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a36126ee41eso114916066b.2;
        Thu, 07 Mar 2024 04:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709814047; x=1710418847; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcM1n3OV8PstO+RR4EsXwZEukc59ldP9nBHcQf99Umo=;
        b=bbhr7OtPmT1ViOF49EykzvLWnKF4sdXY+KkyS0HvwDW5UzdNKoEgedu5qXPr+z59Nr
         W6LUQNo7K5c4zOByY8Un8A+a0jlVDP9thLLBqxxQohHRtwPrfZetUGhEUqzs8kg1zpCA
         gZOwZsLbroasf4cPsGGSsqh3WGzAwsVBOVyJ5tch5EffCldqbChgAim1NLAhEKTOASZC
         B1G/2TtDUVGpcxZBWXw+QmrzGm8Fb4etm2a9dZA49Lv1qeSwPdG3IFAmByC6B1M1g4/A
         yp5BQwggEK598fjXuceuZlmX8EZGmlp/nzIXOyjmNc3XXi0MeVJKyTciw9ZrCspLE5Hu
         rI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709814047; x=1710418847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcM1n3OV8PstO+RR4EsXwZEukc59ldP9nBHcQf99Umo=;
        b=ai86qMCHOG0MOTjzg/3dp1KlXUBc3FTxKAc2m/CF2V8zbNAR1hEREEIm0Ld4RwWkZG
         nPf768q5EkCouzrhW7/3lufrHXfkHlTINGAAclGOzr3tPiSfWBvt2cK5Q0AZF+Rwtsvv
         +aRygdqKY4J0fJKKNLUZJuaggA7M67ooe7VaE4pfE6OtGqauUZeBu7vLGeC9t83ZwLfQ
         OuB8RMJQKjz3/Njv2270kQE4EEYMYkMMmsEv/7jkAXHiZo+Y0pEYV1OHCmkgzp54sCUj
         NUEzKE6a5N2kkM/FIH811n2Voi/ZXV3ZGgLvFzUVZ9j4T5DLBrYOFHlk3WBkbEzGPMd9
         ex6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1VK55o336Q1cAS/BhOk9ubR3l+v3ojrMRuPZgpD2E4MR4+gAfOQH4JAXjJggKQNZNigyjg+VTSjib65rUPBAAIqVeatwnyCvLupglcmXI/8koOIQ8tyiDUiPaStq3XG9ZuI2sEEz47A==
X-Gm-Message-State: AOJu0YxwD3yXaMRLA7QEee234wiVBoH8kXBgkGfs61fQRYC8ay0qsodi
	67X7F1hyRa4VE5Xgyw6r9F6ogwGlVtfbthorFK2LdMHyc9bMwKZl
X-Google-Smtp-Source: AGHT+IGepocXbGDn5C3I0Q0mLxIpPRsjJl7grwJR4iqtcyAom43uedXRgF4E4EM3ODi8oBoQ6PMjIQ==
X-Received: by 2002:a17:906:1d08:b0:a44:4610:6aad with SMTP id n8-20020a1709061d0800b00a4446106aadmr11298343ejh.11.1709814047442;
        Thu, 07 Mar 2024 04:20:47 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id l25-20020a1709065a9900b00a45bb9b81d6sm1643073ejq.195.2024.03.07.04.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 04:20:47 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v2 2/8] Staging: sm750fb: Rename sii164ResetChip
Date: Wed,  6 Mar 2024 04:36:05 +0000
Message-Id: <20240306043611.98074-3-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306043611.98074-1-dorine.a.tipo@gmail.com>
References: <20240306043611.98074-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable sii164ResetChip to sii164_reset_chip to silence
checkpatch warning Avoid CamelCase

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
V2: Added patch to series
    Fixed patch warnings
    Compiled the kernel

 drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 3fb14eff2de1..6dee95e60a6e 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -18,7 +18,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.get_vendor_id = sii164_get_vendor_id,
 		.get_device_id = sii164_get_device_id,
 #ifdef SII164_FULL_FUNCTIONS
-		.reset_chip = sii164ResetChip,
+		.reset_chip = sii164_reset_chip,
 		.get_chip_string = sii164GetChipString,
 		.set_power = sii164SetPower,
 		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
--
2.25.1

