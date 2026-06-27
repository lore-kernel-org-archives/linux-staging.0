Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561291A6813
	for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 11:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782558240; cv=none; b=QgYNRkmMp3/ya26cuGC7SkIIWkisQoToxgeaD4+VBvIUn6MA25p9qIYj7GZLRDX1aW995neSe8nY1GiA1WVwMYRBGAtv6VnRo2as25U37xZPqAiEL3gopQTBhoO366yvAd7mGAEJqwmcGsI/9ksehSRspK3PRr5SoIcPVe6MmE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782558240; c=relaxed/simple;
	bh=TSh4dcKfnWaDtBFTEgrD5cxFrEKGsq1lUwd6DdkSMwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jrKKfYYmG1fQbmD5tb88K8lnSaYCLph0AGnxsT7T1HlSq46VM3dBqHqSg5XxG0inOJI8mYhXYI7by+vscsPJUqPSTn+CrZ6x+jdr3Uai9RwZTe/yo/J+YPf14bbe0l/yRkspEDBvxUkSUVIoU5a4+yTYydm9qmNwtq6TKM8nXIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=ePhv6Lw1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="ePhv6Lw1"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b7866869so15440235e9.2
        for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 04:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782558238; x=1783163038; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CnR6fISR5OFFfaQoxjn4A8je6s9oxTo0vTn7EXK+LZU=;
        b=ePhv6Lw1vgq/GkLn7W+dGxuu9QRf5iyfRc9sHIpMhqvd2KxzmPFLnVVNdtyVTBmef9
         OqlHx9Ir1jRIOSIFhZBqxEZ+8ZiPF8fW7WGaptePdJTLZTY+euHCX/hIdcJGxhKmKdeO
         X77DdIiEJb8ZrOBjp4LHroOntO7FDC/OFkMZiu1fBLtKfFyAHEYRXEorqOn6+TI/vKY5
         ItQob2MQE7zJyN6U9YFLfiXv0B3yEjmKwOVhzjHCQgMvwlOIv/Hc+Eh2Ur5FTFSMPI5Q
         cp94H+7KAZhkTF/uuAS+G7Zh3GRQQ5hkfklEzQwPdbYRmZJwJOlBmDmpj4ctdFed1dZh
         f65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782558238; x=1783163038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnR6fISR5OFFfaQoxjn4A8je6s9oxTo0vTn7EXK+LZU=;
        b=SYCqRiILduLeKX7srWUa40Khuul4eplTw5iFvmdr6/l79ohLpa42x2tS503NArCf8p
         ZUNB/juaDWKOP3i/2dy/XQRHfKPN6bbuQA2J/M5Az4IYdBw0n8j8+8sFhFTMF+h17Dck
         TYz+F2Y9OebZqci1hOcX/ovuSTplHcPq4ip5Hbsv6bPXD2tQumIJ3DvOFI/MrSlDPn0E
         QoUHdR2poj9YggmHFuP0mAlxexaXF8z0dCVeTo6ox73uSek9q/qqqwCXGzPIVHA25XOf
         yueceaBqE+6Kao4UB+9u58sVkhbF86BT/RtQcDo3Vm8oID0pt1gHvqD9MQl973ErFPoS
         HsTg==
X-Forwarded-Encrypted: i=1; AFNElJ9XGGV3DxcR/Tg15LhQJTokess8JHDuGWlL6kPHCDAclkAbnbNTjwNla4eYyZwJjiyNl4ya1bUw1J6ZEzFj@lists.linux.dev
X-Gm-Message-State: AOJu0YxiHMlPoWSCrjUqgwPgQVMCbH/80QI8CDtPw46vI43FSeYnWfWF
	blAuk+DzvdOyCcKKo7Pwndk+kNHyY8n2Q+lWFIxXLLMrOsdrw8W/pdfuDlk7j5Lg1JEE
