Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C962571C7
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 04:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776659703; cv=none; b=GA6Unbc33GlC/letaOQZQdWYRrUP+bY6rzwOc5rBTqQ0OYmfvzSxld5MXPaMhcW9rbtTarhvW6bvrozr9yZXTy7v0TQSOiWOjeYQkCsmTuqr/eltaS2pScBZQLBUJoW6s+Ihd8vh6yvCj0sFa+p1zNmMliOPxzxY55ZVfM9gUoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776659703; c=relaxed/simple;
	bh=2HPqnQMRtv0/eCGmh4tSrfTxg0tc2Yxqnj6WCItB6pA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gaxnvwKAgpOG4o9rrfkAhgKIFp8M3Hf8OxzZtShsRI2HdVoy+xjN2suauoetUHEJRJfMzvB9nBLJClzbJVyWx4r/uuyjF4rl2XJz9E3jWgK6qNNyfHXLoJKRkqVM/iQM1Jol09ME9qnG9QDdjBRKy3MteI7OvO9DVXS5zPBdIws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cI3d66un; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cI3d66un"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f0884bcfaso1919311b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 21:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776659701; x=1777264501; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOcTTerYRxScw0XuJN9vjsh2E4H0d23/wA4kuMvKkYc=;
        b=cI3d66uncyWXLAJXEZ4PhEiTwsnJhQXiScfzYC48jXbC8WAEqJfHYP7Iyi9gIKaAoe
         K+tZjQrx8b9RFQMdxIWraPxxmtPlb4PGL4gUDmW2sFQL1QlUsiBGnyEs8RAm/PpEj7V6
         jvY10BKBYmTnShMZPRGS8jTNQbAAz7PDz+4PMyhUM6Qs56zc4UVsWQHKfQD/KdPQunHu
         +fpCjRqM7GS7oMAFdjUFQmtTy8O8zdzF/3ebxCo4biMD+/e8VhN1agaKAftEkDhK5OKJ
         8nb53W+zndgL5mn6pgu/1f2CmWAXe04BlMGnG+yNtUObCxzxH1u8DtBT0cXek+y9Jykp
         vFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776659701; x=1777264501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eOcTTerYRxScw0XuJN9vjsh2E4H0d23/wA4kuMvKkYc=;
        b=juqQ/VhhXTB2703F+/j5GS0XFenUWbmqajBNPGlwEr7j0nJPPPXkjIAs2AqylgDCRD
         FTm+xu2VBYO9P8MS/GUPARoGURLD4AMR6lRbBj1GYGbjPZOYyIlU0tmnaUf468roTQ0X
         4ABSskslCh/oC3XTF7MXQHgC9uu+g6wH4YNjcDOe6vfkvHhCtCQdgVCpLvBlvJ3gavgJ
         rqszFaj+X7ITm1yRhFCFtGY2+Yor5ilkYP1GmAgf3OE5wRemB6nHjJ+LY4lQ6Ism/xA/
         TVs42ZCMyH30Jcnq+GLaw/6IspfVAVdBF2Z52esSpvvyhPRQB8dQLlfUEy1FDbNMpwVe
         EXmg==
X-Forwarded-Encrypted: i=1; AFNElJ/6J4pNJv+HNOtOxNcq1egVqxfpYgT/0lydV7+WIlw44Hk29FcIl1dHTUwoAVfT1GkDr/9R94Qia+/MiC7T@lists.linux.dev
X-Gm-Message-State: AOJu0YwclKGTF0NVefW6T1MjcRfNu+D7byXCKUFBWqOKARyBHMcflkS6
	reCIiCawUY+QE0s6+QTyVnUXnzzXunli7yiL54mpiElGLp5wOAbH13+d
