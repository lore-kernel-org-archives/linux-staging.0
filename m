Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3192BE7AC
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 01:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550319; cv=none; b=K3UoN83ISa2WfUSVfcOwgghDQUEdqdPj9qkAgtlVUddUZpNdVACrgoW1+MSZh5dmxoRwRsV0vJIFTJzTBhSvp3apr14f1+d4YE4G2ALnh4Bv/27vbPycyQ8DnKyY+wknC0sLSoYHfzP5SjInPCdZZfhgZEL9pe9GvL/HVg5JiJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550319; c=relaxed/simple;
	bh=YxgDZVqMtyl56UCDKSwzuZdYVkyDLcSvULyv0SuvHI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jnh3DAHnkzWXl6axyez6gQt9CRrrwe3lZp2XWr9qEtrw7lDRXUpFHpIbgnJja3u5z65JdoqxaJtxtW3wMdZMp3BecXShHDvql3QZnm5M/k0BCW0hdmdl8YYJYj5lQ3Q/R+cg3sSK/Z5ECqMcLqp8QB7jN5Ej1VbP5xe9Qr3n2vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDxyRpQY; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDxyRpQY"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ecf9e398f4so13521856eec.1
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 18:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778550317; x=1779155117; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OXCU/htQ+8Rp3JW/PnjUI+XPGJxr+8fcjyipcOXBdks=;
        b=kDxyRpQY5NVpVD9BJ6tP2NnEipNJOpwnZ2hzSe03Cx950c06VJlr1jG3AzAhYEZxHT
         D5cmz/t265BPQxCamqNYp7m8bnsZKXqlr0UOwMeCn+24Cr1jjVguD7kZ+LRYA3Jlw5un
         SC4M0ktVcZH06K5clSX/LOZLAsPaE/8xVUql6pucazX02nKeZbu8t9ojNySyv1tfWe9w
         +FnwL/IlaoEXXmd6+z5huy712+3XO9qmvtrUReV68zB7wIDctl7K/R22JbA48g1djLZB
         uPMZZz8THMB+UzGf1xIQfPceMq/zoV8ToEUgYcIDJ0ttQ60NBGl4Rnega0q7i6D02obT
         LvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778550317; x=1779155117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXCU/htQ+8Rp3JW/PnjUI+XPGJxr+8fcjyipcOXBdks=;
        b=m8GGorlOWTZwvohK56P9WvQa/wGc5ojG/bov4R/xqA/CoXxsDRR7sybJruMmm93/8Y
         Ts2vKtlLEd3M7Rbgwf1uSXLpcyUNwJAOmE/igFQfRFvzYRS2pKTTcsqHo9PGXn0mily+
         dMizEyNMUkChB6T6aHdxkA3F7ldiEappX82a+DNxQjF94V547Wx+0f+EKftii2P0gTx4
         OTS9UKhNQZpRpeCj+fRw6Y8jq4PdRxDg6OWDJRDXNpDhZ+oUr8uxoiYQE7b6XdrU3VkW
         8inqxmLn2ZQztCM3jj1YKkEGtPYz0btvMnuu41E0Jb/B0E/tT/Aydnk2Nt07Xho/Alz6
         ay0g==
X-Forwarded-Encrypted: i=1; AFNElJ96DWRhiwK/BGHptPgQNu8OVcGpMnsQPn78GFw4LJ3wSb4o1CLgy+SNBqafRbt5Q4PtZPNp79OiQ8Knox2R@lists.linux.dev
X-Gm-Message-State: AOJu0YxeH9XPXtGp0ynWMlqRzCe7BMdk/LOMd8cJCnjVomC4p5KQeARQ
	4JjpU9QBnyIOUKertTXQjXEHNx+tDFdMnrNk4mGc92YrJVhe41sMuU/y
X-Gm-Gg: Acq92OEnAIIzKzpvOSocaQVqWw8o17wt7BPaKUbvYQr6E66Mj5dWzwID9xqz5XKC4xZ
	qEfgZawFe4MstaiSONGSpbIJCI2aSiwQ4KaJPVWrKMCqBJbkCoo4pHolfm+0EeoEbmW97fO+xM/
	dRlynkcQezv1t3G8o2IwVrCsbquBnulsn85HyhUSG3qlwGOPkZc+vTTxreEZzgGwAx4F5hqMYnF
	nJJvqP9uh0DnqJLDZFe5ZJy92Vg7n1AIV2fVIj4IGTo5SJs+DsLjZ9DNPoFeDo8jl5tdNSscBPZ
	8fOSCl4dzun0VZEARq0V8r9YIWjLLR7I87k6MeaynMAmNLQ2spQQqd8x8KNwUMnHTZF+8/WOLbY
	/9iuNS7m5UfIFK3B0l9hr+Uge0u2IYIgNfYY8vPZTjBq/c1fOa6hlLg+Fbw1LtvMsdh0YCVAo8G
	4dZpqHHqxFzQ5oqo6Jqucu94xvTY1wzuCCHimoptlAd1we0V+x7rRPCfGQatfy5HFc27BHjZxxx
	jc6Uoo=
X-Received: by 2002:a05:7300:6da5:b0:2ed:e12:376e with SMTP id 5a478bee46e88-2f54d67a686mr13643905eec.30.1778550316712;
        Mon, 11 May 2026 18:45:16 -0700 (PDT)
