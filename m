Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F7C33A015
	for <linux-staging@lists.linux.dev>; Thu, 21 Aug 2025 13:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783338; cv=none; b=j9uakSPAtfIgbKZuaqjehpMcQBpHuSwSMsASiR5REvJVrcqX/X7/NzLb/LfE55Tvjr1EooArvAQyV/133F7F7Efb3rykZR2JZm84nZtVI5tseCmFutTnruSg/anfR0sGxjK9c/y1BO2UOGw07ByKw0psxV6FnaF7rBOMY4A5Xyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783338; c=relaxed/simple;
	bh=wc++2Oy6r3s/7kL3+UoefnxPfMBadpuQu0bcTemREeE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cI54KOyY7d6fGnJNHtQv6qUdduSyGyTLDs6PFh+zENzjSmNJ3RxYnvLJulKpsrxT9D/W0k/b5Keab9sOguS5TxjlI0C/SRNDTS5mqd4NtbohPcf1LCQYXgLTOwu8jdn7SqkCOTiOupYvsRE+bVv7NhyPbYv+Nd9HlmO5F99o1d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wRH+d673; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wRH+d673"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45a1b0cb0aaso7573845e9.3
        for <linux-staging@lists.linux.dev>; Thu, 21 Aug 2025 06:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755783335; x=1756388135; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r5c8q0Ky8ajlAkdaKgOXiGJui2dC0wizBAr85LUc6gA=;
        b=wRH+d6738kbNFBcxTXEK0+WGIRw9dfR0KRXii0Ti0f2ssl88+HzYQv5kR3WG3DpxOH
         ZusIKOGnQ2uZ93GV6iwe7/pfdFKUeIcMXqV567LWeWam6HItOkSmxbMg/+6KksNRfKLH
         eDuIWYNqssJOzvmOqTYJfSoSWO+YtsekTLxLOsaBQ0klB7rJNkV1wVLQ5FPgm6zcp/us
         roKYa/7vprrATsQ/krWKCzgqXVssdjMeSa4SPjPELikHMinuTEO3FybN4PU/SoVrjoGA
         kAGYfY57cNEjNzfZGVfTrdPFdpW3NyJ800m7XhyxIcjxdaA02SVbhRvedjPniFKyNJ9W
         5XGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783335; x=1756388135;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5c8q0Ky8ajlAkdaKgOXiGJui2dC0wizBAr85LUc6gA=;
        b=M7mDGsu+idqil5vpi32aUhRHuMqETuQ7tJ8s4MtrEBQT8emtSYVLGetQmQF9IVIkIn
         9/avOqPy0Sy2Zci+0a2ioq3dvljJCc8u97GA2DjmRNhWs/S5EVwgXT4oJUuvAzw7TI+d
         2TgN5VBoi5NsPQoSTPz+wMIAzgHTwKv5oFWJ7RPXVjfrdb1E++m4AVKlxqPElvqIernh
         qKnCJ1fiJLmdMOw+nCQqC880wl+xo6i86qTKQin+7ajIFPRByIGTNrnr4/ehy3PUZ5be
         RQnt8WCpiNUmAl2sj26v4xi/teshpWrCyFtoeDqjeImkIZZnNU0H47u9MLxKOJuE7EiH
         85GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxG7pR4aEVEuSXG5PFfKDXIojlT6vTY8eNU/zjBtCmQylwc8lKnvuzirWxJfSp3NqGn7rAXjgodLkHzmTg@lists.linux.dev
X-Gm-Message-State: AOJu0YxuqMDeG2rAzs2fwuKlqwl60MrN6W0V7SrRy3oEOVY2jLNc7cy7
	ZMj3skfNPH2ApvCMl1B5q2w2S9pqUgNNOvRkl4fEhIq9qXgoicXrhWVZfgdr7neOnRjHsTXC89+
	EO7ytKxf6Nw==
X-Google-Smtp-Source: AGHT+IHIRg6I19eGyKLDXrDhVh5Q1QDPm2jvIQ9GUlLEMDNmDUHP1uq8W2QMfP2fIkEEXeSTbRaTO5YZvqrI
X-Received: from wmbbi16.prod.google.com ([2002:a05:600c:3d90:b0:458:bea8:57ef])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d1c:b0:458:a992:6f1e
 with SMTP id 5b1f17b1804b1-45b4d7dc73amr28165345e9.5.1755783334885; Thu, 21
 Aug 2025 06:35:34 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:35:19 +0000
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821133521.2665734-1-abarnas@google.com>
Subject: [PATCH v3 1/3] staging: media: atomisp: Remove unnecessary forward
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

Get rid of gdc_reg_store() forward declaration because it brings no value.

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

