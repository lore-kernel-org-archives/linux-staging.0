Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546BB32BF5C
	for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 12:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784441; cv=none; b=q8lrIQXzvCqAU9ulTInOFhIoCLJX36dhaAXna5QoU0CFDJl0Az3VY/WDr/NzHHDBFaU5xr8QSOOcH70Vh+hrG+zRwqe8J9LtnRHZEY/MMCSHnJHdxiQX+h5glWz/o02FP5G97AejEypS8kF806cXeVUAjpWewoQK5m36XT5+0Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784441; c=relaxed/simple;
	bh=SfbOzbA3MKHsGeTbafSXSu5EYcsHWSO9YIZOKREiu/s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rcmqQfmaJH6NUXaN74GCljcH4apkjQs8w/+9mimC4dm9ZxU/XvTFAeMdEfMiVuWqer1F5H4k7V2dMsFBKJbyZ3hTyjBamE8HQV7JEGXWfLWjcin2qSwdvDr5ztXlChGU7fGo9jX2zhD8VpcUj20XVS/CpqImpS90QmN5Zo/FBEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUxw7PAe; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUxw7PAe"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ad4f39064bso628376e87.3
        for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 05:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781784437; x=1782389237; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T++eRh22ZRqvDFRoIZdWaDjQ3HSUiMobAguihqXNESA=;
        b=eUxw7PAea3ifaFsoNBfhkZ+5r31qxkmuFACE+Eu5901WjB2pSS6J79A9qPfZc9YLTo
         kQLS92GVeRNau2c77qePcrG9KfB1ETOFXswdDqiNl13/2NWPxhbSzBarsSQIncODkMVj
         STndy9V5swPTQ907gNcrs0xCuBVbBn/IL5O/s7X4nPvJXfsNMVEqGKoCxU+VonXZ5mKV
         1XdcCi+dxgahaUl7b7DjFGlZ/3kLKGC5nKCnhmp7hnen3gHR6H7b36rmbgOy6KwroDLI
         laFAV3JW8L/drL0nucwGONCqkIggXh9nQ3AqiYThH/501zQI5RuIWJ4JIaivOvENJZ4p
         hrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781784437; x=1782389237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T++eRh22ZRqvDFRoIZdWaDjQ3HSUiMobAguihqXNESA=;
        b=lhFsd0TmdqoBkEA/neNqAN25NEJZJbqIlp80NvO7nJk78xmEleT2V+mcSbGp7YDM/l
         3nQ5u7fkul3KwE+OLVWsZ9gKT4sDWMk9LhlLonH5k6oW8GFZDK7TaEgfUgt0Whw40Fyr
         fwEJKN+4xvMLVYiZ/P2smrASs1n4ok/px3nSl8eh9jzzj2yhhuunXThU1nheo1YmwaRS
         nGFZXUJ2vcACoqiL6RutOjGNauBwa1gXcVD7AvJK7Z4TDPAO22LkxfAsf7iO5U87DXZP
         27Mvw3cjCo5HmT9GdBlrUNW7d4IM42e5UIw6SblGsOJFLY3xc8Nj93Xyc4WE2yjLjWTR
         RSrg==
X-Forwarded-Encrypted: i=1; AFNElJ+eJqGaEyeLqyUVmp4RJPOA4CeSQwSloFAuHfR7CNs3y37ljTEGWCXKNXGpVNsjCFJrEYlr4WKysIpF6W8B@lists.linux.dev
X-Gm-Message-State: AOJu0YwdG9SuqGnomluh5x/rvKcSFKadr09VaRL4aBiG2Z5VpgdHrLzL
	Iq0x+dTD75deXexukl5IzSTxYV/eN8cwimvxLpq5uJj6uSSgHUGoQNcy
X-Gm-Gg: AfdE7clmUpKY6b6XxN01W+UcIBbSTqhcwnXi6Fif+vRKdBPahT8wVoEJ9Xj4smO0qaf
	SfKnGDpFoX8CffLU1lnJxPcB2TM8vaCkOItyaSt9tJd2xrXMkPUWR6XG98IbEWFQWNBYS7jAb12
	qlhp0wiKIiCowUA8piLloKvNzYsXDa4/bHZQ4xUocGVQF7ozYkj30ArtH8AKAm2YC1cJ9pRoGZ5
	ivn+sxOxXr0uwxZex9WVIygVndFACfxU8RrujiM7JPUq5UrZTbSrZehdZ4DjEyCgDOXn6bpMCuH
	+TT9abYWGskmsuMCBXPyvx+GPWuYu9LIwvSm53/kj45WsBOzm9+VQ9FiDF38gA2DUwer7bJ9PQ3
	JaTXTQDRvNHrgYHGNGliQpBHuWjSovrE4KCDW8Xu2Kd6cdUbYuIEw0aARsWp3oc8Dyh1Oz2+UAv
	mObsvDvQFeBTidgHnjYqIdhqD4A+R15u6l6J0zeXw336SqbHbB4OU=
X-Received: by 2002:a05:6512:3511:b0:5ad:5346:87ac with SMTP id 2adb3069b0e04-5ad534688cfmr396355e87.13.1781784437232;
        Thu, 18 Jun 2026 05:07:17 -0700 (PDT)
Received: from g.localdomain (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b545asm5356676e87.80.2026.06.18.05.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:07:16 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH 2/2] staging: media: atomisp: prefer __aligned over __attribute__((aligned))
Date: Thu, 18 Jun 2026 15:06:23 +0300
Message-Id: <20260618120623.42867-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the GCC-specific __attribute__((aligned(a))) with the standard
__aligned(a) macro to match the kernel coding style.

The checkpatch.pl error about complex macro values is a false positive
here, as enclosing the macro expansion in parentheses breaks declaration
syntax.

Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_include/platform_support.h   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
index 473d8d4fb9ba..9aa445c45e9f 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
@@ -20,6 +20,6 @@
 #define UINT32_MAX UINT_MAX
 #define UCHAR_MAX  (255)
 
-#define CSS_ALIGN(d, a) d __attribute__((aligned(a)))
+#define CSS_ALIGN(d, a) d __aligned(a)
 
 #endif /* __PLATFORM_SUPPORT_H_INCLUDED__ */
-- 
2.34.1

