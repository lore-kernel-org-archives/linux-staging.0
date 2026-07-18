Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F80AD24
	for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 10:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784370699; cv=none; b=F+I+Rs683oMhtXhGGqhfnyaQzOQCf5FZC2xrSEi9AYeeRiExE0ZQsknLlAYiMETxMtZfUCFkAxNG/yIn5gaVeH2BscEn0gNwvxWa1G97mOSlRBlaDE703SpFJrDu9Chs7BItS+W/UJPcO1tcjCKJ1UodBCjJ5uF0W8E1JgAZBjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784370699; c=relaxed/simple;
	bh=//RX4WkXlQC6pYWjnZffoQCrCvtvt+jpXoPoMY8XutA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MR/F8TAjECM5CTWUZFOOl0bxG1FhW+KuMUsg8MaxtRDilttK1WdtOXFcxbvKrxQg5Lru+qlES7K3RT2Mfq+JKLg2eZxumFlI6oO/y1lzu1CJzksS1AvxGCqpzCSSSCrjPyqwoeHdYCWPUs4iC10St4DsWqwxY0cCYA/1uSumbU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgVfhXwh; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgVfhXwh"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so16271249a12.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 03:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784370695; x=1784975495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MnN8DFBWo+ZvzL83jibfwGEyO0GPb5UkEb4CK2Q5G2Q=;
        b=DgVfhXwhNrwbSJGVBGQXk8D8ArKGlBMViiVb09mcuPfkiXMKFhXNxC6VFHaOLHbQ/q
         6JPWCy4p164F8KG9R9VbBsKRoSsdZUNWeN2QNUz/lW1eg6B9CaW5C9bhX8xTO4TOlu0+
         KCNK9tzWOtziRl/HtuVRdMci+uZApJOPXfdQMn6X7ATagDKuDZ5JCMVged9VuFqD0l0X
         3cX7msxRZJvQiA+gUoNEPJWYg13M5bETBgmUN+nZO4aKvOiZ7hMTgDcsYfbbVviHeGvA
         2tMwzT0KapBt2S3hf1L0bT2BP4GQNOY8xANJgAVoepLLioW6woaNgRxFH7iugJXC+hGu
         LP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784370695; x=1784975495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MnN8DFBWo+ZvzL83jibfwGEyO0GPb5UkEb4CK2Q5G2Q=;
        b=jSsPLXKlKJVLxSIZMht6T+KHCBLn7k0ojba5fGHA9drB6ZetyDeoogc7ObOdIfj3QB
         +1ovDzDLS0wKRm21xjdtNQDp62YPUjt1vJbgo3sWfbqG77LWBwIpRjtTm+9+tYKOrb+w
         Ze5hoNajn8OcsUly+qVkkWDeJE7iVs9pUEAQFngeDd1o4M1Hh4dbgYKe+MgbzNJmvHgL
         bFWGRb3R7AUWkJzcTlOifuwx2AqyYoI0Sey2x4Zq9ENKqX4LlE7xuKy3WMF/keQQOwO7
         yoqZHXw/B9TsD3YHogPKsnTUvuy6lkg29XEezncsSLRDCJrK/wVSpBWC343Nh9GC33+/
         FdeQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXPQ7LR7S6eBDHGuCzNwnZeg1AoSXICI9vVQ41whtttl5PB8kJoxPDU9Ui4NABG6kQ+eIxo8PdZJEupRtz@lists.linux.dev
X-Gm-Message-State: AOJu0Yw60C8+CHWKmitk6UrITqFGAUW6aHhv1dYtSrF0zhIUtT2mTHeF
	E/YLWB8V05j2SmGV4lVPcusVWyxrgVKx+xz0oiA1jKnbAfAYPeV7CNw4
X-Gm-Gg: AfdE7ckQOcCcHtRTpXA9SFhVXkY4N/iY1lWKszDdTo/hkfybB4+CQi08nIp9EcNOl43
	8tVBc81R7D4Oz/ym1rEAGFovBtcmXKlwQhyMCR8Ssw20k1t5xLWMDI9F0Hstk7JCTS2wS0BH63M
	nAEr72O2A6w00W/oGErQfUYTEoYlTMbleCebhnDaegr6JwqvlVGfoATplelSrhG+c3/ipcQM7Jj
	zmOn16f8jlOC7HiqS0KqZ3mT0CvTrUUAQXwVDvoZn3WX3i8jK95dP8gTkRspnlVCG91arKeVCZP
	vlxWLe4VKusnzfXiJ6NZNDGaPod1fFAfAx5TsfLHA3phPBHmcxBHLcYp1aSmZ+VdnWdC7WkZxpU
	NZYd8h6pctMdwOtn18BkEYNeo2lS5a0OWp9SmrUJK0uQ5go0wDa7U7fw4nBhHxmzAAgcWl2b26B
	FEaHn2XEjJUYnOSUkXwZmCbWqG4dizRJTLy//vs+URD7qU9V/DOTh5U3P+pQkUN+ksuw==
