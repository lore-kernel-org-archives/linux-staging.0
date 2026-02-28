Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB06272803
	for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 20:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772310433; cv=none; b=rJgvRLQCzBB/dAl5eptqm/ewpglZy9rnLgdJupl4rlYgVJNS2ZooNlLqFTrPn21OsJvcRrVuyJjTOCyhqt+gfsofvipS3zk/iro+PAHONVinTCO4Dka/sAxXHWjPaOS1xMiLzwbu+zHKOwI1CU5LvGLXaR79fAvCItbUGE77AbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772310433; c=relaxed/simple;
	bh=aYp4smBf5B/m1My73xjNkVi3QPyMBWYzajkjVuSgSlw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PStN1ymJUxM33ZnMyhagthelDO8ae5JLG8Y2n/mmF6qv0PgRLVkOGOJM2fvS2k9coKVk7uhOJV/RwYABk099siyfH3qsnOfRUGEfqLgkHIw67y9FkjGrQZKZeWwsC+prcq7juH3Uz7+xuyOyyUDXsPw8TP6xTfZenMGNdbMlNn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbfHAWqu; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbfHAWqu"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a3e79fe2b8so4427355ad.1
        for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 12:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772310430; x=1772915230; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hbY6xLWGKXtaxrC528rj/sYRbGkuV5WfacpZcBywgMA=;
        b=MbfHAWqu5BIfBwzPmNibhLI3c/fPOZr4ib3BRlZyyeZ1xwtGKSm5dXUc7ulvxl6uVA
         /gWsBZdSyZKbIdKUDbU1kMBSBQCjdWPO/qzDZBrqYb8Jp5zd84J3KFA1OmwBmZFt1yf2
         v/lN4nRFvLaiLUQFne3IDU/E7T/G0ZobP5hi1+z25bcz1w2RAOT7xjbTswqrqJna2POs
         qU3a15+y/99yC/SQ1qWHelVAR2DkAYUp/Nw5lO+XtgYFpCS8k65SkWIaKCa2E+2gDnyQ
         kev9dLfvwzkBXsZgGysaWhIE1An6xvm0ivH4Ny3ta3z8Fka/4g8SVdhF6TqOQ0lMSWkX
         H7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772310430; x=1772915230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbY6xLWGKXtaxrC528rj/sYRbGkuV5WfacpZcBywgMA=;
        b=WXTJhiWn1PAYMtbdlF3x9EmZE39uDOEu7IwEwnS+4Bae+xtgf+jY9D4F8YH9+2xywz
         81ZwaCnHYtYBR0D4N4Azl1FUsMGxI1nrqcLtgWOxQlQPCrgg5n5JDyZnvcR+ZDHmiGmv
         kluwux161ezVk6MvxwRADCCMB4ZSg90kBTlqSjDDhSLw6orpnAJLu71nf5/mlMM8fbLg
         nFUO2luSsIp0XivyGTbehFnCNkWE9mxrgVt6doaUEPcykL4zwecUs7EGD9x3YNF/xxYx
         YsYZIQT9rke3v2opsaDURdswsb29U1+Ck3qI7NeyO9SxWFuv1CtFUIbByshWyXdHhdZr
         qq0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSOr8zcDHSs7NFqyVGuohtPokngSgpM+mS0Mbm4kNRUwREAI6wV4zUOJemwSm6mV3rQEQi7CW6Gk9L+GHj@lists.linux.dev
X-Gm-Message-State: AOJu0YycWpoXb9fgXZ0K42wKqce4TPNJqHXBSw42wLoNmbbU5TNW7YAd
	a9K7R1nVLQVGN+QEn3voDnCmSJFX1lJAfG8UKfT+T56/urISB5TgBsBN
