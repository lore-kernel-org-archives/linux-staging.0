Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFAB37F8DE
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 17:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770052372; cv=none; b=KiolnMN9TCFIJK8gY1XXoV1ZC+Fd1XM3RKrECEwXxKwP33IBrEg7qWcuz5Zi4IYETrCuw9Ii6fdB96B5NazgcnRTdPkkyFX10z3EnKJsvg7/VA0gmSgqCCnhllLsyWx11dhnh39IrlDYANms8ICSBBY/m1k01Su8UHuRZOBo3t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770052372; c=relaxed/simple;
	bh=uZupMsY12grTXtbViH2uDs9GyHCl34p6SlRSawPH9Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G0pSdZLj/Z5P1pE5j42PokmZCEMSCvXIgxrnk4KlU97uAxy/Xp1CTz7LoboDn7RcuXiKuQGooC1S3BiIuv/ibDzHwCv5Lj6VG9KwfrYVZIyM3AiirqpP+AejswdVyO3I82PFUBVILJMR3pgIblXOaTueXj6A6I0oDgU7WzEVN/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoYhaH8W; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoYhaH8W"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-432d2670932so4341294f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 09:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770052370; x=1770657170; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INIFCBCUJTQI/9LdXmCI4Y+qu/4cGnWjRRdFLeUHGsM=;
        b=aoYhaH8W9xmiUXFsrNCRD5UskVuoU49SxySW4sQQdHN88oQ3EZtwWSvGr7NUL/vcaz
         nG/B178uQqRL9av0ux6N+dmCwAo96POQzxzsEK2r+Ou5qMuPq0CTKMeRSbUZokH/VrQ2
         bFjgw7tre8BZBwKTuakLYF4U1mbHtSwfKe9wA3UTC7izLq+hP/ZSM97IQL8Ze3/Tgz9p
         Y1GNTusQqlR4hkEqFT/JGd8qpCKQf6FxSnKBUx+WZb+lmjEefez0BLii4YGSpyAHARUr
         ZC8hKcliYjNCEaVl/9FXOItw8hg1lYknpAHjYd4eEa2ak5Fj66BsbF22/UulMobQywvA
         DfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770052370; x=1770657170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=INIFCBCUJTQI/9LdXmCI4Y+qu/4cGnWjRRdFLeUHGsM=;
        b=Odk24v/bYc00sr8skUjy28cv/ctpyxdY1gfq0w1V5eq0onYDHJsRXFQAQxs+ePiHKl
         eh4hve0TDhBkyNhWuH2W/M6h5rb1gqP9XcQeZjwaaPkdhmCxfpCoUdXGgRrB1UCgbfZ5
         amNF0RUBH1cgt0kv9p5+dPNDTf1wwZ61W8NYoAI11Xlpqb3vGBkMYlojeM/2lNYjKKgi
         Gtk8Gd0URgCg+jP8JYEoIny4iSW/J52uTj+4VzcqmmCl/v6a8sb/l1DwityRU6IcCwfj
         AYChDGyjCqXVrACSySfcAvcoUpckBhicd6PLF0S7l4BYu54TdNQBx4RWgrLawP5zhPIc
         dCkA==
X-Forwarded-Encrypted: i=1; AJvYcCXNeaXkoXXD9d0IlUvbJWoS+7CpRDJSxRLZNrIs5pvhOyszqp9n5rbKP3b45y/M32rs5SVEylSdEhSoYuLk@lists.linux.dev
X-Gm-Message-State: AOJu0YzXlpGZGxfZ4bSyDrUtghMpXfqD7B7FpBG3WOOfx4bOFYNzYy+r
	hiaoImIFQgUy43tPe9l6JF7H+ynHHpIBjBpv3AomHSxmqtQwJrsquQl2
X-Gm-Gg: AZuq6aLD1iEpYRDYvTddK0nuxNf25uZPm3YoNj8A9cRuT2QlYZUvpJXV3n/MCk5lrPF
	/4E9Rcn3SCrbkOTiVvGbVvQ84Iqj6TiYjDU6bkACYTv1OtfekY3kml+GLH6XDFRzYkOde1ioQHw
	O7WD/NRpppBZG2XeZ0pIzRZeZwaYfmjpXk0M+POWjoj4X7SgQTanxNYzu74GJUnzcbuI9wRyjl9
	nXTUn6bsS3DYFf5Ha6SROiYGNCMwMkitMKLD0mMUct2X0g93f9MDfZdZu7nShd6RqZduAlNFjuJ
	vZcrli1TdvHMxgvTpyYzOHJmMwS0UWkKsNc03RQN43WuC6DbTWfcaLe88VbRFMJBPMLNYYhhErI
	w9ROR1tyfkryw6fszCWvW4Jl42Qd0Xw+Yl0oU3ctVE2OMwc3y0+ydxf6Y0c5T6lE5gyaDxXOsTe
	OGytKVUVy0DBIMIy9phso/N/Srv59j51elBYHRpxEhTUSyTn8Ml8U=
X-Received: by 2002:a5d:64c7:0:b0:431:62:d946 with SMTP id ffacd0b85a97d-435f3a7bafdmr16924187f8f.23.1770052369703;
        Mon, 02 Feb 2026 09:12:49 -0800 (PST)
Received: from yehudis-VirtualBox.. ([195.60.235.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cefdsm46308792f8f.23.2026.02.02.09.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:12:49 -0800 (PST)
From: yehudis9982 <y0533159982@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	yehudis9982 <y0533159982@gmail.com>
Subject: [PATCH v2] staging: sm750fb: rename Bpp to bytes_per_pixel
Date: Mon,  2 Feb 2026 19:12:43 +0200
Message-ID: <20260202171243.133935-1-y0533159982@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026020201-monogamy-sash-4866@gregkh>
References: <2026020201-monogamy-sash-4866@gregkh>
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

