Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02E6376BE5
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770044064; cv=none; b=VBcc7vg2tRC5us/7T2LFYZqHaW3ROsk2r/3sCNcTcDF6IzTwHiCJ+mvAjqkLJhHlzkYqe3wPyfXk8ZE9Gytgj5lgh2+o+j+cUv9Vo3NUAROmZ6Ihmh8Pf1R3a3G4MMVDLfQ/B15XRqu52Ybo/G2Og9B6p6YbEzYHRdZtycxsNpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770044064; c=relaxed/simple;
	bh=HlzZDm3wDGEDRIiUNHMPI3nIr6vadV093jni4DOqn4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b1JHUF2mTuTFVc7KuDeTcm0pb4VicnAVQjkDfK8umpXLEZzBX8vZ+mAc7unpvwbi5QdWuHU5BRArtiFiImJusV8+lIx64yXQEyLNbuEt+RqZibnU0ySRsGB4u4/E5SP9JVoQG5n2Ksp43XHClayU9hIX67A1EKNDiOqTT+d70yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dh4ckwKg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dh4ckwKg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so50484655e9.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 06:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770044061; x=1770648861; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vEn4ZKSSYDbmHCenGK9C31Qr9OkytxiWm0OV7IJoy3M=;
        b=dh4ckwKgKkT2z3c+Xp0e9A+GRRWDy0gmCuxuy46C1wdWw1uBm55EofleJGc6deOLuV
         4rvbx4oWnvOdWMqoNRMkUCDshfSxB+yYFEWrcTSFDVOaHUVSvPdIvyWSlez+pZ6WBAEx
         79q+F4KlrxXr2Hn0R13JbqnzO/Ss58TZI2lLeyHKixrdbHg8VQgO6bVfddURNA0AsITD
         xLjPVsxOAoseGOPgJi6AoRHvvrgOC14bKm1dyzPDrnl5dJDv1d1JCFdtuwZvEfjFafjD
         r2FE1MIbqVUjhUX8xz/H4zAjD3aguVi+AD1JnuHy4PwU6d8NsH1iRm/03fL7pC+TRV/r
         hpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770044061; x=1770648861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEn4ZKSSYDbmHCenGK9C31Qr9OkytxiWm0OV7IJoy3M=;
        b=Llmw9Ktw+b2xstEhTvYEXxK8ohFRfgRIzEGfjA1ru6+/etc9kgM+hSMBolVT6udD79
         NoX6iqANptg94lkz71luL7ztwhufuJECcEpuwGCVjuI/Mayt2J2Bu5e3ZZhgD7Wrt8ft
         g0UFHF1u8j1hqYclnP25QQ0CGku0TE4wSBBtXle7blEqaIVQ1yukaJQ4f18gwAptokCq
         YPhhMhuYguf7XmZ3iQll00Sse8xE52LHWvXhZpIrYzYx5ouEFAvlcNOqdsXNm6DAz8j3
         lg3/mHZgr6gJTfc66eaRA9qHRQYoJ9nO/RaRqrlTvr7VR2trX+F2vEpGXKvcY9zXTcAw
         k3gA==
X-Forwarded-Encrypted: i=1; AJvYcCX4JOxJdpifFscLNTQk57Uhjd8QQfIatcJdWcrTfgLm0BFyISsrugvk+cVfYMJHuRNNEONwt4WM02qbUywn@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5UkMAOAEab0xNNoV20BEqSN3AIgxAPb8Z+kNKT9tUhPYCO97J
	bPqNjTWEW1cA9C5xG2rQv5OeV60LxKhtEowujILOsDTQcE+HdwH4bG4+
X-Gm-Gg: AZuq6aJ2V7PYaX1viqZUTuxCEvHc8+fglJbC1cCWTz8de8PAhTylE+6X0ojM82QO/ZI
	/Ly34pkuEoAgwRerkNy3tUz1SgiZSG+dUA0XE77YvwwT0O+sui/zYVMy7VhfPLaNOx76ONFbcyc
	rocFRktBAM3turReVXx+HVmu2bY6WPqJtzv2AH6kvq85AxyoSPCWmTNij7Hl+N7D5Y2cHhS66sa
	QPZ7LSJ/C1KdoM2xW7SLpcBXgOgxVpDnk1zPWZ7Kr/UDg+w4YJj0mvDwPe8cy+HcLRstP27O39A
	TWx3MJ56H7HbCpwr3lWIVGI3vVqv3xuVVrGLkeeRaR5Oo4lP7tHFZv+kUxYXHFnzVPwlWH03SQx
	D+fVaJCHYc8CIBJCRqYNV74d6s+dVSJqp+08ICZvrGSMR5NXIrxbWUvC1IA4GO+zN8bpaL575Da
	0pOnt3+0HSSH/SfYaVfYwS4Uh06/XGII6SfG84SFOKRK3dDaleOcA=
X-Received: by 2002:a05:600c:8b0a:b0:477:af8d:203a with SMTP id 5b1f17b1804b1-482db49993bmr153461055e9.27.1770044061016;
        Mon, 02 Feb 2026 06:54:21 -0800 (PST)
Received: from yehudis-VirtualBox.. ([195.60.235.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e2973d57sm91081965e9.18.2026.02.02.06.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 06:54:20 -0800 (PST)
From: yehudis9982 <y0533159982@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	yehudis9982 <y0533159982@gmail.com>
Subject: [PATCH] staging: sm750fb: rename Bpp to bpp
Date: Mon,  2 Feb 2026 16:54:13 +0200
Message-ID: <20260202145413.132435-1-y0533159982@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the Bpp parameter to bpp to avoid CamelCase, as reported by
checkpatch.pl.

Signed-off-by: yehudis9982 <y0533159982@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 046b9282b..866b12c2a 100644
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
  * @dBase: Address of destination: offset in frame buffer
  * @dPitch: Pitch value of destination surface in BYTE
- * @Bpp: Color depth of destination surface
+ * @bpp: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
  * @dy: Starting y coordinate of destination surface
  * @width: width of rectangle in pixel value
@@ -149,7 +149,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int sBase, unsigned int sPitch,
 		      unsigned int sx, unsigned int sy,
 		      unsigned int dBase, unsigned int dPitch,
-		      unsigned int Bpp, unsigned int dx, unsigned int dy,
+		      unsigned int bpp, unsigned int dx, unsigned int dy,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2)
 {
@@ -249,9 +249,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * pixel values. Need Byte to pixel conversion.
 	 */
 	write_dpr(accel, DE_PITCH,
-		  ((dPitch / Bpp << DE_PITCH_DESTINATION_SHIFT) &
+		  ((dPitch / bpp << DE_PITCH_DESTINATION_SHIFT) &
 		   DE_PITCH_DESTINATION_MASK) |
-		  (sPitch / Bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
+		  (sPitch / bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
 
 	/*
 	 * Screen Window width in Pixels.
@@ -259,9 +259,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * for a given point.
 	 */
 	write_dpr(accel, DE_WINDOW_WIDTH,
-		  ((dPitch / Bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
+		  ((dPitch / bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
 		   DE_WINDOW_WIDTH_DST_MASK) |
-		  (sPitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
+		  (sPitch / bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
 
 	if (accel->de_wait() != 0)
 		return -1;
-- 
2.43.0

