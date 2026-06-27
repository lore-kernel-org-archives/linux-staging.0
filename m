Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE66737C103
	for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 06:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782543361; cv=none; b=rRmYXCQLyMZLElbMAUJ/ahs3YsfXjuCuwk0EXuBk8blFvLyLtaIr3CRtBQAzVY2bBXfxsAiyl5E9akQuh8uGUsLdpChK5dDzcVtnun0hXjealQ0xzBZ4wU7DThCDdzx3Yo6ED3NElzOfO7VSWOSHOI/I38odC6sew8o/zkudUco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782543361; c=relaxed/simple;
	bh=D9Cv781oiSTqV4iuqMvHiWA9WXdvdRNj6Mhji/kLCaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FFATI0lVTqf1GVBWzP1ENRkBAT6yAb5aQz6o9eRXObK+uGpSlGpbuSW75xWKoWMqHJN+zsi0Rk841+6qJlPK0enmhtx7OYQCpAFSQwqu75ooK6Zf43GK73qYH51L1NYM2+tJh1mgYk/VzwiBEscI2wqGVlXpu8zbsELrlriOoVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=pirQ/bgR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="pirQ/bgR"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b7866869so14234975e9.2
        for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 23:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782543358; x=1783148158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FMEWzYEbT1T1SfjfQGAsJMVAlI7tTUIW0mDhbwFaH88=;
        b=pirQ/bgRst0jBQtko06t/5rPjSMfs3lSd7PiuYHjYtyU9zHtCKLANvEFFowqlcinsi
         x307q2mOeCAP9yQD7Cts8M1gQ58uD3b+E6b0j0s6bwy4Pu/IWQ4TOK56QTjUxwcJyZaT
         EzjM10RfzuR3NTB82a2eE+tTkW6/1qxMP90fBuD76nHAqT6iAbzMTfavO5OLNt4d3FZA
         MmyvmL/reLHGc0/Or1ZApNi44Pb4uRopI8O4eF56K4yjcgxksZYOkkjpPFhw5M7hzG+8
         jPpPt3HiNqGkCsU2AD0tzcLyA/739tC9H/VlsQfdPgKrqhypgWesNaxMvDIr+xYnw40X
         JizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782543358; x=1783148158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMEWzYEbT1T1SfjfQGAsJMVAlI7tTUIW0mDhbwFaH88=;
        b=g2JhQQ8zlIi5jy0SUGXp135J3TEFceigmk6SHzDzmUnJjQhi0YC5W0fE0mgtEy55dC
         E2ly9v3vJqY2ZidcixZrZseBk9ZfhjpwlGSdua3Rxt5nfcxotrj2zmazqMtnM/Tt1QO6
         n7PFnsXWujY/rt6rkwl5IGfGsZvtvvBy5B4Nna6X453GQRCfaMSRA3t5vKLNH2IOMh8+
         EvC9xF6j/NQeoIxB1gCBMEVY8v7ruyHzJrSIUh4KhKLfJ0zA38gtn08TF9RLRQaaDOX1
         RL3+eZ1sUZPFnoJcRq7pLsRvFYK6lajulmz39HolUYhdPVZ0FsFVEIQ6njhqDdeXSNEP
         o9VQ==
X-Forwarded-Encrypted: i=1; AFNElJ/El7/8SzrQtpbKlCgpPSrwdNJllIgkg2TkyNYLFR625grn9vmkjiUmX+7fPcNm+s5S4kl0kbCWGXm6wUwk@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/LNDJYbmeCS7LzU6gzd9/AN3akBRkqFl9DL/yvUjg9zbx0bpi
	lwT2ja/LcKJDQZQKDprwS6ZbJGpTV/ZJZtGug8ApeedkF6bk143vnV3C9ShJUqtVlrS7
X-Gm-Gg: AfdE7cl9CL8GKmQlklQ0kWOyKyvEwHy/gNJROVc25ZieFwW32bh+WUx+SbOYL9Z+06/
	YTZOV2pjxdYLNQVoivnI0fAHSF/p3UYsIt6HxcEt7DkHSrtniAScXhsz2BATCbhyGnMqnWhb09Z
	7OBfT/0VKIh47TEgzl8R+KmGIQp6/PuOcNWPN7TgDxu+XFrfVG65it/gXsx8VOl3mzCkfrfKr3c
	wcn2OrFA/D7WAS5LV3nHmx2BeuqLi6pIqoVbvukdVGb9X2bRfi21Y3gkyE4egA1oI+AhfS7IORP
	phL7d+fUASVmQP1JJ0umvJofX96aLFb1TvrQqK+9UXZkMzF00xttoBqoVvaHdu9xjgC2kyRB+xW
	DS5jhH8dETS73W5J0nsKjXJMHexxm8z4kkTRkO1pUD+0Wk3NiSDo8t3rBEEt9FMQfVxQeHY/VJ3
	Z4NQb6zZyQ7TKC65vyexvDFo/tzvuUOczRjZrcRVNWoKDs2alqsKH+MdDO44cgOr1BSxzLnoXZ7
	uEFeA9GG+3q664WHULJAh7+LC5T4a4hvxnXmkIQaeuGpg==
