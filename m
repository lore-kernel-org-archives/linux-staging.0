Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B63727D776
	for <linux-staging@lists.linux.dev>; Tue, 27 May 2025 17:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748365896; cv=none; b=axoRvykrr0Lbgpi5OxNSnf4iTEksn5VBifS92S819EDdA8msKHYCszk/8QcEl5LA3ASmhhF3ZTnhnwxTCLRxIXyZTRbc3zviCT90GRnT06V2OOm6zIWbDbMBPZ7uDQCQx6FZAsCPQuKisIQiJOydjVtQmSsWxAKNsZHUpyBUCJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748365896; c=relaxed/simple;
	bh=xRMf5TFiD3IukzwA+3BGS+BrEX4qd2fgpFwrTPSzcOY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=vACwnDdr8tP1p0KM08P4kt3BLXaNmcuiDXgHSgfm3FxZbb53ZOLEdizeBrNJbm0l0Bvmw6jWuEzLtE3duo0HmSvcrwpqsp1dIEEfe7pXcXM08QZAJmkgGwsI0C9GCV0Je+UkdYQ0tiqrAdKIYFefBtey5yTZET1gL7OxjhkkK70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DWAnfoCs; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DWAnfoCs"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af59547f55bso2101065a12.0
        for <linux-staging@lists.linux.dev>; Tue, 27 May 2025 10:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748365893; x=1748970693; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EGpgHQv1Yjhu2NBPNLoBAvCrufXEESK7KYUZZgAiZNA=;
        b=DWAnfoCs4QtBhgLitv4tuwG0w8dcknY4+u0g6XvaoINTnq6S6pqB2Shr7+jO4f3Rc5
         oSXvYsWp+YnnPTQLiX5zKOyBlRbW5sfTXnc7AppufzCrH7/Ta1Lv+bEDyFkv2+wPZJJ0
         tujy1NZAGiBfPgLRbAn46utMnEEila7JuWVWt3DTAVABBEXZr2wWRXpphlmqinC+oYht
         QvC0u3ODos8Ut5Hhf/hS7tMfRusq5u0heMQOomNhtIeDy9iMj+9XAelnUNkbtSrUp6Px
         qskdMzZkOasWk7riI3xSiYphn6g5b24t3JIl6xp7h8ip4rtvre+NJruxn4qHqQE0k/oL
         Qf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748365893; x=1748970693;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EGpgHQv1Yjhu2NBPNLoBAvCrufXEESK7KYUZZgAiZNA=;
        b=Tly7TsVgV/zf6jqULirQ+T6BtwboC/95V/BFmzg77shUAAL8SORCYig6U7ZjU41MRA
         5yucHJ5BxKwNRi6N8QBTP+cbeUbgeHyMbdf5Stn2YeAl8u3q5UDQO//6B2ROJl/uuMgO
         25NGMXUaDTFJX8axB1euMd7GV6+iacO7I6wwdlU9KHhyo52xHBaaa7/0XyLSxSboDAru
         N7KMEAeJm3+d/MkwwxWYHQi8mZCK0hmufBmw4NBOxanL52e688xFulK9I2kxe9KsMv0g
         bvXQXb8HdsdDG7O1WABz32vLTF2IbMTEmDoY8gx/4AXKGE4irJ8g0ao2pfnlDrJlOyF2
         JXaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhwCoLAqtwSy/NTVLK2qwi67TLHnZKYiL0RpIRkrC7wSHc6bT/+WXxKJ4FsE7o/gduo9dtPnJ+9R3TBVug@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7pV8oHW2n4y03x4KJXqHXNVlOvOm/L3TholDmoXpqXrXM66Nk
	0jWo7dpbzSl52eRznTomneOEPS//B485IHQ4ztp301ZhNxPwqeStd9AJ5EltOmvjQgynSowga82
	y1GaRq1bUmFhURBgpWdYTrw==
X-Google-Smtp-Source: AGHT+IE3WTlFx1duweMWUtRWUZ+stTGECKFWb4JdL2WHNP9bk0YeoZVjs0fdXgZHMKS+hrjElIbb6qMFX7sMB52f
X-Received: from plbld15.prod.google.com ([2002:a17:902:facf:b0:234:1b84:9778])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3d0e:b0:22e:59cc:a44e with SMTP id d9443c01a7336-23414fce054mr185474395ad.44.1748365892870;
 Tue, 27 May 2025 10:11:32 -0700 (PDT)
Date: Tue, 27 May 2025 10:11:23 -0700
In-Reply-To: <cover.1748365488.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1748365488.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <61e6984331cc7ff88a9f8207e187cd5b9ffd9c63.1748365488.git.ericflorin@google.com>
Subject: [PATCH 1/6] staging: sm750fb: rename `sBase` parameter
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename `sBase` to `s_base` in `sm750_hw_copyarea` to conform with style
guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <sBase>

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 44b9e3fe3a41..74e4be8103ac 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -132,7 +132,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 /**
  * sm750_hw_copyarea
  * @accel: Acceleration device data
- * @sBase: Address of source: offset in frame buffer
+ * @s_base: Address of source: offset in frame buffer
  * @sPitch: Pitch value of source surface in BYTE
  * @sx: Starting x coordinate of source surface
  * @sy: Starting y coordinate of source surface
@@ -146,7 +146,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * @rop2: ROP value
  */
 int sm750_hw_copyarea(struct lynx_accel *accel,
-		      unsigned int sBase, unsigned int sPitch,
+		      unsigned int s_base, unsigned int sPitch,
 		      unsigned int sx, unsigned int sy,
 		      unsigned int dBase, unsigned int dPitch,
 		      unsigned int Bpp, unsigned int dx, unsigned int dy,
@@ -160,7 +160,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	de_ctrl = 0;
 
 	/* If source and destination are the same surface, need to check for overlay cases */
-	if (sBase == dBase && sPitch == dPitch) {
+	if (s_base == dBase && sPitch == dPitch) {
 		/* Determine direction of operation */
 		if (sy < dy) {
 			/*  +----------+
@@ -234,7 +234,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * It is an address offset (128 bit aligned)
 	 * from the beginning of frame buffer.
 	 */
-	write_dpr(accel, DE_WINDOW_SOURCE_BASE, sBase); /* dpr40 */
+	write_dpr(accel, DE_WINDOW_SOURCE_BASE, s_base); /* dpr40 */
 
 	/*
 	 * 2D Destination Base.
-- 
2.49.0.1151.ga128411c76-goog

