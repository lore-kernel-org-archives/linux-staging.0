Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355FF1BC2A
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 05:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772342083; cv=none; b=NENpML3hP1dcxai9qtnL1x+p32f9yxv4oipm9x+ab7ODcHr+S/8sCp528CEbmGQXPgl8h67RnkFn+nk2cWaX7pWnwyhmVdAOVsaE3wsr+g8tn7YsGmg4j64KmcQpE+uJq5d34Ee/wXzUa/qDDJERboPn4IiBchaZi2RfU3mJWM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772342083; c=relaxed/simple;
	bh=+94V9P3uZsspdMGc6KsIYWut42QqNWXwX7vEg92NR2o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DXIfL9QO/5Rx9686b5JW+oWXEQFBVs1w9eqmn4l9Uaq/mx1SJMvpd3sPZAFcJrv+FdjWHeEWR/cDd/f8y74249fy8mwDvtToPIj12ewCVo+UVVC+2u3DmQlUNHNIAYfC2KYVL5KE9zqB4AFjKcqsJaw2+R0ossfjaoRgpesU4H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWkdbjTD; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWkdbjTD"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-3598a0b982bso18784a91.2
        for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 21:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772342081; x=1772946881; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5wud+qGCdJgXmWDagJPYVri7UNngm9Du3LF+naqdy0U=;
        b=IWkdbjTD5zC1YuzuoGTeTFyChQMs1JGSt/RjSdRaSX45ObMXNW9DtRoqsLnvwzJJxt
         4JXcWW46sthKVtXNtSuUnWdTtQ5HoY5qDI08B8IBQFPkopXBNim64Us1POOMZorSyEz3
         zr/e4YioTeGskpKIS+KXEBFpO7VQMYYrwyEz01WXEHhA9GwufT86lrMTOixVRngCivg+
         ACj6rvCSj3Be3xRmzm1fnSnRuL2A77jPx/Vxwc0QsXHhDEqDXqWwo8g6jYKjrPM4RsOz
         agpjLX8NStZB80w13US4yfQDYWFKd75SoYW/mhKbLiHapfWmh90bQ19UFvq0Nk/RRdUU
         tPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772342081; x=1772946881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wud+qGCdJgXmWDagJPYVri7UNngm9Du3LF+naqdy0U=;
        b=enQt/JDG4R9RHf5851+d+rNEEhgwN7KzM/xP+wkTgAPnYt7jhOxsr0dPwFY8WQygiB
         y0lkmGTCd2c4W5m4vBB8N+th3/1tFW8i69wIRlYRAcHJWfo1fr5xsHfRnj4SwGYAuhSB
         3lG29wBc4Zf1dew6Rqd2aAvtsXalFCnYMZ9RHtGllmwa4mWzV35MH/nwg4IUuQqA8Mc+
         jRw8oRrwvIVZxltcm42JjQ76Mn6pOuJZpvwBII6vN8AmWg/UH6u6m1Co2h0AkMVeOgxK
         5jWEWpisGmb4KPlmQE+mbxXJBoOYp1CrzxH31Kei7LlEEqlzn6b7SEfEKNTquqq0mcDD
         4vMw==
X-Forwarded-Encrypted: i=1; AJvYcCXarwu/FDswpBmTaF6xwoljZMlubR2ZM7kFtUok+N7sOtUqmxT58OBlNuILKlINljRfFTzOmmb90SwSZxGt@lists.linux.dev
X-Gm-Message-State: AOJu0YzBphQQjtvMsbKU1ZIc5/h51NcTnd1dXfVDP8getrhFOJMs7YGn
	Dt/fb/7neFUMdriLbzlL3WASOSOUVNxteg9MrHivf0dI8vpGIYHDqX2r