X-Received: by 2002:a05:600c:4f8f:b0:492:432b:d78b with SMTP id 5b1f17b1804b1-492668710e2mr151805515e9.15.1782543358284;
        Fri, 26 Jun 2026 23:55:58 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492690a1a85sm235875035e9.15.2026.06.26.23.55.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:55:57 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH] media: atomisp: reject frame dimensions that overflow the size calculation
Date: Sat, 27 Jun 2026 08:55:56 +0200
Message-ID: <20260627065556.88673-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ia_css_frame_allocate() computes the allocation size for a frame in the
frame_init_*_planes() helpers as width/padded_width * height *
bytes-per-pixel * plane-count. frame->data_bytes is a u32 and the
helpers use plain unsigned arithmetic with no overflow check; the
result is then passed to hmm_alloc().

width, height and padded_width are user-controlled: the
v4l2_framebuffer ioctl path reaches this via
atomisp_v4l2_framebuffer_to_css_frame(), which forwards arg->fmt.width
and arg->fmt.height straight into ia_css_frame_allocate() and then
copies arg->fmt.sizeimage bytes into the resulting buffer with
hmm_store(). A sufficiently large width/height makes the size
calculation wrap, so hmm_alloc() returns an undersized buffer that the
following copy overflows.

This is a memory-safety bug confined to the ISP-private hmm buffer
object (a separate bo allocator), not the kmalloc slab; it corrupts
ISP device memory rather than granting a kmalloc-heap primitive.

Reject up front, in ia_css_frame_allocate() (which already returns
-EINVAL for bad arguments), any dimensions whose worst-case byte count
cannot be represented in the u32 data_bytes field. The factor 16
conservatively bounds the largest per-pixel multiplier across all
supported formats (up to 6 planes, or 3x RGB planes with up to 4 bytes
per element).

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Intel atomisp
hardware required).

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 .../atomisp/pci/runtime/frame/src/frame.c     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 8614efc28b19..dea7b11ccc90 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -6,6 +6,7 @@
 
 #include <linux/bitops.h>
 #include <linux/math.h>
+#include <linux/overflow.h>
 
 #include "assert_support.h"
 #include "atomisp_internal.h"
@@ -106,10 +107,30 @@ int ia_css_frame_allocate(struct ia_css_frame **frame,
 				      unsigned int raw_bit_depth)
 {
 	int err = 0;
+	u32 bytes;
 
 	if (!frame || width == 0 || height == 0)
 		return -EINVAL;
 
+	/*
+	 * The frame_init_*_planes() helpers compute frame->data_bytes (a u32)
+	 * as width/padded_width * height * bytes-per-pixel * plane-count using
+	 * unmodulated unsigned arithmetic, with no overflow check, and the
+	 * result is then handed to hmm_alloc(). width, height and padded_width
+	 * are user-controlled (e.g. via the v4l2_framebuffer ioctl path in
+	 * atomisp_v4l2_framebuffer_to_css_frame()). A large width/height pair
+	 * makes the size calculation wrap, producing an undersized hmm buffer
+	 * that a subsequent copy then overflows.
+	 *
+	 * Reject up front any dimensions whose worst-case byte count cannot be
+	 * represented in the u32 data_bytes field. The factor 16 conservatively
+	 * bounds the largest per-pixel multiplier across all supported formats
+	 * (up to 6 planes / 3x RGB planes with up to 4 bytes per element).
+	 */
+	if (check_mul_overflow(max(width, padded_width), height, &bytes) ||
+	    check_mul_overflow(bytes, 16u, &bytes))
+		return -EINVAL;
+
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
 			    "ia_css_frame_allocate() enter: width=%d, height=%d, format=%d, padded_width=%d, raw_bit_depth=%d\n",
 			    width, height, format, padded_width, raw_bit_depth);
-- 
2.53.0

