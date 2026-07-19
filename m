Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E461990A7
	for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 06:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784443605; cv=none; b=rtzIKb+wsAf6QdB0g4rPL40oNY313ByEQ0GYvoO7pup/8IzPHTIpwkvoRCVUUupXhZz0W1eN/j5zsNgVpatH/q4ivA1q2ll1zCh8dph9nG+6EwupoZ3Dj5BYdK6xA5g6GaiSDpQCAxsGkDzN7FAIXO6u+zjCEMoZ7/Ystas4+VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784443605; c=relaxed/simple;
	bh=fnnC+vlyEjUrD9X16zPRa2oHzbXWLC7N3ScazD4URT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BbX18RzfTL3KXe9AtaTiFpPVaPwpJKX6kAjs303LzBoElQqNEDAHJs5ApFprvdTXxe8LF5FCSTBG/GcX8M6jeB/Cb78bey0M/gqEUI3DwRFtPD2C7YWFuFd7znqakhlJ+4zlch89xmFwilp7FeQM7807IV7cHS9X0bFJdCSrGuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtW58Cs1; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtW58Cs1"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc97653887so101168415ad.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 23:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784443603; x=1785048403; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X9y4maNSu9c0ZLymsFbxk/rrYyHzr8mr1Czws/Zz3XA=;
        b=CtW58Cs1/OVtmI09h5d/q2mSoHh9i7pkFdV/pWr4yaiXqEPdk+MuuxGGfXJ2voFJvl
         g43ZzjxBMm9/NsKpxuRbMlBvHE03cIjBZuZRtUrcRCmjN4aWVWPeSo1OV+0I/U+HcWrV
         W2WaLiQpvzxhS0dSJn9P71ksdhZzUc5By6dCIJW7VVH/I2ZWYMU6OcxIjrbpsYh0ORGq
         gUgElvStBa1nMricVb4JrJDBWui4GswpMZxpPeKDrq++cGHAZ7UeShwcXRJMnqE3ZJzU
         WjhrLug8+oc71Hv2Y0SruPnFOoWewhMMukHflygMgICWK8otYkEJ3RaSVprVN2slv7qN
         1Z/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784443603; x=1785048403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9y4maNSu9c0ZLymsFbxk/rrYyHzr8mr1Czws/Zz3XA=;
        b=HMcu7at/+Bv241HxuDwdVo/AnyV0MpxEd8QoMICdenc6sp1AlBHrn4PM3SkDxgM8LE
         2RpImTBSGCzcdi2y2m/Y/m2l4TZIVsGoLnJSXppfY69rcLifAWQ2w2JbQ30CrxlWvLgK
         7bkkMeDRTtS09lw8suzmM0FyjFF8hnt3WLt1EQ+dzUUhaYEcgpvU+YJy3Dc0ylNyZZD6
         HW5hIEXna/AsETXP/Wj920z9ALFMFemVPFgNg9ZJzXzuNwuB0RbSmFPuHk0sUXxzF++P
         S4U7fOHz88W4fLmlc8CTF7cCXMGrHVXbhFHN/pVqcE98H6YuxuccINstmpfXASO8QZRM
         qz+g==
X-Forwarded-Encrypted: i=1; AHgh+Ro3H6LrfZcLSLB4x5tlLJVrkGmxSQE24D8eganSYQ6TeWg3IQMFBCpRkpcVcoB88rJcphlbkq9+iaRp0TvO@lists.linux.dev
X-Gm-Message-State: AOJu0YyxgRzdY4gbwoZBh9ZyPH/uj2clAPhQc68DHzF3a1KGmjPDBS34
	ucsHXWum/eH3hFdbPtfPVXPCJHZPI7hBj4FeWBhL2G8BdnrQeI/ad1tP
X-Gm-Gg: AfdE7clRhkVt3EyRDSruO7U4O07TxYlNG4cDiZ4Z4mwpTJVPZmg7jb6wsV41ZZ3FRuX
	DnKmLuZlogbyErsIaV2/Beg8qZpwq3rGADtzDFxVgiIFJslVAmLqQ+eXen58xaxgAVKg38/HIJW
	3D3NrxNdFjXU1SIEiF+uKDBL2nvbWs22eaGQQoQEj3POnfSWznW8CeOEeKqEMD9siEOOsEn4rmi
	XaZFuEv365nlj8w9SCJwPilx/42fxyBN03olntsFnS+parpRlspSrM1Zy/hPEFj2714VOalGO6L
	p5hymg3gP6zWKbijotteYo4a7PeYw7GX6lc62Pt2aJGY5AzYTufxL4xr6MKqWEPJQBKWx7hbebo
	EdcE6F6ruORK/aOU2pmgaY1vCX2FFUhqZ9x2DRi0HZ4y21aMNLopk9tWX9dY7//YR46xPks0Fds
	7O2sLY2qgb1Kry5LzR3VYvabyw9Rpri0rUeke/Bp8bp+toBhHE6kHVfC+Yzm0j9rzhP/Dsk1MvD
	7I/GmVnrVnRJ0g/svgIErDhZ65M8KdpcFmIq8OmkPwt5LtB2vPMC2qN
