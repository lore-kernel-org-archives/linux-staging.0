Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6162B3DDDDD
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 14:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745717; cv=none; b=R3IH/SI6zXxSwFUksaEsDb309ZbDLlgajD8zrZMV2fyx/eh2L94mTMKx9dj6NJDWYaikCWrZ+am6oO3ij8zLQebRLzT7Sdsyu57Eo8m0Ca4YW7mkNAwdsDAA5vBYv8xuJRebbLsJK8pBnb/PsCH8g5dI3r6uJENN6NqtlSdT3xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745717; c=relaxed/simple;
	bh=/3dzbTa2yCGGWKMPTi/jtaZM33hFKM0i5biBd97LBEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tl5oMAC/Jt3ytlZ6yTVMMetbTmix6cgNUlJ9Sgv6oLiIaq+++e7slOausAVGyYUXxVKWBBhTCiQJQLZlW0ffj4a5wIS4DJ4hYUQFXU4qhTed8pGqKgnY/t9Hfbb09xKMxmY//3PfhdzfGxCXDzghW8c46Z2dQOT4dOZw8PYGeY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HR1f3vcv; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HR1f3vcv"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-12c1fcce8f8so4676479c88.1
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 07:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775745716; x=1776350516; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIq2KvgyVuLp71772xYiI9sgjjf9n0iRtxnyZ0QmOTY=;
        b=HR1f3vcvG/RZkvcwu5EikZUzXjh5fsfv53mDLvGY9bFlm51YE1oKzt8NmZ17e3bbLr
         WHlqckVOff2qPfoxSsykqVU/1Di3bGpyMlB7ORAgFyXTWrHiyHzFr3pPFBRrWxaCvKIx
         R9/DBm6NpzyeaCHdg6dSFmJs1+/fvT2NKWLDkpC+LQSCD/40QPHKJPBBdvM+jH2UFyCd
         lUXy8OJQ16eztYgzdllKL493hNEv8YECMqZoMtfpX4x8VUPiTxlkBGQeDZvmQyQKJsbG
         LJedFYFyuMYJhydssD8yPaOljUNK6c3cz0rP8mNNEy0rHzDpcDMjxNKY80tE558VSzoM
         3Vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775745716; x=1776350516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cIq2KvgyVuLp71772xYiI9sgjjf9n0iRtxnyZ0QmOTY=;
        b=RhcWFsuxGN/LCvDFemH2OIsm7W6i5bTtP3Qd4vv0PY90z3JAl92yy4Or24HLtjP28X
         XsEC8iqPVv0rp/eSIvqTv/GcxJcj+oaWVBswXarfAINn+UDZkqvNrM6NXKHv3nOW31y/
         PMjl87z19fpIVCinxQuhjLQc2NdenIkoUdwvge8Kmqxj8wkDxYY4do0CPRhONLQpIlVq
         BPegCCQJMm/LDaAF/XOixJatxu4SMWLhWfrwOpDavVFOaqodNz0tvzqy/uQXuwsFP4aZ
         g6mvMXuxg4I2ut98OHDsQa6WMSGjt++eexzyf45x6L83z7cZ60oYRpJ0JDYQwXSx8mp9
         zJOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCNWmRM+z4QW9uewMbWyVslef3QwZvzUY+aACZ2/X6GhdO48nODzkZGoNvnLBRNEkBSjEFwIWb/+1TuCp7@lists.linux.dev
X-Gm-Message-State: AOJu0YzkJ1q0Dx0b2WB6CNr2ZIcvk779+Uv+D3XLyh5AAvan8Ic8wlNe
	ZDb9lJN1b6J1WfFEvQkOvUaSaFx7yiGBTYalA+xbdVVK0Ua09ju1o16u
X-Gm-Gg: AeBDieuo9jnxJOoH1vREkFPwn8E+s+2gBF2tqa1C8dz73SUb4N+YKJGo4aAUYHnJrP5
	E3jqXI+mYo8okMIL1XrX5dFuKnNz5vumGHCW+ik9nAYGoaIXQ99CMHqxIvpWzCpJpg18bzGD+RE
	u4nhCR5M6BYzg4kKzNDjieLbDF1YY5ehsui3MOxWZCoBh8zmiN2nud4nYtDrFcRqrwCjTamsYCA
	1FdOYmuph2IzPZzdAKM1EciKQW6rDdyojsS4KOz+R4TL7ciJo9ElJ51NbeT/1kZzTvz04rrKJ9W
	c22bh+STP+lpVwC85G2yX5rI9HXN1bxAcy/tMb+xjmCdQ8PYVHvzHqVe3iQc0WxCOA/iqHrAKXQ
	Vj/jbMACP1zKPawsjggWZZqB4l0Q/qRDIyGzJYZjzSAg6hH3JK/ulawtDPOI3FkXXDGBbrw+El2
	FuhWyptmnwkdvHsCacykC+YN9QVdi7CAfjucRXx0mbMfD7c+NGTTyOmrd7LtQTSApfAw==
X-Received: by 2002:a05:7022:ec14:b0:128:bae0:e03c with SMTP id a92af1059eb24-12bfb765c2emr15325531c88.30.1775745715490;
        Thu, 09 Apr 2026 07:41:55 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c07a8703esm20363284c88.8.2026.04.09.07.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 07:41:54 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 2/2] staging: sm750fb: propagate error codes from de_wait()
Date: Thu,  9 Apr 2026 14:41:19 +0000
Message-Id: <20260409144119.21500-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409144119.21500-1-dennylin0707@gmail.com>
References: <20260409144119.21500-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sm750 acceleration functions currently return -1 when
de_wait() fails, discarding the original error code.

Since de_wait() now returns proper errno values, propagate
the error code instead of returning -1.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 0f94d859e91c..891d12a5e2cc 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -90,14 +90,12 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 		      u32 color, u32 rop)
 {
 	u32 de_ctrl;
+	int ret;
 
-	if (accel->de_wait() != 0) {
-		/*
-		 * int time wait and always busy,seems hardware
-		 * got something error
-		 */
+	ret = accel->de_wait();
+	if (ret) {
 		pr_debug("De engine always busy\n");
-		return -1;
+		return ret;
 	}
 
 	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, base); /* dpr40 */
@@ -154,6 +152,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int rop2)
 {
 	unsigned int direction, de_ctrl;
+	int ret;
 
 	direction = LEFT_TO_RIGHT;
 	/* Direction of ROP2 operation: 1 = Left to Right, (-1) = Right to Left */
@@ -263,8 +262,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		   DE_WINDOW_WIDTH_DST_MASK) |
 		  (source_pitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
 
-	if (accel->de_wait() != 0)
-		return -1;
+	ret = accel->de_wait();
+	if (ret)
+		return ret;
 
 	write_dpr(accel, DE_SOURCE,
 		  ((sx << DE_SOURCE_X_K1_SHIFT) & DE_SOURCE_X_K1_MASK) |
@@ -326,14 +326,16 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *src_buf,
 	unsigned int de_ctrl = 0;
 	unsigned char remain[4];
 	int i, j;
+	int ret;
 
 	start_bit &= 7; /* Just make sure the start bit is within legal range */
 	bytes_per_scan = (width + start_bit + 7) / 8;
 	words_per_scan = bytes_per_scan & ~3;
 	bytes_remain = bytes_per_scan & 3;
 
-	if (accel->de_wait() != 0)
-		return -1;
+	ret = accel->de_wait();
+	if (ret)
+		return ret;
 
 	/*
 	 * 2D Source Base.
-- 
2.34.1

