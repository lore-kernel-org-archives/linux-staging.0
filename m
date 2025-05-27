Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B6F280301
	for <linux-staging@lists.linux.dev>; Tue, 27 May 2025 17:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748365898; cv=none; b=WhqYdHkT4d8KxYwjGPYF8hWe4crLMqk6lwYV8mGag37z+AyratF9e9Ag/mgbzAsfekRznSS2PsUVNkVU/3gknl/WpE2l2pJnDngXHJ+oX8azT9H6MGLwQtZWnVsLmSbBoOLBuBiobpFAjUTvC+nmdI9wGC2Ivy/oqf6j2bhiL+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748365898; c=relaxed/simple;
	bh=IxmY7857XxRCML+mmmkccQP5aewturlw2/qLm8OGYQY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S2i0hAEfsc7JppUA3DJiioe4IyzqltRBCXlJHZfWA2AyNBH08bk88L6qftc0ThivitGqi2C8zKbfdOd6ju7CVaQud363i3nKcN3KX0VJgg418nHyP8mccRAoYwnX1HA6M3czG9dUk/65oGEdblzTW0X0g7WadeZ6x+Xrwy3ucH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sBHxZOZs; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sBHxZOZs"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7398d70abbfso5184482b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 27 May 2025 10:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748365896; x=1748970696; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pdqg5XvDH208k/LZjDauOKrmgmkkgqZoXO6mZxQvsJE=;
        b=sBHxZOZsaZx4nvzPvVW1yrt6Cy5V7oU2fKMh3OKRJmPTXoOl+HOaEisizuKtXNdYNn
         1QYdWXW/E/f13hhvdOvMhh+abTDuJt0xr4alJB4BDqMZsNn8z/xKlLf+mVi8DPtmhsFE
         nU1p3TCOqvTY21My9FVUPHRRla9C0eexyxidp6qM49J5waA6vQ2Ll+GEof5y4Jcqk6Il
         lbSxYB8pTssYiADM7P+Zv5BEx/hgUUBmOPCZRJplukOoQkQSPFoVs+Rr4VDJaOP2mD55
         oLWblfp0FPglR3T56b56woFccGLkZwkhAs124OQ5hA+dUiwln9mw7+ypltr1ta16ItyT
         PlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748365896; x=1748970696;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pdqg5XvDH208k/LZjDauOKrmgmkkgqZoXO6mZxQvsJE=;
        b=O/opdLXqmNfLVzQ2e3pti2SJh73wbSVnTMzaQ+V2ODvUiqIDPz51Nr7++TKfiF37+J
         QTEEKqlw+TWtKawr8zvXWMIerx0/3UTgncHNe+EKYBhtGEcKvPlkO2/4U9wmkwsmTcmA
         RNLNfzCgvyhh0SXwkBRq4YSlTDRPqURkw3AfQVQSVnYMEQ6GPjn4kP5L5OT+qmRK/sg5
         +q9LsYnaWPi6/zIbb9JOt5ZaBN6+sNRsf3BPrF69kb03fcx9fICOD6X5fdLlk2kdnzhT
         6ZQy9wJnOhC+wYBquz+kQY2Y/pmMvUgnE2aygzsB1zT+fW/MzHqpdIk0EVggCStHZeFI
         vUNA==
X-Forwarded-Encrypted: i=1; AJvYcCXQepu8i+t1eVR6LVTqlljkp8we/UKk9h2YqNa31qcGz77GwE5cfGGyfQMMIlqVSO4Zdm7maQjhQ49mnyFP@lists.linux.dev
X-Gm-Message-State: AOJu0YyvA3X3aBerLKv7WiBWk4h95955cOe8kkbNJqhq2//4rbbmqDXU
	jnvOFa5nSMn7+VsfTb//EiBkdCTmxRTfxPSLx6fMZDAtjh2SP+hF28Y3QEmRVXKKx01MmQ1yyat
	4mvrjI/vt0AIyoaMBCuhu1Q==
X-Google-Smtp-Source: AGHT+IH5+jOjV6AZnNuwMZ9fasseQwb0SSCynSsK1tPRGYJuml66W1Zl/d64TGz0CjCDJYTLB9X2dGkAoxI8hH/Q
X-Received: from pfbim3.prod.google.com ([2002:a05:6a00:8d83:b0:746:3185:144e])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1149:b0:73d:b1ff:c758 with SMTP id d2e1a72fcca58-745fe0515b7mr22869683b3a.18.1748365895953;
 Tue, 27 May 2025 10:11:35 -0700 (PDT)
Date: Tue, 27 May 2025 10:11:25 -0700
In-Reply-To: <cover.1748365488.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1748365488.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <b46e54ed9006f7a5b4439b8d4bb1fc36bd9c3ca0.1748365488.git.ericflorin@google.com>
Subject: [PATCH 3/6] staging: sm750fb: rename `dBase` parameter
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename `dBase` to `d_base` in `sm750_hw_copyarea` to conform with kernel
style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <dBase>

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 029f5c013d91..e5f1f021768b 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -136,7 +136,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * @s_pitch: Pitch value of source surface in BYTE
  * @sx: Starting x coordinate of source surface
  * @sy: Starting y coordinate of source surface
- * @dBase: Address of destination: offset in frame buffer
+ * @d_base: Address of destination: offset in frame buffer
  * @dPitch: Pitch value of destination surface in BYTE
  * @Bpp: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
@@ -148,7 +148,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int s_base, unsigned int s_pitch,
 		      unsigned int sx, unsigned int sy,
-		      unsigned int dBase, unsigned int dPitch,
+		      unsigned int d_base, unsigned int dPitch,
 		      unsigned int Bpp, unsigned int dx, unsigned int dy,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2)
@@ -160,7 +160,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	de_ctrl = 0;
 
 	/* If source and destination are the same surface, need to check for overlay cases */
-	if (s_base == dBase && s_pitch == dPitch) {
+	if (s_base == d_base && s_pitch == dPitch) {
 		/* Determine direction of operation */
 		if (sy < dy) {
 			/*  +----------+
@@ -241,7 +241,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * It is an address offset (128 bit aligned)
 	 * from the beginning of frame buffer.
 	 */
-	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, dBase); /* dpr44 */
+	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, d_base); /* dpr44 */
 
 	/*
 	 * Program pitch (distance between the 1st points of two adjacent lines).
-- 
2.49.0.1151.ga128411c76-goog

