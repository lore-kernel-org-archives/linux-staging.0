Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E44C37F8C6
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 12:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778760073; cv=none; b=G2vUonx+AJYp3KkX+tV1MPHrKyR01GlJbJMiDFi1jnwlkf38XkuheIWDUeT3TvD9X4+gwTCxlUrQrhJda2U0j8SDA5K9KojMnIz7JjOYdQGnCzfDC2D+r+/7Om2u5FcwdLKa90/iqjXWHnRqP77OeA1I4Z8PJcIYQfPRYh7drF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778760073; c=relaxed/simple;
	bh=wOalxmODc4JSgALGC0wELwUByt7fm0coLkoMsnnMxT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uGdUgg9OmMg9L07L0j1NTsVioenvl3IFPgYnNWz5uv/ZE0WxoDYqJYm30kRHPoXaUmd82vX/ZKy4Eg2bbAuF1wt+H3f2q96PUbAh/3hvndW96+QJHBnDEaoApBVAskBk1mXgivMoK5fF2E3+t1GrniYRQID17UxdvHOzqGtTYAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irrvxMLX; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irrvxMLX"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-83ef8b48f94so2115102b3a.0
        for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 05:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778760071; x=1779364871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TrfEwjQI8X+NkXOCcXIf7gPoC4c3rfx8sQVHvDJPS2M=;
        b=irrvxMLX04uR9/sTHRyoLOv33NeLd2fpBlaG0zmqwJm9X9lLZytwrXYwXmXddmnn8t
         FD3gSKc66JYwq4Msm4Yg8LKGUb+PIpAGxH53DeE/vGEVpfPDGxgRBjB+5eRNx+qC/frR
         Tie9TusTMuuwhwRNV81LGsUSFne0zhdx2HsrLAxPjMfvwAkCO2kmuN5UuwlJkFQrCUjq
         pG6AsRVseclXEf+n0DeXP8l9NQ/dXGzVmLqltCZwvaZGBfgVYFYjtsHSxa6eZvFU5EHa
         wybzPQSlU5pnnuvxrSIKhuuWu9igXzEJDvu1auZdP+SAEFlgXLcNf9ddVZOoc0Mj1EEX
         +B4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778760071; x=1779364871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrfEwjQI8X+NkXOCcXIf7gPoC4c3rfx8sQVHvDJPS2M=;
        b=JkkUbiwBDjRf/ZQX5Nv/ZMvwsfk5pAaGC0CsiycM0DXdOhrNnISv/dkydtjicUEcsv
         XbFwIsUkkS5SVpeuc9twJc2DT52GZmsz/onugmGRKb3KzAccISFo1Z7x4Vr2uAWZnhn/
         ZreAA4wFJZiJ8Y9mQDojTVhUnKVTv7pUnNBKTTnczXLctK2FxRJ5+FMQ0vlRAxQhe6nM
         MNChatNr8/Tiw8oqEYkR+/udFt8j/WfvvHhuLEqpPDpNcDvobq9IdCvtlWCgsZdmsaj/
         yHN0dsbjVzp7b4LMJhT4D8+Wj4Bw8REiU2Wo2DRcwIEnMUfWlG3M2+Vt/iqcokSMSwK2
         6AKw==
X-Forwarded-Encrypted: i=1; AFNElJ+ptjyO8oQNxEf35nh3dSq5VpPFHYC1JHE60EIATJQouMJ8C2S5OksSBHYpFrNscR8VXpfnNZcXlDAXsDJn@lists.linux.dev
X-Gm-Message-State: AOJu0YxdzwKlto0kPDxNITuNRm0xcbm/kxeQ/RCenrAjwzdt7dtZ2GHe
	MhN7/d4JbZxvIL3zdhUXX1qFZQkgSDY9xQ/9iCByul3pgdSNDn6POQzKpHGHXA==
X-Gm-Gg: Acq92OGz4qQ3PaHj3r3Q/Ph2/5gynuD6VJWiDpLDWepSh4rTJZk55KRgC1f9JWQU324
	5b+0pbbviEo/pHABwG0VY1uYOgWZ6SchvC0Sr9r23jogDwU7HtQuX53Lr4mbidUALyzuKlHssA3
	tTxKgoiAi3KPQiBiTtZqRabcCuDuLnv1uE/NTBe16j4YSpJX0j41LxFiPJbp9263JYJUfqzIpfp
	T6QEwN41phNQOvrEcTBRe1A0IFg+nIekooPtgw0Z0lhKBt0LwkNcU+wGz3WyxlPPwaVYnE/XT0N
	qBUJs3TzbM6vnFTBiZrqGAozc4h/EuCwetD81zdkaUgdWzn4gN2V/y+W9+WMZsyUh5+HSzlsqvr
	8SW7JjfIm5+Z919IFE9svWIEkp/c//K7C0NIL76to6u/cLwW8+rh5kV5aVaFoy3RSwpGnnaO1pL
	ZRDyTZzK6X2wcLRNbYcaySojxRV2pkGl+Zca2t4vCC/PAFM0VaiumPU8wE7ocEmTpEtxCstmLxh
	Z++FOI4bw==
X-Received: by 2002:a05:6a00:2347:b0:83e:b443:9651 with SMTP id d2e1a72fcca58-83f0542dbbemr7459819b3a.4.1778760071023;
        Thu, 14 May 2026 05:01:11 -0700 (PDT)
Received: from localhost ([2404:7c00:52:8f0e:aae2:91ff:fe57:5e15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19775c97sm2619734b3a.15.2026.05.14.05.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 05:01:10 -0700 (PDT)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devel@driverdev.osuosl.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH] staging: sm750fb: Add suspend checks to copyarea and imageblit
Date: Thu, 14 May 2026 17:46:02 +0545
Message-ID: <20260514120102.71615-1-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lynxfb_ops_fillrect() already checks info->state before accessing
the hardware 2D engine, but lynxfb_ops_copyarea() and
lynxfb_ops_imageblit() do not.

The suspend path calls fb_set_suspend(), which sets the framebuffer
state to FBINFO_STATE_SUSPENDED. Add matching state checks in the
remaining accelerated callbacks for consistency with fillrect().

Assisted-by: Claude Opus 4.6 (Anthropic LLM)
Compile-tested only.

Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9f3e3d37e..025ac8fe3 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -204,6 +204,9 @@ static void lynxfb_ops_copyarea(struct fb_info *info,
 	struct sm750_dev *sm750_dev;
 	unsigned int base, pitch, bpp;
 
+	if (info->state != FBINFO_STATE_RUNNING)
+		return;
+
 	par = info->par;
 	sm750_dev = par->dev;
 
@@ -239,6 +242,9 @@ static void lynxfb_ops_imageblit(struct fb_info *info,
 	struct lynxfb_par *par;
 	struct sm750_dev *sm750_dev;
 
+	if (info->state != FBINFO_STATE_RUNNING)
+		return;
+
 	par = info->par;
 	sm750_dev = par->dev;
 	/*
-- 
2.54.0

