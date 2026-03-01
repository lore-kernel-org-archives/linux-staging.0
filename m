Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97171FC0EA
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 21:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401714; cv=none; b=RpFNl6yE3ox3xwIN6hBWF1moBYXeBqJ7/rGAVJPSE/BAU7K1pU/3PcyYmKajIe4OlWgSMSsR8unbeYJvcMQGtdnDBT+TugfsbYfG0MQr4wgXWgGuq0LH2Hy8vr28HE74RGV+huUmcJXrUrR8LjQ8mCHtcx//Zyqnw1mcIRlWEz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401714; c=relaxed/simple;
	bh=p9Uuk4XctNLUtIJrMxS+/W1PItz66+Uhic8UHsf91+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EfVbYrybu7eP7lRFKy3UU3Y/vXepkXBoPf45DC8jSiDvnsyp0SyL53R8EsmD0miRUQF3MCFx+cwdmhwcyxyxlQU7IodiI0rVmkv9Ia/BGtUnpJSSVxHd/52A/z6OOows/1kIzCgUz3cY8jFZxRgi1oevE4iwyExxxLete7DjL+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+g0ASgk; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+g0ASgk"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cb4081e82aso529734985a.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 13:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772401713; x=1773006513; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWORFS8L0XIGPLAt+xpSMwaFFZEya3/7ZgSDGHcHmKs=;
        b=L+g0ASgk2eny59bJtPZE5fYuDfBewB2CmPFR1oA3r6ZDhb5iQ3thezMbgKBES5HZWG
         UrPBO/CSUrqg87OLQtmkXYunl7+LPU06iUv8fB+dVEWbbWuP6AVvyw5l17dmHxTKU07D
         sI+GXnDAoa3TuAL5mVJrtvweQZNuaHsaJYZQ1sUXt9a3nr/X0HGNcoDIUvF6wQRNrwuZ
         C7N8gNEv2YsobiO/PREyTT3vAT4luxFewrntZNWTn4NJq5Ow7T8LyYH/lRwTz2Glttvv
         Vb+jdM927Gw5erN81tPZvnUnFSG13iGPg9NwiKpXbKAizmit5oohgr/2G8l/TJ8uKN8x
         0l8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772401713; x=1773006513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hWORFS8L0XIGPLAt+xpSMwaFFZEya3/7ZgSDGHcHmKs=;
        b=aL4fgFi2dVXGgyem2ZJf92UXOmWjhc8QzxmGY/dZSQwjhdI8uqAHDF5sDorO7glhnT
         2DjW9CxCc8V5o5u7V7iu31xWVcDQK85EKKkj3LAiTFIWh+pYqnEiUEU4/sj573G0RU8q
         JAd8fhxKiXkhtbkECsCF0mKZE6D/bNp1jVFiMZdRCwDYdaV/UY3XxewSJGWglh4G3Mr3
         0+b6mbY5lwrPp9mVoJr3rEpM+jhqsopVMnG7qJws7sRAIPl/cPpOyDNU+Yszb1F8yqyl
         jnsV59nEArCoOCRaYG4eCZDEsTyjoQ/h5j6wlVy9blOhF+glZFcmpatBI1JgtnwlVI3o
         VbfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOucVWgZPseYKaVcLCSoFyz+OlagWZtEywPK58WNuK90SaJYIweZUGJdfyESiMNRt/9EO18bCwRqZP5HdM@lists.linux.dev
X-Gm-Message-State: AOJu0YwK7tkJU1jA3CBd9wHCxRxuKfLNPsPuLRX+cGskDxhHZooBLMZz
	z6ERbPYup97crmnzd5NJHmwQwM5kIfXkYmDtqhdcZRKeQCgUaczNEtexNIhMz92f0f0=
X-Gm-Gg: ATEYQzyA6Wu/DynLdZ8TQwg1StqUjHBTpl+5MwAOPqSRwDy1VodH0gPDASqHyywKg/r
	CHPgSUqt4gDZMeueRaDymUsPBg10MM5hjaiCKLKze1rgBny3CMWImLleRrwYaQZAx2o/zA5fHR+
	FbBV+8YLHHjUj2bjFYSZhIawCTyw4fimvZ7lS/4mehnQ2A05ujqbwnGsRP4KF/ei2RQgpGc6qOS
	+UPZHjPGy9BKPRWUfLMEyhSYi3hhgsa+VEirzpoRXEsh1u0W+DYUzEGiK+Vd3KRqV8t4GsBMjIe
	N6AXQ+wua6aCyKt8kwda1CFK3xdzRn/yyZbBtyGd6l2I/CfhU0QyrTVZPhTfddGgm/4ThxCijhR
	28+iU8Weru1USpetwGSKFdupJhfBaZqp4agxYLpXk22vJzRalJzc4O8cyppJPWOdQGbaNZG+Fq/
	TH+DhgfpVXousxobEuCUi4BGgnjd4TzsajpOaA3rzz1e9cR4uYlPXLWJLUNYTwAkGWKqYgTsYXt
	zy3
X-Received: by 2002:a05:620a:4015:b0:8c9:f996:8203 with SMTP id af79cd13be357-8cbc8d6f59amr1317230385a.13.1772401712778;
        Sun, 01 Mar 2026 13:48:32 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6f948dsm1006700085a.30.2026.03.01.13.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:48:32 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v2 09/10] staging: axis-fifo: remove unnecessary variable initializations
Date: Sun,  1 Mar 2026 21:48:14 +0000
Message-ID: <20260301214815.2628942-9-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260301214815.2628942-1-objecting@objecting.org>
References: <20260301214815.2628942-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Josh Law <objecting@objecting.org>

Remove the unnecessary initialization of 'fifo' to NULL and 'rc' to 0
in axis_fifo_probe(), as both variables are assigned before their first
use.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index e154139831ea..7ca0404b0875 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -456,8 +456,8 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 static int axis_fifo_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct axis_fifo *fifo = NULL;
-	int rc = 0; /* error return value */
+	struct axis_fifo *fifo;
+	int rc;
 	int irq;
 
 	fifo = devm_kzalloc(dev, sizeof(*fifo), GFP_KERNEL);
-- 
2.43.0

