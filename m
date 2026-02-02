Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E8B2472AA
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 16:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770050815; cv=none; b=eWd2Tzu3kN7RENsO9PoboJSVrVpqmpoxsWClJl0lXD4q5Rn0cIYpsjRliLjVvIP42vTBl57Cbv4kUhN4+QnNyV9YkaTYuf3sz1OLbuAmCbX8poo88vXMNKhEdri+lvqOvvygONzzcO3OYg59cmHLMPsal3vTK8T5c5dk8akCnGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770050815; c=relaxed/simple;
	bh=uZupMsY12grTXtbViH2uDs9GyHCl34p6SlRSawPH9Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TodFfcLsFX7n6737YU3l5DYHuPAg5qJEkD2UtIs527Cm/oECIsLS39OJc9Fu+wCKZsfdc/aPN/JDa1484MCEEt1kccMlcQ8lmFy2o6/sw/mFU0Q2lDTQ4HYDRDybxIhZ+iitmxWMVHqos0NkmlYi3Ra7fFKb2q4k1ZMesFndTRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cc0Yzicb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cc0Yzicb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4805ef35864so39887765e9.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 08:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770050812; x=1770655612; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INIFCBCUJTQI/9LdXmCI4Y+qu/4cGnWjRRdFLeUHGsM=;
        b=Cc0Yzicb9IulYj/bqBhKQaRDCqOux8p01yBCx+qvRcnLK2d92zdYP/V+fTBHTBpPov
         6SAq27qXw61VA8HVn4ZU3reO+0v8x6d3plExAi0L544QmSXOI/WAWNPKUX+0SY1x+GGN
         wIBfYGXxp99nonZtLgk0z6gEGqJXD53G/Sb3iulfUU2d2kf5s2hKo6MEW5VCbB8SawQW
         GLL3y8Ve72Cfh93ued26ITg1lSNk6sDLTw96ENGBQ5WM/3ZnnHOYj+4fqU9SSaU+iIKh
         pIavinS5LQzrUomALBvgvwmQuobIO52UCNE3v5bzzPuvivqLimodjAxGivZ0c3KeP+GG
         Eqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770050812; x=1770655612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=INIFCBCUJTQI/9LdXmCI4Y+qu/4cGnWjRRdFLeUHGsM=;
        b=w3vpDL/zDoCFIFRFpSm00bpKOfoG9HqSRRchVPeiS7EOV3PdDh3A9EnGTVpHG8CNXZ
         tJVXPDuPLaBFr3tO0mccYmt2Q0xVNtdguHHzsNJrWxWTT0SUXYf5rLO0nEEyy8NhCOBA
         M3Dnh/1XMwjGtZXlZV5tVz+co/OPsgKuGfGwwY0MYz38Y6fqca0kdj89tPr2yx6YmodK
         +AXoqfn/r2Pp5SI0jXjoT9QRE8Vo35lCUGy4G+Irle3CYKs8HELVN1rkgMx7rJ74RazU
         pqw9W4NpS5hNg5jM5rSt7jaH3pCT+g3OfIWaKJaQmhWGL8BOIP1yCpK2HLTm9+dZvWRP
         BXDg==
X-Forwarded-Encrypted: i=1; AJvYcCVKR6c6Rm6IewHk84ql4wET/XQnXFJmiWiMrsz1RGxVxJ5R05GKZUiWKTFczg2C2zuXjohnrliMju4q8AlE@lists.linux.dev
X-Gm-Message-State: AOJu0YxjF92bfX2LnWehq11RvCcjp00zMsxi4eMGMo1hG22lzLeQJjEr
	CesRHq7DNXNgHqo/d7wTEvkcV69XeEWfejQDyMsZfRxI84pKonYHmIZd
X-Gm-Gg: AZuq6aKGyBtuC+oLXKv3u7vKyVg4trV1R76OkLqplq1fIZnUgr7sUR/wyWfnrhMeZVf
	BjFPGD90c4PsVNMB0q4qmLWmjAee9p8Qb1S9fa7VH6k4aJNpLxA1xdUzzm5WbT5rTiyLOYjraD3
	IxhjCylwneu9G2zBUCPhzZF4a48r1g9EN589XOpTCrQXMkz8pxgdA6LLfYEznHjEGKKGqE1G9sf
	ug5omqRD11960qGL1oKYprdR23zfBMKHDGjQjaTP0l3D6m7sxKO0x5HLeN7fXZl+yXwPYgcHqs7
	KivYcw2MVgflNTeWa1MPn9W84Bc2xu54/j9HKBRNw1CpJdSNXlHzOVhXmpe60UUxIZ/wtTDKOaJ
	WpUo8axN00UIgTv/whZ5uoCMPc7KZ7ZNBFFm/tSZ4xl9IMEl5l16SBX3znytRJnloMK/rJMcPFl
	fBvUtkQYHCOw0Oo7TYOXkPRR0HuKwriiorT6NjSkbP/p0WI5FV9U0=
X-Received: by 2002:a05:6000:400e:b0:435:98c6:7f06 with SMTP id ffacd0b85a97d-435f3a6f562mr16178743f8f.6.1770050812146;
        Mon, 02 Feb 2026 08:46:52 -0800 (PST)
