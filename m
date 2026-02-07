Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82D83314DA
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 15:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770478628; cv=none; b=L8VCs/HYCmWG+MkG+8l1KZrHtrtiLJVuVLeraCaxHmdNP932bd0LwLfwQ4zQiDJeXIdXT5nC/2jNhBtf6s3H4Wa80x9nu4tLWIzdZGRU55LdK/9lEpXndkJi4p9e9grLukNQSNzXSrWY9rN64WUCSlfSVRmPXEJwc5zk+0rCcBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770478628; c=relaxed/simple;
	bh=jdubdm4I79MqOnpsLzJ91ixMD6dvIG6KUclj8/ope9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fsbrspQQ++uMO2GU5EN3pLsJ+54Ar4XSLbUF0T50JZD/KQEIg96eJkbX5LOeMTOAEt17YmJZ3ToLpaKpgW2MAqvTaMn+xiax4UEjXzVqcK/VdTHP7qPxBhVQF2AC1z6TcMXSMUA/JFEomuC+7pbVQdzkPJTlHeyS0s3fZGZYPRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCVWDlQl; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCVWDlQl"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6580dbdb41eso4265677a12.0
        for <linux-staging@lists.linux.dev>; Sat, 07 Feb 2026 07:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770478626; x=1771083426; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J908Zx4L7U5Tl433tB9UC9jyDe+BTgpPRWxg57FIM4U=;
        b=QCVWDlQlHaiVNXytV3r4T/AJY+/K/IWN5C3j7H2M0O15qtM/0UUDsWuY87IOALO0a7
         pWVV4x5uEkzka+k6Rn7L7Am/n1OHDaldip7briq/c/jKZ2P4n51C6x+vgHLDEOzyX7Ah
         eca6fhFpT58zN/1pd518d7mCiAnmfW3iSYiZVPVPqX7IZ8P7y3DwwjxU0DjYRy+zAefx
         37lgDmwNWMJnno7+XpBoaWPCLiF9Oh5MQb/8Jji/veIJl54uy/9o7sK30jI2mLHT8dCc
         MR/jDw17NtJL18w4Mx+UMQqJMClpK2vPZqbjnnKYsWobuk2MF00aJGzeUQ7vFfTu4onR
         W/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770478626; x=1771083426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J908Zx4L7U5Tl433tB9UC9jyDe+BTgpPRWxg57FIM4U=;
        b=ApyML8myfKrsAcfGgrx6lusjkaap91WiLytBFsnXmbUORg+cm8qLYvqbvlcK+bHxZZ
         gGJcUQcGN0sKgrb/5NpEeIkbypHk9oNhaxjYLJ7w5Jdve+HWKec471L7/mklOgqHbcUX
         LIh6BX3tQODmdzqdmGNnGseorUDm3FSpb7NynqRhgCSbgNSHOIOUE9l8qWHX63ZxWYJB
         VAW55MOYn8enDuNuNmSIFLrzgs6EkAhNCdwbAL+Qn+wrCSFp03zpjmbv/3BUSEMfnq60
         LkoCie5rdwOJP4w0wq0KsoMspXovJdka/Yoq/hrCpK9V82PVBdBRaqa+bNKiCQsUYVw4
         z7zA==
X-Forwarded-Encrypted: i=1; AJvYcCU01Jetv2Bu49fGTU5wiJ3aCLKJuk6WiYhmDDVNSn2BDCF6/NqocK6wIZUOBta8U/HiWSCdDLAQ+lf5uvlR@lists.linux.dev
X-Gm-Message-State: AOJu0YwGsj3aVvGa7+5udcNTw2NLR4FN277GyU9wqSQp4zBcqMPXejaD
	sJQYx1MafHOvG6pfHEUnUIPjowy3Fvh6P3oBP3jP3Zsgkf+NSWdKoRQL
