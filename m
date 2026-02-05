Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFB12D9484
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 23:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770335291; cv=none; b=J/2LiwU774kbntoerl4lkg8749ExhNZOzwmQxcP81vE77BihLfhz5hMxjrntWPxkfelLMaEw67DIrJUlnWeEmoMrtVgtviLXKmaq4kgHP6YVJHpH0NXYqpfZ6l4Xy4xRApOfH7wiBhct0C8pt/T+NphOlHFDuiC+wgttOtJBz2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770335291; c=relaxed/simple;
	bh=N+g0BzYcEEh6AYLft3SWs4nNWS5pdRPrYxb16ajZwMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=doFjH0ewy24XDut1DnCLABqzQiv9D+p7X5nEAo7l6WMbT7C0Rmg2W29niXXA2W0uVGy3AhgRdDYgC+7jp98tWVcitXjpDblpGBBdrFR5M8K5pwIX7NUQaWj06s6g5jOzijisKTI8RpDyNv9X7Jo/EhVNctnmFI+KVvLIq/mxo9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXhMDDT4; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXhMDDT4"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65941c07e8dso110984a12.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 15:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770335289; x=1770940089; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LUAGu6tZDWhCDqrEj8a34HU+Ej9aYntgTTO03ielJVo=;
        b=DXhMDDT4DfOYdUJ+tHP9HMZByg8rjtdY8kcUQGgUfu90jp/ueS+Q6Wvgoidu7HCko7
         Qu4oq+6XLiRIt98vKpFVUO0AbpQWloYHuA19OgdPqgu2GP/lsxbXlrqWzmHtCla4AiWo
         QONcJ3S+O1y6ZUiQtm7mXpNt8kTe1eiewECU/o95j8Gs7+h3O5s1Wc8psxTiLLpyplVG
         X/gwFn/oryKPIW8FqLCrrA9KiRoDuJio3fWfTz2VobXfX9+j8PJ6/AY64KgYVGesgdPq
         9Ua07izPxlMvylMUShMgYomKOT5TU/Jz4IivbEb3qI5ug72yjnVZDHfuMSGWAKdj4SYo
         rChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770335289; x=1770940089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUAGu6tZDWhCDqrEj8a34HU+Ej9aYntgTTO03ielJVo=;
        b=mNOsQex3us2/3gr8rwH8M0NF6WeW6SBTIHlu/UKch64fDylL5EIucPxjulr/MAPsDU
         CSplcv96NIn/y/O5MD6rzeStVoySmVN5Rd47nGtk/SEVibtGH48Va9v7A26LmyIINk4E
         yH6PpQHn2ZFM1fb01wA6YThlQ1BbA/5OgWksCNUAYb+GsjbSjgNfrfzy4GxVnp5acGvq
         F/NKJf0v1zeQiHbIjlw22qffnCJEMA328q8YEKBNSnMjOC0zpS0DVPrOJNO4KUqTGDvD
         6b5JBIeattOFy3zHvV0Jj+Nkwf1R+h1iHnuydCbo0+teF3nFz5/DAvk01CK/1be6QW+g
         7rIg==
X-Forwarded-Encrypted: i=1; AJvYcCW0O9RskaMiILXtj9BCmJNDhvdkW1VrQDM6UNlCJi/n7KT+Q9WKfl388oWj2cdOConfq0C6/NzAwH6qCicI@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1WA7iBEyXIqTGg7GhPS8XiGaRQ9EWEZVzf3yBdBZbedeJF41c
	9v4SDc1U5frkD9T4vUTLN1seIMhsOmURXbdLQcbMibBV53lzU8lRS7Xv
