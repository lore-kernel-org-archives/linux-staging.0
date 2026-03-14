Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486DE314D35
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 08:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773475806; cv=none; b=cwXgLHxqjvQ4Khe8dKh4cJekOOAzruEhVHpvQWwCB47VJxf84n9PevLlNAo8UAiziRva3V4q8XDSwoPg0w9xJArhI4bYOaeHYWVZkXaiehjhmS8aQpBBq2r55urDUO3vbzqC9QSrnZvytBgqqB0RxQhmKtYusXz74qM6u3xFSW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773475806; c=relaxed/simple;
	bh=u73qQwGF5sga5NfxOUpUjAEhQky3bXwXMtnc3QKj0P0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YwiG7W5e3D+Oeo3CiXeFUryZFoBkxThIdHxdhyU+cNGhdyOeyURVl9lGcmoyPf3O7Hdj3xAvIlNF3ie2euYOpUBh1BDuBaA+8Cd7rKr3JoovDRujwM7JNJYYxRiPt4ByfRYsyJ90RUnVPE+903prcum+w4EhjGcjjLeIIW+avm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAVhkmpw; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAVhkmpw"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c7382731edfso2007620a12.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 01:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773475804; x=1774080604; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeIgkxwl9JJwWuwyECyvmWjJWhOSc5N2s3Zcd0cjeZo=;
        b=EAVhkmpw+eLi3Y4Zf3bVkwtvMK1qlChpuGoHzCOQka6kVpa7OG8xSMTpsFt8S+Ljhr
         iwDyEovoEPUR9p+iUob/f5IQQAlLmr2lIfOrjUVsRj2jD5yV8sKHYxsN6F3r53oKgAbi
         TdQyXafCaBZqNBSgBJugCbUQ8UzXGPs76b13eYLSVNFfqtqqit6PwDFZc3zYsibggoRy
         3VKrd9ehxxYpIirofwaTh8YAFemZCSIdMLvmGH9YWADPaogQytqVqDlckgTNXGKWWV6P
         B8vXZl11gVghWlEw8woBTpbI8RJWbWyV9+3viMTuj/5kmKd4qDmQXYaKg29yMohwCHxH
         VaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773475804; x=1774080604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KeIgkxwl9JJwWuwyECyvmWjJWhOSc5N2s3Zcd0cjeZo=;
        b=VX5SM6aMMWMik+JeOb4lDWbPzNi9ov279NB4wNcuPMwFLJ2G0gXjyKUxfcxdyS2hxw
         HOxHsS8iZklVvYvPdQUwAhB80va2aNwj8HuMbvKAI9rpj1E0+jd+F7ZMUOaI67lg2Of+
         KSWqrYncJRJNlNWvVgCU4bLrsIWh2gY2Jzrb7qMdxISDLfx885gTTZ+1hQqq+g5kSL8y
         jWUFE7anSFr1o4TfhATlDl2vxmG3p43ksMiJaxcsCpm7D4JXtaDq6t+LO5M6/umbXmZg
         jBvwTqCvdY//EudQUONDFywsoiFV54vm7NVIkgkN2Tg4xpNoYV0nuOm2rtwfQOzVHz6J
         farw==
X-Forwarded-Encrypted: i=1; AJvYcCVRWKUfzrYHgOqhaWoj7AA9qRQORbGPhDzfMV7QXCGi0prdMT3rhMeF1b3kCs+NRKpfewKM1GCppUJzPnTH@lists.linux.dev
X-Gm-Message-State: AOJu0YykmZr5+eKQtzdrpTzR4LkeFQG/WV/9YI/5+0gQGg15fiInLTVv
	DXkadvAQmaAzbc/SW1TTh9RB7dn3Od8QAhqVCqMZNMEk26n90fKsD5IpV3UzU84oS7E=
