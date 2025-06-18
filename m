Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0E92ECD07
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 14:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257423; cv=none; b=kR4rDNZi8B6U0fJTtu/3KV5cyw1xdA9Fc5fWpD634ONl4Evxsr64Y0nRaU/4HiIYmYf7cPECc6UJK1F68vI1blVwUGQGLDm+mLawdy7shqSB0wxP75ig3zEPPvvOb5P9BuTiiP18wHAbbOGh9FopfKYPFZVt85YnyXWFX+cuDrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257423; c=relaxed/simple;
	bh=vyr/GHGO6xfTWq6buMng2zgyugvAz16GZ1LMGwzKwlY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rYD4+ZA36UVykbJut1mDLPMsZ8HcRTFpLe5VHAIhyMMJlJlg9R+sMIUKu8zC8zEmqvKlZL3fa85XpH29csC+MzDpA+AwJ9MjKYC43pstK3YMl4KD/TM36Y7YTEi4M5q51jJ86TT6IQMGO0QjNK2/gyPfCv4fw2Vm+q0MRvLk/UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbHIdAYF; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbHIdAYF"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3121aed2435so8097239a91.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 07:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750257421; x=1750862221; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kd3C6/3Ctr7DBwFDySkUZ6vFzUEoBWHbZrpLkfWxSyk=;
        b=PbHIdAYFs6k+gHg2aX+KV1ojTv7Tqxkzl+zLNhYhd0E2TDalXEBFNet6uJ5Y8trv+s
         RUlhFzWPEWEFVeyV+Rlfddvho8dBR58vV+IgDKkfuOXtBinWhOVGd0Ybdz3Y9Ch0azKE
         /za17u4p9rlVtEXh5WINZ+9khExkWCbNlSJMIJCAyu0NBqyvP5CVk1bbIabUVABs7Hr8
         Y+bqqs6WTdzwNeJ/hkrAYlKmw/wojog6gRVYuOtBUPpGQKQ7gwf3/E8YDJl+r88K00s/
         DbmzBkh17JS5Qa1ffhwNCQwIjOsoeFPMHz6W8/YMwoXBofQzwAYKrg29KxvOoG8EiJwg
         KkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750257421; x=1750862221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kd3C6/3Ctr7DBwFDySkUZ6vFzUEoBWHbZrpLkfWxSyk=;
        b=gj9qnnpYZ1zDIstUqCXh8jAZR8JLNNSaJroFmSXcyu3X/ANkxAD2gKDJ5WWouOZTjF
         vyrqjpZb6dqHxFq7FU4XqsHnJmfcJHByZZ8XX0oBRTVq8ecl/QXLz2XbWLl7qRNFwIdY
         ffGxGklAm0A30Fb9+llF88AZL7q15fP0aFQ2D7ifXLV444v/NPNK/Bd0XyUqXnN2Qmkg
         9FbZrplUMGeuJFrXCjmpzDPrqLqNqXy6EU/B9yhyXGisQnuUPB3dPGfrRI1eqA2+oBHu
         laJHtXjt/xvEEUoC0GiQZAK7fCsOZI1mIJ7cwKw5iHo+bUx/EetmRJXEENEh60RSfXT/
         vG9g==
X-Forwarded-Encrypted: i=1; AJvYcCWtHJ9RKEGDlYhrLQRn1pSCrZ3Xb4n/jyXyeHt7tKQEyHtWrjYfdUdnDmpl0D019sx8ExmCyp3FQ99HYL7m@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0is0VzFhz0XMQYJnxFt20Bh0qxmqzBvzT8NeXtPZlR64ks0Bw
	kx1ewaSzYnu4ajPdwWl/GgceupYpYB2dtNfiO3j8Dm44veBH0Vm0rgoEJYHM3wzC
X-Gm-Gg: ASbGncvQ9SiBVfIHvkNiebCUA5pJwzvtlv8hYs751NYbQRVvR2ACjy4zyYSnxzFwE8d
	gDC72Qf/WSbib7rwZYy9O7WuugMchVbPyWxeQqSwCY8slYJxT/63uGVI8znZ9zibuzo01DPui9l
	+PZFUOGuL55+IrXYmfAALlwD1bqnNe+iVq9mWExeXo42i0+/H9lfXpdvXZD0CB4cIOBruHibgJT
	hPnN3pSqNTWf/sJURJEPSCplUHskqQ3Hq4ggl1WLR//UZ3yMkZ2pHOTq/HHooDUITnAXKRgn69m
	7YV0A1ehIvJtEEG8QzeiMKbzllIl7X+GmApkd1BSLLXiVC5ipt0LMusqvm95
X-Google-Smtp-Source: AGHT+IF4PFBEgS42FhKIoke8rPoBIVhGT5/T0QrFVR80PDyAFSLZkjMc9mwlCqeSuoGjRMwER4MFSA==
X-Received: by 2002:a17:90b:3c8e:b0:308:7270:d6ea with SMTP id 98e67ed59e1d1-313f1d2f830mr29006301a91.30.1750257421149;
        Wed, 18 Jun 2025 07:37:01 -0700 (PDT)
Received: from zinc.. ([182.216.63.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deaaa05sm100699905ad.174.2025.06.18.07.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:37:00 -0700 (PDT)
From: Kisub Choe <kisub.choe.0x1@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kisub.choe.0x1@gmail.com
Subject: [PATCH] staging: sm750fb: rename 'hwCursor'
Date: Wed, 18 Jun 2025 23:33:42 +0900
Message-Id: <20250618143342.6517-1-kisub.choe.0x1@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename 'hwCursor' to 'hw_cursor' to
conform with kernel style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <hwCursor>

Signed-off-by: Kisub Choe <kisub.choe.0x1@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 drivers/staging/sm750fb/sm750.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index bb2ade6030c2..612c982bacd7 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -598,7 +598,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 		crtc->vidmem_size >>= 1;
 
 	/* setup crtc and output member */
-	sm750_dev->hwCursor = g_hwcursor;
+	sm750_dev->hw_cursor = g_hwcursor;
 
 	crtc->line_pad = 16;
 	crtc->xpanstep = 8;
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 40051798efbf..d7e02ff3d6c6 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -113,7 +113,7 @@ struct sm750_dev {
 	 * 2: secondary crtc hw cursor enabled
 	 * 3: both ctrc hw cursor enabled
 	 */
-	int hwCursor;
+	int hw_cursor;
 };
 
 struct lynx_cursor {
-- 
2.34.1