X-Gm-Gg: AZuq6aJBIMupXQy7LATgpbZl+dMoel5bUh1tpF16Jqg9+vWAjvqwPSQDCTcWPinJhrc
	kt+m9sgVFaY5j2AhWJdDvwSq9pzcQ0qqFsixHXjiPKHUf8iqZLVGMjKtnsh/V3ppXE9cbQXCAqc
	q64HLxGymm5EYo5+IVivIJYiZJ3KMjbBaGtJQPlKloS6cVjv+QO9G542XMaHrfDE8isyPGAp4r8
	ZJBemcGeQ6fAXdb8/J3BrDyKEb0G7CxH9BlIj2UGE3Z94QoMDxSBnXvRS8GDOnHZc54gQTXJwU8
	XEhLNNjLWMnM1QAskaJ2M+BudHXcl5HoNxEPpu7EeeIRhDyFuZkMHMGSB9hhM6+wq71P83x4B4J
	qzdAykLPb1v4LCMOG8Y+sXqHvcfCeja95+mkqtGXy3VoV8M9el4EpR8+E+6wjr4ctUAlY+u965Z
	tjBac27/ANA39pdspzcPKN8rg2V3b/U5YXyFRx5hDpEeO8E41T535P94NcjcvK3UtO427pyB6ni
	ZAD/1E33DohB7k2FaFVJhtuxFlLQ72Ym5kRG0xopFyAMNXv+2Cw/TOsNYiTxREw
X-Received: by 2002:a17:907:3d50:b0:b8e:2a8a:430d with SMTP id a640c23a62f3a-b8edf22fc44mr323680666b.26.1770478626090;
        Sat, 07 Feb 2026 07:37:06 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.od237066db22328bb-tp.internal (170.249.141.34.bc.googleusercontent.com. [34.141.249.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda748aa6sm181308666b.1.2026.02.07.07.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 07:37:05 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v4 2/3] staging: sm750fb: convert logging to device-based in sm750.c
Date: Sat,  7 Feb 2026 15:37:02 +0000
Message-ID: <20260207153703.2049-3-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260207153703.2049-1-iprintercanon@gmail.com>
References: <20260207153703.2049-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace pr_err() calls with dev_err() using info->device to provide
proper device context in log messages. This makes it easier to
identify which device generated the message when multiple framebuffer
devices are present.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 987ba8772..c5eb3e98f 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -388,7 +388,8 @@ static int lynxfb_ops_set_par(struct fb_info *info)
 	var->accel_flags = 0;/*FB_ACCELF_TEXT;*/
 
 	if (ret) {
-		pr_err("bpp %d not supported\n", var->bits_per_pixel);
+		dev_err(info->device, "bpp %d not supported\n",
+			var->bits_per_pixel);
 		return ret;
 	}
 	ret = hw_sm750_crtc_set_mode(crtc, var, fix);
@@ -487,7 +488,8 @@ static int lynxfb_ops_check_var(struct fb_var_screeninfo *var,
 	ret = lynxfb_set_color_offsets(info);
 
 	if (ret) {
-		pr_err("bpp %d not supported\n", var->bits_per_pixel);
+		dev_err(info->device, "bpp %d not supported\n",
+			var->bits_per_pixel);
 		return ret;
 	}
 
@@ -502,7 +504,7 @@ static int lynxfb_ops_check_var(struct fb_var_screeninfo *var,
 	request = ALIGN(request, crtc->line_pad);
 	request = request * var->yres_virtual;
 	if (crtc->vidmem_size < request) {
-		pr_err("not enough video memory for mode\n");
+		dev_err(info->device, "not enough video memory for mode\n");
 		return -ENOMEM;
 	}
 
@@ -527,7 +529,7 @@ static int lynxfb_ops_setcolreg(unsigned int regno,
 	ret = 0;
 
 	if (regno > 256) {
-		pr_err("regno = %d\n", regno);
+		dev_err(info->device, "regno = %d\n", regno);
 		return -EINVAL;
 	}
 
@@ -834,7 +836,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 
 	ret = fb_alloc_cmap(&info->cmap, 256, 0);
 	if (ret < 0) {
-		pr_err("Could not allocate memory for cmap.\n");
+		dev_err(info->device, "Could not allocate memory for cmap.\n");
 		goto exit;
 	}
 
-- 
2.43.0

