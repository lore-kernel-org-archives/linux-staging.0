Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924A827FD4F
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 11:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262271; cv=none; b=oik1HVQEQa0gDNvdiAxlDjFqHQpu2MbmDvmVX9AQ2bu1ECKNH6e2jFbKIODWY+ANqXhE9mH+qzDsF3pRvaD5DL6hjFv/T+dvVTf92zxupHWSHqnIc91qQwW5lNoMXoiQm0AEalnIlKw+G20c/psUiUFHLDnRxu8LuQ3p/EB8CTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262271; c=relaxed/simple;
	bh=GOfCtdOlnDVlkwF7QCjS/o/Q4x5UhEZg0QzLw2W423w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=serFR5jKXEz0AJQi6kF6h+KzroW7hsvPAXSkaRZvbCeGdHRLaAW7G0oRjuP5EXpJleh4zUdGpGDfcRHVC/uHdZhjNrKzfvl0pYNQpKbJcDTIEo/brGMMQ6f+IeXqiV3pDFWh0DnSmrc7f7Cxrgu1MLZVxC7R6Kh/BmtnmG8uNI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaIlIRbT; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaIlIRbT"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so686519a12.1
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 04:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788262269; x=1788867069; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wDrPFlu+35b76UwZKFDqbuoAbsDm578Nxc7NOFH5Dx0=;
        b=JaIlIRbTOKXgS9k61H2emFmwWukyiHvyZRIhU0sQNcAjA1EaHcy/ynIBPO3CDqTMdx
         A3R0dfNTlPK/+uhZQZjz93MenBN56ke2qRdXjM0f9iLYrtOFI5zZL+iGL099UIquz9xj
         FfhTdgIDUwgSwX5yXyMXthoFXDu1CX6tDFXNjarmOfRXZSwedH7Q+ltzrjfJcxdky4zP
         +5jawxVJPMhDn7yrY/CB6j7YX/PgTdVBbWijPK/uw/fEHuyQpNq+gjSkZliY2E57eaiA
         OPGJrICZXx6VJL5X+TRH/O5SBiD3sfHyQluR6FXO3lxwb31+WuOCZMrnW5HMkBN/1i3T
         cc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788262269; x=1788867069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wDrPFlu+35b76UwZKFDqbuoAbsDm578Nxc7NOFH5Dx0=;
        b=cfgciUgKUICGDL3IZtXEYN1PWPFZGl6RE5ZPiYGTXsX2+GczMo4VOa3bQLtzdlLTip
         QJqz0ReK7vvdEB1Ljk4+xQ9/7P/grhsuyLsO/1Y4VEDFz/GChXnzs2BDtTQw7sshEhqQ
         NAu3IWp+C70ekb2rohyVkZawxqyQ1+5JdLVhDokdWUyr38p2b1Eio5XOUKZr4oxBpNuL
         xKspewTIFcygwe7QKhKDnlW1eIi6ZubeGUsqalQrK5sgDSYF3rLhygW+Xza2AEaatRKp
         yXEtbiLVeZVemNu4l/z5skAtTwi4Y+Dsg87/vZZHRqZo1dueWuWIze4S3FZ0fSu7mB7u
         z58w==
X-Forwarded-Encrypted: i=1; AKwUvBwZitV6gj6QjWcM1C9mgYnRI67zkdg9p/6bx6L6O+VAZzIhJmxHYhdX4CBvVOd3HzF6y5KqrQrflzxsaWiI@lists.linux.dev
X-Gm-Message-State: AFuF++mB7xos7V8SxDJYbc7kzd6vk0yjG1Yf7PsCQQq4znGjWihYjsfF
	DNKd/eDh9x+5qctuis+U2vRbfCyQjRtNUsGmR5SuNQ33HLbVSSrNlcRk
X-Gm-Gg: AYBFou3qVu/oVqChW/lAO85rARM0g2RZd5jjI/6/Zjr+1HNF+7JJvs9Y1fUEZRE+v+y
	N2+86tJe+HLLy+DetvKbwRGCt68BC5miTLHljAiolkyWTLltfG1VVytiBoLYlv/+Z9tV5WtPZmW
	6C3jVaKRFZX5zBpv5d6NT/Aw8HHVmXmZN/OwDWhN3wCAZDAlks6XJxrv5f6qdbCUPOxtu8s3Thr
	/Zwa1edilZe3LbH5Gbd/J6bGzPh8m9txGLZ4g21AYsCoOvVJ49S8xcBsANt6VtqOEW3wQ3bYTcB
	9QTPmkBzr+uAuac05cPfVtDeMPDz0FHEtcgYIsrebiQuTnqBof3V2b4gvlxeb+LkRVLSx0OYeqX
	v36IwX8/WLl/g63mN+yosA/dxhKIpVHQgMgqMTTE45ab2lRgztZ7jm3p839QGlQ493XBO7W3MQ+
	EYTKobB1iE2I//CUatndJX7ki7z66K6mqiTZaZwdy6Zap+am8gBdMypdNsidBWSsk2N7spwk+xQ
	mqWm3Xuk17hUhJQPS5YFJxTlaKaoUKzZXpl1SDW