X-Gm-Gg: ATEYQzwmE1fLCxLNDCrtOXiiisl2tOe/YCZ7cMTQpJSeMhqy9pgST8Y9gi1Tzg+n87B
	BcBJJ//TdhxFb4ORJTlkyH7hg8Cp8LZYm286qQTTVqpqSrUxCvKEWU9Lzowrz3DP199O7DayoTS
	RJmUk3avFiRoVbaraFDss8MDcYvOS4nvJnPkvFdXU2pWJKT5efo02dbq2LGVQ6rfV2RLhCZHftc
	T6/r01IhCVeHIgaHiU+hW8Y6KQfe0Hq9/FOBhUHJ3V3ZLYeqYexvcEkrInvpacVlWqhLbsqH4ff
	YkAwLXglb69ps9OhDf6TZzYwCa1v50j1YPbouFuBCmzurq7CAPqk64vptbUMo0f7H/ITr+V5VyT
	Qvn6ngVWvZsjN0c2L9LcgAdyhJrrdmUWRXgoWYHusgcviwkxqdjr7zlU5CseD7BAnva/X5C6mHl
	/Rx/PqeQJZl7GDsJn9elnN4imXUgRLnzxd
X-Received: by 2002:a05:6a21:50a:b0:398:9662:110d with SMTP id adf61e73a8af0-398ec9ebaa2mr5649068637.4.1773475803657;
        Sat, 14 Mar 2026 01:10:03 -0700 (PDT)
Received: from fedora ([2409:40e5:1052:9a56:d0d2:2da5:541:7e3c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb9966d9sm3665378a12.11.2026.03.14.01.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 01:10:02 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH 3/3] staging: sm750fb: Rename struct sm750_dev members to snake_case
Date: Sat, 14 Mar 2026 13:39:32 +0530
Message-ID: <20260314080934.135457-3-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314080934.135457-1-chakrabortyshubham66@gmail.com>
References: <20260314080934.135457-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename CamelCase members pvReg and pvMem to follow the Linux kernel coding style.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    | 22 +++++++++++-----------
 drivers/staging/sm750fb/sm750.h    |  4 ++--
 drivers/staging/sm750fb/sm750_hw.c | 20 ++++++++++----------
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index c30ffab8a5f3..1c60ba056719 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -624,27 +624,27 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 		output->paths = sm750_pnc;
 		crtc->channel = sm750_primary;
 		crtc->o_screen = 0;
-		crtc->v_screen = sm750_dev->pvMem;
+		crtc->v_screen = sm750_dev->pv_mem;
 		pr_info("use simul primary mode\n");
 		break;
 	case sm750_simul_sec:
 		output->paths = sm750_pnc;
 		crtc->channel = sm750_secondary;
 		crtc->o_screen = 0;
-		crtc->v_screen = sm750_dev->pvMem;
+		crtc->v_screen = sm750_dev->pv_mem;
 		break;
 	case sm750_dual_normal:
 		if (par->index == 0) {
 			output->paths = sm750_panel;
 			crtc->channel = sm750_primary;
 			crtc->o_screen = 0;
-			crtc->v_screen = sm750_dev->pvMem;
+			crtc->v_screen = sm750_dev->pv_mem;
 		} else {
 			output->paths = sm750_crt;
 			crtc->channel = sm750_secondary;
 			/* not consider of padding stuffs for o_screen,need fix */
 			crtc->o_screen = sm750_dev->vidmem_size >> 1;
-			crtc->v_screen = sm750_dev->pvMem + crtc->o_screen;
+			crtc->v_screen = sm750_dev->pv_mem + crtc->o_screen;
 		}
 		break;
 	case sm750_dual_swap:
@@ -652,7 +652,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 			output->paths = sm750_panel;
 			crtc->channel = sm750_secondary;
 			crtc->o_screen = 0;
-			crtc->v_screen = sm750_dev->pvMem;
+			crtc->v_screen = sm750_dev->pv_mem;
 		} else {
 			output->paths = sm750_crt;
 			crtc->channel = sm750_primary;
@@ -660,7 +660,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 			 * need fix
 			 */
 			crtc->o_screen = sm750_dev->vidmem_size >> 1;
-			crtc->v_screen = sm750_dev->pvMem + crtc->o_screen;
+			crtc->v_screen = sm750_dev->pv_mem + crtc->o_screen;
 		}
 		break;
 	default:
