Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F81D405C38
	for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 17:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784743123; cv=none; b=oEd+aEek7oV2wBCcQhY+ucqAbtFODmmBnzftlyzJf5PYs87n99R0terUVDbXDJjJ2MjmDvkxc3VuRGITjhEFptnuiLHmz1Ac94sgRYsQnqqG/y+Gqz8wGvZX2UUbkyVzvdqQxQXG6fqb8R2zJ+UkpXGWAzjsUYhzLbi+GNVGazg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784743123; c=relaxed/simple;
	bh=ecT2gO/ZzAVIeRznVChrDRyBlm+Tx7VAthNScxo4f4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VeeJjl3E5p7M8tEsH3JivMP0oOhQV4qpVvI1TUTYssLqIW0LQSrHlmfoOiwtQ66P2RZVuTPG40bucg6dS1ymk/0m6K1MrrqgFCaI91wZnl2pFLOsz66ryeTCUNG1xKQS2ltObxeWry8wZFxpSHHyGUpUZ5NbP77wkypdNSdjFYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+Ti3blx; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+Ti3blx"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cb5a6aa8760so3070928a12.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 10:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784743122; x=1785347922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FT23JezC0wXJyWPJrB8NdF3ihbQYF5YfS1BycISojdM=;
        b=W+Ti3blx3SQq7d9hECvL3iVAA1Jg/K6fVxSs2NSicuwtp/bwv5nQr/asVVdvJzaR0T
         rAEz2UQPqoM8XEKQteUG9YI8kD+Fx9vseq+uz5krMvWLPpKCMAiVM2FAfe3/N7fe3rFJ
         4y7fsYrwrOngKIlB4T/rASYK7binVCeXlpvM0qjzdytS9aaGXWLD90EDIZTa4X5fDLBU
         5ZJwawd+en8Z3q6uz335f+E4o2Rh6oNrWvbVy02D52x4vTE9AqY9kzrv3HE+LJXpMq0I
         AJZGMSaEQLh8rvNmxSR4kxBOQOQcn5S6yR3KUxYQCxJ9GB+fIBq3wjittsLM6cxNb+NG
         FTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784743122; x=1785347922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FT23JezC0wXJyWPJrB8NdF3ihbQYF5YfS1BycISojdM=;
        b=GfMoClmzelhHNl8Gn8A3sWrek6L7aGNLXcdfP+Rg3RH848KwiFpf5Vv+EBRzB+m3GG
         xJiR2Rgs93bDGWigOEEwviBxJ8k06zXmrY97j0tjBx0YhgB2m6v2AOaif8SMtHwYvXkk
         lO8szttsqYXC+yp6qBIdfQ2t5VrVe64FNPFyzWb4pP8AYbMG+t+Mq3bdoNcMomxO3ZTx
         FQNaFAoncGDSvFiImWOFNASVK4gNrNKx16s0nxQl8C+Ee8LCRT0HRDWE/VeJsTf/Gdkr
         L9FO5SsURisM9y887WtfJDdHJgqrJuI3vXaB/7UHt5NWeoRE6yBCY4m4iya3QHhcYAD+
         iiqQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSKxOy6JVLcNUoBPpWYFm98F3bmfbmbJCMChwbKLtslNwhAO8n4+8iCxtnQ4ZsArmeT3Wdgtk0E2sQF92B@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw3Ucc6k1KZIXQ+Cu+POBtFp56hUtrzaIAIsCE4MnV6/P38gU3
	DdChPIicRKbvEUGE5m83lJrqEVZfKyL0cAeWc7cHyGjB6Xy13Z1tyJzK
X-Gm-Gg: AR+sD12gfyxSWddp3XtZ/tfe06E6qXCyXpGgxQTKfp98dKNws8VBza9FNYv7dkrHfdK
	6S806jJZpBTev2jm6epVM6LhglPOAW7YVczZV8ydahJrAhagRYVvjHq2iPpbgQFDso43ilrE+2/
	lPY5Q1CSC3eGtK99bSLQzV6RYY34x8vCxDQXzpXxNGkfzsip28TaedH6+z/CrtHuIXt0JEVkVM7
	rCCIGXY/0Bvrvisd3HTsuGd2ptkOpBvg1rA7O3yI7XjIss10EPx9Pe1KOMrbZUkkSXGO/J3tP2w
	QDtHp38BuESLrmPNaktqEUcwKRpdu5c2mKCKeqqK7pUQOqKBArVkmnvrp5x+FcE+HcQCqGzlMuv
	C9ikpWS/MprX3bxti1BcpKlwPS71DeeGVO7AY3s/HlxhhuG+mwSNGogjU9I15vB7h2PLrU3EZTu
	3RUQ==
