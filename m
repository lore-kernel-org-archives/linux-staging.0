Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C5D50276
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 21:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770499463; cv=none; b=Eh7wXPLo6MH0pT+n02rdg7CQ6qbvx6vW0Y1CB8pcwRxDGVFtFH3OoSr0djKVXo+9yHMzbU2kTv8R1IjmLga2GEG8NXmNFTP6JFlYuAx3m/r1J84Lnb+qK8qKGgWarGB8/QldWklDJSUBDGAcdAzqmy0CRok4oCXGlaArIwVd8ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770499463; c=relaxed/simple;
	bh=znC+c89Fj0oQshOxV0VvpdMyEesdypwI3of3qGsYJ6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pKYcJwWAkh1HLNnUKsfdyzD2I1NLLXr2PgA3CkXdYoM+GiDm0OWxFTVrovAnrnGn/EkxiFpGheJVnwoU1u0m1ckvxiUfmfo38Ef2GOQXphSpPTYgPYhrmrYvvqLguv47loBB5lFUlIp3p/T76WJVjQouVBVbxj58SalvChbEFZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Av8AEA6k; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Av8AEA6k"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so2884562a91.1
        for <linux-staging@lists.linux.dev>; Sat, 07 Feb 2026 13:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770499462; x=1771104262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S1nzzQBPwDG8eSyWSNqpWAtchWWWfeB70K0ueF/vw1c=;
        b=Av8AEA6kZhtUtVNGG5noOdfjJXu0B7Fvi3xkjyBYzSdZbB8uj7vq1lmbuWxkl9mUr0
         uLG67bdnKxs6sTv3h1AwtcDECPRV1SUt5ECzRBoF1gVmMdgdsqjLVVcI5ibczAVOPc8Q
         OZhkJwCw54gFhpJ+6AAM2DDgvuKrUGZAKM7Van9xhZGB+nFgOhySFUVbeG5rRN1yFAEn
         IKHgD+Gfw/26H9DkJVPgyUTHv9UIqFX5RlpDPGX1EQrtNu9GR2PIQQi4PbuNQbRRcNJy
         ekIrSgmDLzYGRO/5VGxz1XutEjxoHGBvvOqXTURY/h7tPas5H3NHkcLQrV9qjXvMLCrd
         qA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770499462; x=1771104262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1nzzQBPwDG8eSyWSNqpWAtchWWWfeB70K0ueF/vw1c=;
        b=fLEff3sVotJYHVCDQMQZh2NxMmG6oudh4wFq4gwk9MU62M/953gcT/qxRXdGWzQbcE
         +iQJP/TscFPFrzsLwv0NuExjpbBnTSjWws/QK87Cm3oin099tOkxdOJbZcId792/+fNe
         Nkjrpnxzlo7gtWAMAbwK4H6jCSQFxLg4PLLshux7FGdIgRAwl7lEzfwstfrfHNS74rMS
         9RTN4IPDDesBcTQCGA0jh5lJtdZVpNsjIrM6IZ+yn5drcM/PExpzSN3Ihw4wzb5M40bY
         d5Yf1nC+AIn6mQpNKpe8jozhw0at5dg4GBSR0jSBQGtNV7UVh+2z7BU0KEmMEILRoCC7
         ZpoA==
X-Forwarded-Encrypted: i=1; AJvYcCWAENm3RpGk6GIl8C8Vu8l2AiITADslBzp1+AgzVM5+6OfAawqC3zmR/H0gbHgdlPHIrAr6cZu0S/+AAWff@lists.linux.dev
X-Gm-Message-State: AOJu0YxZzRwNx8heN/0tw4YUo8UTiM+p3DHF6G8D3hI8iV2cHDV2QZq4
	5T3kDz8zjckcpjDIQU2PJNl4lKayIn3EdOC8NO/eYCq50Mv1bQyB5IzBBWEATQ==
X-Gm-Gg: AZuq6aLgTI9Y9GLEE+ZL3GWDOU2FE03hGSdkJ6askAyEG87LEACRVbriqLE7hVd7KRG
	Sj8I7RJzcUdr0soo7CVA/1AgiI/4bK7HrlBWVEL8WYGwAxJ4BsDYrWzfnI77xEXAZkx4bJRtX51
	hZv2RyBdAUaH6BlgH7gDvgtDGWxX6Lj6AziuO1kZ+hgS1HSRxbjNHF6LN/Bqk39T9k+vDM/xaMh
	ktfjddE20PzdNVt2HGy+5qJPjiiS3MJWpGbCuyJiliH39V5YkERXd1PuR4y2a/dd7zh7kecwsaf
	632UoqQDvm2RXzCGSxqKNye5/kCpqb+akSedKloi9DzhA8nkwlC3Lzkxpfh0se1yJ3/qem39xgJ
	IMi+Mgspv68VUWLZNMhlFO0SSYR/1pIHTABXdkuKDtwzjo9XFF0kUkN0C/n6etz/U4RBK49Y1GA
	bckBDqI4LpZUKybWEBnE/zjUmhhxf6+bw7nc9Qf/p8qg==
X-Received: by 2002:a17:90b:5348:b0:353:e91:9b2f with SMTP id 98e67ed59e1d1-354b3d086ebmr5999630a91.37.1770499462390;
        Sat, 07 Feb 2026 13:24:22 -0800 (PST)
Received: from fedora.domain.name ([2401:4900:1c80:515a:e2d8:fc5e:e39d:5717])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb526676sm5190239a12.12.2026.02.07.13.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 13:24:22 -0800 (PST)
From: Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
Subject: [PATCH] staging: most: dim2: remove unused header includes
Date: Sun,  8 Feb 2026 02:53:54 +0530
Message-ID: <20260207212354.51694-1-rajveer.chaudhari.linux@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused header includes from dim2.c and hal.c to
reduce unnecessary dependencies and improve compilation time.

Signed-off-by: Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 3 ---
 drivers/staging/most/dim2/hal.c  | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index dad2abe6c0c9..b406cc0415b5 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -7,9 +7,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/module.h>
 #include <linux/printk.h>
-#include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
@@ -17,7 +15,6 @@
 #include <linux/io.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
-#include <linux/sched.h>
 #include <linux/kthread.h>
 #include <linux/most.h>
 #include <linux/of.h>
diff --git a/drivers/staging/most/dim2/hal.c b/drivers/staging/most/dim2/hal.c
index 6abe3ab2b2cf..50ff3ca37073 100644
--- a/drivers/staging/most/dim2/hal.c
+++ b/drivers/staging/most/dim2/hal.c
@@ -11,8 +11,6 @@
 #include "hal.h"
 #include "errors.h"
 #include "reg.h"
-#include <linux/stddef.h>
-#include <linux/kernel.h>
 #include <linux/io.h>
 
 /*
-- 
2.52.0