@@ -764,14 +764,14 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	 * must be set after crtc member initialized
 	 */
 	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
-	crtc->cursor.mmio = sm750_dev->pvReg +
+	crtc->cursor.mmio = sm750_dev->pv_reg +
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	pr_info("crtc->cursor.mmio = %p\n", crtc->cursor.mmio);
 	crtc->cursor.max_h = 64;
 	crtc->cursor.max_w = 64;
 	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.max_w * 2 / 8;
-	crtc->cursor.vstart = sm750_dev->pvMem + crtc->cursor.offset;
+	crtc->cursor.vstart = sm750_dev->pv_mem + crtc->cursor.offset;
 
 	memset_io(crtc->cursor.vstart, 0, crtc->cursor.size);
 	if (!g_hwcursor)
@@ -1090,7 +1090,7 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
 		sm750_dev->mtrr.vram = arch_phys_wc_add(sm750_dev->vidmem_start,
 							sm750_dev->vidmem_size);
 
-	memset_io(sm750_dev->pvMem, 0, sm750_dev->vidmem_size);
+	memset_io(sm750_dev->pv_mem, 0, sm750_dev->vidmem_size);
 
 	pci_set_drvdata(pdev, sm750_dev);
 
@@ -1121,8 +1121,8 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
 	sm750fb_framebuffer_release(sm750_dev);
 	arch_phys_wc_del(sm750_dev->mtrr.vram);
 
-	iounmap(sm750_dev->pvReg);
-	iounmap(sm750_dev->pvMem);
+	iounmap(sm750_dev->pv_reg);
+	iounmap(sm750_dev->pv_mem);
 	kfree(g_settings);
 }
 
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index b683a82af349..3f6570fc8f08 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -97,8 +97,8 @@ struct sm750_dev {
 	unsigned long vidreg_start;
 	__u32 vidmem_size;
 	__u32 vidreg_size;
-	void __iomem *pvReg;
-	unsigned char __iomem *pvMem;
+	void __iomem *pv_reg;
+	unsigned char __iomem *pv_mem;
 	/* locks*/
 	spinlock_t slock;
 
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 0e594734a8b9..32b3813d0d8b 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -49,19 +49,19 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	}
 
 	/* now map mmio and vidmem */
-	sm750_dev->pvReg =
+	sm750_dev->pv_reg =
 		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
-	if (!sm750_dev->pvReg) {
+	if (!sm750_dev->pv_reg) {
 		pr_err("mmio failed\n");
 		ret = -EFAULT;
 		goto exit;
 	}
-	pr_info("mmio virtual addr = %p\n", sm750_dev->pvReg);
+	pr_info("mmio virtual addr = %p\n", sm750_dev->pv_reg);
 
-	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
-	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
+	sm750_dev->accel.dpr_base = sm750_dev->pv_reg + DE_BASE_ADDR_TYPE1;
+	sm750_dev->accel.dp_port_base = sm750_dev->pv_reg + DE_PORT_ADDR_TYPE1;
 
-	mmio750 = sm750_dev->pvReg;
+	mmio750 = sm750_dev->pv_reg;
 	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
 
 	sm750_dev->vidmem_start = pci_resource_start(pdev, 0);
@@ -76,15 +76,15 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 		sm750_dev->vidmem_start, sm750_dev->vidmem_size);
 
 	/* reserve the vidmem space of smi adaptor */
-	sm750_dev->pvMem =
+	sm750_dev->pv_mem =
 		ioremap_wc(sm750_dev->vidmem_start, sm750_dev->vidmem_size);
-	if (!sm750_dev->pvMem) {
-		iounmap(sm750_dev->pvReg);
+	if (!sm750_dev->pv_mem) {
+		iounmap(sm750_dev->pv_reg);
 		pr_err("Map video memory failed\n");
 		ret = -EFAULT;
 		goto exit;
 	}
-	pr_info("video memory vaddr = %p\n", sm750_dev->pvMem);
+	pr_info("video memory vaddr = %p\n", sm750_dev->pv_mem);
 exit:
 	return ret;
 }
-- 
2.53.0

