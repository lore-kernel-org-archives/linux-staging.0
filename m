Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1518722423A
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 13:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779023980; cv=none; b=DNf5BmKq03aA4kK7Yw4B+rB1/9Dl6nNHFY29LPRnZVgZnrgFoMn8DkB1Ts70lu6sav0DHaERZLd8x00NIB8QzHnwXK76zMdI688pj9D1Q/K/Xjl63TALKQyihu+oYABEiI7kDekNGbpHjHvhu282kWiIMq2m9msGMc4WfJ7NY8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779023980; c=relaxed/simple;
	bh=jruy9C0+DAnIeXUwqu79F+yBCJJKuZ1rEfyvwUris4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qRKqamc1PmjwArVR7GSd/BYb0tGTAX+opXUz3oU9A9wMFkCtETWeDBTOw03UMUHPCCalJ8JuSjky5cgC2jYhvVywXoGZB+8D5Ac7jIDrtLMQzPCq2wtycgeeD1jES7wKxHKxgzZ1GBnnQdb+8ucEnsjQTABo2pY7h7BBdrTKCd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VyBaqe8m; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VyBaqe8m"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa1b2327c8so796345e87.0
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 06:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779023974; x=1779628774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7/dqCYjDfAnPwhsU6wCw9vMKNTZiUIqNFGfHG4kAM7s=;
        b=VyBaqe8mZLWCcOBj6N+mS9hPh84K0bFfpCnZSycMDGI1cDGt9iPCHxgNI+OkOEPWeS
         J49JJUxZkw+zx1/jtb1nEcUOvk0wuHKkVhaJ9UYL0umr9T+rN+nE6x3Dc4dS6Lo3UtaO
         3TSdLoJy+qx6250m8c5C5IQlaxojqUDBefEoPjiGgPWeiZI/QZAjrZcA0KLtZPTG/Nel
         jkMn5VP1NJ/cjaViC75CS3ege9mhIFhX4w3aDydeSKq8KmSf0Yn6MKDsMQ3rxmWWoS0d
         eFBytXPt60YqVfsV4+rGAYMv9agO06hP75ITKq1ckLl95h8nwGcXGy683UGAi3/IRI11
         aNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779023974; x=1779628774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/dqCYjDfAnPwhsU6wCw9vMKNTZiUIqNFGfHG4kAM7s=;
        b=lAHsQvsgo9tb/4a1YdOSDoa8szzHz+sP/8bBnAm+C7hGIXNp8pi8Y17nThhonVYgsC
         B2BzROgGlzFpvzwP0OGINkV9/k2a0zkEcQOBMRzH0KO5DYHMwAeMoAqPnvab/31eXjR6
         44rdsAAnlG7pNM4pZrimmT8tf9YO3S7OmZpGKnykepkc9LBwqCMsu4zDAjm32v/AB72f
         LFI0+HLXC8S6qbwouxw+TdbA/neyykC2Fscl78jAHiB1uCrV4gsYr1+Pf6fSoTzwVHUZ
         br2vR1y8b/qOMBpRqpyw/tbfM6loREZFp2uab4KjHtuWRAaQMX7Va2DbCrbyc5pDh/8n
         ubkg==
X-Forwarded-Encrypted: i=1; AFNElJ922NDuNAy6+0fNGTHvAvkLbyLzVWYkW8T/hx607cA+bkkS7dhP0ypD8HAMBmrhKCTF6vSo6CabXtUgqGIT@lists.linux.dev
X-Gm-Message-State: AOJu0Yze6K6r0MVhrlaAa5YIogvMY+FjJAMCu7e9rAOwbkOtzLnLkQqK
	vXRKr1uo/oXhJj/DEZr/Qq1eMZrHP9hOAlzwp6PaFIxFzI7WYhz1LaVV
