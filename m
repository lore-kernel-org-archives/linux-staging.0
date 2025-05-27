Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0155027FD4A
	for <linux-staging@lists.linux.dev>; Tue, 27 May 2025 17:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748365896; cv=none; b=EQOs0+3S6FVK0O86u/5OpPJS6GKI9GAqnnaHOaoIICSdqdDlwGrRYBDDJc3Z3YYAc4Ax3rTpfvoE5HN4DROPwM8Kmo95FUHHTEaBptW4FvG0Tp3Qiyw962uT5AaW/+jX7tA9cU/msagOGGAJm/B8foFx4ZyT8cr8ck8FNSa/TW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748365896; c=relaxed/simple;
	bh=H4TqEXIjlqRG2Bie9YYiQ3GcjAC/tlMYkOyueCKVWnI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X0L+KBCyTjzghqAW4ceEeaUrDnohTej7jwA9r/pM62Td9HR7IIufg2Pi4RwXNLImp2pwaV5ydjCWf95PtRo8sq/kwdOTl7layBPN4ICo7/YntjvPFeoAQqZbPZklw1jYoOas7S6IosvOZzvZYnqTeNJ9TsCef6/CPulM6OYajE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nurj74aT; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nurj74aT"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-23415056f5bso41400505ad.3
        for <linux-staging@lists.linux.dev>; Tue, 27 May 2025 10:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748365894; x=1748970694; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ngriwog0WV6bwjlrawORboMmBAKwg+7ahv2Ua2MbkWI=;
        b=Nurj74aThmiKB9FOf5lkiIu1YQf60Ltnpb9hBWcIfgt77uY5MCSszwur7yP7pvcnTI
         UnEpamalk7eylFdNE3kRDdZfY0BkwOR3KnVZ14rAmIMAmRV3lT14YFkaGdbCbLvXM2YO
         PKaHNNG7opr9Ok9ni/b+qTkyYe8E+5S57mWyKaJdXzx5QsiqYv8x54hPtV5XIBkhXqdN
         Lrdb8CzzfUSKtly99g+PVakdR9U9KGVyoZhs8KVOLeRghexhRTSpZgPdJCamo/wkLKOF
         0uunEoWC04CNIwTLEjLyN7UJ/oVZi8r4kttlwX2FnYmSuX77aEly9rGBUlDP/WUH6niW
         7wQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748365894; x=1748970694;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ngriwog0WV6bwjlrawORboMmBAKwg+7ahv2Ua2MbkWI=;
        b=WpfJyLAKUtmW1aCI3vjPf5jF9ESUv+wnMWHK1Q2ot4CtfY7MkaEk4EiySDCB5f5P/h
         /hTLmK1MvEXk7k5K1G9fWcSOdJ6LhwBTT+aRGFdpTLmwzTRY9euIgm7H2aBrcGSlMLTa
         6T7aMZLX5upUHdmJaRa/9lmF0RAVl6FwRopksyLOAU8OWQSqm1Kvd7EW9st/zwNhwOy7
         cMalbY4mRbQlOi2XJpCvRzukdSBWdqa89aLo6xfj2c/Umb/KM04xjWQFIWFnQjio4JzJ
         E5GD8YvqEZCnsb/Zx54nZXN3v8HcGbmXqIQyRPxQXuGJldRMT5SONPpct6XdR/lyuHJp
         JOUw==
X-Forwarded-Encrypted: i=1; AJvYcCWwd5ovInfn3EXrSowmvirThYdAyzQ/XM9Tk6imALdrXMD9+yQkS5wejrkJAX+PAoKlDEORLHLqq22sPx9H@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5QiIe3TxolKhm7fC/ZscQ0NXF0DstAhQdMX65pcCUN9UaeCFp
	XxXVKm42qwaTX+7yAtzVf4qgP7cNRWU2lwrd4UqvpvzeehGowWSWY08wjtvICWcGOfcvIDFtp8D
	tpJhBiqUdrsEBgZXVucfFgw==
X-Google-Smtp-Source: AGHT+IEy6fu/76cZYpGjBrmomtCPA6OCWfT7RStBFgB/RS+SDT6QPi765w8a04wj7CvCDq5hZHQLy60AW5Fn7wpF
X-Received: from plos6.prod.google.com ([2002:a17:903:1ac6:b0:223:690d:fd84])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:19e3:b0:224:1781:a947 with SMTP id d9443c01a7336-23414f5ccb5mr235064785ad.21.1748365894466;
 Tue, 27 May 2025 10:11:34 -0700 (PDT)
Date: Tue, 27 May 2025 10:11:24 -0700
In-Reply-To: <cover.1748365488.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1748365488.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <0ee15444dc0f9430b1c7836c565e305b6dab823a.1748365488.git.ericflorin@google.com>
Subject: [PATCH 2/6] staging: sm750fb: rename `sPitch` parameter
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename `sPitch` to `s_pitch` in `sm750_hw_copyarea` to conform with
kernel style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <sPitch>

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 74e4be8103ac..029f5c013d91 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -133,7 +133,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * sm750_hw_copyarea
  * @accel: Acceleration device data
  * @s_base: Address of source: offset in frame buffer
- * @sPitch: Pitch value of source surface in BYTE
+ * @s_pitch: Pitch value of source surface in BYTE
  * @sx: Starting x coordinate of source surface
  * @sy: Starting y coordinate of source surface
  * @dBase: Address of destination: offset in frame buffer
@@ -146,7 +146,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * @rop2: ROP value
  */
 int sm750_hw_copyarea(struct lynx_accel *accel,
-		      unsigned int s_base, unsigned int sPitch,
+		      unsigned int s_base, unsigned int s_pitch,
 		      unsigned int sx, unsigned int sy,
 		      unsigned int dBase, unsigned int dPitch,
 		      unsigned int Bpp, unsigned int dx, unsigned int dy,
@@ -160,7 +160,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	de_ctrl = 0;
 
 	/* If source and destination are the same surface, need to check for overlay cases */
-	if (s_base == dBase && sPitch == dPitch) {
+	if (s_base == dBase && s_pitch == dPitch) {
 		/* Determine direction of operation */
 		if (sy < dy) {
 			/*  +----------+
@@ -251,7 +251,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	write_dpr(accel, DE_PITCH,
 		  ((dPitch / Bpp << DE_PITCH_DESTINATION_SHIFT) &
 		   DE_PITCH_DESTINATION_MASK) |
-		  (sPitch / Bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
+		  (s_pitch / Bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
 
 	/*
 	 * Screen Window width in Pixels.
@@ -261,7 +261,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	write_dpr(accel, DE_WINDOW_WIDTH,
 		  ((dPitch / Bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
 		   DE_WINDOW_WIDTH_DST_MASK) |
-		  (sPitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
+		  (s_pitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
 
 	if (accel->de_wait() != 0)
 		return -1;
-- 
2.49.0.1151.ga128411c76-goog

