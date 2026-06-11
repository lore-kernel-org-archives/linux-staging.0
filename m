Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2BC3CCFC4
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 10:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174293; cv=none; b=f98CsQgoVRSGQzWXELYgd86wfKCFWq0nsrxyEv69raU86OlN6ED5C60yeGHouRia119NZ48ebzI2b8YgqcNtjYUmxrc2KT2AvWSNn60Xt7ofFbCaUVcey9N2D2Ue+UbSxZMWRdFbNO2vkjgq1JTKVS9Wwz2nnfSXBMo/L6OMxIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174293; c=relaxed/simple;
	bh=E51J4T0xJ69/fphhlgw/2kq+lZqHpHqe+c+Vg/cpgoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hUfGE5u70KdTUZDwWNpzJpeDnTihewm6SYx0COZ690s9PF/bpWPjKzx2Wa9HZAWSKKJ16IfxUacKTlzcWFoiX4Ixj5Z54/caLFWpjncxoh16IyDBOt/sYQV+ossuR3YU3eit0GQkUEnzCRAYjV9qN0HIZKGrDgZUeZWKyRdnBos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxzWO83L; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxzWO83L"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so5209879a91.1
        for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 03:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781174291; x=1781779091; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1RMANRuTG+F/Bx/ZEnnvybJMzkG0+xiu8ZbbDHlOBqs=;
        b=gxzWO83LQQPVP/FgrHdpFYEjGVQSRP1huP7KeK5wcf9jjHQwpeQvRHh7eikyXMVj92
         hctTHzGSecgCQeAR6Zy2rhu9BbYiC7oRzC4HNPgHcy4kNZnR8D/9vdqhZPpNWnLTlk9C
         +TlXi5dPMDbSxzCUASl051el8ZUXnQtg9zucw0n4Hhgfiu37+qg/xKt9ITXDyMCWyDJe
         lhcLste3aCPtua4vPZkikMZCg8gqAG1cbNb/N560Dlee/mOfWAMNdpOiesXrCxC6lNBD
         S0bCQDmPL9eY3CwOL0EmjS9WAtugC9J8PizE3JMrIHndUYzZJE1MhZo5nfKOKkyZxx50
         Bt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781174291; x=1781779091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RMANRuTG+F/Bx/ZEnnvybJMzkG0+xiu8ZbbDHlOBqs=;
        b=W2QaijmH8Oug8++ApcfTf4xHDvv+UilusqfBz3zgGZKuUXjiGvGJjDKGFf6yTIXPB5
         HBiOXLTWzBUktKuVh9EtR3xA0EP9M7Znujj4EVoAlvbGYJju6EfQeiVUxQD2g88ydeVz
         6wdubGS3DZwynXbvHwlbzbOb2M0uftLBIArfKIYMrZRIiFbpGAHce7MUbeXR+Wbn1WPd
         9GhPKO1TomqcQ+x+kkpxSlgPCpg3oACl2tDt464NJp9yynJQvrOFtWJwUw417LmhSt/Q
         FaoKMPfyrv1/rKfjKlMLs5o2GuwQ6BCQor4q8Oxw4mpSkQCPJTMfXOTEvdkkJblR2BdZ
         QDVw==
X-Forwarded-Encrypted: i=1; AFNElJ+RBBDAHi1QzcSEJxr904s/IqAlJRGbdJvTasrdEFYhk63r5AgMBuZNxhL7Pb13QBfSAm5ejEMBdacy4UmK@lists.linux.dev
X-Gm-Message-State: AOJu0YwVaWJuGpzABrXk3zci8abVXpt28ELpau2nHUt+MhvydTb0ki/j
	V5zfeq50RZn4w1wnKSZDBbHAUoiAQf8EXZ46zrOU9po1F19JhjdWQrnK
X-Gm-Gg: Acq92OHPgyi7ZL+QH2T1hBRneXc+YmrOcd/giN2tCxwgjY8qje0RijSbq2xWtNPVNp2
	qFjfSrzvJ5A0+zxctTRzUBPG/kivktiLlUfJld8JsAk2WRx3JJb718JzZDADP07AsbG6gTOytmO
	GLIe/kqVHUoQagJY9XtNznGrZuV1IsNu/EjxBYHv0FVBw2BQNRH9ttWBEvEQzx5t+ETJvu9YcRi
	MMN+Q8NHUM+AGLftv/0mI3LvhPC3ClICm9wLm52PebsA4axeMO/VZ10F3wKgHreMItdUJrxU5er
	jRkc1peeNvrrRcyOX6DUYcjO4Qlyi6VulJWblhPSH+W8sy0pK2LvqM9c4K06sHU0wO0qq0l2iE8
	t9y6TRPfMkuzCFlnH7XvmAlUnRrf1NtB45eklqU5Un0/Qqyw5kl5QBX1FYeQ6dfPU1yoapubrKB
	DDeCR7uxXdrnnXzktuwxZAgD4EZjsSfLSk
X-Received: by 2002:a17:90b:4d81:b0:36d:81b3:61a1 with SMTP id 98e67ed59e1d1-3779d2d72e5mr2424749a91.7.1781174291203;
        Thu, 11 Jun 2026 03:38:11 -0700 (PDT)
Received: from 192.168.1.10 ([43.248.69.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377528719e0sm2648202a91.5.2026.06.11.03.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:38:10 -0700 (PDT)
From: Siddhesh Sable <ixebec777@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siddhesh Sable <ixebec777@gmail.com>
Subject: [PATCH] staging: sm750fb: fix CamelCase variable name Bpp to bpp
Date: Thu, 11 Jun 2026 16:07:48 +0530
Message-ID: <20260611103748.29584-1-ixebec777@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CamelCase variable names violate the kernel coding style guidelines.
Rename all occurrences of 'Bpp' to 'bpp' to fix checkpatch warnings.

Signed-off-by: Siddhesh Sable <ixebec777@gmail.com>
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

