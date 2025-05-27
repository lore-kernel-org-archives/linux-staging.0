Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4403280CCD
	for <linux-staging@lists.linux.dev>; Tue, 27 May 2025 17:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748365901; cv=none; b=q4tKkXD1BLUuyceIPCeewTm0CzcoCea6kCVPx03rosSonjUCSM2JqLewXrzM1QfGHLAfRqeovlMtZFezGbEi17IPySXY6Jy46y18oaspPsdRCkKV4owYo5hec0bTfUblWDKzDS4caeuYyvfudhAjWPxYX14ozn8vz6PV5OGkASs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748365901; c=relaxed/simple;
	bh=awIVsMJIo6c6lxHwbHS1OrLq4nbMwYCl5k5skXygSzA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ILXbddNreEDZFcdc3b1l/tOarDPBcOJG4/MMPvlITPIvEztYvluEtTmqXv+LdfoVBzyTXSd4LDLVP+DeVCOxM7Fr0hS49CuReuVhO8F6l3aJE9kruQlJO1HeXCnD7jXm/4qRCQUiaNn8so8bLGHO42lVuf+tTd33vNGonA2E0Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LFhx+/SZ; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LFhx+/SZ"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-74299055c3dso5295693b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 27 May 2025 10:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748365899; x=1748970699; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ErNNtp8tIhLsvXDOPpiWELLdI0K19IbrODKRiF2bcdE=;
        b=LFhx+/SZc/H/LbM6G+BcpOO9CojZsG/BRUDFY7dLJmPj4O8QTU4hS9PUTN4iBIm2eO
         NeAzb1mV9Tx3106hhVmv31bq0eQjNlUXkWN01wIUDmEB3uM1Kkgl67SQdwlDztEyu+Es
         opmDO9WK13ZDN5yoyY2KXCyUvOzWlZgEU6ZU5MWD09Da2tlG9NcVOlj2G1NcsCK53a5n
         uLti9osOzasybnmfu74MF9sTHGngq3X45aQmqs80BCDxV4NCDIPWCwz2+KVG33ynboTa
         NIH9Xk/fNOkamTTlK8MMYWyMU2JUmkumPWSQuxAp+H6v9ocNeTyWMTWcMBGuxFtYjuiw
         mRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748365899; x=1748970699;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ErNNtp8tIhLsvXDOPpiWELLdI0K19IbrODKRiF2bcdE=;
        b=HK4ZHEr42PMCX1OK5euE3V0VPl3uOaXxInVsuk2GfEkatYWCCWovbh9NzI2YbFy703
         fFN+ynqeo3N9Tuguy6dVjGd8fy5j4lJGYC4/5reAJYLSe+BkVR+RWMCPuIwt27UhDcKY
         VbU+3bIW72APVXyuvv0M0OkEMN8v2/kMWikMVdCTuX75lz6fjfMHEZhQ0h+jEKKZ5SNf
         Yi5UGtDR97SohZYJaeAc8R4ew4Zoh+wD0NsYP42fQmgIFjPtQLzwNJS6n+mS3KppvyF/
         F1l7D7Mjho3ZSJCPDNuxy5UU6LnByQvQ5N0q8IhDTBaoFOJQAIdFuNdhZ9AFC/fo/xxT
         8BpA==
X-Forwarded-Encrypted: i=1; AJvYcCW48ZYsf3FR6iCuxchZqwRYheNafLECbOLvdhil6KIGwnIApQvQg82mp4RpjPbOCzPcp3RU1kb2ZdcY16Zc@lists.linux.dev
X-Gm-Message-State: AOJu0YzhDt8lZYZqr+kaggfBuKhVzbTV5LOS3B69V2i+DvA7Z/HArxj5
	dlAQ1Zu9+b9eP1ZCne3tETyG9YMjoT7QxuwylFF5B35Hz2APrkO4MkTbmIhbB3d/ehYjTUNGnB8
	mWQArXrBnI5Dc7Cw+ItYn3A==
X-Google-Smtp-Source: AGHT+IGxxnavX2uarCvCpcN0vhOLeB1NeqH4YORXOSXY3TONJqbGtIy/9hCvgy9XqCYcmWLwyURiyZ3IyPKV3G2i
X-Received: from pfwp49.prod.google.com ([2002:a05:6a00:26f1:b0:746:25af:51c4])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3a1e:b0:736:43d6:f008 with SMTP id d2e1a72fcca58-745fdf77ab7mr21271166b3a.12.1748365899010;
 Tue, 27 May 2025 10:11:39 -0700 (PDT)
Date: Tue, 27 May 2025 10:11:27 -0700
In-Reply-To: <cover.1748365488.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1748365488.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <5f9c28d0dc0f48151837f11d5f6e7b82f84978ef.1748365488.git.ericflorin@google.com>
Subject: [PATCH 5/6] staging: sm750fb: rename `Bpp` parameter
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename `Bpp` to `bpp` in `sm750_hw_copyarea` to conform with kernel
style guidelines.

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index ea64e10d4814..a34d8f6a033d 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -138,7 +138,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * @sy: Starting y coordinate of source surface
  * @d_base: Address of destination: offset in frame buffer
  * @d_pitch: Pitch value of destination surface in BYTE
- * @Bpp: Color depth of destination surface
+ * @bpp: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
  * @dy: Starting y coordinate of destination surface
  * @width: width of rectangle in pixel value
@@ -149,7 +149,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int s_base, unsigned int s_pitch,
 		      unsigned int sx, unsigned int sy,
 		      unsigned int d_base, unsigned int d_pitch,
-		      unsigned int Bpp, unsigned int dx, unsigned int dy,
+		      unsigned int bpp, unsigned int dx, unsigned int dy,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2)
 {
@@ -249,9 +249,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * pixel values. Need Byte to pixel conversion.
 	 */
 	write_dpr(accel, DE_PITCH,
-		  ((d_pitch / Bpp << DE_PITCH_DESTINATION_SHIFT) &
+		  ((d_pitch / bpp << DE_PITCH_DESTINATION_SHIFT) &
 		   DE_PITCH_DESTINATION_MASK) |
-		  (s_pitch / Bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
+		  (s_pitch / bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
 
 	/*
 	 * Screen Window width in Pixels.
@@ -259,9 +259,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * for a given point.
 	 */
 	write_dpr(accel, DE_WINDOW_WIDTH,
-		  ((d_pitch / Bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
+		  ((d_pitch / bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
 		   DE_WINDOW_WIDTH_DST_MASK) |
-		  (s_pitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
+		  (s_pitch / bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
 
 	if (accel->de_wait() != 0)
 		return -1;
-- 
2.49.0.1151.ga128411c76-goog

