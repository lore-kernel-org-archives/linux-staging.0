Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA1772
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 19:20:20 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id k1so17167453plt.12
        for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 12:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uO7kQ42xSTAH3+3Dd4r+058TnMUPwUJwWEreFhwbiJ4=;
        b=XrG6NfXeZJF2h4g6w7+A3bstUDqrEF6qjbBGUEjH4N8/44iFl0VC3sMUocTpGbGzut
         dzKBjRuWT6Oi+cWY9jnprPf9Nth5xSEZqmmW4V2K8glOA3ocQ+L7iHqOcvkKj6xwVuwy
         IKR0JsgSbUvDhozXTRrL5Y0ofAgbXnmityuRrS+Ssq8LNfc0Bk7lg6LgE2UeCGPv4OwS
         0ZcKxpE/IeOOHNMZB8KFg0lwU+GsdSFFQg2zs4wabdICMOh5x0oWrAJiITfXknn8+JMa
         oe2gDrqX375oEST4VKrT6XfARbuTeR2leeTFM5z05Qk+8j8LBtmjTFyOVfPwRbssqK/4
         gydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uO7kQ42xSTAH3+3Dd4r+058TnMUPwUJwWEreFhwbiJ4=;
        b=WYgtNMsOG5kkjKLkskd5ooSGCS0rt12kr57qXYqrdyjNw2VqynipYC8YWbts0fKhIv
         cz73mc35eC8etdIXoUsctT6jH+GVMMfNsWdoahmR+KRrXi6FkmGWfmklhWmXZzsLI0A7
         9o/UM4GftSPIFMSvnkjFOEDkpDxj/szBZcvOWWNzc45+EsvdEDQ4SypG/HdbJadYot+x
         OCuNvMOQMFcZd5jiFXpjetSzNJ+lnGrKgyn0e1NQKWqqIZrQreQSmOk6Hnr2c50bQniT
         XZ+G7j/8KnS7daafnjm+WmRMQemhRDxVW1OS9sVyTY5mcZfQnlzimdxfMsTMvxyZz9RZ
         0s2w==
X-Gm-Message-State: AOAM531MqL4erl2U+AKFmw+hQPWD957e0VplPj9DD+RjJsshf4lOW3Xq
	CidD29+POMRvakNh+JBTEno=
X-Google-Smtp-Source: ABdhPJyx+Om6fO6BkBy8rKT1fjJbR3aHCZ09gTN9jElT1zRxPVnyyxJl0kW2X0Z3cXJU0fejK+/5qQ==
X-Received: by 2002:a17:90a:d816:: with SMTP id a22mr16713760pjv.180.1627413620528;
        Tue, 27 Jul 2021 12:20:20 -0700 (PDT)
Received: from localhost.localdomain ([2402:e280:2130:198:9b25:1cfb:9ff3:2a8f])
        by smtp.gmail.com with ESMTPSA id f7sm4317096pfc.111.2021.07.27.12.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 12:20:20 -0700 (PDT)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Benjamin Philip <benjamin.philip495@gmail.com>
Subject: [PATCH 4/4] staging: sm750fb: Rename vScreen to v_screen in lynxfb_crtc
Date: Wed, 28 Jul 2021 00:49:53 +0530
Message-Id: <52db14bfc2f39e246aed7fdf866845a72e503b36.1627413010.git.benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627413010.git.benjamin.philip495@gmail.com>
References: <cover.1627413010.git.benjamin.philip495@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct lynxfb_crtc has a member named vScreen. This name is
CamelCase and is frowned upon. This commit renames it to v_screen
and makes the necessary changes for the module to build.

This change also fixes the following checkpatch CHECKs:

CHECK: Avoid CamelCase: <vScreen>
454: FILE: sm750.c:454:
+		memset_io(crtc->vScreen, 0x0, crtc->vidmem_size);

CHECK: Avoid CamelCase: <vScreen>
136: FILE: sm750.h:136:
+	unsigned char __iomem *vScreen; /* virtual address of on_screen */

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 18 +++++++++---------
 drivers/staging/sm750fb/sm750.h |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 202d8f47365c..dbd1159a2ef0 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -451,7 +451,7 @@ static int __maybe_unused lynxfb_resume(struct device *dev)
 		crtc = &par->crtc;
 		cursor = &crtc->cursor;
 		memset_io(cursor->vstart, 0x0, cursor->size);