X-Gm-Gg: Acq92OEpEZt/YSTrx1aVF0B3si1tPFkRShSdmQRU9jhyZ08bP7qyORW4cGgHOhlK8uA
	0Ni7F3JtXNkbS80j8KDjUOTdrJ23EJsWXIcDvR3FfQB3ibv63eP3rXT/2pe4HEMd8OhgnLswS43
	QVfHjElg8G1J61ZU6YAFkBmngnvyyNRVL9gRd0dAg9KysC6K11VT2nBtFNeumxZKgil3LVrCP2a
	tlz5EPnQlPCiFV/0L3y4KaMiMNfXl3nhzg7zzcFXCCJaGHdZOlEr7JXv2vGHOK0RnIx9fEvVPTZ
	tk/9+exxNKa2XAzLMKBdPaOoWyZFNE8+U8IBUpTW6wmaV4ZVgmu6HjaTZnfo+0wWn9qgrJ6BOGm
	Nu2t3yTcMo8gE4jsDiPkde9CGDpHBV1lWWuiix471UxLyGQjQuVovtPqeXMLS/VPKc4tNhZYPfT
	hBNiXFIkyZQEirKW4n5SCZ7dEH0YLWlm5fuKJeuZqnsAKxuulR+B/TJ/ZxlbaOlK9xAFXhSaSoc
	w9ghzv6/tLKSWaCpv+CQaheyjsND2RGoQ==
X-Received: by 2002:a05:6512:1321:b0:5a4:1a2:1d39 with SMTP id 2adb3069b0e04-5aa0e5ffab1mr2864465e87.6.1779023973716;
        Sun, 17 May 2026 06:19:33 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc440sm2686166e87.51.2026.05.17.06.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 06:19:32 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH] staging: sm750: rename CamelCase variable Bpp to bpp
Date: Sun, 17 May 2026 16:19:18 +0300
Message-ID: <20260517131918.197943-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the CamelCase variable 'Bpp' to 'bpp' in both the header
and implementation files to comply with Linux kernel coding style.

Issue found by checkpatch.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 22 +++++++++++-----------
 drivers/staging/sm750fb/sm750_accel.h |  6 +++---
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index ec2f0a6aa57d..59449a84728a 100644
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
@@ -103,14 +103,14 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 
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
 
@@ -139,7 +139,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * @sy: Starting y coordinate of source surface
  * @dest_base: Address of destination: offset in frame buffer
  * @dest_pitch: Pitch value of destination surface in BYTE
- * @Bpp: Color depth of destination surface
+ * @bpp: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
  * @dy: Starting y coordinate of destination surface
  * @width: width of rectangle in pixel value
@@ -150,7 +150,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int source_base, unsigned int source_pitch,
 		      unsigned int sx, unsigned int sy,
 		      unsigned int dest_base, unsigned int dest_pitch,
-		      unsigned int Bpp, unsigned int dx, unsigned int dy,
+		      unsigned int bpp, unsigned int dx, unsigned int dy,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2)
 {
@@ -251,9 +251,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
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
@@ -261,9 +261,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * for a given point.
 	 */
 	write_dpr(accel, DE_WINDOW_WIDTH,
-		  ((dest_pitch / Bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
+		  ((dest_pitch / bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
 		   DE_WINDOW_WIDTH_DST_MASK) |
-		  (source_pitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
+		  (source_pitch / bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
 
 	ret = accel->de_wait();
 	if (ret)
diff --git a/drivers/staging/sm750fb/sm750_accel.h b/drivers/staging/sm750fb/sm750_accel.h
index 2c79cb730a0a..d15a40cacb84 100644
--- a/drivers/staging/sm750fb/sm750_accel.h
+++ b/drivers/staging/sm750fb/sm750_accel.h
@@ -190,7 +190,7 @@ void sm750_hw_set2dformat(struct lynx_accel *accel, int fmt);
 void sm750_hw_de_init(struct lynx_accel *accel);
 
 int sm750_hw_fillrect(struct lynx_accel *accel,
-		      u32 base, u32 pitch, u32 Bpp,
+		      u32 base, u32 pitch, u32 bpp,
 		      u32 x, u32 y, u32 width, u32 height,
 		      u32 color, u32 rop);
 
@@ -202,7 +202,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * @sy: Starting y coordinate of source surface
  * @dBase: Address of destination: offset in frame buffer
  * @dPitch: Pitch value of destination surface in BYTE
- * @Bpp: Color depth of destination surface
+ * @bpp: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
  * @dy: Starting y coordinate of destination surface
  * @width: width of rectangle in pixel value
@@ -213,7 +213,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int sBase, unsigned int sPitch,
 		      unsigned int sx, unsigned int sy,
 		      unsigned int dBase, unsigned int dPitch,
-		      unsigned int Bpp, unsigned int dx, unsigned int dy,
+		      unsigned int bpp, unsigned int dx, unsigned int dy,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2);
 
-- 
2.43.0

