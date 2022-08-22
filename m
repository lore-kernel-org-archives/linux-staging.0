Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C361256C
	for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 15:41:48 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id u6so3812050qvp.5
        for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 08:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc;
        bh=cRvGK+nfZIMwtiejaDileiwHPvBs7s1NtuCURg1xkOE=;
        b=jrIMSLP1O0YpmecScYkEyzJrB11luBCBk7dY8gXgO+9dVe6uTS9YjcXSs+Ta5OH1sV
         dXHvi7zstA8c4+yeoSq6Ynqtg3+Pt1rYjxvkNcbx5rOihOE/RiUAWJp5bdf7H+4uz8tk
         KywVzWly9gjOTSr8FzpDKLVQUOBlSeikDyiCQGM5ouYLMl1N7a5sOj8e6Dn3mZIlfqrg
         doR5BHOHDXum4QOY+Kpf43/7h9SwVIYRj9yIktK86uPksWD11jIlT93UN5hUZFtKRE9W
         Qoh6Pa7XE+GeU5tV50GZL695dNnS9HEKr2xWG2d7cAMi/OeM/Hp8umiCVKxSfLsjeu2Z
         e5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=cRvGK+nfZIMwtiejaDileiwHPvBs7s1NtuCURg1xkOE=;
        b=VAB8s0GmHtExXmy/4/6RKWWdM6srH7Iogn64c6FICMCdnT894cYsMzjCBNksPiv1SN
         1OGKXWjCf6TYwwmcOm/5CBcdPeDeK/9FD5bFgx6E8992Oe3tHGt8hJOl2PzLknuHBd71
         47jgf7Zrcunt5Xg7Lb6MWAkyIAKcAgKHYnZ+TwkwxncpvkkJufhH7+6bOGepGJ2a6PNj
         FQ+eS0HBqbkLNz0A8iU4Rsk8xlg6O/IxHrLS+lCvbfMg3kgPkvXuEqqjUmzHBlPTTD1e
         XHWRhZN4KBgtB+aUQWP/62rNHrAIeUE3/w1eF4g/82RSYinkeDH9NaHSbDZtUOiyq18I
         XQYw==
X-Gm-Message-State: ACgBeo3W2S3SbrBWVMr6MehjndYSCwJVVM74fwphXIKl6edlDROOA3/4
	zILh/ZgFzaktYD3Mko3Sk7k=
X-Google-Smtp-Source: AA6agR76hATzF/fDLbd6N41mySAOy78wgkBSUZiZKFl8do1rkquH1626SX3sseMpeZ7SIVjZHhCKWA==
X-Received: by 2002:a05:6214:e68:b0:474:89bf:ca1b with SMTP id jz8-20020a0562140e6800b0047489bfca1bmr16197681qvb.107.1661182907114;
        Mon, 22 Aug 2022 08:41:47 -0700 (PDT)
Received: from valhalla (2603-7081-5203-61c3-0000-0000-0000-1449.res6.spectrum.com. [2603:7081:5203:61c3::1449])
        by smtp.gmail.com with ESMTPSA id u5-20020a05620a0c4500b006b5e296452csm10854329qki.54.2022.08.22.08.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:41:45 -0700 (PDT)
Date: Mon, 22 Aug 2022 11:41:43 -0400
From: Christopher Carbone <chris.m.carbone@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] Split multiple assignments to individual lines.
Message-ID: <YwOjt+ZrQkKFGRH9@valhalla>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: multiple assignments should be avoided

Signed-off-by: Christopher Carbone <chris.m.carbone@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index dbd1159a2ef0..a0f8ae359248 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -386,7 +386,8 @@ static int lynxfb_ops_set_par(struct fb_info *info)
 
 	ret = lynxfb_set_color_offsets(info);
 
-	var->height = var->width = -1;
+	var->width = -1;
+	var->height = var->width;
 	var->accel_flags = 0;/*FB_ACCELF_TEXT;*/
 
 	if (ret) {
@@ -498,7 +499,8 @@ static int lynxfb_ops_check_var(struct fb_var_screeninfo *var,
 		return ret;
 	}
 
-	var->height = var->width = -1;
+	var->width = -1;
+	var->height = var->width;
 	var->accel_flags = 0;/* FB_ACCELF_TEXT; */
 
 	/* check if current fb's video memory big enough to hold the onscreen*/
@@ -723,7 +725,8 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	pr_info("crtc->cursor.mmio = %p\n", crtc->cursor.mmio);
-	crtc->cursor.max_h = crtc->cursor.max_w = 64;
+	crtc->cursor.max_w = 64;
+	crtc->cursor.max_h = crtc->cursor.max_w;
 	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.max_w * 2 / 8;
 	crtc->cursor.vstart = sm750_dev->pvMem + crtc->cursor.offset;
 
@@ -1027,7 +1030,8 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
 	if (!sm750_dev)
 		return err;
 
-	sm750_dev->fbinfo[0] = sm750_dev->fbinfo[1] = NULL;
+	sm750_dev->fbinfo[1] = NULL;
+	sm750_dev->fbinfo[0] = sm750_dev->fbinfo[1];
 	sm750_dev->devid = pdev->device;
 	sm750_dev->revid = pdev->revision;
 	sm750_dev->pdev = pdev;
-- 
2.37.2