X-Received: by 2002:a05:6a20:e292:b0:39f:59c8:f302 with SMTP id adf61e73a8af0-3c3ada195ebmr26645657637.37.1784743121546;
        Wed, 22 Jul 2026 10:58:41 -0700 (PDT)
Received: from PC.. ([103.172.209.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a67esm12057690eec.2.2026.07.22.10.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:58:40 -0700 (PDT)
From: Mohit Mishra <mishraloopmohit@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohit Mishra <mishraloopmohit@gmail.com>
Subject: [PATCH 1/2] staging: sm750fb: Remove legacy kernel-doc comments from header
Date: Wed, 22 Jul 2026 23:28:16 +0530
Message-ID: <20260722175817.213235-1-mishraloopmohit@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header file sm750_accel.h contains duplicate kernel-doc comments for
sm750_hw_copyarea and sm750_hw_imageblit. These comments are outdated,
still reference legacy CamelCase parameters, and generate kernel-doc
warnings because they do not document the 'accel' parameter.

Since the correct and updated kernel-doc comments are already present
in the actual implementation file (sm750_accel.c), remove the duplicate
and outdated comments from the header.

Signed-off-by: Mohit Mishra <mishraloopmohit@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.h | 33 ---------------------------
 1 file changed, 33 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.h b/drivers/staging/sm750fb/sm750_accel.h
index 25e5703b6774..e98cf8f9fb2e 100644
--- a/drivers/staging/sm750fb/sm750_accel.h
+++ b/drivers/staging/sm750fb/sm750_accel.h
@@ -194,21 +194,6 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 		      u32 x, u32 y, u32 width, u32 height,
 		      u32 color, u32 rop);
 
-/**
- * sm750_hm_copyarea
- * @sBase: Address of source: offset in frame buffer
- * @sPitch: Pitch value of source surface in BYTE
- * @sx: Starting x coordinate of source surface
- * @sy: Starting y coordinate of source surface
- * @dBase: Address of destination: offset in frame buffer
- * @dPitch: Pitch value of destination surface in BYTE
- * @bpp: Color depth of destination surface
- * @dx: Starting x coordinate of destination surface
- * @dy: Starting y coordinate of destination surface
- * @width: width of rectangle in pixel value
- * @height: height of rectangle in pixel value
- * @rop2: ROP value
- */
 int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int source_base, unsigned int source_pitch,
 		      unsigned int sx, unsigned int sy,
@@ -217,24 +202,6 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2);
 
-/**
- * sm750_hw_imageblit
- * @pSrcbuf: pointer to start of source buffer in system memory
- * @srcDelta: Pitch value (in bytes) of the source buffer, +ive means top down
- *>-----      and -ive mean button up
- * @startBit: Mono data can start at any bit in a byte, this value should be
- *>-----      0 to 7
- * @dBase: Address of destination: offset in frame buffer
- * @dPitch: Pitch value of destination surface in BYTE
- * @bytePerPixel: Color depth of destination surface
- * @dx: Starting x coordinate of destination surface
- * @dy: Starting y coordinate of destination surface
- * @width: width of rectangle in pixel value
- * @height: height of rectangle in pixel value
- * @fColor: Foreground color (corresponding to a 1 in the monochrome data
- * @bColor: Background color (corresponding to a 0 in the monochrome data
- * @rop2: ROP value
- */
 int sm750_hw_imageblit(struct lynx_accel *accel, const char *src_buf,
 		       u32 src_delta, u32 start_bit, u32 dest_base, u32 dest_pitch,
 		       u32 byte_per_pixel, u32 dx, u32 dy, u32 width,
-- 
2.43.0

