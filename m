Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456751B808
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 17:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779038194; cv=none; b=hA5e2imXj1DIJf2owCEmFxp7BvJ3P5bo5abH7gvK67grnCXqlcYtNVQsdhb5xXQ3A1DNCkuGSlKOQgXrgeErs3GCnVpz4XhB8VgPtyZ+XNjEH8qqRz/e5XKzQ2H50kDB6npqnyZoZ4N8HXjVvSvnOEYlgaY/JRuWRZ0foFZiUkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779038194; c=relaxed/simple;
	bh=/hfaNiuiZBwYNsrqHyXlX8QBv2OlqIaQFYTQ/5Dw8fg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KUbJTh4wN1qTFdg5lUG5kBzI4AmPjfpc2YH8FopIMIJWFfdFUcmx290SBwKyiK1CSlcLaJrHtThXp/6hA9fphHUPIWAFyGYncyrAijIzRbAhKb1cE8gDdNiUR0FJEDoufk5MVtijLVru1Mwpj+3wXV0rMm3/SGvGph+rW3NyBLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+XsiEu6; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+XsiEu6"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3664df32e91so1507173a91.3
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 10:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779038190; x=1779642990; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5xXX2Y86tdkkaKcWAnVmmQD7AOIU68u7Kw1dAHi0us=;
        b=m+XsiEu63yqAr0nNAKCL81+VPIByAKRTk4v8FWNlmkQ4c2FjCVlPpfl2SUyk8ldS3G
         b094Z05cvYEf2g626DyjU8iZeessu2jT5f5CEyK8k8r4io6XGOhbUPzroGykniNwv+2K
         lv6q2HUQz/vae7g1kPvGAGXabjwv4TwoVOJrmkkMeJVdL3T5SAyLo3j9LJwX2dESHS6h
         pkKDquKXK6O7LE9BfWH68k7GV54k73X0DbQ+aKgVvwDZ1+L8ZnGO2G9xwQGVU51UrhqD
         ya5uQMqrsSAVC8c0nbjtua8cQsa+aTd+3EDV5UUO3VB6tGO22waaS3KaXAdJ4Oq2sHyY
         i4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779038190; x=1779642990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5xXX2Y86tdkkaKcWAnVmmQD7AOIU68u7Kw1dAHi0us=;
        b=CC34klaHSUr1pvjqWShNTq0QJYmlys5BVkBtq3dP1LzsF48W2qzvAmd53ZJwMkwauz
         gT2GIWPrtXaSsKpWl52Q2Fgeqf5YQUNzH+lO+LoWrUnse59O6+qGXuD4m4b2oxgwDnwF
         roZxxwc2L3Wgz5a6Jea1OiZwMEw82EC5PE4h2WcpHqJwVXmEwMfXiWQSlT9GSHPLnHFR
         NbfbODdANNmtJeE+6+WfUxs7tdfKaErClS6VO/A04VkRQfYjQBfXVQxr3ISFzzJI1OTB
         va8/7WK5K0tkhGJ7yVPmlblARCUi6yuqMIpuPdhyOh4w7XExpz0CdBKk7XgyCIjkYkk7
         jCNw==
X-Gm-Message-State: AOJu0YzLD2fp3BAZja9svQXHYDyqXyWc/ZZJvpq5SaguxcDlfm5vMLyQ
	3PxbH9bxDLaNVGfhvlDCFo3NyIPS6VVh4H2EMnWD/rQMuFtVW5G7F5V+
X-Gm-Gg: Acq92OF6xN5AnczkuP9rXr+pGDz2yahJN5vAxbHBHYUD4z10DsDUVUdFoWxycFL2ECY
	b8QssdCAEG1OdTBLMfnYi9yftm99H4FWpPeFBm90spqXWyIG6IaGZcL0fhpVyYKUI5P1cO3LlQO
	gELjA3YeuPaubykUbJR4GS45cUrDd+A00i6hfPTeR5OW33kbGKlE/xsQ6+hZZe/LY6YzL12wqlT
	93RPB3nzAE7e36/LBjCMOaMzrte4YRe/by59TRfI7vlyYgiwYLUy0n5nh6dE1POYlCv6+rYH5In
	x/pVCmueCbKGNUYUW2k6w5C2kho2h6B9wum+Dr6AvtNvCFvFhhjsilDCM1cUkEQVPWhZrFHRfZG
	FToQGNsgKd/j9ceWoa2ofamElxsr8zNWo/D/pBnGKaXuwBt6q85eC/1Dzu2rUdpQn+C6KRHiWDN
	Ta/IhSxqAxVc9iQl0AGGFdceN1cjBt/uA4PSkqHXh/
X-Received: by 2002:a17:903:c07:b0:2bc:67cc:d1eb with SMTP id d9443c01a7336-2bd7e8a7b6bmr85233295ad.28.1779038190408;
        Sun, 17 May 2026 10:16:30 -0700 (PDT)
Received: from fedora ([49.37.171.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c26355csm121190305ad.35.2026.05.17.10.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:16:30 -0700 (PDT)
From: Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
Subject: [PATCH] staging: rtl8723bs: hal: Remove unnecessary blank lines in hal_com.c
Date: Sun, 17 May 2026 22:45:37 +0530
Message-ID: <20260517171537.17787-1-praveen.pattar2022@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove multiple consecutive blank lines that violate kernel coding style.
Detected by checkpatch.pl with --strict flag.

Signed-off-by: Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 728a2171f..de1fe8a98 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -30,7 +30,6 @@ void rtw_hal_data_deinit(struct adapter *padapter)
 	}
 }
 
-
 void dump_chip_info(struct hal_version	chip_version)
 {
 	char buf[128];
@@ -71,7 +70,6 @@ void dump_chip_info(struct hal_version	chip_version)
 	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "RomVer(%d)\n", chip_version.ROMVer);
 }
 
-
 #define	EEPROM_CHANNEL_PLAN_BY_HW_MASK	0x80
 
 /*
@@ -378,7 +376,6 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 
 	} else { /* typical setting */
 
-
 		/* BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   1,		1,	0,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:ep_0 num, 1:ep_1 num */
@@ -419,7 +416,6 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 
 	} else { /* typical setting */
 
-
 		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   2,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
@@ -751,7 +747,6 @@ void SetHalODMVar(
 	}
 }
 
-
 bool GetU1ByteIntegerFromStringInDecimal(char *Str, u8 *pInt)
 {
 	u16 i = 0;
-- 
2.54.0

