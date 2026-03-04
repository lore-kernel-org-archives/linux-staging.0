Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EF03876C0
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 08:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613969; cv=none; b=iq+G/EIB6eOMSB+JaIbqwgKG1+PJNs1WU//RNPSZsQ3YJqrQXjYunmOG3irhH8dFKJECQdI/Qq1tggUCXTnmX6Bmovr+t/rW/6LAre3CQxTJ4/NMJqPNc8IlokyhhW790WbRBrWRuYwt5cBw4rKH1eCGnOKnWkndB19JGyQrPAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613969; c=relaxed/simple;
	bh=3F2Xe9MSsTeaAIiOzoWVA5GTBbp73iMfn/lprySLtwU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lPGJR8KiKWTPY108Icx7Da/F2sBPhcIiJ2XNOxnMmeEZHD5MjPHlk9pscyRHnCPgGUWHMzCekBVElqISX0SPy5o1Brw+DrTxWH8g/VNMuOlEOV6QT8+XLyh7ob7DRZG5CcecQmwb/mlAmaVgDD2ued6i+BbdguzpXCfxOUvSL7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frrK3TMg; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frrK3TMg"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c6de5ea6879so180460a12.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 00:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772613968; x=1773218768; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYEhFSH2QiR/Cp+sFvQyOBwINQ7A/pZyDrDPlhVTTes=;
        b=frrK3TMgLHfsCG3j7Z65l/oiN6KcKC5Emh27YUYjvIQIMvsogC3VvuJEa3wRtCut81
         eMqahx1IgmY/kmVf0wi77IUlsUgNZYk9oaZT9zvehs29+aYFj0fc4Qtv/Mj8BuyxqPkj
         QNssd2XGcAhXmNFjfEDnN49k+klD3ygM/sN+G0XpvdkSo5m62FvlHuefFaANS8Ylimb7
         SetZtjTmAghzqmoKGbrByHzym2hXmaPXzhTV5m78ipC5Xt+yFUHS98l671oAnHyedMBr
         8otQpWxXv8FTbNr9hSVEw8JvNF+s/Sr86n+FSdGerxPzq8qAkaGQBgOff/8r/0q78b8C
         p7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772613968; x=1773218768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oYEhFSH2QiR/Cp+sFvQyOBwINQ7A/pZyDrDPlhVTTes=;
        b=Wbll66xSfEsq3746c4ahi7+zvX0Z4gjIQYQ7vJGFkCbzv+SqLqgiF6981ZUn4dxNZi
         T0ujit+IW3nWnNZFm3EhOMXlte/Cyz8+7zAwkw3Id7BCIVMwBiCtZwzSjfTLmDfz8vzu
         Pn/e19qJxWKeaQsEMy+C9h1B/YIs1DIQcIzQe+VYtilVvYMK1AOb+Qt5FmgHshEc3FXX
         rB+na1zYFbqygxbH0Igcj59PFHMkTA2NRmq9tqi1s5nBgtrFEmPoTcrye3qiqUNG3nOK
         3e+lRPBiyD1OGEikURXxgTYjsPaCyec1t7pdYAG66HGaLzAQlGib55IjdaJ0g8gDtQbR
         U2bA==
X-Forwarded-Encrypted: i=1; AJvYcCWuvJeglgv1gc6knkEjcHh8K6Vt6MYkETO7VX5VDp02OL6N6jGVPGE1oWqOaLBgvkPh0X1EWzUtrPSTXCSe@lists.linux.dev
X-Gm-Message-State: AOJu0YyIK/UG6Dq7w+mN585fBqbFWKPla8q0zkgRmahfxJBj1mjrYsrC
	TAjYMM56WTe8uqMayXhcVB0Kic/1+55ZFHmR8dGNldiS303ZJbZC0QvH
X-Gm-Gg: ATEYQzxLmJRMR9DaYLEnNHajwZkADFDfhm8VZmkmDqptD8yM/WE17DSV83FrBmfZ5tt
	rmQBJ1+x0a57+x0bkYee6fFEXIZ55dj7veRnMJkxr3VmR8VWiQB/lfroGiHnbACkRgDnXeAluFz
	OeBxRQDZD4cmyPdHkLB+Uk6GNxLwyHa8gEPfi3SNQqb8KkPTIuDzF/HyKIjAv8sZ2SvaHNIPBHT
	rXfJmI+QKwif7JshAlcxfVKYVGEeg9bfrTjQBSvoJL7J6rkIXo5gXECx46kIQUfu1SZB9RgQ4MB
	xXmY40CwFEwHYv7e4CmfE4xBuSxcdSwpoo2UENGAMhJ5TymlBqs8y0jaynTz8HPKwg3HxYchEb4
	3bfG1CALM75GxQs5CObtGMFPgeUQFNeretyOtzoHY8jM/A4RqhxSSbAe1MPgFQxIuS87/CXpHOC
	v1oEOs6yw90/+4zbMjvwk80Z6P2OxtAjJWWtnMw6yvTBSjt5cGd0ZgSSiH2GbT7qwBnavaUtzoy
	8XW0Kq1dUMlzMM=
X-Received: by 2002:a17:902:cf04:b0:2ae:3f3f:67c4 with SMTP id d9443c01a7336-2ae6a8c0867mr11344515ad.0.1772613968144;
        Wed, 04 Mar 2026 00:46:08 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:950d:ab7d:5e5c:5244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1b2c5esm122010285ad.6.2026.03.04.00.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:46:07 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH 3/6] staging: sm750fb: sm750_hw_copyarea: propagate de_wait() error
Date: Wed,  4 Mar 2026 14:15:42 +0530
Message-Id: <20260304084545.156170-4-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304084545.156170-1-officialsohamkute@gmail.com>
References: <aaVT1mSeKrSSlrha@stanley.mountain>
 <20260304084545.156170-1-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate the error from accel->de_wait() instead of returning -1.
The caller treats all non-zero return values as failure.

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 1bd0502db039..f2fde011e7ca 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -152,6 +152,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int rop2)
 {
 	unsigned int nDirection, de_ctrl;
+	int ret;
 
 	nDirection = LEFT_TO_RIGHT;
 	/* Direction of ROP2 operation: 1 = Left to Right, (-1) = Right to Left */
@@ -261,8 +262,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		   DE_WINDOW_WIDTH_DST_MASK) |
 		  (sPitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
 
-	if (accel->de_wait() != 0)
-		return -1;
+	ret = accel->de_wait();
+	if (ret)
+		return ret;
 
 	write_dpr(accel, DE_SOURCE,
 		  ((sx << DE_SOURCE_X_K1_SHIFT) & DE_SOURCE_X_K1_MASK) |
-- 
2.34.1