-		memset_io(crtc->vScreen, 0x0, crtc->vidmem_size);
+		memset_io(crtc->v_screen, 0x0, crtc->vidmem_size);
 		lynxfb_ops_set_par(info);
 		fb_set_suspend(info, 0);
 	}
@@ -463,7 +463,7 @@ static int __maybe_unused lynxfb_resume(struct device *dev)
 		crtc = &par->crtc;
 		cursor = &crtc->cursor;
 		memset_io(cursor->vstart, 0x0, cursor->size);
-		memset_io(crtc->vScreen, 0x0, crtc->vidmem_size);
+		memset_io(crtc->v_screen, 0x0, crtc->vidmem_size);
 		lynxfb_ops_set_par(info);
 		fb_set_suspend(info, 0);
 	}
@@ -615,27 +615,27 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 		output->paths = sm750_pnc;
 		crtc->channel = sm750_primary;
 		crtc->o_screen = 0;
-		crtc->vScreen = sm750_dev->pvMem;
+		crtc->v_screen = sm750_dev->pvMem;
 		pr_info("use simul primary mode\n");
 		break;
 	case sm750_simul_sec:
 		output->paths = sm750_pnc;
 		crtc->channel = sm750_secondary;
 		crtc->o_screen = 0;
-		crtc->vScreen = sm750_dev->pvMem;
+		crtc->v_screen = sm750_dev->pvMem;
 		break;
 	case sm750_dual_normal:
 		if (par->index == 0) {
 			output->paths = sm750_panel;
 			crtc->channel = sm750_primary;
 			crtc->o_screen = 0;
-			crtc->vScreen = sm750_dev->pvMem;
+			crtc->v_screen = sm750_dev->pvMem;
 		} else {
 			output->paths = sm750_crt;
 			crtc->channel = sm750_secondary;
 			/* not consider of padding stuffs for o_screen,need fix */
 			crtc->o_screen = sm750_dev->vidmem_size >> 1;
-			crtc->vScreen = sm750_dev->pvMem + crtc->o_screen;
+			crtc->v_screen = sm750_dev->pvMem + crtc->o_screen;
 		}
 		break;
 	case sm750_dual_swap:
@@ -643,7 +643,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 			output->paths = sm750_panel;
 			crtc->channel = sm750_secondary;
 			crtc->o_screen = 0;
-			crtc->vScreen = sm750_dev->pvMem;
+			crtc->v_screen = sm750_dev->pvMem;
 		} else {
 			output->paths = sm750_crt;
 			crtc->channel = sm750_primary;
@@ -651,7 +651,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 			 * need fix
 			 */
 			crtc->o_screen = sm750_dev->vidmem_size >> 1;
-			crtc->vScreen = sm750_dev->pvMem + crtc->o_screen;
+			crtc->v_screen = sm750_dev->pvMem + crtc->o_screen;
 		}
 		break;
 	default:
@@ -801,7 +801,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 			    crtc->line_pad);
 
 	info->pseudo_palette = &par->pseudo_palette[0];
-	info->screen_base = crtc->vScreen;
+	info->screen_base = crtc->v_screen;
 	pr_debug("screen_base vaddr = %p\n", info->screen_base);
 	info->screen_size = line_length * var->yres_virtual;
 	info->flags = FBINFO_FLAG_DEFAULT | 0;
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 8952154739ac..aff69661c8e6 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -133,7 +133,7 @@ struct lynx_cursor {
 
 struct lynxfb_crtc {
 	unsigned char __iomem *v_cursor; /* virtual address of cursor */
-	unsigned char __iomem *vScreen; /* virtual address of on_screen */
+	unsigned char __iomem *v_screen; /* virtual address of on_screen */
 	int o_cursor; /* cursor address offset in vidmem */
 	int o_screen; /* onscreen address offset in vidmem */
 	int channel;/* which channel this crtc stands for*/
-- 
2.31.1

