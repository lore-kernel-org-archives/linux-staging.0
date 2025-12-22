Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45782877D8
	for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 21:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766438981; cv=none; b=FTjoeFaCCJ4vEB6yybatXQ66je2Rj9FXT98a/sEi3FT7Sy70h8I+oYhzZjp8oY24+kIm9CMOvU+MfaUXywzrg3ksjZ7xqOGDbNyoU9hV8p8keDS5yBVaGEESu8H0RrH4Le0c7cH2NXN8+CfhVtGbN0v4y27p6eeRPYhlLx9MzC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766438981; c=relaxed/simple;
	bh=pyPRbx6it1eRbylNbnhGgk0sgAAY902esWUARckU4U4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XZMfnpQsaMwQ2OjasemeSJYlbhSNMSqe/jhJY4TTvfG0q/cK0j8XotjB3Rz1FJqqj8tjiY8lHnmsnZpKdpMyNRvNlKw3dLcn0o0EyaUwk2TAKtKoagI/VT0CLwYtnd+VJ4s24E/1eWQoChnPRG9XBEvi+qW90KL/ePj/qBWA/x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHWrYhFH; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHWrYhFH"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64d4d8b3ad7so2194584a12.2
        for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 13:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766438977; x=1767043777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BXWJIrQGSeCEefAdF6HYxUBEX9eBPbFxpub4IBJuCcs=;
        b=KHWrYhFHNnVaDPRzQjVw+C12hFjZe2+Rwy955xvGRMTdbM6rtuvkfGDmsxz1ZOak0Q
         blPyLAFSNmb4ZAt1BP2pTs/Bcl4uovFUui4F6UhqvfmwUbbmK4Vw3kZkEgOVxwvkOqsk
         3KaA/jxxS4SRROWO5B6mDC4pw9s461QkADZhuit5umbJnNDIQsM/FfP8sH3UU8liAbsl
         IcEJZaZq9B4AotKjKSpaa6juymlzTvuiivGmR2xF7AJ7mPGIAGF5l5y9WTD0WS0S365C
         5NFRQr70kZ47DTeIMgvGEQYSZwZrfGDARyPQjGrgdBXODtl/3eiORqGCRvzzwIpJddW/
         cI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766438977; x=1767043777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXWJIrQGSeCEefAdF6HYxUBEX9eBPbFxpub4IBJuCcs=;
        b=a38Osee8jKCrruCP90A3/+lu0MCvvhrJAa1OLdcV89ZKsND6t2hixmDFyPoVe/+ly+
         1buuYVgSGLfoKpX5zB+0RREZR7ZACWBbg7Pbyz9nV56jzXEUKdxhAE59ZN0i6XMzJilt
         9FOUndjPFXlYvhC8cfbp/hWKzWbHq3GMK35laiJd594SF1Ah0LVfLwWEvLM4WHn7wzXG
         PXXoApWn88x5f0hff93BM7PSS5JD3Y2zZjl7msDsXGwyeV5YGsBvZXudOHhoXq79aXXV
         I0FOqPb8uIsjMQl4HCy7Atya9z7lRTpJEdbV6yAUg37xIWBfT+EcVAx3mMMgnn8a3Zk+
         DN6w==
X-Forwarded-Encrypted: i=1; AJvYcCVREEdbSYd1rdQeUbYOjx/E3qVNtfTBZHRGVYp4GtGS6qCItUGoe6PZEbE5aAPJ8yBpe0SwvrLQJOlLoUCR@lists.linux.dev
X-Gm-Message-State: AOJu0YxeF3K/MoNOm+YZmJSi9OG1Al7qw2pGV9jk1te/NYzbgZyx6Y64
	tSFP9MECd8XaQ9fnfhNRiAwKtwt/7pNuXse7qiLcGwijNfmPlS9IGcyp
X-Gm-Gg: AY/fxX4c2vLr2/yG0drQxMT0kazoSDxSrY2iAFqzxWM1B8slTHeCPmOQ6c2O7iKtDiB
	PH6p2ayRp2vg3qtuIZw+wx406iY2dBhIIWHmaIK8mfnSN+4Sg/dJjRit3ZLarCVxG/7vkCCSgBn
	bV6prjw7ZDB84ZY1IAdWWli7xAyDTpnVBToLSqeU0Qba72urdHCClAXiZm0O6vkdiHbGyZMqfKl
	w3UiC1E2S233izkG9F5oUy4F2ZeUJoAIjhWEQBBFmG6HM+j0d1sHSzsUduNAHNnP5ajU5rCfLv4
	Dy6q/emW7CqTiSoGnFyYA4RwlbIz8t3xejyyOQsm4vv9prMOiv4wx4utk+0u8Plwtqa4h6WpHcH
	oY6KD6FueHaDu6/9ItLsT7Dd0kgwAjdDu+J/Fci7cXshKC6U16Efj9sO177H4LTHXFrAQ/0Mfjw
	vOqvclI3PAH4MvLTqpFah+K8kMJGQ1HxgyNE/qjM2w4f18tsU5y+g5KtwwPgoesQ==
X-Google-Smtp-Source: AGHT+IGTKsTRfat4leQ78e123zhOg6UamgeVDxItHWdIQtPdUqEVFL3XYITUUz6+yg57k5dFN/i7MQ==
X-Received: by 2002:a17:907:3e8c:b0:b72:5d08:486c with SMTP id a640c23a62f3a-b8036f5a0cdmr1458907966b.27.1766438976936;
        Mon, 22 Dec 2025 13:29:36 -0800 (PST)
Received: from localhost (19.120-65-87.adsl-dyn.isp.belgacom.be. [87.65.120.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b912534f2sm11359443a12.15.2025.12.22.13.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 13:29:35 -0800 (PST)
From: William Hansen-Baird <william.hansen.baird@gmail.com>
X-Google-Original-From: William Hansen-Baird <william.hansen.baird@icloud.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	William Hansen-Baird <william.hansen.baird@icloud.com>
Subject: [PATCH] staging/sm750fb: remove outdated TODO lines
Date: Mon, 22 Dec 2025 16:28:50 -0500
Message-ID: <20251222212849.555571-2-william.hansen.baird@icloud.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TODO lines about "checkpatch cleanup" and "kernel coding style"
are no longer needed as all files conform to the kernel coding style,
as verified with checkpatch.pl

Note: checkpatch reports a false positive WARNING for sm750.c line 36
about missing const in static const char *g_fbmode[].
checkpatch suggests static const char * const g_fbmode[].
This was intentional, as the array is modified throughout the code,
while the inner strings remain unchanged.

Signed-off-by: William Hansen-Baird <william.hansen.baird@icloud.com>
---
 drivers/staging/sm750fb/TODO | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/sm750fb/TODO b/drivers/staging/sm750fb/TODO
index 7ce632d040b3..037984801654 100644
--- a/drivers/staging/sm750fb/TODO
+++ b/drivers/staging/sm750fb/TODO
@@ -1,6 +1,4 @@
 TODO:
-- lots of checkpatch cleanup
-- use kernel coding style
 - refine the code and remove unused code
 - Implement hardware acceleration for imageblit if image->depth > 1
 - must be ported to the atomic kms framework in the drm subsystem (which will
-- 
2.52.0

