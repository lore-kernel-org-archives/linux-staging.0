Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775573C9EE8
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 10:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781173488; cv=none; b=A2NDIjSMcpTLw4QgO0l97sk/o4a2V4TOR32LALz/Jbs6UeNx4AGvjI1uGEpYgQsANCr/tElagzwPRY4K+mrDjL0u93QybuueBjPNF4/XsHRHhPv5a4nvyP7tnsLjSOuFZUgvr41czWpxUI57hino3yKnlvUQ5z/FfGDh5aYHq90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781173488; c=relaxed/simple;
	bh=hlfMl8YRaJvwDqi/+iqxrs0r1tbx3KXyGipQCqVE0hg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S//b5h9hyjSLgfcDUqXG+YJ6IJk71oJDThqHlNKRtjus/9In0cAUIiGm0pxepeACAJl5zV1wzTf1RY2Kcy9q4v3XUuL/jLTlonotOdX3vPsUnOcxslMYJuAmIl0n2hHJll5RcAxF5LXOGMl6FxbPgP8N4utMclX9dyZAcBb2hbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bsv/2EAE; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bsv/2EAE"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c2a68d01so52135565ad.1
        for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 03:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781173486; x=1781778286; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ouPpwQMT501sab37XIOkk8CD2y0PoAbrmxd6qozXfMQ=;
        b=Bsv/2EAENlXHBaCmBG7udFOVJfL6pTz/C+J0EYl5ai49lOiXe7Xi+kNlHuOpGsmq7z
         S7XK2YqHW3STuyEmln7TUrFMNVtFvQNg9IYJqQKmyC/zAdJ3YiwkoZFjFBYj1ZDk18OY
         HXDU0ARYLCdsx5yCjT3OCDhwaB7WUwmAQWBEbdfUCc7WpHjGHIAiQlztKp8Mp6SUSgyI
         YfqOmC3dmeCjT4ykesxwbQSTXc/lPfsQl9LjS+LnuFww/Sp73ZresHnlcm8ftNMytJJr
         i7j4HDumTAFpyFCwcprBkTBAtp/qJ1IjIlPN/zaT89qbdMEHNbFgOBcfsz8BhFhLxpU3
         h6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781173486; x=1781778286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouPpwQMT501sab37XIOkk8CD2y0PoAbrmxd6qozXfMQ=;
        b=HwGGx5MSMpCq2/5Tz8xZH5aRDLNWdtMR1F4JzK5C/w6zZ8ZB3VKT21cn0gejdcS+Om
         ID3f0BAuZ/c1ir0cxDgsajv4RhT+QknnwXZx2hQ8a9UHmWvmy3zzlXne544XDLUAkLcP
         mfbkedrEROoBIzAJCqOHN4BxkeUNPrIBQt76zYxoTfS+45wxk7rRDSa8utsI1/kil+NN
         s2/QLjzYGC0c6M9IoNOFEfqz8yT5+WwGTntV5D21LSTvMgEv+rx8ZH2ofTkFT8avHog9
         tdetZKJhjKGcc6BwalDYn5lRocP20wRfvg0gMIQoES16Tj1cEqxA4Atp/ma8m3glmYwP
         lQtA==
X-Forwarded-Encrypted: i=1; AFNElJ9pitEMg8gP1tnQRG2VFkFZoECbl+PfN0Jn9zUHygbTRpVQQfaQEpKqArq1Zlb09h8pwSph6A7Rzdg1vP3E@lists.linux.dev
X-Gm-Message-State: AOJu0YwL10xh9NBjIjFG97v3lRO3Ci0DrbXhN1BeUR9kjdM4OwxG0bW4
	As6u5gGnc1gtRLC/HCUx8AWV52Xc42pdIChIg0HIaa+MOrYh1bgs48ds
X-Gm-Gg: Acq92OEnLQGj0UPCirOVenkR9ftkFsGnOcOFBgPw1Q9WW5x+ZXkFob1I/TQZjJIkZP2
	CNi02WOjeBMDYUaoS4JTKki9OM+xEL9BG5JXYC6FQUEXmn1s+0of5dQ3KZqK4PcYvaAmy0CvXCj
	meP8YCvh78IPScyUTYqaqA2oUqd9NqZRebrgYii4+lmyzA25Cq5Y/gmiZ8Y7/sVoBdN8WlRDan+
	0E9Uuv4LOFygiszZWJZ1y+G0tq/7PGLEWypK3PENGdpB45htyDgYLfqRBx9v3Ad1QFavVFRKL/w
	96cIBJAFKi4qAQIWZjSl+/gt4aQucr3Z4ElG0nDGLcW6XvmzC7TX1hEUYCEM53XHzTIVZnSJ8Zr
	B45286k8Dd4wPhacr2/KZFcl4KlFVuHYdXZWpfq71JCOxTXnUdqpKiDwZUJ4N7BUud0XZ/LxrAx
	05tpZurPI9MxPuUEtMlJ5pJGAy0rMIauvV
X-Received: by 2002:a17:903:3b8b:b0:2be:e3bc:e8e4 with SMTP id d9443c01a7336-2c2f2a77e4fmr24126845ad.18.1781173485714;
        Thu, 11 Jun 2026 03:24:45 -0700 (PDT)
Received: from 192.168.1.10 ([43.248.69.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d55esm279641675ad.63.2026.06.11.03.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:24:45 -0700 (PDT)
From: Xebec77 <ixebec777@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xebec77 <ixebec777@gmail.com>
Subject: [PATCH] staging: sm750fb: fix CamelCase variable name Bpp to bpp
Date: Thu, 11 Jun 2026 15:50:27 +0530
Message-ID: <20260611102027.28137-1-ixebec777@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Xebec77 <ixebec777@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 0f94d859e..4beabe105 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
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
 
@@ -138,7 +138,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * @sy: Starting y coordinate of source surface
  * @dest_base: Address of destination: offset in frame buffer
  * @dest_pitch: Pitch value of destination surface in BYTE
- * @Bpp: Color depth of destination surface
+ * @bpp: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
  * @dy: Starting y coordinate of destination surface
  * @width: width of rectangle in pixel value
@@ -149,7 +149,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int source_base, unsigned int source_pitch,
 		      unsigned int sx, unsigned int sy,
 		      unsigned int dest_base, unsigned int dest_pitch,
-		      unsigned int Bpp, unsigned int dx, unsigned int dy,
+		      unsigned int bpp, unsigned int dx, unsigned int dy,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2)
 {
@@ -249,9 +249,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * pixel values. Need Byte to pixel conversion.
 	 */
 	write_dpr(accel, DE_PITCH,
-		  ((dest_pitch / Bpp << DE_PITCH_DESTINATION_SHIFT) &
+		  ((dest_pitch / bpp << DE_PITCH_DESTINATION_SHIFT) &
 		   DE_PITCH_DESTINATION_MASK) |
-		  (source_pitch / Bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
+		  (source_pitch / bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
 
 	/*
 	 * Screen Window width in Pixels.
@@ -259,9 +259,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * for a given point.
 	 */
 	write_dpr(accel, DE_WINDOW_WIDTH,
-		  ((dest_pitch / Bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
+		  ((dest_pitch / bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
 		   DE_WINDOW_WIDTH_DST_MASK) |
-		  (source_pitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
+		  (source_pitch / bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
 
 	if (accel->de_wait() != 0)
 		return -1;
-- 
2.54.0