Received: from localhost.localdomain ([50.231.3.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eafcdsm20104427eec.6.2026.05.11.18.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:45:15 -0700 (PDT)
From: Shayaun Nejad <snejad123@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Shayaun Nejad <snejad123@gmail.com>
Subject: [PATCH] staging: media: atomisp: bound DVS 6-axis config copy size against allocated grid
Date: Mon, 11 May 2026 18:45:14 -0700
Message-ID: <20260512014514.22856-1-snejad123@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atomisp_cp_dvs_6axis_config() copies user-provided coordinate arrays into
a 6-axis grid allocated from ISP dimensions.

The copy sizes are computed from the user width and height fields, so
mismatched or overflowing dimensions can copy past the allocated buffers.

Reject dimensions that do not match the allocated config and compute the
copy sizes with array3_size() before copying.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Cc: stable@vger.kernel.org
Signed-off-by: Shayaun Nejad <snejad123@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 84 ++++++++++++-------
 1 file changed, 52 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575d..677037f1da 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/kfifo.h>
 #include <linux/pm_runtime.h>
+#include <linux/overflow.h>
 #include <linux/timer.h>
 
 #include <asm/iosf_mbi.h>
@@ -2570,6 +2571,29 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 	return 0;
 }
 
+static int atomisp_dvs_6axis_size(struct ia_css_dvs_6axis_config *config,
+				  u32 width_y, u32 height_y,
+				  u32 width_uv, u32 height_uv,
+				  size_t *y_size, size_t *uv_size)
+{
+	if (config->width_y != width_y ||
+	    config->height_y != height_y ||
+	    config->width_uv != width_uv ||
+	    config->height_uv != height_uv)
+		return -EINVAL;
+
+	*y_size = array3_size(width_y, height_y, sizeof(*config->xcoords_y));
+	if (*y_size == SIZE_MAX)
+		return -EINVAL;
+
+	*uv_size = array3_size(width_uv, height_uv,
+			       sizeof(*config->xcoords_uv));
+	if (*uv_size == SIZE_MAX)
+		return -EINVAL;
+
+	return 0;
+}
+
 int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 				struct atomisp_dvs_6axis_config *source_6axis_config,
 				struct atomisp_css_params *css_param,
@@ -2582,6 +2606,8 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 	struct ia_css_dvs_grid_info *dvs_grid_info =
 	    atomisp_css_get_dvs_grid_info(&asd->params.curr_grid_info);
 	int ret = -EFAULT;
+	size_t y_size;
+	size_t uv_size;
 
 	if (!stream) {
 		dev_err(asd->isp->dev, "%s: internal error!", __func__);
@@ -2628,35 +2654,32 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 				return -ENOMEM;
 		}
 
+		ret = atomisp_dvs_6axis_size(dvs_6axis_config,
+					     t_6axis_config.width_y,
+					     t_6axis_config.height_y,
+					     t_6axis_config.width_uv,
+					     t_6axis_config.height_uv,
+					     &y_size, &uv_size);
+		if (ret)
+			goto error;
+
 		dvs_6axis_config->exp_id = t_6axis_config.exp_id;
 
 		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
 					t_6axis_config.xcoords_y,
-					t_6axis_config.width_y *
-					t_6axis_config.height_y *
-					sizeof(*dvs_6axis_config->xcoords_y),
-					from_user))
+					y_size, from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->ycoords_y,
 					t_6axis_config.ycoords_y,
-					t_6axis_config.width_y *
-					t_6axis_config.height_y *
-					sizeof(*dvs_6axis_config->ycoords_y),
-					from_user))
+					y_size, from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->xcoords_uv,
 					t_6axis_config.xcoords_uv,
-					t_6axis_config.width_uv *
-					t_6axis_config.height_uv *
-					sizeof(*dvs_6axis_config->xcoords_uv),
-					from_user))
+					uv_size, from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->ycoords_uv,
 					t_6axis_config.ycoords_uv,
-					t_6axis_config.width_uv *
-					t_6axis_config.height_uv *
-					sizeof(*dvs_6axis_config->ycoords_uv),
-					from_user))
+					uv_size, from_user))
 			goto error;
 	} else {
 		if (old_6axis_config &&
@@ -2680,35 +2703,32 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 			}
 		}
 
+		ret = atomisp_dvs_6axis_size(dvs_6axis_config,
+					     source_6axis_config->width_y,
+					     source_6axis_config->height_y,
+					     source_6axis_config->width_uv,
+					     source_6axis_config->height_uv,
+					     &y_size, &uv_size);
+		if (ret)
+			goto error;
+
 		dvs_6axis_config->exp_id = source_6axis_config->exp_id;
 
 		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
 					source_6axis_config->xcoords_y,
-					source_6axis_config->width_y *
-					source_6axis_config->height_y *
-					sizeof(*source_6axis_config->xcoords_y),
-					from_user))
+					y_size, from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->ycoords_y,
 					source_6axis_config->ycoords_y,
-					source_6axis_config->width_y *
-					source_6axis_config->height_y *
-					sizeof(*source_6axis_config->ycoords_y),
-					from_user))
+					y_size, from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->xcoords_uv,
 					source_6axis_config->xcoords_uv,
-					source_6axis_config->width_uv *
-					source_6axis_config->height_uv *
-					sizeof(*source_6axis_config->xcoords_uv),
-					from_user))
+					uv_size, from_user))
 			goto error;
 		if (copy_from_compatible(dvs_6axis_config->ycoords_uv,
 					source_6axis_config->ycoords_uv,
-					source_6axis_config->width_uv *
-					source_6axis_config->height_uv *
-					sizeof(*source_6axis_config->ycoords_uv),
-					from_user))
+					uv_size, from_user))
 			goto error;
 	}
 	css_param->dvs_6axis = dvs_6axis_config;
-- 
2.43.0

