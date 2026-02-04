Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9086F3ED12F
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770206766; cv=none; b=L06Xh/kIhgEHy3ZaGWHyaPXHvus/k7wmPzfG48pW/3HBs8R6JQB+kTJBdd3sQurQ7JM0GX1LRJN5+IcGmjS1dXJEtEbqMPyxZaMu5hfBtpmE3dFLGXf2ilE0VWH4QFFugFcpmoeHopj3R3SQVKFijf2gq7SdV4yAmp27vvh6QPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770206766; c=relaxed/simple;
	bh=DiQrtXvSp9eCQt1h9ogElyp0Cqb3r6cauWeWpSKCUzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0hO0ye6eruboCrZSRjMCrBUwJKV9in4vDeMkVkic7a7ojOtX/aivLdKmvGbH4HzSIJ49pQU38tN5XATA4k/RBaYMsZ8EaTzaBa8An8UrA8ba3EOh/PlZQds6qefeT0ch23WlM4lIvdpZs4KGWjePuVSiCrFDUtoZFSxGlbilwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+V64cXF; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+V64cXF"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8eafb515aeso41038766b.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 04:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770206765; x=1770811565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8d7hAmMNj9Zk28HsG7cVWd/Fe/+w30W4GTBLy42O7s=;
        b=D+V64cXF6dvFqQgS/phOWmsDLxzzZu9micLyzC8dVBjFnFFN5TWjQ2skHw4CRXromh
         MeFouIZZte2OphBj+rPDfVWWY4c3IHt/RSXisHq+xs+bqkYjSFXk90MhkTCgD5wfhHaN
         3nktGhcVqtyBOzY/gBRxpwQwfhvlCMurQCw3DjsVqVWLEpmpgEH6aNDUCNmGhrG6dSxm
         1s2np501LiLZSeSj2UKH03w52muHGMM4QipFKHK/iN6vHkumfKGCetqo+aHk0VK2Wuam
         uL1xKq8cM35KbQnpIsDx3I2W2LvM0scki54zNm5oqF4LypAxnRaWrpcCrSJMO9O//T3M
         cnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770206765; x=1770811565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e8d7hAmMNj9Zk28HsG7cVWd/Fe/+w30W4GTBLy42O7s=;
        b=G2z3qcTY5uR2R5KRwErhbO0znMnQG++jAzjFztMFKAKHXxAIIOLA2pxfrS7ZUZ4oRS
         PrGiVHwPwdttaB37OLQyCceH7RD/yWIG4JR77KFL4PcvUnYTFYcb0spq6myuNBF4dj4w
         22muTzGOmH+YvjqCDf5p7FYFWuT3i21aHt8Fs005ahI1EBhIo8PMbH8hhUFmK1TPdt52
         7MqsgJObbPvYqvJ19i9T8LHOJYx+VtvX3XAj6YQZg16QNfYVtftGs4toMkenw1A8SLTf
         0cMriepwBKcpoi5Rn6aE1IWDx7Zpel4/rlT/Ib2UgrPF2CTNBAoNFbuPZ5HoL2ShNy5l
         nZkA==
X-Forwarded-Encrypted: i=1; AJvYcCWAakGRK2dxQ7rx/uG9a70EiLDAs3NT+uGGgZ9i7rYWfKOLFCwrh2X0FIIO1Zf0IlT5B/lh36AtuwIhh+3e@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3VUtkuTrWalqT5J+gmpVy7Dm+WeJ/XCS1tQ17LQ8gU473eR/N
	G3VEsDdlYHVHg3kkXlVzIEFmsc+GnvfHpgWfsIXeAXqsmxdsO2IduXZw
X-Gm-Gg: AZuq6aI29mkeeWH3kn4iCOEayhKNA3MWWguaBmACDj0RvYPTrzLcsNqLgdeyokwm6Rs
	mSPvwAQJj399u4os5Firsjk2nRgja1PG7wDhKelR2J+x8Y5bzG44R06KywwhmX9nDt5TB5bXzuT
	DrBuRX5M72dKMRV75T5bxN4jLM7KR/+YCKU09nSEqNmEKQgBVeBwySpbWFYUt6lK+JYidsKGc9m
	duT+VrLieul5TqPBdvEJE7dEVP5L0/Clk2tkQQhI0xv5Oq8LlWqtBs77G7XeoDR+8twEGvTaSr9
	GIM+uTl+Y7C9vhsaOegPtitSV+xlQOEWrkqkJdrf+hiQEyLwWmjdmJuaZnSEF8p6r6uxZwDvkjI
	AeDRMDqEm24z7PrbSj9+WPK/1xNMVPhdS1L4yvACdxOqKSBHWMYPk1wwc9U90EKvgxUmGwkOIrV
	Rg1k9uag6/ZnF3ZzYhS5dWt4cbpMz3uZcdfUArrpEUpFhc45C5W9FCjdl2z0YUVt/u+h6qrJifN
	fcvIlwX/LIzUSkXtOP80tFtElE8FgrrS4pHB0kUDiVIiPM//IJ+G1xX3LM=
X-Received: by 2002:a17:907:72d0:b0:b87:6:371d with SMTP id a640c23a62f3a-b8e9f42bb01mr200801866b.49.1770206764658;
        Wed, 04 Feb 2026 04:06:04 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.od237066db22328bb-tp.internal (216.79.91.34.bc.googleusercontent.com. [34.91.79.216])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fcd8be3sm117979666b.10.2026.02.04.04.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 04:06:04 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v3 4/5] staging: sm750fb: convert logging to device-based in sm750.c
Date: Wed,  4 Feb 2026 12:06:01 +0000
Message-ID: <20260204120602.6715-4-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204120602.6715-1-iprintercanon@gmail.com>
References: <20260204120602.6715-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert remaining pr_err and pr_warn calls to dev_err and dev_warn
using info->device where struct fb_info is available. This provides
proper device context in log messages.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 050408af2..1561fa5fe 100644
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
 
@@ -793,21 +795,23 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 				   pdb[i], cdb[i], NULL, 8);
 
 		if (ret == 1) {
-			pr_info("success! use specified mode:%s in %s\n",
-				g_fbmode[index],
-				mdb_desc[i]);
+			dev_info(info->device,
+				 "use specified mode:%s in %s\n",
+				 g_fbmode[index],
+				 mdb_desc[i]);
 			break;
 		} else if (ret == 2) {
-			pr_warn("use specified mode:%s in %s,with an ignored refresh rate\n",
-				g_fbmode[index],
-				mdb_desc[i]);
+			dev_warn(info->device,
+				 "use specified mode:%s in %s, with an ignored refresh rate\n",
+				 g_fbmode[index],
+				 mdb_desc[i]);
 			break;
 		} else if (ret == 3 || ret == 4) {
 			continue;
 		} else {
-			pr_warn("ret = %d,fb_find_mode failed,with %s\n",
-				ret,
-				mdb_desc[i]);
+			dev_warn(info->device,
+				 "fb_find_mode failed with %s (ret=%d)\n",
+				 mdb_desc[i], ret);
 		}
 	}
 
@@ -855,7 +859,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 
 	ret = fb_alloc_cmap(&info->cmap, 256, 0);
 	if (ret < 0) {
-		pr_err("Could not allocate memory for cmap.\n");
+		dev_err(info->device, "Could not allocate memory for cmap.\n");
 		goto exit;
 	}
 
-- 
2.43.0

