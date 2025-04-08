Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E9226B2DF;
	Tue,  8 Apr 2025 10:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107681; cv=none; b=WAflqGIWIUUXY8BUen0CrMf9QC37y6/t1LGu/LAikdP0HjZNe9G3HswmYcgtbas+a5mCnOPcbtAgfaF+/5/6xHl2quvsyRkDQxXwEbRivEXEC7MFOVXCuV2Hr3dhQltZYAaq1VGt4WLJKB4QxSE3UHg9SRY09m6AZxY6DF4E6v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107681; c=relaxed/simple;
	bh=u6zEX+t1aVIDzy0JiAoJ7d4d/Fs9Xyppen8tPxxJuLg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cxbfIizl+Pvx7HeZJQbn8ysXreKvpuUB7EwFyLiwrcfENladQJekqDFI16H/XO037/3I2NPuDxe3xBnMev99flF+hjbo+5bbzIP8Sy3TfjLQknL1bM01Dg/YAqoWxhOFBp7Qc0YYiCMQ3hWYj/n3Da/cQLwXGSxSSmZ1P7NRDh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4F0rdRW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4F0rdRW"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso35464945e9.2;
        Tue, 08 Apr 2025 03:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744107676; x=1744712476; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvS5tdlccUpYMdewqVDUL2P1AZVRPsP3RNJi07oU4SQ=;
        b=G4F0rdRW+WNnvzWMpnkI+UYw/1YRMGMzaQK6ZIS20KArIiB9Mt/sufeIV5AG+S2v2q
         blQV4ujwKhkWIbeY9nnUfs/kfP2kaXWHCUFJjNtESx5Vsp9SVWiJ8L64xSTjkjGO+vxI
         60NrE8M2BOEqopMZehT4ingfyqW5H8PFCsjQDx8PFk1mnR9+y5Ky8SzuySmmDJlYccnO
         LWK8NS/k70OntfOBAkmmQEEW/xOS1iTdNJbo3UikWksOScsKnvby8l3luCa2VhtyvLnJ
         9JVHoT5ydIDvCkGWzVIp+KP1bjDxim1eX0T/+aWhBQwTGc5GQFc3kG647kZLUxNCp4Cf
         EZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107676; x=1744712476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvS5tdlccUpYMdewqVDUL2P1AZVRPsP3RNJi07oU4SQ=;
        b=koaSOFvzTlwKZa4OHlzja0jcbzhtM+lUl7TUh6TNRS6OPJMt4X8YNXBiRM4j23oQp+
         VvG54xPHcU8ehqvd3iT81tjqHctDNq4l5EMTfcaaF419ID5aPOF7IJ61yL6i9guEGlFR
         xT7KSRW9KWhn+SkcD80d1DO3n32hOSXHGVHrcr4/hx2Fr26alrwTiUVxPu58czjWLhGO
         Pgd1WBpW/sNRZgAev1JA7vXYp1LDdF8Gdzpm3SuTkLHPfv/wGPPL4UUQHDRyjX0DGOL2
         Vak4Selyd63SYpwVesYTPhuxmRvK1U/DxRoPkVaVHnGoURkr2xhfyphreBgwyAVp7MoK
         JJfw==
X-Forwarded-Encrypted: i=1; AJvYcCUQfPzVsaJHmHYiswk8CKlA0PQm9UQjrAjf71ImIgNeZJhaxUchVdwEsn4g0ZzRs+vPEPKQK/dhRPh17Bm4@lists.linux.dev
X-Gm-Message-State: AOJu0YzKh5Ig4HY1COtBMqMv475wkDkrwXhoWu5oPtFbLPy+zYulVtoz
	k7rPnufe2+HOBVeCUYXT3ZwjNmUnuCyVABl/IBC91CcfVdMb1AvL
X-Gm-Gg: ASbGncs3jdN9QfstsbltwfNGHxc/D5dIiKPAGKL3OV/Uo3B61Q4ya0rVXcF7i5MbDww
	KwlC6I40IzqipfekjCPKV/0y2b3Hf4eYoKrwN6OUil6M78+2XkKrGH88nBtMfVUmdNjSytkyWSD
	nc85fImUIS9zsENiBd3CEZE3hrqu6Tkpz3dT+xIKM4tPaCfwn9OprMkPlsyoUlXWEAt3yZ1n/vY
	K+/N+vxkCaEsqqvzIHhAWKqy7VOmnzIW7X6XkTu8zUjOXRGXorCGwwu7p6GjBZTJBH/Vv/s6eDf
	IFffNsV2F30FuvsEf67cpMfwpOI=
X-Google-Smtp-Source: AGHT+IHTQ7zdy21IjggxB65+WUeE2WffLJ03VXeHe93ycTaduBaTH+0V/SULfFmqu1/Ro1Mn7ZBtWA==
X-Received: by 2002:a05:600c:4ca7:b0:43c:e8ba:e166 with SMTP id 5b1f17b1804b1-43edd3bd698mr70802975e9.22.1744107676131;
        Tue, 08 Apr 2025 03:21:16 -0700 (PDT)
Received: from parrot ([105.113.112.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364c959sm155838995e9.25.2025.04.08.03.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:21:15 -0700 (PDT)
From: Richard Akintola <princerichard17a@gmail.com>
To: outreachy@lists.linux.dev
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Akintola <princerichard17a@gmail.com>
Subject: [PATCH v2 8/8] staging: sm750fb: change sii164ClearInterrupt to snake_case
Date: Tue,  8 Apr 2025 11:20:40 +0100
Message-Id: <549b645b265edcb793458a534427f75f0ea343c4.1744105389.git.princerichard17a@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1744105388.git.princerichard17a@gmail.com>
References: <cover.1744105388.git.princerichard17a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change camelCase function name sii164ClearInterrupt to
sii164_clear_interrupt in order to conform to kernel code styles
as reported by checkpatch.pl

CHECK: Avoid camelCase: <sii164ClearInterrupt>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 4 ++--
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 1def02be4cce..6fef1ab484c1 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -24,7 +24,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.enable_hot_plug_detection = sii164_enable_hot_plug_detection,
 		.is_connected = sii164_is_connected,
 		.check_interrupt = sii164_check_interrupt,
-		.clear_interrupt = sii164ClearInterrupt,
+		.clear_interrupt = sii164_clear_interrupt,
 #endif
 	},
 #endif
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index aebde3d8b903..fc725a9952d4 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -390,10 +390,10 @@ unsigned char sii164_check_interrupt(void)
 }
 
 /*
- *  sii164ClearInterrupt
+ *  sii164_clear_interrupt
  *      Clear the hot plug interrupt.
  */
-void sii164ClearInterrupt(void)
+void sii164_clear_interrupt(void)
 {
 	unsigned char detectReg;
 
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index aa3f34c13979..ebc173658f0e 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -37,7 +37,7 @@ void sii164_set_power(unsigned char powerUp);
 void sii164_enable_hot_plug_detection(unsigned char enable_hot_plug);
 unsigned char sii164_is_connected(void);
 unsigned char sii164_check_interrupt(void);
-void sii164ClearInterrupt(void);
+void sii164_clear_interrupt(void);
 #endif
 /*
  * below register definition is used for
-- 
2.39.5

