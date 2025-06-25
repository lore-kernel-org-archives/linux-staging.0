Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE18B1D432D
	for <linux-staging@lists.linux.dev>; Wed, 25 Jun 2025 04:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750827340; cv=none; b=nkaDWSDej/pGh7ozXwjkeB0RmPA9GHSFj+CGckBUlgPDPErKMxI735Et4x7oTrAEe/qLSyEZd0MYbchKfWeVuzIPmMAEvXtHRjwIlgzCIBVHJK+q1EShav66sLvrkgFJGErxcBOt/CPXE/cwci9p6fUafiVe57It00P9r+OOqo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750827340; c=relaxed/simple;
	bh=KSjhtsYtDPWq5P0JewRLIYDc5syrJxdWyOswWFMIj2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dOI3cWeXV9Izmn0kCcnbHFjuMe1mCuIZvf2rhUqoM/YREX667UbIaTtYNxVeCPoDEY3A8OS8v40vq8NN40FyHQsCHFicPDEabVW6VrPGdP/8IzAAdq5//i2C83afSnQHg3VDdXmhjqMwzvaIsaaHBujtJozBg8ahZ9IIG+HEDVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1WIsps0; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1WIsps0"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-748d982e97cso5308319b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 21:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750827338; x=1751432138; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UO6NTPCPP/dvAMAtqZiOjPibwhoAo2anGboFbitGK6M=;
        b=V1WIsps01PXPR4Yu1Kut7TgH59j6Sdi20ByA3l3tZG4dA1P/K2MQzoUgfm1p7OBem5
         D3nS0CIoOjLTP1J8ZYYs1X8ttrUhPmsT1dRmXn84tzyLM9/FzcmUluttQIpsI/NZY9Eq
         VNxu+ibR3oHPxshDjE6pgUHF9jfDvFdJRSGX/I+qqr7CQ2k6bnIuUvI/3AahUUBDgLZe
         TVBPFWmvJItWbAMj8iq/ziPh5Ics1UEoMH1ezTI2xImEyQR6qkoXucxLFHIRVdOOVmd1
         wKIqwxK/EhtRuIc5uBwuh18TZ+aghuvueA9OooZT2/Ry0TwVjim0E5CK1W/VCZ2J20Tw
         I3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750827338; x=1751432138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UO6NTPCPP/dvAMAtqZiOjPibwhoAo2anGboFbitGK6M=;
        b=VyMPz2e4c23x2FwLGd+ZMuMOPKeF2dENSmObCyAnDv9k1gXU56YbWZScgxRffVV52l
         bZlw9M+Bhg8o3SL1f3voJMXSikq/JCdddoy+Q+aJ9UZiuxscLmqqYYWdzcJlS0/Chlr7
         PyH9wTlXz7it+aICa4OqSsogDuLzkupXwIX4vPf6BpntvlZATUzA0qhW+SVu6EhBPn6q
         xxck2mzb4sStB0HnO4d1hgmo8i8H44QDvQkaI4r7yUAeEJPv78g4bM4QHe1dWqB+HNNb
         w9nuGGzkFmyXvhNTfC5R1hbJ9Aaa6sjxSdwtAIAMxuzl2F24Ht9AO19BnSNZYfO1V+vD
         935Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBbyCwSFhfoKXhBrtc4AUkJQyqMoTpTQVW7LGs7+KJzgurRlxNFAhyYM99+8RhFvuZsOEJQhAsXdXAEHxM@lists.linux.dev
X-Gm-Message-State: AOJu0YzvZoHL8c9yZgYnrzEu+HTHsd2jI8Ud0DbgXf4LTAcFWQi+odJw
	qOx5tZnO+TK2KsfVeyF/om45rBJ57Q3g63p86F65YxyB6cmIb7s5JuBRFp8kHf7OL2NhXg==
X-Gm-Gg: ASbGncs8K/rEnYd/QIpozIDroJHSqcyD+94uCLrFmVGSHexVaT4aRVxmYCCOIc0sYdu
	Pv3vzwz9YTcS3w14osHQPVl+RN3rjSU1XpfxUg17FmBsFlQG/bUBiH8R8EfB/UgFx7MAdin6EnP
	UkmSUSth1MWXgno5UneP6cC4CxkU4cngNKlWDEvF+bAHRuNBS7nbuuedBQycEAXZWEuinV1GuR3
	eN0w4Aunt1YYGZ3eqQU7N4rdRPGDzvWVIts081V5J0rG18bkwRsG7B9q/0Ut1rYwh9eRkABGrpC
	FIeylXnmYmZ3DJw/qcmsoQVxiv5Uf7QwKYIZl8aoptD4FDXyJ0xXSjrHrzEkQinEUCCpMWv01Xf
	PYjf8vmPwT/bosjw4Lg==
X-Google-Smtp-Source: AGHT+IFLbqpz8txyiEyP4O5dWK2HN68bf3Px02AjjgY6ny0rLjNSLfBKIcKav5NxVJRGNqxZfpE+Uw==
X-Received: by 2002:a05:6a00:2195:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-74ad45e6b34mr2574345b3a.21.1750827337903;
        Tue, 24 Jun 2025 21:55:37 -0700 (PDT)
Received: from archlinux.worldlink.com.np ([2400:1a00:3b42:5d1:1d64:4a49:adde:630d])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-749b5e21120sm3610679b3a.43.2025.06.24.21.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 21:55:37 -0700 (PDT)
From: Pratibimba Khadka <pratibimbakhadka@gmail.com>
To: sudipm.mukherjee@gmail.com
Cc: Pratibimba Khadka <pratibimbakhadka@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org (open list:STAGING - SILICON MOTION SM750 FRAME BUFFER DRIVER),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: sm750fb: Mark g_fbmode as a pointer to const pointer
Date: Wed, 25 Jun 2025 10:40:26 +0545
Message-ID: <20250625045526.82758-1-pratibimbakhadka@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a checkpatch warning:
WARNING: static const char * array should probably be static const char * const

The array `g_fbmode` contains constant string pointers that are not supposed to be modified. By declaring it as `const char * const`, both the string literals and the pointers themselves are protected from accidental modification, which improves code safety and clarity.

Signed-off-by: Pratibimba Khadka <pratibimbakhadka@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 1d929aca3..d3bce107f 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char *const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
-- 
2.50.0

