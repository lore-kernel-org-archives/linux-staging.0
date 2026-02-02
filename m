Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB7537F748
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 16:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051448; cv=none; b=fv54Z+c9vfyJL9Q0GxGxBLz0iUeKBO4nGGaneynghOGKgz/68ewlCk7j32Kea6w6WNodL5ezc8RE8W351HgVG1jQh0wxA29VyAZtcCB4XWSdiyJa8e1s7HjLnQq8NJwngCJyGOqUJA1BdtkmeSAjqq3mCFRJJsk6bhnx830bMVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051448; c=relaxed/simple;
	bh=uZupMsY12grTXtbViH2uDs9GyHCl34p6SlRSawPH9Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=irqbQMwj97x+S1jujC4vAoVG1psOYKLhmbik43Af5uckawCvZH65srWkRbTAMPR4VVaS9nn0mhmcC3gXzIlWT2GU7QH59zWaCNkB5LM1IH/ZVvi7Q9g1CzHb6LWQq3gzX5qGIPCCwtr/UihcNWQTgOPFmEAOSRF2BvVAnahj9Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzsF3T1T; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzsF3T1T"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee2715254so25407005e9.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 08:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770051445; x=1770656245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INIFCBCUJTQI/9LdXmCI4Y+qu/4cGnWjRRdFLeUHGsM=;
        b=FzsF3T1Tz191eXLrC5aFIwN9Tzz6ctG25Lg4Rk9yRXhKw3LcbJ3+0dJfNpmHMrYkkn
         AYZ/Ie6En7vRSHN/Mb2ebcMIHmTskn6itxPJmJU26qqvJf+dwVJT+rDqaR52/u54ht2E
         DRuaMesMTKvbguy8QLPEF3d9OWQCRzm2A2q/HslJhtrSiehngHu8dQJIIbAe4ZHyt6cB
         IEHNXlJr7c1hwCFqC/hORyKsyvRvxIazEnxbIkmwBr8G7BMczQj+nx75HkP5MaOi0yvt
         xbwokPAnSkUhwbbeo6KTlFhlG5MWhj5Kh17dL+Q0g8imAr5Hb17l21LvrSsuO5vfazOS
         gWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770051445; x=1770656245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=INIFCBCUJTQI/9LdXmCI4Y+qu/4cGnWjRRdFLeUHGsM=;
        b=tixvD+zOLveuE59G5w4ct7XVMoT0SbxCXHRP2P9uzS9Nw9IiBnj3xDhSJQm7cbjPmb
         rfi5Chs3tjRNpAeIkVobFO3iVv4YKTKwJl10evWksYEC2NiSeYX8+0cTtEktfh9uHzk1
         Pzqx+kav1jrxPX/WH55z/bZJzYsyyL5b0nn9AOubbs8g1m2H627eN2b5+PnvD2LtiYNL
         aNUzW5TXHE8KFJncy5aIFV1zmztdLMuCruHOXHBw9WGNwmnIHFKQNrdS4gbjAauEGb0K
         Bd186q0O19Y1KtioQMcANY34SCLQMpEt5JikWOn0ItYVRwvYB3qLwxE/zdy+NFgqp7r2
         CDBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFeFKMBrzvJdlyaKcF8nfUXbygblUtcewIpOgGrwaoeSRSE5GDBGBvZeCHsfTYLwxFXE/jg1LneQ5HO7lC@lists.linux.dev
X-Gm-Message-State: AOJu0YzYUS9G/qjXLZtM82M+77xjb2YAPgXPwqs9sYD40QV/3o9EReo4
	G8pnOnTTRSjU2HO0zlsyma+dMMeis9JidT42wPE3sbYNKKL1X6UWIfiv
X-Gm-Gg: AZuq6aJQzJ3+yp89AZmp47VbFrWf5Q6yRZPMhdxvxzkr+xxe3cbDvfeFtmRcsJUiqZk
	KF8BmJQ8dWV2IOrTrzK9Bxtc6wnt6xDzue5CNzs40+WFkLlQ2ZuqEP35LE0abjHT9aqIooN285s
	GmqoFGMT4xlg1rdfszX8MCWrEDSO4m0atNGrFWrHj+F+YbvlxG/8hHYtbJJTJf08b0o1NoMT9sj
	daHjSHO8ccJDcr85YYH+jrMzfEkzKpmY2ynJi+Z4MaZlqabv+6jlzwK9fnWY2avR6kq8gqH+eAg
	DhsZSyFLTH2EZvSIT+ZO+DOCdAk1L4FvBcNJreVxzm6XuWhX2+NUvy9P750Mvs51doEjJtL/vV3
	3Bxam85taXn7vg7op9/QNNSgU5slXPZ8+VH6wx7HibZgGNWOQdWOuEa8nwAegt4F2nKcOYe2QJ1
	kp+In4K9g7bv5M538200NGl7NcF6Gjn3TlOV1DxtXRbUg8WOWriPw=
X-Received: by 2002:a05:600c:354c:b0:47d:5d27:2a7f with SMTP id 5b1f17b1804b1-482db49590bmr155556105e9.26.1770051444643;
        Mon, 02 Feb 2026 08:57:24 -0800 (PST)
Received: from yehudis-VirtualBox.. ([195.60.235.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830511bfc6sm4121875e9.2.2026.02.02.08.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:57:24 -0800 (PST)
From: yehudis9982 <y0533159982@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	yehudis9982 <y0533159982@gmail.com>
Subject: [PATCH v2] staging: sm750fb: rename Bpp to bytes_per_pixel
Date: Mon,  2 Feb 2026 18:57:18 +0200
Message-ID: <20260202165719.133879-1-y0533159982@gmail.com>
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