X-Gm-Gg: AfdE7cmSm0D9oJ+1VbjSq5tUn0dqrPzGI4XNGJGpb3HT1tD0bExhUoRFR3GTUIToTEX
	mvTZQSSjc2e5vURfvQDxzXIreXWbxI71NdWL8+48JNTORl0AVplo62qdwLEWSxLIWl4vIaN4MrB
	UW71u2ccHuitVu6bOKMxNeHsmMJ3+eA+xWg0hLnjGBwbmo3bUPFtC4gN/50mRSTfrFvj7fPl8yY
	dm42/Efno+KglwAO1Fq9ZBZUpQBVWxntTh8vnPhqbhievuLS3YE8vqJZuDsGCF/2EOWML9cE59p
	9yXRDzVCkPHKDMfnCYqQV+qYzRebtA2xKDdLZ6DqbsW5NeOqTaZ4FAtztCH4l3zoPFOWvKVIhKA
	ZLJ/vR82WIEy1kjwV6eNPaRFQ3zgbDmcFfMUfIKxCVz3hr2e8buvaF37jhzFc0JJqjkr5yCBA6v
	yBwzAy5fDnkbzkPTgDMOXUV/zhKuRJ3rM7m/FdSSfJ4kjfIRtPhFA7rJSP96Kjo7Q2PPAnClIFl
	iQHcjlcMAw4hdSPRt41k6Tu6D9EosYqMschu02RH9N3Yg==
X-Received: by 2002:a05:600c:3552:b0:492:700b:deea with SMTP id 5b1f17b1804b1-492700bdef5mr67123065e9.13.1782558237833;
        Sat, 27 Jun 2026 04:03:57 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fc0d36sm243869495e9.2.2026.06.27.04.03.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 04:03:57 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: hansg@kernel.org,
	andy@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH v2] media: atomisp: reject frame dimensions that overflow the size calculation
Date: Sat, 27 Jun 2026 13:03:55 +0200
Message-ID: <20260627110355.27167-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ia_css_frame_allocate() computes frame->data_bytes (a u32) in the
frame_init_*_planes() helpers as width/padded_width * height *
bytes-per-pixel * plane-count, using plain unsigned arithmetic with no
overflow check, and then hands the result to hmm_alloc(). A large
width/height pair wraps the u32, so hmm_alloc() returns an undersized
buffer that a subsequent copy can overflow.

Reject up front, in ia_css_frame_allocate() (which already returns
-EINVAL for bad arguments), any dimensions whose worst-case byte count
cannot be represented in the u32 data_bytes field. The factor 16
conservatively bounds the largest per-pixel multiplier across all
supported formats (up to 6 planes, or 3x RGB planes with up to 4 bytes
per element).

The most directly user-influenced caller,
atomisp_v4l2_framebuffer_to_css_frame() (S_ISP_FPN_TABLE), is currently
gated off by 2b7eb2c5dc72 ("staging: media: atomisp: Disallow all
private IOCTLs"), and other callers pass driver-derived dimensions, so
this is defense-in-depth on the shared allocator rather than a live
userspace overflow.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Intel atomisp
hardware required).

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Assisted-by: 0sec:claude-opus-4.8
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 8614efc28b19..f34135683d32 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -6,6 +6,7 @@
 
 #include <linux/bitops.h>
 #include <linux/math.h>
+#include <linux/overflow.h>
 
 #include "assert_support.h"
 #include "atomisp_internal.h"
@@ -106,10 +107,15 @@ int ia_css_frame_allocate(struct ia_css_frame **frame,
 				      unsigned int raw_bit_depth)
 {
 	int err = 0;
+	u32 bytes;
 
 	if (!frame || width == 0 || height == 0)
 		return -EINVAL;
 
+	if (check_mul_overflow(max(width, padded_width), height, &bytes) ||
+	    check_mul_overflow(bytes, 16u, &bytes))
+		return -EINVAL;
+
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
 			    "ia_css_frame_allocate() enter: width=%d, height=%d, format=%d, padded_width=%d, raw_bit_depth=%d\n",
 			    width, height, format, padded_width, raw_bit_depth);
-- 
2.53.0