X-Gm-Gg: AeBDiev2/MwLpofxtTlZ6wCiQGbSSWapsE9+NcAmSXbHxmvjrRWT4kznjk4cH35DQvT
	uVWFtMYnVHdRgXl/Mz1LFZn+SulgOQd/HnaeHdvUsouG4kfvdxirpnutghAvSoVWSRAsa/gjmau
	FYR4t/Ap3wYH8wOENKHYiMRYGYytkYd/sOJWTn/ZqW8tJNy/NzKYLhoJm4JsYFxIJrzp2an0lqU
	HCQRNZh/1ycEGSEa6nCzilvFd1jCeNpyFaAV7NhjHz4MWE0k7V5fYWOGhc/jlmY/UAtHKDZPKv9
	5ofq3WbY/81M5BaElgyI+tN10e9ZiGDAztW6fC8SZjgRCB5uV/tgj6pBBXVT6d5h2K8Kylw6eje
	r10pnip1VYxEh0otCHfDn/hMKHR7Ie/m59FAc97zJgkeIC0GcC66ni7iIOzTjNDqxjvoLdK3GAZ
	E95cD+4SttfoPCVM0y/1xos12iqDO6qq6VjaPyYfPkia0ZQXvmT+gu
X-Received: by 2002:a05:6a00:1953:b0:82c:d861:3caf with SMTP id d2e1a72fcca58-82f8c907fbfmr12578564b3a.36.1776659700685;
        Sun, 19 Apr 2026 21:35:00 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e984f20sm9868599b3a.8.2026.04.19.21.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 21:35:00 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	debjeetbanerjee48@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: media: atomisp: csi2: Fix DPCM decompression for source pad format
Date: Mon, 20 Apr 2026 10:04:42 +0530
Message-ID: <20260420043442.60982-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420032701.33250-1-debjeetbanerjee48@gmail.com>
References: <20260420032701.33250-1-debjeetbanerjee48@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CSI2 source pad format was set by blindly copying the sink pad
format, regardless of whether the sink pad is receiving a DPCM-compressed
mbus code. This was marked with a FIXME comment.

When a sensor transmits DPCM-compressed data over MIPI CSI-2 (e.g.
MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8), the Atom ISP hardware decompresses it
before passing it to the ISP pipeline. Therefore the source pad must
expose the uncompressed format (e.g. MEDIA_BUS_FMT_SGRBG10_1X10), not
the compressed one.

atomisp_subdev_uncompressed_code() already implements this mapping via
the compressed_codes[] table in atomisp_subdev.c, which pairs each
DPCM mbus code with its uncompressed counterpart. For codes that are not
DPCM-compressed, the function returns the code unchanged, so this change
is a no-op for all non-DPCM formats.

Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
---
v2:
- Rebased onto latest media tree (fix CI apply failure)
- Fix missing linux-staging recipient (typo in v1)
- Fix indentation
---
 drivers/staging/media/atomisp/pci/atomisp_csi2.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 95b9113d75e9..e723304bec80 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -107,10 +107,17 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
 					     &tmp_ffmt);
 	}
 
-	/* FIXME: DPCM decompression */
-	*actual_ffmt = *ffmt = *__csi2_get_format(csi2, sd_state, which,
-						  CSI2_PAD_SINK);
-
+	/*
+	 * The source pad must expose the uncompressed format even when the sink
+	 * pad receives DPCM-compressed data. The hardware decompresses DPCM
+	 * (e.g. SGRBG10_DPCM8_1X8 -> SGRBG10_1X10) between sink and source,
+	 * so propagate the sink format but map the mbus code to its uncompressed
+	 * equivalent. atomisp_subdev_uncompressed_code() returns the code
+	 * unchanged for formats that are not DPCM-compressed.
+	 */
+	*actual_ffmt = *__csi2_get_format(csi2, sd_state, which, CSI2_PAD_SINK);
+	actual_ffmt->code = atomisp_subdev_uncompressed_code(actual_ffmt->code);
+	*ffmt = *actual_ffmt;
 	return 0;
 }
 
-- 
2.53.0