X-Gm-Gg: AZuq6aIvz2J/D39QGRQpN+jNilLu2Bu6TVog/e4C3QsNlPc8aNDl2KiSx/tECZeo1y1
	ZBiC6pVKDVxyGzpD48oIEw4M+y9kl1UfDc5gOg6zqv7Xf8/aHmYz9igCzFBilaVjNzLM0eWyPir
	fs/KD8Ywa4LG8z6OlUEN8qe0Dm2JZvxfUrnmb+mB+jsem1COxWkD8QVVjJNJSZIDZqzhhshErkV
	LFCBocOPTLrZk2nQHDfrNpJ0kGaRixuwT/hRFc0Jbu7x8hWS4xAFfMBsMRZQvnNpl5py/OMzR3A
	qsz2cu7Z9d9QGZ6WeCClpYjqVY0FnmaJEaRNlgMDdckE6ANEDWeeobepz8lXQ2PpGlfMyjb9E9a
	GGQDaHCcb9nDgUOFUOd7sDNXMb45O8O0quUl9nbC8UfMHM4gC+QV2GITgyvnBwbSxi2IZ93vDg0
	IpWRUKXYP0K+IAPd+cnbCsHbZK437mcN/ZEoR3h+xjf++CFmum99pW2GfU3Wx1oOTeFbUQKyMoe
	UWhSiM0I8gNOZVJSq6kzZi7d3R8D4/JlCVqYnQT1wiXePVDttLWSMckqi+9Ug==
X-Received: by 2002:a17:906:c10c:b0:b88:3bb9:e2d1 with SMTP id a640c23a62f3a-b8edf37741dmr38794966b.60.1770335289257;
        Thu, 05 Feb 2026 15:48:09 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.od237066db22328bb-tp.internal (212.28.147.34.bc.googleusercontent.com. [34.147.28.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda74a62fsm32496366b.10.2026.02.05.15.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 15:48:08 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH] staging: sm750fb: rename CamelCase variables in sm750_accel.c
Date: Thu,  5 Feb 2026 23:48:08 +0000
Message-ID: <20260205234808.2232-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename CamelCase function parameters and local variables to
snake_case to comply with kernel coding style:

  sBase       -> src_base       dBase        -> dst_base
  sPitch      -> src_pitch      dPitch       -> dst_pitch
  Bpp         -> bpp            nDirection   -> direction
  pSrcbuf     -> src_buf        srcDelta     -> src_delta
  startBit    -> start_bit      bytePerPixel -> bytes_per_pixel
  fColor      -> fg_color       bColor       -> bg_color
  ulBytesPerScan  -> bytes_per_scan
  ul4BytesPerScan -> bytes_per_scan_aligned
  ulBytesRemain   -> bytes_remain
  ajRemain        -> remain_buf
  write_dpPort    -> write_dp_port

Update the corresponding kernel-doc comments and function
declarations in sm750_accel.h.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 134 +++++++++++++-------------
 drivers/staging/sm750fb/sm750_accel.h |  46 ++++-----
 2 files changed, 90 insertions(+), 90 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 046b9282b..ad055dfb3 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -27,7 +27,7 @@ static inline u32 read_dpr(struct lynx_accel *accel, int offset)
 	return readl(accel->dpr_base + offset);
 }
 
-static inline void write_dpPort(struct lynx_accel *accel, u32 data)
+static inline void write_dp_port(struct lynx_accel *accel, u32 data)
 {
 	writel(data, accel->dp_port_base);
 }