X-Received: by 2002:a17:90b:48c5:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-3989be9ac97mr37709892a91.17.1788262268809;
        Tue, 01 Sep 2026 04:31:08 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d4b336sm36888309c88.8.2026.09.01.04.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:31:08 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH v4] staging: sm750fb: fix mono image source stride mismatch in lynxfb_ops_imageblit()
Date: Tue,  1 Sep 2026 16:30:31 +0500
Message-ID: <20260901113031.161610-1-meatuni001@gmail.com>
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

Rounding up, rather than down, is the direction consistent with the
rest of the fbdev core: struct fb_image mono bitmap data (the same
image->data this driver receives) is walked elsewhere with byte
strides derived from a ceiling division of width by 8. The generic
mono bit iterator in drivers/video/fbdev/core/fb_imageblit.h advances
scanlines with "iter->data += BITS_TO_BYTES(iter->width)", and
BITS_TO_BYTES() (include/linux/bitops.h) is a ceiling division.
sm750_hw_imageblit()'s own "(width + start_bit + 7) / 8" is that same
ceiling division with an added start_bit offset, so the caller's
">> 3" (floor) was the one calculation out of step with how this data
layout is handled everywhere else.

Found by code review of sm750_hw_imageblit()'s internal stride
calculation against what its only caller was passing in, and
confirmed with a clean -Werror build. I do not have this hardware,
so this has not been exercised at runtime on real sm750 silicon.

Fixes: 81dee67e215b2 ("staging: sm750fb: add sm750 to staging")
Cc: stable@vger.kernel.org
Reviewed-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
v4: Rebased onto current staging tree. sm750_accel.h had since picked
    up an unrelated parameter-naming cleanup (pSrcbuf/srcDelta/startBit
    -> src_buf/start_bit) that no longer matched v3's context, so the
    srcDelta doc line and parameter there needed re-applying against
    the new names; sm750.c, sm750.h and sm750_accel.c were unaffected
    and carry the same change as v3. No functional change from v3.
v3: Added the version notes below, which Dan pointed out were
    missing from v2. Added Cc: stable@vger.kernel.org, flagged by
    Greg's patch-bot since the Fixes: tag targets an old (2015)
    commit. Added the rounding-direction justification Dan asked
    about, citing fb_imageblit.h's BITS_TO_BYTES() as the existing
    kernel-wide convention for this same struct fb_image layout.
    Moved the "no hardware" disclosure from an email reply into the
    commit message itself, per Dan's request.
v2: Added a Fixes tag. Moved the src_delta calculation into
    sm750_hw_imageblit() itself and dropped it as a parameter, per
    Dan Carpenter's review.
---
 drivers/staging/sm750fb/sm750.c       | 2 +-
 drivers/staging/sm750fb/sm750.h       | 2 +-
 drivers/staging/sm750fb/sm750_accel.c | 6 ++----
 drivers/staging/sm750fb/sm750_accel.h | 4 +---
 4 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 039e203..8b93bfe 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -252,7 +252,7 @@ static void lynxfb_ops_imageblit(struct fb_info *info,
 	spin_lock(&sm750_dev->slock);
 
 	sm750_dev->accel.de_imageblit(&sm750_dev->accel,
-				      image->data, image->width >> 3, 0,
+				      image->data, 0,
 				      base, pitch, bpp,
 				      image->dx, image->dy,
 				      image->width, image->height,
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 89a61bf..fd1cf9e 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -64,7 +64,7 @@ struct lynx_accel {
 			   u32 rop2);
 
 	int (*de_imageblit)(struct lynx_accel *accel, const char *p_srcbuf,
-			    u32 src_delta, u32 start_bit, u32 d_base, u32 d_pitch,
+			    u32 start_bit, u32 d_base, u32 d_pitch,
 			    u32 byte_per_pixel, u32 dx, u32 dy, u32 width,
 			    u32 height, u32 f_color, u32 b_color, u32 rop2);
 
diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 0316ea6..bac9a20 100644
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
index 6178854..efceefa 100644
--- a/drivers/staging/sm750fb/sm750_accel.h
+++ b/drivers/staging/sm750fb/sm750_accel.h
@@ -220,8 +220,6 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 /**
  * sm750_hw_imageblit
  * @src_buf: pointer to start of source buffer in system memory
- * @src_delta: Pitch value (in bytes) of the source buffer, +ive means top down
- *>-----      and -ive mean button up
  * @start_bit: Mono data can start at any bit in a byte, this value should be
  *>-----      0 to 7
  * @dest_base: Address of destination: offset in frame buffer
@@ -236,7 +234,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
  * @rop2: ROP value
  */
 int sm750_hw_imageblit(struct lynx_accel *accel, const char *src_buf,
-		       u32 src_delta, u32 start_bit, u32 dest_base, u32 dest_pitch,
+		       u32 start_bit, u32 dest_base, u32 dest_pitch,
 		       u32 byte_per_pixel, u32 dx, u32 dy, u32 width,
 		       u32 height, u32 fg_color, u32 bg_color, u32 rop2);
 
-- 
2.43.0