X-Received: by 2002:a17:903:2a8b:b0:2c2:bd0d:3cf0 with SMTP id d9443c01a7336-2cf3497f5dfmr105825405ad.25.1784443603113;
        Sat, 18 Jul 2026 23:46:43 -0700 (PDT)
Received: from localhost.localdomain (c-67-170-60-64.hsd1.wa.comcast.net. [67.170.60.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3474692asm37073735ad.70.2026.07.18.23.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 23:46:42 -0700 (PDT)
From: Gabriel Changamire <gaberashawn@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gabriel Changamire <gaberashawn@gmail.com>
Subject: [PATCH] staging: sm750fb: rename CamelCase parameters in sm750_accel.h
Date: Sun, 19 Jul 2026 06:46:01 +0000
Message-ID: <20260719064601.12223-1-gaberashawn@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The prototypes and kernel-doc comments for sm750_hw_copyarea() and
sm750_hw_imageblit() still use the old CamelCase parameter names,
while the function definitions in sm750_accel.c already use
snake_case. Rename the header parameters to match the definitions.

Fixes 10 checkpatch "Avoid CamelCase" checks. No functional change.

Signed-off-by: Gabriel Changamire <gaberashawn@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.h | 36 +++++++++++++--------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.h b/drivers/staging/sm750fb/sm750_accel.h
index d15a40cacb84..3d3d93d4b308 100644
--- a/drivers/staging/sm750fb/sm750_accel.h
+++ b/drivers/staging/sm750fb/sm750_accel.h
@@ -196,12 +196,12 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 
 /**
  * sm750_hm_copyarea
- * @sBase: Address of source: offset in frame buffer
- * @sPitch: Pitch value of source surface in BYTE
+ * @source_base: Address of source: offset in frame buffer
+ * @source_pitch: Pitch value of source surface in BYTE
  * @sx: Starting x coordinate of source surface
  * @sy: Starting y coordinate of source surface
- * @dBase: Address of destination: offset in frame buffer
- * @dPitch: Pitch value of destination surface in BYTE
+ * @dest_base: Address of destination: offset in frame buffer
+ * @dest_pitch: Pitch value of destination surface in BYTE
  * @bpp: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
  * @dy: Starting y coordinate of destination surface
@@ -210,34 +210,34 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * @rop2: ROP value
  */
 int sm750_hw_copyarea(struct lynx_accel *accel,
-		      unsigned int sBase, unsigned int sPitch,
+		      unsigned int source_base, unsigned int source_pitch,
 		      unsigned int sx, unsigned int sy,
-		      unsigned int dBase, unsigned int dPitch,
+		      unsigned int dest_base, unsigned int dest_pitch,
 		      unsigned int bpp, unsigned int dx, unsigned int dy,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2);
 
 /**
  * sm750_hw_imageblit
- * @pSrcbuf: pointer to start of source buffer in system memory
- * @srcDelta: Pitch value (in bytes) of the source buffer, +ive means top down
+ * @src_buf: pointer to start of source buffer in system memory
+ * @src_delta: Pitch value (in bytes) of the source buffer, +ive means top down
  *>-----      and -ive mean button up
- * @startBit: Mono data can start at any bit in a byte, this value should be
+ * @start_bit: Mono data can start at any bit in a byte, this value should be
  *>-----      0 to 7
- * @dBase: Address of destination: offset in frame buffer
- * @dPitch: Pitch value of destination surface in BYTE
- * @bytePerPixel: Color depth of destination surface
+ * @dest_base: Address of destination: offset in frame buffer
+ * @dest_pitch: Pitch value of destination surface in BYTE
+ * @byte_per_pixel: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
  * @dy: Starting y coordinate of destination surface
  * @width: width of rectangle in pixel value
  * @height: height of rectangle in pixel value
- * @fColor: Foreground color (corresponding to a 1 in the monochrome data
- * @bColor: Background color (corresponding to a 0 in the monochrome data
+ * @fg_color: Foreground color (corresponding to a 1 in the monochrome data
+ * @bg_color: Background color (corresponding to a 0 in the monochrome data
  * @rop2: ROP value
  */
-int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
-		       u32 srcDelta, u32 startBit, u32 dBase, u32 dPitch,
-		       u32 bytePerPixel, u32 dx, u32 dy, u32 width,
-		       u32 height, u32 fColor, u32 bColor, u32 rop2);
+int sm750_hw_imageblit(struct lynx_accel *accel, const char *src_buf,
+		       u32 src_delta, u32 start_bit, u32 dest_base, u32 dest_pitch,
+		       u32 byte_per_pixel, u32 dx, u32 dy, u32 width,
+		       u32 height, u32 fg_color, u32 bg_color, u32 rop2);
 
 #endif
-- 
2.47.3

