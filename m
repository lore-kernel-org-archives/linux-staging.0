Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D2523C368
	for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 04:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782017460; cv=none; b=I00trfSLPxuiOcYynNfIJNo3ehNw2sEztleA3hcjeMIlYbPNfhOVhMmyNETyLsESlN8NkZEP67D7Wm9riLOUAeoWIQjbmubtZyez/jDO2JWCdDOqgowTd5EExsABRXV87cI41Kmv2Bry+GU523membmwjcmWFGT8mfg7yAoxunE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782017460; c=relaxed/simple;
	bh=YFAUHjBXI+kFetjkLd/b3rCtVjUhrXZxxVWHVWINm2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uOApPGeWtxkcCTnFo76z51bQWTLbSx8Y2E9eli6OueDo2tKLjenKcfgizHn12MZ4tRd+mwOy6rg7A4pPuz4TPVxbQqXeUOP0fV5dXij82JKih6Ca0fnI6Y/79qfts5z9udi8A21GZlY5CQEiEkFo+/c184NyLt/jz768I8p4jgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qt8ji78J; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qt8ji78J"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so1918762a91.1
        for <linux-staging@lists.linux.dev>; Sat, 20 Jun 2026 21:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782017459; x=1782622259; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s5y1GPeu5P5j8qh7qGP62ln0SsVrjPHUxMxNHCrsfkI=;
        b=qt8ji78Jz8RZA9bhqwrVyjGxA1wknkAtvqLZW5dF+qhfJ9mI+Kbh013C9duD6jOfPH
         Le4T4OYj1CTCXtEJO1rwXkHZz2xbZRrgHaWuteSwcaw3jIDomQRdQZhEUGlRAzmvi7eN
         7mDcW6wPx8cFlG2ckah4LXmFupCA71i4NeiRWPjkKyTk7gYSgMt3qO8FqPDG4vBIgJvX
         TFQLy4FeupbdTPjAFl77TNWTFHOIkbmYZi/Ikup9BoFgrPhoaUn3KrZP+8wJuZcl7JPu
         0L87+H8jFU3iAYOJKLH/SIOF6O1uKrJ7bxCin9eEaiIKZZPyDFmij+3LllgWO/jYmEep
         HK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782017459; x=1782622259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5y1GPeu5P5j8qh7qGP62ln0SsVrjPHUxMxNHCrsfkI=;
        b=Ka5m7Tl6nhXwFGXCAb+u8Dz6Hs/B8dPb/ZB61ym3Ox5sioIZyn6tw+L1BGGDkGWx7x
         27Q/oOW2BZblzks1G6lTmlPAJ4OiL/KbB/Pq0mXi6hFN9NXPBM3GqnDStMzbX4jK0wv0
         KPxuNHbSpy/4PSdayVkBwaxyNV4YTCvz0ecEzdeDw9FFfg1L1aUP41wYNhdNJu4A2LJJ
         cBm4TFg8DpkciN3cN0UatcsUrUhg8o8TMXeVrMUCnjJWHapSn2Uq6qoAUfw9UPakKP1K
         wr2Fmu6KPkpjjGOwzh1zQwwCgkrAU5tu3+1iN5zBEh+bjS5MBG79ApHKQju01oW9rMtQ
         N5ww==
X-Gm-Message-State: AOJu0YzHB2I03ZY5RlXZug7yflHPvHemarSIPUBXXKDaRLwXdOdBuyW9
	6dBeyTKBhp/wMkqDf79RJGfpY6SK8UfkfBW/HJzmavhwpfDJJ1uQhiHx
X-Gm-Gg: AfdE7clxV0jTogZDrH2eGoBmi1R2w0X1owySDrQObmEZvf41Eh38Ds3h4jZtdcAfaL3
	WHzbn6owiOpQhFb/QfQtl5CqPhO7D+b24hnKIvl+2Y1icyEoh+4Q5L6t5mJV0gKy4UU8aI5xMGj
	1t8BJwmk7w9dIvQMdlkR51zYzWB1l4IT1HThTYfbrCyCLHC2DhFZkooIobcvLi79Nr81cFwXjKs
	6dqaY+JxsV8in0Fy07NJRDqArN3KqILsUi+p8sFLfhmwUKGGfyMREJ5n08q5LLP2y2i87huCuPX
	nk0EhtLzDI9U32Zw3jsIo/ZWUErcS84kiRYZhJHE3oN3KyKdosROydWybDX7hiiZxma3EFNxfLZ
	uXUPzOaAgrxA94pJnJ15jZ/OGCcEx1VRTALbyqkudDiHRqaoUtqn4afqffkn18vbnOf3OCggjn3
	jftSsNwrBmwS+7zZkWvKuYuR1ViKIHDB2syAngRPkgHcWr1CoZslC0DBgK0qdeqYvhid/Di2C/v
	fkxzLsU8ck6kIL4+ykXaQhNDu05v6fKFsNXrHE0K0otawkxSV9E+xbJrA==
