Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4F51EDA0F
	for <linux-staging@lists.linux.dev>; Mon, 29 Dec 2025 01:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766970561; cv=none; b=a/GFqmADJIzYFb2cQcvY06NdjlhJr3fxakDWKDg/DI86mr9uSWrQzKmZ1+OHiILl2zSBR+z3/53iXzXDeUhmeMBd2xA3NnhgYHXNqeVxv0JSPWuVBh6txg6IuIyYCALJkWpOY5UVm/M6Q3zPn0NggKTKeYTOXO5WxyRiq0hZ0xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766970561; c=relaxed/simple;
	bh=rrpllWC8bDC5bI71gounAjuzzkVcsC0COvFxACH4G8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QmcFZhiE8dtH4TykpKhu7RacOAUlVqoaGCMSswUhygk4zOKdt4SbS/huegbobM83hYSEDPpFHVwJ68JzcTkGkcnZw4hBpUTfM5hKVOKpXJO/nsCy4J9bq2QW9u2A73LsT3UkdRbTCpEuOnfu8ggX0P5Xk7YffnnAv0bPBWHotbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpxLMyfE; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpxLMyfE"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-477aa218f20so51207615e9.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Dec 2025 17:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766970558; x=1767575358; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5dW38RDm9ae1+68aq0l8C8yBQB4OMEKFfYFCgP2bm/4=;
        b=bpxLMyfE2h8uk2/yQGFRJwHvS2jHLQM3zYBipf1SZxiWXzJP1COx1iTzdxQTccCILy
         V0WzYqg1Wa7Oy5h59iZ5JvvpDGNqvIJ5nr615q5PYHe734bhPnC4Mf3WpgcV868DNqI2
         GR7qF63Yk5GXy6DtzN4dql/3h/5xdW3L4jHLUzb1uMCWEg9sfkeV1H7Ci90MFABFCHyV
         Ys2i8nmgJ71p75IHVFf16tbVMh7AfMRe/IcnZlpmSTh6MNS75WYOVkPhugmwvcXDobHS
         Rkj3RQaqjCZP/x6CiEuzzXwgVKg3uojkgG8fcFtKP9EUJzF71ssBR0fn2f5Xge15iTrC
         fJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766970558; x=1767575358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dW38RDm9ae1+68aq0l8C8yBQB4OMEKFfYFCgP2bm/4=;
        b=AfYu+OMKJxF4N0F3+o6Za0rgAXBjT6pwU6PB6lZr2E6elgTdjSBVBKS/9j6qMdmY2O
         Ux/uk1tIH5wzEegG9J+Qtb9S+sg+CzIZUHatoG/c0s2dmPdeIXqYFKrX4x5tt2r3k7NG
         lTj+GIp89M+hFFQn0uzwL2HEwP79uhnYAfNSPNlOpjgu6HxLXuyi5WvCOM5FGq1SKB90
         PCkyLzI8GoEHF1pKf1t1cu2JHSwGyzDNOxpHYUs7ftusJW8wdFlJ/ZZRDPKD4nH7Hg7Z
         hiwKWAzxIh+0TBopN4SUmrB+BQfv2d5WC8+qKNgSH1Hf/9tyxUFgJ6IXuq4iWViZwz7l
         a+zA==
X-Forwarded-Encrypted: i=1; AJvYcCW53BGHnrVT/pQ/FZt4Yw369GntfQD4R4fASLjdTOenrfN/R9Y/3PhMKoS98lrxRsZOHAPfqMsbU01JSreK@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu402yPCgxQHzgd+VdyvtOLWimiiS/2C3dyJkCIdiKqy9KhiBK
	dXYtrvaBFL8HDtQPYgz7sKm9DNX1htF/Vko+xBvrhp5dEDJA9JPcr+qQ
X-Gm-Gg: AY/fxX4QLIn/YdcgIoDuqXc0uyQ6WA8LNnWPHZEk6S5u0lQKZOPmaiR6Ty5p1V0sRHN
	Jjag+U11A3qKafC+DQJprRevVM7/9o/DjxJr71DMlJ4aKQtNgeMx0ksDiV8z3KCC9zu+1xv2tfL
	m5CpggW2UH8fS192X6YammCdvVGsthypWQ3K/GC63BVs88wt4UO93UfJr//59ls917lylJEfwBy
	t98SYQIbc+32O/qVl/EPM5EPdXkiKp+Rq/1GrhxgpD5SQgpOHWZWlpzCAr9LASljcsndczK11r8
	w0hbZara559hHMAUnU4gYZgtPdFr1X/tY2ShQj7ERVtIALE+9ruNOSBbRRmkM06/vK36GymG94z
	14rI14/l/D3HPegbfGTqIW19XxSFuCdSkTaD/N+tHkQogF9nMeBO8wf3ktGSeGC+QwVSt5Wje33
	WRPD1JbxMAJgMu+g0PQpDVTvU8QwWcbBrBWmeX4gw80Sw=
X-Google-Smtp-Source: AGHT+IHV4ZJMK7bXEGIcq0XJLLZ0z9mzC37KodrTHfctPm6PYkmg1Ku66Axj7NdKa2uj5K/YYl8V6Q==
X-Received: by 2002:a05:600c:1991:b0:477:7a78:3016 with SMTP id 5b1f17b1804b1-47d1953318bmr316061175e9.8.1766970558082;
        Sun, 28 Dec 2025 17:09:18 -0800 (PST)
Received: from alex-ubuntu.. (88-127-35-143.subs.proxad.net. [88.127.35.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2723b2bsm566557265e9.3.2025.12.28.17.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 17:09:17 -0800 (PST)
From: Alexandru Costin <spxxky.dev@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Costin <spxxky.dev@gmail.com>
Subject: [PATCH] Replace udelay() with usleep_range() in PLL initialization code. According to Documentation/timers/timers-howto.rst, usleep_range() is preferred for delays "10us - 20ms"
Date: Mon, 29 Dec 2025 02:08:14 +0100
Message-ID: <20251229010814.94255-1-spxxky.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolves checkpatch warnings:
  WARNING: usleep_range is preferred over udelay

Signed-off-by: Alexandru Costin <spxxky.dev@gmail.com>
---
 drivers/staging/fbtft/fb_ra8875.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de6647d0..130150b0f07f 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -210,7 +210,8 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	}
 	len--;
 
-	udelay(100);
+	usleep_range(100, 120);
+
 
 	if (len) {
 		buf = (u8 *)par->buf;
@@ -231,7 +232,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 
 	/* restore user spi-speed */
 	par->fbtftops.write = fbtft_write_spi;
-	udelay(100);
+	usleep_range(100, 120);
 }
 
 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
-- 
2.43.0