X-Gm-Gg: ATEYQzzCsmlHOeDoZjVC6tP2u+KpYXUt4C+iHwVSZle/xsToInIGEcxFB69yjbEQaEv
	0jyMIHUhaoXid9S42oi6F2t9ilBuJ+Y6KOA2gZG2IqJkh5UljlqPLtBGsApGVvnum3bn84l7SpY
	P7Wy1d68Fq7n0/auaNv3wXUmBQ1SAfvigfdhhvGTnE4l8CJ+qxAcQZIvsARULFWXrgDBZ+wma70
	ns3pj3pBAlBIEvFrSx4E6A7gEocwIB48T7CeKZm0EUQmHGXGzZDYUY1LbFZ233wbdAasz0Nd112
	k5lwWXucHvQtiHi868SsIMOV84MiIf8bej05ToR1YljHt83RK4THqpRUrCyrLDN15ucUZOFgb+b
	6Mx+/7Qjx2z2EO16HV6V4mKcXzSA1S4e/5jnaYRpImYuty5khpfWich56LozD79HpYqOJdjS7vs
	a7Ny7gIP35UiUCyI01rUEUpU59w54yqwIBtiKcuckTvarwJ+l/sH+WZ3nQ+uvOuQ37U9elUn0pA
	vy/di2iCaa2DyY=
X-Received: by 2002:a17:90b:3fc8:b0:354:9dcb:1935 with SMTP id 98e67ed59e1d1-35965cd26bbmr4906008a91.6.1772310429803;
        Sat, 28 Feb 2026 12:27:09 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:37d3:368b:370c:c273])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359834ac606sm557872a91.6.2026.02.28.12.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 12:27:09 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH] staging: fbtft: replace -1 with proper error codes
Date: Sun,  1 Mar 2026 01:57:01 +0530
Message-Id: <20260228202701.43337-1-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace return -1 with proper kernel error codes:
- -ENODEV when SPI device is NULL
- -EINVAL when display size or buffer is invalid
- -EOPNOTSUPP for unimplemented functions

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/staging/fbtft/fb_ra8875.c | 4 ++--
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 drivers/staging/fbtft/fbtft-io.c  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de6647d0..c2e5c6276415 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -29,7 +29,7 @@ static int write_spi(struct fbtft_par *par, void *buf, size_t len)
 	if (!par->spi) {
 		dev_err(par->info->device,
 			"%s: par->spi is unexpectedly NULL\n", __func__);
-		return -1;
+		return -ENODEV;
 	}
 
 	spi_message_init(&m);
@@ -144,7 +144,7 @@ static int init_display(struct fbtft_par *par)
 		write_reg(par, 0x1F, 0x01);
 	} else {
 		dev_err(par->info->device, "display size is not supported!!");
-		return -1;
+		return -EINVAL;
 	}
 
 	/* PWM clock */
diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..9a87bddd7d19 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -181,7 +181,7 @@ int fbtft_write_vmem16_bus9(struct fbtft_par *par, size_t offset, size_t len)
 
 	if (!par->txbuf.buf) {
 		dev_err(par->info->device, "%s: txbuf.buf is NULL\n", __func__);
-		return -1;
+		return -EINVAL;
 	}
 
 	remain = len;
@@ -217,7 +217,7 @@ EXPORT_SYMBOL(fbtft_write_vmem16_bus9);
 int fbtft_write_vmem8_bus8(struct fbtft_par *par, size_t offset, size_t len)
 {
 	dev_err(par->info->device, "%s: function not implemented\n", __func__);
-	return -1;
+	return -EOPNOTSUPP;
 }
 EXPORT_SYMBOL(fbtft_write_vmem8_bus8);
 
diff --git a/drivers/staging/fbtft/fbtft-io.c b/drivers/staging/fbtft/fbtft-io.c
index de1904a443c2..2144f5257fa9 100644
--- a/drivers/staging/fbtft/fbtft-io.c
+++ b/drivers/staging/fbtft/fbtft-io.c
@@ -19,7 +19,7 @@ int fbtft_write_spi(struct fbtft_par *par, void *buf, size_t len)
 	if (!par->spi) {
 		dev_err(par->info->device,
 			"%s: par->spi is unexpectedly NULL\n", __func__);
-		return -1;
+		return -ENODEV;
 	}
 
 	spi_message_init(&m);
@@ -231,6 +231,6 @@ EXPORT_SYMBOL(fbtft_write_gpio16_wr);
 int fbtft_write_gpio16_wr_latched(struct fbtft_par *par, void *buf, size_t len)
 {
 	dev_err(par->info->device, "%s: function not implemented\n", __func__);
-	return -1;
+	return -EOPNOTSUPP;
 }
 EXPORT_SYMBOL(fbtft_write_gpio16_wr_latched);
-- 
2.34.1

