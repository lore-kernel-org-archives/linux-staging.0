Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD852820C9
	for <linux-staging@lists.linux.dev>; Tue, 27 May 2025 17:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748365903; cv=none; b=L1GBihH+kWxpST8Cez/hNX5YY+ATDglINZ/W5pK9P7ZXzlOUpwxqNBGmvrJTdOYn2CVA6wZ9bLrx6cHRr/o1feyvZfzijOeeTa+nwX7Dx5K522/GMx3AMbpN9VGC1OhMEIyJhgmkWzb0xfc1sAcFBlkzK6r/6N2+f83OMbfpspk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748365903; c=relaxed/simple;
	bh=WRJHINpKvIzq+kAIFhHGh/uFlb6VeUjDetEZlCoYiZ4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l8Kh8n7uTR0xkLWfhhcKTXLXHvceuZc5dcEx9biMOiNPLuvRRV2lqcoVX/kFl+3A31eE9bhKl95IZ7XWEGhlxPs+bZGrcn2CknVrRqyJ7iNUYMeWznwhZoVkdp9as1So4b4XLAqWBUwOl0JfJi4dVIkwJeqo7zzjEwJBQxFnw0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EwKZnk6w; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EwKZnk6w"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-31147652b36so2675396a91.2
        for <linux-staging@lists.linux.dev>; Tue, 27 May 2025 10:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748365900; x=1748970700; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7pWVizCte/zfBc5wbZWXELXXuItPZZs1aoRgUlPPJRw=;
        b=EwKZnk6wmDSepQ+n90MtZmnnRD5US50vKff0TRDGadbz/htyTaEzRqQxBYQcgwU/sm
         z0lyAx90+mFyYMS6ZfVKscklPe2lMuIt+8hAyFoOjlMklXSBKselcQd2J6kdntjw7FdE
         jguAuCTZU+EYrKmtkUNXknvCEU0vqnD9gUeq2st3MaM4ADNr838I2Nk5iO2n6/Orrlhb
         ObnVa8Z2xTyu9VtABdHmMEazjMDJkbYI/BMZMTz0UZct3OME4HYW780Hkvw5MHpUuifs
         71mkl64ouCASxyt7RNSzNZ4pstJf7YJTavM5LU60AlG6QbJ+gupko6B5rqFgsBAqSxl3
         Q6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748365900; x=1748970700;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7pWVizCte/zfBc5wbZWXELXXuItPZZs1aoRgUlPPJRw=;
        b=FQzOTT2slulAr5qmdxhgUaB86DHH3wQv/brJddXaN1h2yJMwVfGzqHF5udKLxl03Mr
         H9VX9GCQ3YZzwqzZdvsFDrPf64Pf+FzuTuB+n3DTggqj6Qep6WAf28pj+VugGd2xU5p2
         0PpzuV9nufsUMm1+YAfIhZ5eZcHr/8lGSP1rMdogTum0rSkaoOFexH5Qfor30lw57B7t
         zT2bsmNCYIB02TYEdcvcvgSMnXpa8wIOQ6rRkkWD58YSVzuT+i1vxT2cKemcgVNrTH9W
         UfhFinLsLS7kAf09nHW3H/xLv9AO65oPSLGIR5BZUVrPXkLdUu34UOdPqpx7Mhv7Q2cC
         0rVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIWbE4e888WjGVALpdBsi12faRvLkjhy/piQyGZ4xAJKGMK+//2bROiNguq9HC4kVZtgfd6nO/JdqXZyD/@lists.linux.dev
X-Gm-Message-State: AOJu0YyY274ui+Tind7uPThOSUUSH174H1Cta27lQnPqEbhiCwwrNvhn
	6uUSExzE/rpEoCgW0na0v4WgAtpc7o9adRfvn6CbJ4NoIuHhtHPaS/GF08k27u+rWtzjSDD4KpQ
	42jomeaa4w0H5NGrMA2d/Pg==
X-Google-Smtp-Source: AGHT+IGco4V40TsVlohUm2gdWA+Dyi4GYATtBZ7Xwh96aBepziaL0EAKO0k6gcGCVwhfFEHtJ+i81GuM/G1Mo+NX
X-Received: from pjuj14.prod.google.com ([2002:a17:90a:d00e:b0:311:4201:4021])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:35cc:b0:2fc:a3b7:108e with SMTP id 98e67ed59e1d1-3110f33438emr22861081a91.4.1748365900271;
 Tue, 27 May 2025 10:11:40 -0700 (PDT)
Date: Tue, 27 May 2025 10:11:28 -0700
In-Reply-To: <cover.1748365488.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1748365488.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <f247ceee80387ece536aa5657f105321809470f1.1748365488.git.ericflorin@google.com>
Subject: [PATCH 6/6] staging: sm750fb: Rename local var `nDirection`
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename local variable `nDirection` to `n_direction` in
`sm750_hw_copyarea` to conform with kernel style guidelines as reported
by checkpatch.pl

CHECK: Avoid CamelCase: <nDirection>

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index a34d8f6a033d..b9f90c934b7d 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -153,9 +153,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2)
 {
-	unsigned int nDirection, de_ctrl;
+	unsigned int n_direction, de_ctrl;
 
-	nDirection = LEFT_TO_RIGHT;
+	n_direction = LEFT_TO_RIGHT;
 	/* Direction of ROP2 operation: 1 = Left to Right, (-1) = Right to Left */
 	de_ctrl = 0;
 
@@ -173,7 +173,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 			 *	+----------+
 			 */
 
-			nDirection = BOTTOM_TO_TOP;
+			n_direction = BOTTOM_TO_TOP;
 		} else if (sy > dy) {
 			/*  +----------+
 			 *  |D         |
@@ -185,7 +185,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 			 *	+----------+
 			 */
 
-			nDirection = TOP_TO_BOTTOM;
+			n_direction = TOP_TO_BOTTOM;
 		} else {
 			/* sy == dy */
 
@@ -198,7 +198,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 				 * +------+---+------+
 				 */
 
-				nDirection = RIGHT_TO_LEFT;
+				n_direction = RIGHT_TO_LEFT;
 			} else {
 			/* sx > dx */
 
@@ -210,12 +210,12 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 				 * +------+---+------+
 				 */
 
-				nDirection = LEFT_TO_RIGHT;
+				n_direction = LEFT_TO_RIGHT;
 			}
 		}
 	}
 
-	if ((nDirection == BOTTOM_TO_TOP) || (nDirection == RIGHT_TO_LEFT)) {
+	if ((n_direction == BOTTOM_TO_TOP) || (n_direction == RIGHT_TO_LEFT)) {
 		sx += width - 1;
 		sy += height - 1;
 		dx += width - 1;
@@ -277,7 +277,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		  (height & DE_DIMENSION_Y_ET_MASK)); /* dpr08 */
 
 	de_ctrl = (rop2 & DE_CONTROL_ROP_MASK) | DE_CONTROL_ROP_SELECT |
-		((nDirection == RIGHT_TO_LEFT) ? DE_CONTROL_DIRECTION : 0) |
+		((n_direction == RIGHT_TO_LEFT) ? DE_CONTROL_DIRECTION : 0) |
 		DE_CONTROL_COMMAND_BITBLT | DE_CONTROL_STATUS;
 	write_dpr(accel, DE_CONTROL, de_ctrl); /* dpr0c */
 
-- 
2.49.0.1151.ga128411c76-goog