X-Gm-Gg: ATEYQzzlT5I6hPlLdEFsVUqKr9YYH7f7d3Hfuu2NgNwirF3P2WehbLOsasFkMdqI3kr
	WmZ+pLmS94Xko2zVnQZzEV2/bZ67wVOmH7zU61Vpv9lMDWZS3SqApMFvpsUiz20uADdwDfGeFoX
	YBF6i1YmFrer81F7WRpy+dhV5bwjxAHf+S7byuHpgAuYBFrKtwYoYwCOcz2n++LkhgAxrtXnrmw
	anNPYhyut/sF/PyCWd+JEvjzFgzOKKT+Kw4KE3hADpcwuWZNYpsJp3QGr6/ZKnQ/1BJMRZ41r3G
	cMd6AHoTLevaFd4nC7GM+waO01FijAwnyRZIGtxKlEzLgHunXOwhqZNNb3Sj3e1+IJwNKQXLMfL
	vESxHs+8+qcWFFwfbsic8RRMc6hpsH6zOK8VsOjE8/sFvV6xA/DId05ntvnrosFDi3Jpq4AdfnY
	M94WHVswl0/M05HOrKsgWxVmTWzhsYgJ+3D6DvPPk4LqKve2t7iFZZd/R57zJvuEEcsBnXsYgIv
	bMwi4/Rk+h0nw==
X-Received: by 2002:a17:90b:5104:b0:359:8988:38c2 with SMTP id 98e67ed59e1d1-35989883b9bmr288915a91.2.1772342080607;
        Sat, 28 Feb 2026 21:14:40 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:a5d:5f1a:a014:e1f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3597b85db9asm1616298a91.8.2026.02.28.21.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 21:14:40 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH] staging: sm750fb: use proper error codes instead of -1
Date: Sun,  1 Mar 2026 10:44:34 +0530
Message-Id: <20260301051434.28187-1-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace magic return value -1 with proper kernel error
codes -EBUSY, -ETIMEDOUT and -EINVAL.

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 4 ++--
 drivers/staging/sm750fb/sm750_accel.c  | 6 +++---
 drivers/staging/sm750fb/sm750_hw.c     | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index 0ef8d4ff2ef9..d90a93ab8fdc 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -294,7 +294,7 @@ static long sw_i2c_write_byte(unsigned char data)
 	if (i < 0xff)
 		return 0;
 	else
-		return -1;
+		return -ETIMEDOUT;
 }
 
 /*
@@ -394,7 +394,7 @@ long sm750_sw_i2c_init(unsigned char clk_gpio, unsigned char data_gpio)
 	 * range is only from [0..63]
 	 */
 	if ((clk_gpio > 31) || (data_gpio > 31))
-		return -1;
+		return -EINVAL;
 
 	if (sm750_get_chip_type() == SM750LE)
 		return sm750le_i2c_init(clk_gpio, data_gpio);
diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 046b9282b24a..fa593d4f31fe 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -97,7 +97,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 		 * got something error
 		 */
 		pr_debug("De engine always busy\n");
-		return -1;
+		return -EBUSY;
 	}
 
 	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, base); /* dpr40 */
@@ -264,7 +264,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		  (sPitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
 
 	if (accel->de_wait() != 0)
-		return -1;
+		return -EBUSY;
 
 	write_dpr(accel, DE_SOURCE,
 		  ((sx << DE_SOURCE_X_K1_SHIFT) & DE_SOURCE_X_K1_MASK) |
@@ -333,7 +333,7 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
 	ulBytesRemain = ulBytesPerScan & 3;
 
 	if (accel->de_wait() != 0)
-		return -1;
+		return -EBUSY;
 
 	/*
 	 * 2D Source Base.
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index ce46f240cbaf..e4b6b254335e 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -518,7 +518,7 @@ int hw_sm750le_de_wait(void)
 			return 0;
 	}
 	/* timeout error */
-	return -1;
+	return -ETIMEDOUT;
 }
 
 int hw_sm750_de_wait(void)
@@ -536,7 +536,7 @@ int hw_sm750_de_wait(void)
 			return 0;
 	}
 	/* timeout error */
-	return -1;
+	return -ETIMEDOUT;
 }
 
 int hw_sm750_pan_display(struct lynxfb_crtc *crtc,
-- 
2.34.1