Received: from yehudis-VirtualBox.. ([195.60.235.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee078sm45122422f8f.16.2026.02.02.08.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:46:51 -0800 (PST)
From: yehudis9982 <y0533159982@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	yehudis9982 <y0533159982@gmail.com>
Subject: [PATCH v2] staging: sm750fb: rename Bpp to bytes_per_pixel
Date: Mon,  2 Feb 2026 18:46:45 +0200
Message-ID: <20260202164645.133806-1-y0533159982@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202145413.132435-1-y0533159982@gmail.com>
References: <20260202145413.132435-1-y0533159982@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the Bpp parameter to bytes_per_pixel for clarity and to avoid CamelCase, as reported by checkpatch.pl.

Signed-off-by: yehudis9982 <y0533159982@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 046b9282b..3fe9429e1 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -48,7 +48,7 @@ void sm750_hw_de_init(struct lynx_accel *accel)
 	      DE_STRETCH_FORMAT_ADDRESSING_MASK |
 	      DE_STRETCH_FORMAT_SOURCE_HEIGHT_MASK;
 
-	/* DE_STRETCH bpp format need be initialized in setMode routine */
+	/* DE_STRETCH bytes_per_pixel format need be initialized in setMode routine */
 	write_dpr(accel, DE_STRETCH_FORMAT,
 		  (read_dpr(accel, DE_STRETCH_FORMAT) & ~clr) | reg);
 
@@ -76,7 +76,7 @@ void sm750_hw_set2dformat(struct lynx_accel *accel, int fmt)
 {
 	u32 reg;
 
-	/* fmt=0,1,2 for 8,16,32,bpp on sm718/750/502 */
+	/* fmt=0,1,2 for 8,16,32,bytes_per_pixel on sm718/750/502 */
 	reg = read_dpr(accel, DE_STRETCH_FORMAT);
 	reg &= ~DE_STRETCH_FORMAT_PIXEL_FORMAT_MASK;
 	reg |= ((fmt << DE_STRETCH_FORMAT_PIXEL_FORMAT_SHIFT) &
@@ -85,7 +85,7 @@ void sm750_hw_set2dformat(struct lynx_accel *accel, int fmt)
 }
 
 int sm750_hw_fillrect(struct lynx_accel *accel,
-		      u32 base, u32 pitch, u32 Bpp,
+		      u32 base, u32 pitch, u32 bytes_per_pixel,
 		      u32 x, u32 y, u32 width, u32 height,
 		      u32 color, u32 rop)
 {
@@ -102,14 +102,14 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 
 	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, base); /* dpr40 */
 	write_dpr(accel, DE_PITCH,
-		  ((pitch / Bpp << DE_PITCH_DESTINATION_SHIFT) &
+		  ((pitch / bytes_per_pixel << DE_PITCH_DESTINATION_SHIFT) &
 		   DE_PITCH_DESTINATION_MASK) |
-		  (pitch / Bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
+		  (pitch / bytes_per_pixel & DE_PITCH_SOURCE_MASK)); /* dpr10 */
 
 	write_dpr(accel, DE_WINDOW_WIDTH,
-		  ((pitch / Bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
+		  ((pitch / bytes_per_pixel << DE_WINDOW_WIDTH_DST_SHIFT) &
 		   DE_WINDOW_WIDTH_DST_MASK) |
-		   (pitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr44 */
+		   (pitch / bytes_per_pixel & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr44 */
 
 	write_dpr(accel, DE_FOREGROUND, color); /* DPR14 */
 
@@ -138,7 +138,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * @sy: Starting y coordinate of source surface
  * @dBase: Address of destination: offset in frame buffer
  * @dPitch: Pitch value of destination surface in BYTE
- * @Bpp: Color depth of destination surface
+ * @bytes_per_pixel: Bytes per pixel (color depth / 8) of destination surface
  * @dx: Starting x coordinate of destination surface
  * @dy: Starting y coordinate of destination surface
  * @width: width of rectangle in pixel value
@@ -149,7 +149,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int sBase, unsigned int sPitch,
 		      unsigned int sx, unsigned int sy,
 		      unsigned int dBase, unsigned int dPitch,
-		      unsigned int Bpp, unsigned int dx, unsigned int dy,
+		      unsigned int bytes_per_pixel, unsigned int dx, unsigned int dy,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2)
 {
@@ -249,9 +249,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * pixel values. Need Byte to pixel conversion.
 	 */
 	write_dpr(accel, DE_PITCH,
-		  ((dPitch / Bpp << DE_PITCH_DESTINATION_SHIFT) &
+		  ((dPitch / bytes_per_pixel << DE_PITCH_DESTINATION_SHIFT) &
 		   DE_PITCH_DESTINATION_MASK) |
-		  (sPitch / Bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
+		  (sPitch / bytes_per_pixel & DE_PITCH_SOURCE_MASK)); /* dpr10 */
 
 	/*
 	 * Screen Window width in Pixels.
@@ -259,9 +259,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * for a given point.
 	 */
 	write_dpr(accel, DE_WINDOW_WIDTH,
-		  ((dPitch / Bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
+		  ((dPitch / bytes_per_pixel << DE_WINDOW_WIDTH_DST_SHIFT) &
 		   DE_WINDOW_WIDTH_DST_MASK) |
-		  (sPitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
+		  (sPitch / bytes_per_pixel & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
 
 	if (accel->de_wait() != 0)
 		return -1;
-- 
2.43.0

