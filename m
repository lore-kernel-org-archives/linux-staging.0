Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B00B1991CA
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 14:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750256204; cv=none; b=pF2ZRuN+ujxHv67e7p6nUE/Nb3X5BBGd0fIP9PkcvyfIHtxrj6B9V/S4/e7UZhodf4T+Ix6dIZGjsp1ed4mBDnTpcz1JJg/swBDy/lUVbIja8wS7s2RBobVXaB3bra8JopjOCFZEcijzsMlndemL6SYb6KcopGgs5bd3WNNm9VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750256204; c=relaxed/simple;
	bh=vpumWvZEKWirBkxBr6SXpGBrKl0PGlgMdEwZMBbkXvA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IrJpYrhMVjEs9wQ/+kvs7URpIs0ovtiYQiZmfZuD72SAhBKlC5OpgaRj+rGya1kdzhv8nKsbQVYQML4jfEL6f84CRAgSx2NsOn2dPY5iPN6RrbxW4kKpt2tgWa8pO7r3ZAuZAj8ehcyTgDiwX6QtObKNRMM+LQm/huiUjyyieQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1FbiP1C; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1FbiP1C"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-742c7a52e97so5814289b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 07:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750256202; x=1750861002; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dN6A+dCRQCTewVwE+vKtlp25E+5/ls+WyGlXJF8/QJI=;
        b=Y1FbiP1C+hhirKEjjH/s+I1nlqacP9y3XtCNGrjzv3utvDX6pJIgMYZTW8as64LvQb
         gY6Xo2MGKVhizoTqJqPdxmxCoMrTg5BuWMmDyAlbNdMYHEC8TT7q7CztHlE2qP59MSys
         cOO9i8nVcjQDwLcp+3ZizSZmlQUZgkFPVCbdGFJ7TkSA6XXPs8aB/WIHsUuztF1PwsfO
         A7mvfBwdmOjPY6Z1NmpVr2htPoEJ2VEQSp7ajuSGFBmnWt7QNJpxu3YnNdNdRnxYCQfD
         dHf5fl4vmNCyWmhWIyYJXMLCXPslsC1M/vx1V6BeQP6y1Ab0LsFG+EuPaGEUgAP7ONBM
         p0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750256202; x=1750861002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dN6A+dCRQCTewVwE+vKtlp25E+5/ls+WyGlXJF8/QJI=;
        b=RAW0zsRAaptCDkVUbCFarHf9V/0xHAEdko69rUawvqGz/yvXPfNhPNtXj4uRqWWKRV
         HWI5cDv6w7mUDUV0qiN1m1bIQZngqGSV8PJ1ilCCswHxR907544M9zUD8Nd+uzIqe2oQ
         MiSPhr2nevrBKE2qM6+W6hrDci/ZcXCZmAdGwQv4YHUaXUvETF3eUrSs2qb8iDygx5K/
         GVKTAqbHKtjV6Q0m1LJPddRaoL2l9JGSc4XGimt+ukD9GPHXAd0U9wWqLP4P6qNG/7rd
         d6TIOsWp7ggaZMmpYEPINlohZ+T0oUkUcK1eEiZgaGB/3zQR/FGCF5KgEBlqyK+rDaiZ
         IHLA==
X-Forwarded-Encrypted: i=1; AJvYcCXEThUcO+7J0/W3M5mD6A/TI7OeB5Hh6/tktTSu6GvQsdU3FVlLs73pX5EYlyql1yHJkBoO7SgcjwuyiRwk@lists.linux.dev
X-Gm-Message-State: AOJu0YxVCFvDqCbn2bUDxFfIxYF/rJPQ9odqvhhsqjjfw4Cd+2Blx6bg
	olZKH9Klw4hP0fp52HZucKO4G/7/eZLNuJoQg+5ngOZJFrL2jFQH0Wt5
X-Gm-Gg: ASbGncsiVTiZjpyKHKjXVJfB0Lff1Ju8ClNHr4eWrHkX5dPqNhuvEYRSEZjA8wvqzlk
	g+GZ7e/pe5D8pczeDBlx2E91b2/+0LnIo8U1FhWPlpYBTpQL0/+4bPVMg3PXwpNAd6yBUCIwlmn
	28o5gzwoWUBTH2JlAKmnoUKY3SOgfkhQjWiKuy/OdYnsqxRU3Tl3Y9Bl1eUxtggKMMvOCHf+p22
	vBDI7FXeBU8XbIJk5dAohbZRq3ZMSsUvYo94R6c7bt+Eyx9ywi0LDdT3+eOYP0wjyVtTZcsGVU9
	zzzVOdakDEjNG6NNZNQF66snSLwfq7kQ0EThUOp7MvjWod+YV3oZyCCfsMc1
X-Google-Smtp-Source: AGHT+IGYEQHH8nI/GaHcGYoU54mp6byytA9Jxq+tLdc8SYm9ueq6KZ56WHIsiHaYQB3yd+AYvGKopg==
X-Received: by 2002:a05:6a00:14cc:b0:740:4fd8:a2bc with SMTP id d2e1a72fcca58-7489cf5c8e8mr20629514b3a.5.1750256201994;
        Wed, 18 Jun 2025 07:16:41 -0700 (PDT)
Received: from zinc.. ([182.216.63.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b2c1asm11360866b3a.143.2025.06.18.07.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:16:41 -0700 (PDT)
From: Kisub Choe <kisub.choe.0x1@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kisub.choe.0x1@gmail.com
Subject: [PATCH] staging: sm750fb: rename 'proc_setBLANK'
Date: Wed, 18 Jun 2025 23:15:55 +0900
Message-Id: <20250618141555.5434-1-kisub.choe.0x1@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename 'proc_setBLANK' to 'proc_setBLANK' to
conform with kernel style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <proc_setBLANK>

Signed-off-by: Kisub Choe <kisub.choe.0x1@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ++--
 drivers/staging/sm750fb/sm750.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 1d929aca399c..bb2ade6030c2 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -577,7 +577,7 @@ static int lynxfb_ops_blank(int blank, struct fb_info *info)
 	pr_debug("blank = %d.\n", blank);
 	par = info->par;
 	output = &par->output;
-	return output->proc_setBLANK(output, blank);
+	return output->proc_set_blank(output, blank);
 }
 
 static int sm750fb_set_drv(struct lynxfb_par *par)
@@ -605,7 +605,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 	crtc->ypanstep = 1;
 	crtc->ywrapstep = 0;
 
-	output->proc_setBLANK = (sm750_dev->revid == SM750LE_REVISION_ID) ?
+	output->proc_set_blank = (sm750_dev->revid == SM750LE_REVISION_ID) ?
 				 hw_sm750le_set_blank : hw_sm750_set_blank;
 	/* chip specific phase */
 	sm750_dev->accel.de_wait = (sm750_dev->revid == SM750LE_REVISION_ID) ?
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 9cf8b3d30aac..40051798efbf 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -170,7 +170,7 @@ struct lynxfb_output {
 	 */
 	void *priv;
 
-	int (*proc_setBLANK)(struct lynxfb_output *output, int blank);
+	int (*proc_set_blank)(struct lynxfb_output *output, int blank);
 };
 
 struct lynxfb_par {
-- 
2.34.1

