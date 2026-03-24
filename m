Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D099366546
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 13:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359093; cv=none; b=pzZ1gPDeljQkjl92IQ14weQXXMOtC/xFReD+nb7s7iP8z/WKi120YH8aRF10H/asvpjohz+giGerZ43ywBXse1VRHO/KCGCbUBmzKT4ly9Cy0njHHHXdL+s9CRIYsLiOT2uG4KsEoQVaYfEXIsYje2uOQQhAkuOyWjIgXW6eh5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359093; c=relaxed/simple;
	bh=i+41mCEu74hikVAshzbO1XkqjTQJOwQmZbg18+1HQMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L0IL3t3qEvdX7V4UE/cMbBKCwQW5KgvAbuDyM42UjukKgGSy7B1nxjFQZCZe+2HYR4IfHJ5k6ME2xCwOW1YT0lj4JALsgdD+AcZfp2kxKdCffx4StXf2yOeEMPttX96psJNfXbOnXRu+NVzucKUrSk7mntUxbcYLs4kcTAGA07c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNyRQLrl; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNyRQLrl"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a8fba89cb5so7971005ad.2
        for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 06:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774359090; x=1774963890; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOwUeJmTSDx/WZPhAB3ncmPhliLK5fmsMzbPGcBHK7Q=;
        b=QNyRQLrlefVQ31Z0jzi+PTsMUcjZe9SWR0u9FzWS4QnpBBZVq3u37Fg5YvW8Dj1qBr
         YG2QCb/Tb02L2TH56KlXdMA95BNTMJdl8oHM50nlYm2j07Qy0l1wtF5Cgzj6n0VrtE0i
         43FouT0bR8rAEK7w7rnghrRvFnb1uBI9InA8JukTHuWKTv6i5v9jvI7ZYu7dCbJKi1Nm
         9PALRS1+x1WPjNKV1OBgWVNf8KmmpgHb0FubRiR5+IfJvTCm0PKnWsdFFasE3pQAXPnV
         MO8OvKERobLSHcF8hMenVmM+Os5lzbyGD610JNahsd7ZRJ0+5vslssiEqxup1oReIcGQ
         e+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359090; x=1774963890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dOwUeJmTSDx/WZPhAB3ncmPhliLK5fmsMzbPGcBHK7Q=;
        b=ZlwsfewY7iKaJPQ/RJDdwaTVQ98nw71o4a5DpJb5ic6UHao+FBYxcGPuLBW2fcMEdZ
         Szf8L5+kCdkRmuHrQIRjOz08lDwjb2t8Y+LNpth1aAcYM6Gp8SEav5hhDLsCGcZx59nP
         fUH2I2Oxj9jdUCJTfPmjpqH+W4MBi4DGh2G94Uue5qEcCWGqnkV4A3uPt3cd96XNKCdg
         AldQV3LeRJzXSIowps/eIWWH0WTw2lKKaVASJJjHfLIezExEdXXSpW0k+qzM0/+iI+A5
         d6PxHTWL7RgWanYAaSeEVITVGA2hlHhzXzzCCqObBXpb5MU1vRMFeimbsK0eT87EbpyI
         C7Bg==
X-Gm-Message-State: AOJu0Yz1IEdh985R06BZJvmeL6WTqKpnMr5IMcf59oMpN4EBGyS+iPXU
	fF4ey9bXgzlHKFcqW91WY20XYeYLJ98LUs562wNsSxSjRFq354CcgnurzOvXxCR1DvLbrA==
X-Gm-Gg: ATEYQzymrZj/XzJHkooQcnHdvUXeIh4jsSNz+CDFE1syuuAb5hpHVVLB+PbXOz9Dc2+
	EJV1Vqxe7lfxnbD2vboIlq+sIaWwBr0v/vd77C+2xl/DTvREYlI48ksHxOp/PXLgiuYyYQDupk4
	pT4wqg/JHtieBHetOI88+ODi/lje8mWvWA/0O0Y7/wZRt6xk91FfQVf50GMt6+FGJsooo+M8X5T
	i4dG0J+P0wkVSYjtid6K3N+t0/nJe12WZD7cge9mCRcODufsQScOxykkBAIPWqCZ8eg/VMx+JHR
	lsMc3deaGLuh/bjY5/Myz6SX+7P06kt2TNN6g9QsmpRNGBcACAvFY6hyVbenwnn42ur+GyG/ZiE
	aH/PTOj3PpPfQF+KJ3y0pPwPJSfxhurSIbW5U8gidVn1E1sQ6V3EkRY3KBzNvWvcouR1V8Lj9sn
	Dyup1OUiy+Cj5Nw93zELf17Ced0IT/
X-Received: by 2002:a17:903:41cf:b0:2b0:7136:d980 with SMTP id d9443c01a7336-2b0826d3db0mr105658095ad.2.1774359090073;
        Tue, 24 Mar 2026 06:31:30 -0700 (PDT)
Received: from fedora ([2401:4900:bdeb:4823:b168:4102:56c7:c7d9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08354bb76sm147526535ad.34.2026.03.24.06.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:31:29 -0700 (PDT)
From: AyushMukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	AyushMukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH 3/3] staging: octeon: ethernet: add pr_fmt macro
Date: Tue, 24 Mar 2026 19:00:29 +0530
Message-ID: <20260324133029.82764-4-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324133029.82764-1-ayushmukkanwar@gmail.com>
References: <20260324133029.82764-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pr_fmt macro to prefix log messages with the module
name for easier debugging.

Signed-off-by: AyushMukkanwar <ayushmukkanwar@gmail.com>
---
 drivers/staging/octeon/ethernet.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index eadb74fc14c8..5bb8c303f88b 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2003-2007 Cavium Networks
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 #include <linux/platform_device.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.53.0