X-Received: by 2002:a17:902:fc8f:b0:2c6:5bae:f9ab with SMTP id d9443c01a7336-2c718f65447mr104983075ad.22.1782017458605;
        Sat, 20 Jun 2026 21:50:58 -0700 (PDT)
Received: from kapoor.mahindrauniversity.edu.in ([122.184.65.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7444aa5f1sm44061025ad.78.2026.06.20.21.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 21:50:58 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>
Cc: linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [staging] staging: sm750fb: rename pvMem to vram and pvReg to reg
Date: Sun, 21 Jun 2026 10:20:50 +0530
Message-ID: <20260621045050.63460-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix CamelCase issues reported by checkpatch.

Signed-off-by: arnavk23 <kapoorarnav43@gmail.com>
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 19c3da654..125ad1062 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -622,26 +622,26 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 		output->paths = sm750_pnc;
 		crtc->channel = sm750_primary;
 		crtc->o_screen = 0;
-		crtc->v_screen = sm750_dev->pvMem;
+		crtc->v_screen = sm750_dev->vram;
 		break;
 	case sm750_simul_sec:
 		output->paths = sm750_pnc;
 		crtc->channel = sm750_secondary;
 		crtc->o_screen = 0;
-		crtc->v_screen = sm750_dev->pvMem;
+		crtc->v_screen = sm750_dev->vram;
 		break;
 	case sm750_dual_normal:
 		if (par->index == 0) {
 			output->paths = sm750_panel;
 			crtc->channel = sm750_primary;
 			crtc->o_screen = 0;
-			crtc->v_screen = sm750_dev->pvMem;
+			crtc->v_screen = sm750_dev->vram;
 		} else {
 			output->paths = sm750_crt;
 			crtc->channel = sm750_secondary;
 			/* not consider of padding stuffs for o_screen,need fix */
 			crtc->o_screen = sm750_dev->vidmem_size >> 1;
-			crtc->v_screen = sm750_dev->pvMem + crtc->o_screen;
+			crtc->v_screen = sm750_dev->vram + crtc->o_screen;
 		}
 		break;
 	case sm750_dual_swap:
@@ -649,7 +649,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 			output->paths = sm750_panel;
 			crtc->channel = sm750_secondary;
 			crtc->o_screen = 0;
-			crtc->v_screen = sm750_dev->pvMem;
+			crtc->v_screen = sm750_dev->vram;
 		} else {
 			output->paths = sm750_crt;
 			crtc->channel = sm750_primary;
@@ -657,7 +657,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 			 * need fix
 			 */
 			crtc->o_screen = sm750_dev->vidmem_size >> 1;
-			crtc->v_screen = sm750_dev->pvMem + crtc->o_screen;
+			crtc->v_screen = sm750_dev->vram + crtc->o_screen;
 		}
 		break;
 	default:
@@ -755,13 +755,13 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	 * must be set after crtc member initialized
 	 */
 	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
-	crtc->cursor.mmio = sm750_dev->pvReg +
+	crtc->cursor.mmio = sm750_dev->reg +
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	crtc->cursor.max_h = 64;
 	crtc->cursor.max_w = 64;
 	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.max_w * 2 / 8;
-	crtc->cursor.vstart = sm750_dev->pvMem + crtc->cursor.offset;
+	crtc->cursor.vstart = sm750_dev->vram + crtc->cursor.offset;
 
 	memset_io(crtc->cursor.vstart, 0, crtc->cursor.size);
 	if (!g_hwcursor)
@@ -1028,7 +1028,7 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
 		sm750_dev->mtrr.vram = arch_phys_wc_add(sm750_dev->vidmem_start,
 							sm750_dev->vidmem_size);
 
-	memset_io(sm750_dev->pvMem, 0, sm750_dev->vidmem_size);
+	memset_io(sm750_dev->vram, 0, sm750_dev->vidmem_size);
 
 	pci_set_drvdata(pdev, sm750_dev);
 
@@ -1059,8 +1059,8 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
 	sm750fb_framebuffer_release(sm750_dev);
 	arch_phys_wc_del(sm750_dev->mtrr.vram);
 
-	iounmap(sm750_dev->pvReg);
-	iounmap(sm750_dev->pvMem);
+	iounmap(sm750_dev->reg);
+	iounmap(sm750_dev->vram);
 	pci_release_region(pdev, 1);
 	kfree(g_settings);
 }
-- 
2.53.0

