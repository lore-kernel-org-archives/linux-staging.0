Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29C81AF0A7
	for <linux-staging@lists.linux.dev>; Thu, 21 Aug 2025 07:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755759698; cv=none; b=EjSTsCHAK7gpOYAkO+o/Ryi1bE7KucUOJpVkamzp7KYZmY/xahuu4rPmRhTkHEtAbDUtpSowuxyAtzjHW3BA5pzOLSgiDSx65kpUe9p8IsjNs4ro0yPT0ar+yn1dHnScGcnZ3vOF36JSAs/ulAIXypjHJEqgdxCgcZjF85xUax8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755759698; c=relaxed/simple;
	bh=xAbwWeBBjg9N+cdieYDjYzALaVmrwO5vpPTMIUPytzk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nNN2u8ZGbqq1QWL5nC/Y5GjHleeRxJcIGO4Cd3bsl6P3I871RooxzI8ksP1WFRc4hppeJ3eQKQpNlsaavJp8Q1c1UnxnEPd53SwsvMWrBXPTcrWm/qhU0lUlnUgXhPCV9FzsfcKkdM8EpkjKcTtlooexpdCnH+2uUPAZ+GNYWUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GlG6Nmqh; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GlG6Nmqh"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45a1ac1bf0dso3706995e9.0
        for <linux-staging@lists.linux.dev>; Thu, 21 Aug 2025 00:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755759694; x=1756364494; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GIUE2PmBqOrrYO7GAV3V+fHhCJGdLaC9xCv0zLUGcNE=;
        b=GlG6Nmqhv8lNPP3193R112d2xGV+841kRklS32pukg2EsfOJh4t26n7rx2ummtTWDE
         r8kuimOXMdVYAMa73bXDYsPOZdFIexq3nUT32TAXZjeWg6dUg/u1OF6oJIRmJNTpa/BA
         s6Wq5IsHhXqw8YLUcF2WGcfW4ENFb/qwZ0gOPvNITDmiP8rLZB2VzjD354AgKP6X+bIR
         F7I5Sz0MhlkG7YFDNTwgUwIXC7u7SKJbjVAgKK6w3jJwsnQvTFrUb8sNpwMZv1EEwsuQ
         5KluFsSh+CgZlNd3dtbvZXVNvAhaj1yuk1IgIGnRwaQB1s9IRIOInITME6E9pQ+jZHTR
         HaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755759694; x=1756364494;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIUE2PmBqOrrYO7GAV3V+fHhCJGdLaC9xCv0zLUGcNE=;
        b=I3/MGVFnE/ADr5yxPSvqQb1mLPO1bP9JfZJYiw3/zFuycTvqrpc4U6XlnEQZ1lmKRh
         rc+rcoHF30hT/efusyoOUZRjJHswcDNwnAE37uIXCPnjMVyFEDrL/L3xFYY84+N+NN25
         93ekcG+HaubP0MEHMj1//BU7E8GOrKFFWup8620Fy6Jb18+O3erB0oBplMknpfJKQ2EE
         la6wy97vtc4TSQBAsjnHaMcpZEcwy+YwTarGmvgxqroo2+dYdmcMGhQ8nXAHeeqwd5xm
         nO02TmxFk/oQ/O8XdnIFOJeqD387zSv2+4x7cJ8d2Tmz+ONF3Awa1AN8TcBfH315sA+L
         mOpg==
X-Forwarded-Encrypted: i=1; AJvYcCVvUgnr2TCBjiOXEkF2a0VZeIF4RyXQ87Y2wGWcgV12O0fl0nx4PJ6F77YR3i7fYW3CHMLOTn03gClCv+XS@lists.linux.dev
X-Gm-Message-State: AOJu0YwG02pyQz6orUg8s+zDWuHNHJe5H3ln3K/EthCADqJQ1IKXKxTD
	m+yinjRoHk/Xn83A+zlwWkFy7sOx4OHd3wdfwRH//ZmNvRetrlP6vZ1rocfSufeqw33ogIgB4F5
	BUxRZ1SMPSA==
X-Google-Smtp-Source: AGHT+IGlH2xw1DoBwNhaE0zN8l2SvWcW/Lug5/2eb+mUXE7rWPWReBJndxbSGekbGMY8ZvWt/3V02e08ioCL
X-Received: from wmbee17.prod.google.com ([2002:a05:600c:6411:b0:459:6a64:4582])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c0d2:20b0:459:dd1d:2ee0
 with SMTP id 5b1f17b1804b1-45b4d70e0f1mr6209805e9.0.1755759694320; Thu, 21
 Aug 2025 00:01:34 -0700 (PDT)
Date: Thu, 21 Aug 2025 07:01:28 +0000
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821070130.2581766-1-abarnas@google.com>
Subject: [PATCH v2 1/3] staging: media: atomisp: Remove unnecessary inline
 declaration in gdc.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Get rid of gdc_reg_store() forward declaration because it brings no value

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../pci/hive_isp_css_common/host/gdc.c        | 24 ++++---------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc=
.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
index 8bb78b4d7c677..bfda3cd13306e 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
@@ -11,13 +11,11 @@
=20
 #include "assert_support.h"
=20
-/*
- * Local function declarations
- */
-static inline void gdc_reg_store(
-    const gdc_ID_t		ID,
-    const unsigned int	reg,
-    const hrt_data		value);
+static inline void gdc_reg_store(const gdc_ID_t ID, const unsigned int reg=
,
+				 const hrt_data value)
+{
+	ia_css_device_store_uint32(GDC_BASE[ID] + reg * sizeof(hrt_data), value);
+}
=20
 #ifndef __INLINE_GDC__
 #include "gdc_private.h"
@@ -92,15 +90,3 @@ int gdc_get_unity(
 	(void)ID;
 	return (int)(1UL << HRT_GDC_FRAC_BITS);
 }
-
-/*
- * Local function implementations
- */
-static inline void gdc_reg_store(
-    const gdc_ID_t		ID,
-    const unsigned int	reg,
-    const hrt_data		value)
-{
-	ia_css_device_store_uint32(GDC_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
-}
--=20
2.51.0.rc2.233.g662b1ed5c5-goog

