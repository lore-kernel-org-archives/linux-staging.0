Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04338645
	for <linux-staging@lists.linux.dev>; Sat, 26 Jul 2025 00:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753488264; cv=none; b=nC/LW8aSVZnfjg0Y9TPOHgnKzui9iF1AyFhli3nSaxLseT7tKu/PSqOwqOj/m/IYS2hxdI5CDKrKa1dYaLLolXE8O4xBXU/TaxDLsXL1Zr5mivgm/RvWIPpwysfq1Cd2OPBWJI1KbabIcOgQShLUWfN7dDRwWTR10eZG3POkAkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753488264; c=relaxed/simple;
	bh=tijO90f5V2+dEbHPsrjzz6aV8S4k/7RL7YfLEFSvJ3o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B9ZC+q/IZMIQxdVbADcOiKrl0K7mxaCAZYstH6tWGpQNJtRu/XtilWyD2FpugerriY+N6CnQb29RV5mib9FmDhhxTEZLN0J/4HEjHxHF1Eb5lT7K7OpkaHD25w/DWbfbF6TlFHgT5Hb6dMVRHgnN5tUZCOlxALsgQ/TrGwWlxAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mn1DJdGS; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mn1DJdGS"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7e63adcd6d8so114525585a.2
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 17:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753488262; x=1754093062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zLeoKD9pH6YTTrPLKVP4AiqhElR/HaLlmxJaymwaLxw=;
        b=Mn1DJdGS7FInpLQsN2I+iNOQS3vfNld9RnTxO/3d/qqIBL6suf+hTGOtQnLt5jo0UJ
         dBvRxcaVRGicoECS0qVAfzzarx22wWcqixg8rqPNW3EWdhK63+OCeWHT0uDnp27BmHE8
         +jrpQxceZNVehc5dF2wump0Teg2i79QXdh5D4SQ5Ta5PwtDRu3O10BxOoAmSXLWeLRMf
         vyVs3cfHe6Mornd3jY5f/6RuvMb37nulEt/HEwz36T+2sH6MHEaiCEgWxhlvDewDhT5I
         w/bz9P+fcu2eZxLxmAMBWrrePCXNbesM6JHs1K2dDIcxHr+v3RNsMCtwTF7SbOj5bIHz
         KS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753488262; x=1754093062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLeoKD9pH6YTTrPLKVP4AiqhElR/HaLlmxJaymwaLxw=;
        b=AQNyeTi2OtBlrujInAWAqyVL41OhsOshRVRItew7abYZyaLUcB3D8Xa48FI3V//cQ3
         AGwt0Q7dNlzj5LajF9rncRKxvF5trI/uGbLIaMeGmwUn3Fmgs5Nwx3YAFA71n6fZtD3e
         FbDKdHw0gW7T2iMEGUoBDtG0Yix8BtTSFBnt1aagIvz2HlMIlw+dnMXZHQ/AhovkfELm
         wQnBlzuuAfbGFHADajYbOkMVW0iNzKGBhVBfp6vnN+xEOMWokpWnUxgDajEnDM34LPR2
         ohfLOwyA1Cut0SqidgxuNetu23HpHCBsUnkJoEhBCi/uYsfNBRvx9eXHq8LVaKjSwhPn
         3oHw==
X-Gm-Message-State: AOJu0YwfCaFZso7RCeEXQ90Rg5pE4sEDFqs8b8vZA+sXh2bXtBYdFaNb
	QXllX78T3fXiYZWhMewtlrv5/iionXfkfoznZv566UcEwHNyOpplnCcE
X-Gm-Gg: ASbGncusTFV+QAXO15fg7nv09yHXX8z3B5O9N/vSuja+h3wGL4loinuSPdQ6Z7x1zoO
	pKnJGOYep4x8Ew4aRnz9+Ch6QNVCqKuETqDoV3uzbQXv0lFWnSVPAygVSUmpjCisdKKnA16iTnz
	NHX6+azr5g7hstp8AgNXN3sw5g7pBIWcv99/iC5TGgvZrCkZhIrcAX63m0x+PhgyrP1gG+bXY6L
	qnUKls7zHo7uUQ9kxArptCimiVtba2r+3ZcC0jdAvJjStMP88VMz/LNUODfOHjBr6kUU015oei6
	cCP79XsXWobD03ozXNoB8HhUSNFojN1oQvGsBTOA7E9uWVU1bG7BbrAUEGhgaNilHErmAA0Y0dw
	VaYOACc0EKoK50ESARbgXINaUiCmtYgyZJhkEfCWJ
X-Google-Smtp-Source: AGHT+IG6l3WQqMadpHdNJpC0zSJGr9aB1wMhpvY2ZooIl9NLW/T9j82ReuKVTuQm7JeZ8ae+D6R92Q==
X-Received: by 2002:a05:620a:d94:b0:7c7:a602:66ee with SMTP id af79cd13be357-7e63bf69ba2mr563202185a.10.1753488261592;
        Fri, 25 Jul 2025 17:04:21 -0700 (PDT)
Received: from Latitude-7490.ht.home ([2607:fa49:8c41:2600:afb4:9d47:7cc2:f4e8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e64327b331sm53652485a.10.2025.07.25.17.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 17:04:20 -0700 (PDT)
From: chalianis1@gmail.com
To: andy@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	stable@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Chali Anis <chalianis1@gmail.com>
Subject: [PATCH] staging: fbtft: add support for a device tree of backlight.
Date: Fri, 25 Jul 2025 20:04:16 -0400
Message-Id: <20250726000416.23960-1-chalianis1@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chali Anis <chalianis1@gmail.com>

Support the of backlight from device tree and keep compatibility
for the legacy gpio backlight.

Cc: stable@vger.kernel.org
Signed-off-by: Chali Anis <chalianis1@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index da9c64152a60..5f0220dbe397 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -170,6 +170,18 @@ void fbtft_register_backlight(struct fbtft_par *par)
 	struct backlight_device *bd;
 	struct backlight_properties bl_props = { 0, };
 
+	bd = devm_of_find_backlight(par->info->device);
+	if (IS_ERR(bd)) {
+		dev_warn(par->info->device,
+			"cannot find of backlight device (%ld), trying legacy\n",
+			PTR_ERR(bd));
+	}
+
+	if (bd) {
+		par->info->bl_dev = bd;
+		return;
+	}
+
 	if (!par->gpio.led[0]) {
 		fbtft_par_dbg(DEBUG_BACKLIGHT, par,
 			      "%s(): led pin not set, exiting.\n", __func__);
-- 
2.34.1

