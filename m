Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE03B32ED34
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 06:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778394564; cv=none; b=PrKx+p+JH/XkDqdJNONfbiUOc6SX9lsCQHKwsKD3P/1D/UveY90FCLVlI6VhpGz6QwEotRFMRA56CcTCA++/zgzk80Wx4f+HEkiWFzrMH4wEXQINXBY4/C0jty26CtJntwRytnHC/+ooed5GEq3lKgffU9KwYifIotWQze/MqgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778394564; c=relaxed/simple;
	bh=gyUzQiP2RdGVTqgVnpxgocRdlWLbG6gxXt5F74z9qOw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vEME5z+ppy3nc2o5ESCzz2/ULp90fvJmA3st5FFsjAOhH7s+0v+/xDK6CXznHokkNWupNnpWJroekD/TkGj1Giy9IJi+e2iPRQLPGtBJGx7ENPivFqdhddTFDHkxtnjHy9NrdfT7shmObTaG6QgBo0dSks4TYeeNr3DEEHKjkZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJJtFfcu; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJJtFfcu"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c156c4a9efso4342406eec.1
        for <linux-staging@lists.linux.dev>; Sat, 09 May 2026 23:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778394561; x=1778999361; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQwsZ8BQclhXzHicGkFvCsOoY46y5DAf0Cjn5Pzp67A=;
        b=IJJtFfcu3C3EWQVYLN6zZTF3MOTb4BFbEbHRTIsDpiNiYCsRouFKiPXiGoY6vIE2J0
         5CPsa4VGbEC7xKht/ZQwf650/9Jt2ruAASF9DcS5pMbDcauu6nml7NIbZc9x5+1ti0rP
         8j9i7f9XgkGnUm5SanacqVzy0TlHUfmzOr0LUL9+eg6tFZstcHAoNSXXeQ9Bc+5B1FZb
         GUdeIz4Pi6QLTuP/bZQG34HXwnLeB74xGjAAW/78ksN3vApzAs/OTNkOV5snHCmqC7PR
         yjgIE6/yn9FldjSa3mLJZI+VwTbNimtb80XDeL8XxF9Huz2ppyaSEm57Oda1/jHvkhlK
         QxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778394561; x=1778999361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQwsZ8BQclhXzHicGkFvCsOoY46y5DAf0Cjn5Pzp67A=;
        b=dD9p1BztE6+0dxU35F4hA+Rv6V0Arj8lI1L0Ao0AZcCTKSj2f2btuwW2gLrGmnBfCU
         Wy4siGE2k7YI5eW95q/LWqGbRM9nqlwaerFYS44StmsJhxORAEZq5uYatT+3BZbtnq8q
         OpXW+uLGxKobCfx0oyfTNrfMhkAt5Ok33f34Ylkf90WzsvM1DVDBLbO/s5yt/L0zEWyo
         ujnKwwbXqeid2oj5vKZIWXhXCv7h8FfaFJisBOp3MJN6mIf7LyL3abUPcgq+BhtK0dzz
         b82J3rP6p9W/LMWkOZux9avKq0oab7RpU32TFHII3PGkH+Sh5LPcf0FJ3uU2rJIM3kbC
         oQiQ==
X-Gm-Message-State: AOJu0Yw9RQYwzNWbzWA849akL3hGeRkRBoAGQOFUPahZfsfrceWUQOfD
	nKEVcgI0o124N/eJew8Xi6EyJbfBz/gQRz7f46WlI1zWfPHarBaa2TUjkNaxLw==
X-Gm-Gg: Acq92OFK0arGdy+qy5PEnC+Nm/UT0w+6jw3xb5Pfe2qP0ZfKc8NApNI2pN2+QNJWRxr
	YutH+GnlII5KIGu1Tfqg/CTXCtGQVRh1tz1leQQK56eZpRMqkG4u3w4ByH/ZNR2PIGVh71oL16B
	Mgit19zZr47QPMICCVvhnaoM/3A+feei8LzE2P8JgzUrQfJ0O3g9Z6AVJkMG+3qils34QzOspYF
	TS0NcrhLGUQ6fMr79cun8tIFQHEvx98wOBTA95IuodWu10BZyp7A6veEuddVIvJ5wMuYyMs7LO4
	ud1Eqt51/JORkrT++68hmAnk2cF1BZS3a1PWA834nr0ZXM4kc0OJWi35IqWgGweOtbcQPdOJXr/
	naWTD91t8Qu6GOOT5r/Mql25sXi/OHhpWgPBm6wNyVfdfm0ZhoSFZEARLmOXtTi/S/2saV+lzjn
	iiNR49KsP7arfWZGnyehTP1RDDsS7a24Kl7KVHHTniKaU=
X-Received: by 2002:a05:7300:8b84:b0:2d9:6373:ad24 with SMTP id 5a478bee46e88-2f5508508d7mr9349787eec.26.1778394561217;
        Sat, 09 May 2026 23:29:21 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-2f8893441absm11666347eec.31.2026.05.09.23.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 23:29:20 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH 1/2] staging: sm750fb: rename CamelCase variable and drop prefix