@@ -85,7 +85,7 @@ void sm750_hw_set2dformat(struct lynx_accel *accel, int fmt)
 }
 
 int sm750_hw_fillrect(struct lynx_accel *accel,
-		      u32 base, u32 pitch, u32 Bpp,
+		      u32 base, u32 pitch, u32 bpp,
 		      u32 x, u32 y, u32 width, u32 height,
 		      u32 color, u32 rop)
 {
@@ -102,14 +102,14 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 
 	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, base); /* dpr40 */
 	write_dpr(accel, DE_PITCH,
-		  ((pitch / Bpp << DE_PITCH_DESTINATION_SHIFT) &
+		  ((pitch / bpp << DE_PITCH_DESTINATION_SHIFT) &
 		   DE_PITCH_DESTINATION_MASK) |
-		  (pitch / Bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
+		  (pitch / bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
 
 	write_dpr(accel, DE_WINDOW_WIDTH,
-		  ((pitch / Bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
+		  ((pitch / bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
 		   DE_WINDOW_WIDTH_DST_MASK) |
-		   (pitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr44 */
+		   (pitch / bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr44 */
 
 	write_dpr(accel, DE_FOREGROUND, color); /* DPR14 */
 
@@ -132,13 +132,13 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 /**
  * sm750_hw_copyarea
  * @accel: Acceleration device data
- * @sBase: Address of source: offset in frame buffer
- * @sPitch: Pitch value of source surface in BYTE
+ * @src_base: Address of source: offset in frame buffer
+ * @src_pitch: Pitch value of source surface in BYTE
  * @sx: Starting x coordinate of source surface
  * @sy: Starting y coordinate of source surface
- * @dBase: Address of destination: offset in frame buffer
- * @dPitch: Pitch value of destination surface in BYTE
- * @Bpp: Color depth of destination surface
+ * @dst_base: Address of destination: offset in frame buffer
+ * @dst_pitch: Pitch value of destination surface in BYTE
+ * @bpp: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
  * @dy: Starting y coordinate of destination surface
  * @width: width of rectangle in pixel value
@@ -146,21 +146,21 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * @rop2: ROP value
  */
 int sm750_hw_copyarea(struct lynx_accel *accel,
-		      unsigned int sBase, unsigned int sPitch,
+		      unsigned int src_base, unsigned int src_pitch,
 		      unsigned int sx, unsigned int sy,
-		      unsigned int dBase, unsigned int dPitch,
-		      unsigned int Bpp, unsigned int dx, unsigned int dy,
+		      unsigned int dst_base, unsigned int dst_pitch,
+		      unsigned int bpp, unsigned int dx, unsigned int dy,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2)
 {
-	unsigned int nDirection, de_ctrl;
+	unsigned int direction, de_ctrl;
 
-	nDirection = LEFT_TO_RIGHT;
+	direction = LEFT_TO_RIGHT;
 	/* Direction of ROP2 operation: 1 = Left to Right, (-1) = Right to Left */
 	de_ctrl = 0;
 
 	/* If source and destination are the same surface, need to check for overlay cases */
-	if (sBase == dBase && sPitch == dPitch) {
+	if (src_base == dst_base && src_pitch == dst_pitch) {
 		/* Determine direction of operation */
 		if (sy < dy) {
 			/*  +----------+
@@ -173,7 +173,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 			 *	+----------+
 			 */
 
-			nDirection = BOTTOM_TO_TOP;
+			direction = BOTTOM_TO_TOP;
 		} else if (sy > dy) {
 			/*  +----------+
 			 *  |D         |
@@ -185,7 +185,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 			 *	+----------+
 			 */
 
-			nDirection = TOP_TO_BOTTOM;
+			direction = TOP_TO_BOTTOM;
 		} else {
 			/* sy == dy */
 
@@ -198,7 +198,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 				 * +------+---+------+
 				 */
 
-				nDirection = RIGHT_TO_LEFT;
+				direction = RIGHT_TO_LEFT;
 			} else {
 			/* sx > dx */
 
@@ -210,12 +210,12 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 				 * +------+---+------+
 				 */
 
-				nDirection = LEFT_TO_RIGHT;
+				direction = LEFT_TO_RIGHT;
 			}
 		}
 	}
 
-	if ((nDirection == BOTTOM_TO_TOP) || (nDirection == RIGHT_TO_LEFT)) {
+	if ((direction == BOTTOM_TO_TOP) || (direction == RIGHT_TO_LEFT)) {
 		sx += width - 1;
 		sy += height - 1;
 		dx += width - 1;
@@ -234,14 +234,14 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * It is an address offset (128 bit aligned)
 	 * from the beginning of frame buffer.
 	 */
-	write_dpr(accel, DE_WINDOW_SOURCE_BASE, sBase); /* dpr40 */
+	write_dpr(accel, DE_WINDOW_SOURCE_BASE, src_base); /* dpr40 */
 
 	/*
 	 * 2D Destination Base.
 	 * It is an address offset (128 bit aligned)
 	 * from the beginning of frame buffer.
 	 */
-	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, dBase); /* dpr44 */
+	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, dst_base); /* dpr44 */
 
 	/*
 	 * Program pitch (distance between the 1st points of two adjacent lines).
@@ -249,9 +249,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * pixel values. Need Byte to pixel conversion.
 	 */
 	write_dpr(accel, DE_PITCH,
-		  ((dPitch / Bpp << DE_PITCH_DESTINATION_SHIFT) &
+		  ((dst_pitch / bpp << DE_PITCH_DESTINATION_SHIFT) &
 		   DE_PITCH_DESTINATION_MASK) |
-		  (sPitch / Bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
+		  (src_pitch / bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
 
 	/*
 	 * Screen Window width in Pixels.
@@ -259,9 +259,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * for a given point.
 	 */
 	write_dpr(accel, DE_WINDOW_WIDTH,
-		  ((dPitch / Bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
+		  ((dst_pitch / bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
 		   DE_WINDOW_WIDTH_DST_MASK) |
-		  (sPitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
+		  (src_pitch / bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
 
 	if (accel->de_wait() != 0)
 		return -1;
@@ -277,7 +277,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		  (height & DE_DIMENSION_Y_ET_MASK)); /* dpr08 */
 
 	de_ctrl = (rop2 & DE_CONTROL_ROP_MASK) | DE_CONTROL_ROP_SELECT |
-		((nDirection == RIGHT_TO_LEFT) ? DE_CONTROL_DIRECTION : 0) |
+		((direction == RIGHT_TO_LEFT) ? DE_CONTROL_DIRECTION : 0) |
 		DE_CONTROL_COMMAND_BITBLT | DE_CONTROL_STATUS;
 	write_dpr(accel, DE_CONTROL, de_ctrl); /* dpr0c */
 
@@ -299,38 +299,38 @@ static unsigned int de_get_transparency(struct lynx_accel *accel)
 /**
  * sm750_hw_imageblit
  * @accel: Acceleration device data
- * @pSrcbuf: pointer to start of source buffer in system memory
- * @srcDelta: Pitch value (in bytes) of the source buffer, +ive means top down
- *	      and -ive mean button up
- * @startBit: Mono data can start at any bit in a byte, this value should be
- *	      0 to 7
- * @dBase: Address of destination: offset in frame buffer
- * @dPitch: Pitch value of destination surface in BYTE
- * @bytePerPixel: Color depth of destination surface
+ * @src_buf: pointer to start of source buffer in system memory
+ * @src_delta: Pitch value (in bytes) of the source buffer, +ive means top down
+ *	       and -ive mean button up
+ * @start_bit: Mono data can start at any bit in a byte, this value should be
+ *	       0 to 7
+ * @dst_base: Address of destination: offset in frame buffer
+ * @dst_pitch: Pitch value of destination surface in BYTE
+ * @bytes_per_pixel: Color depth of destination surface
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
-		       u32 height, u32 fColor, u32 bColor, u32 rop2)
+int sm750_hw_imageblit(struct lynx_accel *accel, const char *src_buf,
+		       u32 src_delta, u32 start_bit, u32 dst_base, u32 dst_pitch,
+		       u32 bytes_per_pixel, u32 dx, u32 dy, u32 width,
+		       u32 height, u32 fg_color, u32 bg_color, u32 rop2)
 {
-	unsigned int ulBytesPerScan;
-	unsigned int ul4BytesPerScan;
-	unsigned int ulBytesRemain;
+	unsigned int bytes_per_scan;
+	unsigned int bytes_per_scan_aligned;
+	unsigned int bytes_remain;
 	unsigned int de_ctrl = 0;
-	unsigned char ajRemain[4];
+	unsigned char remain_buf[4];
 	int i, j;
 
-	startBit &= 7; /* Just make sure the start bit is within legal range */
-	ulBytesPerScan = (width + startBit + 7) / 8;
-	ul4BytesPerScan = ulBytesPerScan & ~3;
-	ulBytesRemain = ulBytesPerScan & 3;
+	start_bit &= 7; /* Just make sure the start bit is within legal range */
+	bytes_per_scan = (width + start_bit + 7) / 8;
+	bytes_per_scan_aligned = bytes_per_scan & ~3;
+	bytes_remain = bytes_per_scan & 3;
 
 	if (accel->de_wait() != 0)
 		return -1;
@@ -345,7 +345,7 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
 	 * It is an address offset (128 bit aligned)
 	 * from the beginning of frame buffer.
 	 */
-	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, dBase);
+	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, dst_base);
 
 	/*
 	 * Program pitch (distance between the 1st points of two adjacent
@@ -353,9 +353,9 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
 	 * register uses pixel values. Need Byte to pixel conversion.
 	 */
 	write_dpr(accel, DE_PITCH,
-		  ((dPitch / bytePerPixel << DE_PITCH_DESTINATION_SHIFT) &
+		  ((dst_pitch / bytes_per_pixel << DE_PITCH_DESTINATION_SHIFT) &
 		   DE_PITCH_DESTINATION_MASK) |
-		  (dPitch / bytePerPixel & DE_PITCH_SOURCE_MASK)); /* dpr10 */
+		  (dst_pitch / bytes_per_pixel & DE_PITCH_SOURCE_MASK)); /* dpr10 */
 
 	/*
 	 * Screen Window width in Pixels.
@@ -363,17 +363,17 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
 	 * in frame buffer for a given point.
 	 */
 	write_dpr(accel, DE_WINDOW_WIDTH,
-		  ((dPitch / bytePerPixel << DE_WINDOW_WIDTH_DST_SHIFT) &
+		  ((dst_pitch / bytes_per_pixel << DE_WINDOW_WIDTH_DST_SHIFT) &
 		   DE_WINDOW_WIDTH_DST_MASK) |
-		  (dPitch / bytePerPixel & DE_WINDOW_WIDTH_SRC_MASK));
+		  (dst_pitch / bytes_per_pixel & DE_WINDOW_WIDTH_SRC_MASK));
 
 	 /*
 	  * Note: For 2D Source in Host Write, only X_K1_MONO field is needed,
 	  * and Y_K2 field is not used.
-	  * For mono bitmap, use startBit for X_K1.
+	  * For mono bitmap, use start_bit for X_K1.
 	  */
 	write_dpr(accel, DE_SOURCE,
-		  (startBit << DE_SOURCE_X_K1_SHIFT) &
+		  (start_bit << DE_SOURCE_X_K1_SHIFT) &
 		  DE_SOURCE_X_K1_MONO_MASK); /* dpr00 */
 
 	write_dpr(accel, DE_DESTINATION,
@@ -384,8 +384,8 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
 		  ((width << DE_DIMENSION_X_SHIFT) & DE_DIMENSION_X_MASK) |
 		  (height & DE_DIMENSION_Y_ET_MASK)); /* dpr08 */
 
-	write_dpr(accel, DE_FOREGROUND, fColor);
-	write_dpr(accel, DE_BACKGROUND, bColor);
+	write_dpr(accel, DE_FOREGROUND, fg_color);
+	write_dpr(accel, DE_BACKGROUND, bg_color);
 
 	de_ctrl = (rop2 & DE_CONTROL_ROP_MASK) |
 		DE_CONTROL_ROP_SELECT | DE_CONTROL_COMMAND_HOST_WRITE |
@@ -396,16 +396,16 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
 	/* Write MONO data (line by line) to 2D Engine data port */
 	for (i = 0; i < height; i++) {
 		/* For each line, send the data in chunks of 4 bytes */
-		for (j = 0; j < (ul4BytesPerScan / 4); j++)
-			write_dpPort(accel, *(unsigned int *)(pSrcbuf + (j * 4)));
+		for (j = 0; j < (bytes_per_scan_aligned / 4); j++)
+			write_dp_port(accel, *(unsigned int *)(src_buf + (j * 4)));
 
-		if (ulBytesRemain) {
-			memcpy(ajRemain, pSrcbuf + ul4BytesPerScan,
-			       ulBytesRemain);
-			write_dpPort(accel, *(unsigned int *)ajRemain);
+		if (bytes_remain) {
+			memcpy(remain_buf, src_buf + bytes_per_scan_aligned,
+			       bytes_remain);
+			write_dp_port(accel, *(unsigned int *)remain_buf);
 		}
 
-		pSrcbuf += srcDelta;
+		src_buf += src_delta;
 	}
 
 	return 0;
diff --git a/drivers/staging/sm750fb/sm750_accel.h b/drivers/staging/sm750fb/sm750_accel.h
index 2c79cb730..b0ee6ade3 100644
--- a/drivers/staging/sm750fb/sm750_accel.h
+++ b/drivers/staging/sm750fb/sm750_accel.h
@@ -190,19 +190,19 @@ void sm750_hw_set2dformat(struct lynx_accel *accel, int fmt);
 void sm750_hw_de_init(struct lynx_accel *accel);
 
 int sm750_hw_fillrect(struct lynx_accel *accel,
-		      u32 base, u32 pitch, u32 Bpp,
+		      u32 base, u32 pitch, u32 bpp,
 		      u32 x, u32 y, u32 width, u32 height,
 		      u32 color, u32 rop);
 
 /**
  * sm750_hm_copyarea
- * @sBase: Address of source: offset in frame buffer
- * @sPitch: Pitch value of source surface in BYTE
+ * @src_base: Address of source: offset in frame buffer
+ * @src_pitch: Pitch value of source surface in BYTE
  * @sx: Starting x coordinate of source surface
  * @sy: Starting y coordinate of source surface
- * @dBase: Address of destination: offset in frame buffer
- * @dPitch: Pitch value of destination surface in BYTE
- * @Bpp: Color depth of destination surface
+ * @dst_base: Address of destination: offset in frame buffer
+ * @dst_pitch: Pitch value of destination surface in BYTE
+ * @bpp: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
  * @dy: Starting y coordinate of destination surface
  * @width: width of rectangle in pixel value
@@ -210,34 +210,34 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * @rop2: ROP value
  */
 int sm750_hw_copyarea(struct lynx_accel *accel,
-		      unsigned int sBase, unsigned int sPitch,
+		      unsigned int src_base, unsigned int src_pitch,
 		      unsigned int sx, unsigned int sy,
-		      unsigned int dBase, unsigned int dPitch,
-		      unsigned int Bpp, unsigned int dx, unsigned int dy,
+		      unsigned int dst_base, unsigned int dst_pitch,
+		      unsigned int bpp, unsigned int dx, unsigned int dy,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2);
 
 /**
  * sm750_hw_imageblit
- * @pSrcbuf: pointer to start of source buffer in system memory
- * @srcDelta: Pitch value (in bytes) of the source buffer, +ive means top down
- *>-----      and -ive mean button up
- * @startBit: Mono data can start at any bit in a byte, this value should be
- *>-----      0 to 7
- * @dBase: Address of destination: offset in frame buffer
- * @dPitch: Pitch value of destination surface in BYTE
- * @bytePerPixel: Color depth of destination surface
+ * @src_buf: pointer to start of source buffer in system memory
+ * @src_delta: Pitch value (in bytes) of the source buffer, +ive means top down
+ *	       and -ive mean button up
+ * @start_bit: Mono data can start at any bit in a byte, this value should be
+ *	       0 to 7
+ * @dst_base: Address of destination: offset in frame buffer
+ * @dst_pitch: Pitch value of destination surface in BYTE
+ * @bytes_per_pixel: Color depth of destination surface
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
+		       u32 src_delta, u32 start_bit, u32 dst_base, u32 dst_pitch,
+		       u32 bytes_per_pixel, u32 dx, u32 dy, u32 width,
+		       u32 height, u32 fg_color, u32 bg_color, u32 rop2);
 
 #endif
-- 
2.43.0