X-Received: by 2002:a05:6402:21c4:b0:698:3fd4:47da with SMTP id 4fb4d7f45d1cf-69e652e2951mr2283610a12.26.1784370695352;
        Sat, 18 Jul 2026 03:31:35 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e7000688dsm2086673a12.29.2026.07.18.03.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 03:31:34 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2] staging: sm750fb: fix mono image source stride mismatch in lynxfb_ops_imageblit()
Date: Sat, 18 Jul 2026 15:31:03 +0500
Message-ID: <20260718103103.18082-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sm750_hw_imageblit() advances its monochrome source pointer by
src_delta per scanline, and computes the correct rounded-up stride
internally as:

	bytes_per_scan = (width + start_bit + 7) / 8;

Its only caller, lynxfb_ops_imageblit(), instead passed src_delta as
image->width >> 3. For widths not a multiple of 8 this under-counted
the stride, so the source pointer fell further behind the real
per-scanline layout on every line, corrupting the rendered image.

Rather than just fixing the caller's calculation, remove src_delta
as a parameter entirely and have sm750_hw_imageblit() advance by the
bytes_per_scan it already computes for itself. There has only ever
been one caller, and that caller was passing an out-of-sync
derivative of the same width/start_bit values sm750_hw_imageblit()
already has, so keeping stride as a separate parameter served no
purpose beyond letting the two calculations drift apart, which is
exactly what happened here.

Fixes: 81dee67e215b2 ("staging: sm750fb: add sm750 to staging")
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/staging/sm750fb/sm750.c       | 2 +-
 drivers/staging/sm750fb/sm750.h       | 2 +-
 drivers/staging/sm750fb/sm750_accel.c | 6 ++----
 drivers/staging/sm750fb/sm750_accel.h | 4 +---
 4 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c..da0b4979a281 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -261,7 +261,7 @@ static void lynxfb_ops_imageblit(struct fb_info *info,
 	spin_lock(&sm750_dev->slock);
 
 	sm750_dev->accel.de_imageblit(&sm750_dev->accel,
-				      image->data, image->width >> 3, 0,
+				      image->data, 0,
 				      base, pitch, bpp,
 				      image->dx, image->dy,
 				      image->width, image->height,
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index d2c522e67f26..83229fe155ec 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -73,7 +73,7 @@ struct lynx_accel {
 			   u32 rop2);
 
 	int (*de_imageblit)(struct lynx_accel *accel, const char *p_srcbuf,
-			    u32 src_delta, u32 start_bit, u32 d_base, u32 d_pitch,
+			    u32 start_bit, u32 d_base, u32 d_pitch,
 			    u32 byte_per_pixel, u32 dx, u32 dy, u32 width,
 			    u32 height, u32 f_color, u32 b_color, u32 rop2);
 
diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 0316ea69d009..bac9a209899c 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -288,8 +288,6 @@ static unsigned int de_get_transparency(struct lynx_accel *accel)
  * sm750_hw_imageblit
  * @accel: Acceleration device data
  * @src_buf: pointer to start of source buffer in system memory
- * @src_delta: Pitch value (in bytes) of the source buffer, +ive means top down
- *	      and -ive mean button up
  * @start_bit: Mono data can start at any bit in a byte, this value should be
  *	      0 to 7
  * @dest_base: Address of destination: offset in frame buffer
@@ -304,7 +302,7 @@ static unsigned int de_get_transparency(struct lynx_accel *accel)
  * @rop2: ROP value
  */
 int sm750_hw_imageblit(struct lynx_accel *accel, const char *src_buf,
-		       u32 src_delta, u32 start_bit, u32 dest_base, u32 dest_pitch,
+		       u32 start_bit, u32 dest_base, u32 dest_pitch,
 		       u32 byte_per_pixel, u32 dx, u32 dy, u32 width,
 		       u32 height, u32 fg_color, u32 bg_color, u32 rop2)
 {
@@ -395,7 +393,7 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *src_buf,
 			write_dp_port(accel, *(unsigned int *)remain);
 		}
 
-		src_buf += src_delta;
+		src_buf += bytes_per_scan;
 	}
 
 	return 0;
diff --git a/drivers/staging/sm750fb/sm750_accel.h b/drivers/staging/sm750fb/sm750_accel.h
index d15a40cacb84..4f609d6af0fa 100644
--- a/drivers/staging/sm750fb/sm750_accel.h
+++ b/drivers/staging/sm750fb/sm750_accel.h
@@ -220,8 +220,6 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 /**
  * sm750_hw_imageblit
  * @pSrcbuf: pointer to start of source buffer in system memory
- * @srcDelta: Pitch value (in bytes) of the source buffer, +ive means top down
- *>-----      and -ive mean button up
  * @startBit: Mono data can start at any bit in a byte, this value should be
  *>-----      0 to 7
  * @dBase: Address of destination: offset in frame buffer
@@ -236,7 +234,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
  * @rop2: ROP value
  */
 int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
-		       u32 srcDelta, u32 startBit, u32 dBase, u32 dPitch,
+		       u32 startBit, u32 dBase, u32 dPitch,
 		       u32 bytePerPixel, u32 dx, u32 dy, u32 width,
 		       u32 height, u32 fColor, u32 bColor, u32 rop2);
 
-- 
2.55.0

