Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42962175A8D
	for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 12:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781439754; cv=none; b=RT/tQkxFgbgqMnpRjkJ6K7wlusrRXQhKHVoG1DsWsThkfeBxVQhGLwcKMjn4KXB2xrX07BTJx7eXD3mNNrFUGP0f7wBMEMknebQGg9QTB2QI4C7wZzFh/jbuqRBS7pQqoenFQMRr0jFKxScRQOwmYgEPEtLH8qLbZXXstJGGPQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781439754; c=relaxed/simple;
	bh=MELML2XPy6qTWzJOp4vMn/VRRRx1GOhqC9FIu/Tnskk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y3Vxf0+M78RhmmsE81dOn8cuCs2p5TDjm1j1aJ3nQIM+48+JBvEoZouu5jwcRm0RYBdygjcWrITRw2SGPRRYHWcFgPadk9SQsnMvEaSqk7XY6fhjHMiqAWF5NdxqOgq+/vDTH9zZrD3bF7fNAp+ooiGJ2S+4Go2aty6R7dVlbLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iwvet+kF; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iwvet+kF"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf30d530bdso24868565ad.3
        for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 05:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781439753; x=1782044553; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEvCGVGl2V6rer+gl7iIq0ltW3OZS1IqmgFM+NAYU5I=;
        b=Iwvet+kFCiEPnjN+uU5S9SIX7//pQi2tbt1zzkDDYC4HYZvwaav2ZoxnrhpAgcPZpx
         rHivXfKngMPHOQuG/JRK/zqQwBARLqA4ONXKf1gaRTFfv9S0/Lttx/yqvI3nBHCTjZY0
         oLyz5TkK6Xgcgq3VnvXF92KZ+lvqiUBgItARVE2FZT+roIzRT5dxwA6lJ3AUwIDYnXNk
         VkMXRw/WxywdxlIob2vMw8Yo076zX2CWP9cl2HuMY3/syf6AgoDnij4NgLHR76h5PhXS
         g2ZnkQQD3lQyKdOxIeXdIZFDZXTe2qcy9x+OT6bsi7sKsfmEswOQNjxuUL1XS2QOyCdM
         ZpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781439753; x=1782044553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PEvCGVGl2V6rer+gl7iIq0ltW3OZS1IqmgFM+NAYU5I=;
        b=XWCIX1vNSO8kvnY8q3H2+wNleBz9nA/leYBfNtRrpp6/VYRnq7rfPpjFiRiDtdvAti
         bmzAPpsr2r6/lbFy2ZKccfPCZ0J552/2V0pCrJszlNw1UXmSO5ealXj7N47TvgKLZxC5
         nZ6VqX6rSVzr5elJiTLD31kaVRiXxKGlQW/6V6x2qHiRsLGhWOcXE5OhUb89TVd9TYx0
         0ooAeKDtGFODMhS/VOS3CZpL24QB3x7RTapodZ/UYZZV+4YcdjCsjxjAFr4ryY4IhMn4
         StTL3BQdtnrJJeBaSSeR/aCuLetq7yDKNU/a3lU21tsj96jsNAyB/unVJe3sem4kZWrz
         Ybww==
X-Gm-Message-State: AOJu0YyE4w2UmIsmKTUowqMcvjEBYoLrSsmcfv1vnYJJfiE2uv9jAtos
	ynnDdDR7Zqe9tuGN86MkzukHDQwYKY0a0jvvAtUU1E9ZWg7FYW0GdjncOh3GEA==
X-Gm-Gg: Acq92OEXAxczJM7RjgukLBWGLETkDGdX7S6HjnsZuqkzLdFvQPQD3sbjyqLW/t/+VG2
	L/+Yic5lv8RGPQOgwlG1GmCj/zMekwIc2FoNwWgyoOJttMzn//hnQwcKx0Dnof8o4RA7ahERiQA
	PXjarrEGxvp+a5allop7bJUXfIZIX52eurvB5liT/ckxkMY7OfDnsv7tX4AETcOBR8cg9t/LxW1
	XgkotxdI+SgqqvHKZEdFHFR7ImUuFJZHb1VdGF3Ozq+aO279SS25ZoLgn6PhuBD/dAWg3ErD/3C
	JYtRVWrvqf2l9ebt1ziLTPoAUM3n5WV21BMZmHpEWkotDPZqGidhHJXmatvLZDcl8XQH+0Oks29
	12Q2YLKkdUvfbqEslqTxRtVntidu2WbKluy8a7DJM5J6vI5wRaqePG2WHKO2mPuBfGW/H/mng4L
	LV6XfwCx5hOp/ql+jD5zZ1O2P/wjz6c863ysWDtrWVWwDYc3uoH7CL6OqkifAqseIRb8sZJjKCk
	22C
X-Received: by 2002:a17:903:b46:b0:2c1:11b8:3c80 with SMTP id d9443c01a7336-2c66428e93bmr75552265ad.30.1781439752567;
        Sun, 14 Jun 2026 05:22:32 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([103.58.154.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c43326b085sm69157995ad.70.2026.06.14.05.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 05:22:32 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH v1 1/4] staging: rtl8723bs: Fix missing space around '+' operator in hal_sdio.c
Date: Sun, 14 Jun 2026 12:21:52 +0000
Message-Id: <20260614122155.20034-2-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260614122155.20034-1-mokshpanicker.7@gmail.com>
References: <20260614122155.20034-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing space around the '+' operator in HalQueryTxBufferStatus().
This fixes the following checkpatch.pl warning:

CHECK: spaces preferred around that '+' (ctx:VxV)
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_sdio.c b/drivers/staging/rtl8723bs/hal/hal_sdio.c
index 665c85ecc..1d29245da 100644
--- a/drivers/staging/rtl8723bs/hal/hal_sdio.c
+++ b/drivers/staging/rtl8723bs/hal/hal_sdio.c
@@ -24,7 +24,7 @@ u8 rtw_hal_sdio_query_tx_freepage(
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 
-	if ((pHalData->SdioTxFIFOFreePage[PageIdx]+pHalData->SdioTxFIFOFreePage[PUBLIC_QUEUE_IDX]) >= (RequiredPageNum))
+	if ((pHalData->SdioTxFIFOFreePage[PageIdx] + pHalData->SdioTxFIFOFreePage[PUBLIC_QUEUE_IDX]) >= (RequiredPageNum))
 		return true;
 	else
 		return false;
-- 
2.34.1