Date: Sat,  9 May 2026 23:29:07 -0700
Message-Id: <20260510062908.67848-2-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260510062908.67848-1-guojy.bj@gmail.com>
References: <20260510062908.67848-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames the CamelCase variable 'pvMem' in struct sm750_dev to 'vmem'.
Dropping the pointer prefix 'p'.

This fixes the following checkpatch.pl check:
CHECK: Avoid CamelCase: <pvMem>

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    | 18 +++++++++---------
 drivers/staging/sm750fb/sm750.h    |  2 +-
 drivers/staging/sm750fb/sm750_hw.c |  4 ++--
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index fadba95850be..d8cb9fce268d 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -622,26 +622,26 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 		output->paths = sm750_pnc;
 		crtc->channel = sm750_primary;
 		crtc->o_screen = 0;
-		crtc->v_screen = sm750_dev->pvMem;
+		crtc->v_screen = sm750_dev->vmem;
 		break;
 	case sm750_simul_sec:
 		output->paths = sm750_pnc;
 		crtc->channel = sm750_secondary;
 		crtc->o_screen = 0;
-		crtc->v_screen = sm750_dev->pvMem;
+		crtc->v_screen = sm750_dev->vmem;
 		break;
 	case sm750_dual_normal:
 		if (par->index == 0) {
 			output->paths = sm750_panel;
 			crtc->channel = sm750_primary;
 			crtc->o_screen = 0;
-			crtc->v_screen = sm750_dev->pvMem;
+			crtc->v_screen = sm750_dev->vmem;
 		} else {
 			output->paths = sm750_crt;
 			crtc->channel = sm750_secondary;
 			/* not consider of padding stuffs for o_screen,need fix */
 			crtc->o_screen = sm750_dev->vidmem_size >> 1;
-			crtc->v_screen = sm750_dev->pvMem + crtc->o_screen;
+			crtc->v_screen = sm750_dev->vmem + crtc->o_screen;
 		}
 		break;
 	case sm750_dual_swap:
@@ -649,7 +649,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 			output->paths = sm750_panel;
 			crtc->channel = sm750_secondary;
 			crtc->o_screen = 0;
-			crtc->v_screen = sm750_dev->pvMem;
+			crtc->v_screen = sm750_dev->vmem;
 		} else {
 			output->paths = sm750_crt;
 			crtc->channel = sm750_primary;
@@ -657,7 +657,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 			 * need fix
 			 */
 			crtc->o_screen = sm750_dev->vidmem_size >> 1;
-			crtc->v_screen = sm750_dev->pvMem + crtc->o_screen;
+			crtc->v_screen = sm750_dev->vmem + crtc->o_screen;
 		}
 		break;
 	default:
@@ -761,7 +761,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	crtc->cursor.max_h = 64;
 	crtc->cursor.max_w = 64;
 	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.max_w * 2 / 8;
-	crtc->cursor.vstart = sm750_dev->pvMem + crtc->cursor.offset;
+	crtc->cursor.vstart = sm750_dev->vmem + crtc->cursor.offset;
 
 	memset_io(crtc->cursor.vstart, 0, crtc->cursor.size);
 	if (!g_hwcursor)
@@ -1028,7 +1028,7 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
 		sm750_dev->mtrr.vram = arch_phys_wc_add(sm750_dev->vidmem_start,
 							sm750_dev->vidmem_size);
 
-	memset_io(sm750_dev->pvMem, 0, sm750_dev->vidmem_size);
+	memset_io(sm750_dev->vmem, 0, sm750_dev->vidmem_size);
 
 	pci_set_drvdata(pdev, sm750_dev);
 
@@ -1060,7 +1060,7 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
 	arch_phys_wc_del(sm750_dev->mtrr.vram);
 
 	iounmap(sm750_dev->pvReg);
-	iounmap(sm750_dev->pvMem);
+	iounmap(sm750_dev->vmem);
 	pci_release_region(pdev, 1);
 	kfree(g_settings);
 }
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 49a79d0a8a2e..2c9038d38b3c 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -98,7 +98,7 @@ struct sm750_dev {
 	__u32 vidmem_size;
 	__u32 vidreg_size;
 	void __iomem *pvReg;
-	unsigned char __iomem *pvMem;
+	unsigned char __iomem *vmem;
 	/* locks*/
 	spinlock_t slock;
 
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index beef05ded98d..73bde37ebc90 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -66,9 +66,9 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	sm750_dev->vidmem_size = ddk750_get_vm_size();
 
 	/* reserve the vidmem space of smi adaptor */
-	sm750_dev->pvMem =
+	sm750_dev->vmem =
 		ioremap_wc(sm750_dev->vidmem_start, sm750_dev->vidmem_size);
-	if (!sm750_dev->pvMem) {
+	if (!sm750_dev->vmem) {
 		dev_err(&pdev->dev, "Map video memory failed\n");
 		ret = -EFAULT;
 		goto err_unmap_reg;
-- 
2.34.1

