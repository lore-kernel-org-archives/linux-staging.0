Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BE2449EA9
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 17:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521299; cv=none; b=tah2LS6H4KKxsbKqyqN83xUOKBnjKP5aOHMMwRoISVvbqKx3XU9dxCHAA/KW3uagf5c5w/cuTfU2Qd3WrmkIlspluRvxdr7Q3sawWwMxTfBkWp9hbP+AtvOgdVsRE6ClcEv8jwpQ/wOtONH9OEJOYK6TMe8gbU9YCHXDt3tIWN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521299; c=relaxed/simple;
	bh=kA49ZIKEBJtKg+pukD3yEhOyJ3NmmzKjLNAM6lQy29w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QiHBA9BOAB/biHGlXaiVc1k5EzZAVCFO99a9cB0kBHnOBp/KpxRZVDP6o7QxJ9bhiCs+DoqIt5DHFDyxGZU0/+BlbK2XfB8aSurdPJD3sE97rBwobRdzTy5PkuRQuzTBNHJd8N1rKUZkO+hMjNFCNzihYvnXcHv8LiPy9XA7fXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SP4F2lW3; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SP4F2lW3"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1309f4ee97fso5663456c88.1
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 10:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778521297; x=1779126097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmLf3D86uSulCA4poMBe4H7juOxldyEv4Yp7oOnriek=;
        b=SP4F2lW375Awe8WwriooCCpMO2mvaVL+uAjcSkxTmyzlAzEt+948Xh1gBdYVOrFelB
         CHQmrHJ/6UUpxpxhJiRjGGJy7D/GHuLVh3k/aFTRz1gEl1jqv2j9nY8dKqxqLXpiG6E3
         6dg0Sj0i/MNUeqKgTlCrzjowN5QNA7+7VjgzzjdDWTCUccbQ68zJDnX4dh55MKGxIzEG
         SnaMB21bWtm1mXIXv+TveqssdeCKCdSVxWkmxz9DSa/r6t0go1aBKygohGs3KimeIhKP
         Jca1Sypf3Kha4RcHEHKcvv3cy4auZNzgAAEyxQ8f2Pyuy5I21oZmFzN/iEf+rtXRrNR2
         tcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778521297; x=1779126097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tmLf3D86uSulCA4poMBe4H7juOxldyEv4Yp7oOnriek=;
        b=ali114D3Kq1LUAqDdIZaXQRyfqHB3g2zsIDmc99UsVPjD5ieENGhP6NwqbLlrsW7kn
         /bTQG0FWSVEEYNZhypiGiaNwig8D1HX01etBppjojml/eT15mbLxVy3LwZJvguQGxbsd
         lWciPCRneaLceZeSMNX7yJBbdkOR75Hm3nvzL8f+Ql86FkjQ11d5Q/f68JdzF6DLmfGG
         AkE6Pf/4mZWb7iFLH/Ap6S2uu/R7xBuWiz1IPFU8Gr/cdvPQMLq/uLDQoGr8mvhHUMpL
         +ALq1/HZcUF34CFDBMPLDA0ly0CP9nWS3i6akaD88UeBE09X9M/UeiWbyhbSsQ2lyfKb
         Tl+Q==
X-Gm-Message-State: AOJu0YxpTrphGzZaAsZ2qnFHKGYQAPmuqvt4EMJHsq4PdMlM3yeQC2c3
	4bx8triGFaA33ZRGJa4d9P0xvuEoZfaPNB+axf+pmYQjr5nI1ALzI8GPGSuazg==
X-Gm-Gg: Acq92OFXSKmFNC9kpCvpV3RKCuoUmPvCYzgMBV7gZls93axu5GBMzJisyABb3ugiRBg
	m74jCWGWPWUhNBLB9XJlbXWz/zc3FBzkPNXZzz3KbIP97GyAaQs6zvv6MVMB159pevVnkceGFJC
	VPaxwhrhYp8G+GFx3Gizkb2pmLhYSJsntjcOR5L3MkQ3YEtunEdukqGUaPCHMAiTGKqoMU5XUql
	sH4NaQPUqz/pcFniyGixwFrl7jtae/CDBjwQJnRsFPvnASkiN6JsZhJkI5dk/2d6qICageaW8a3
	0yKmBCFnLq5wOMLl4ew8HDIeDrtjUB6kC8LNJpAJX9UMAxkREoXehN3RSJ8D8jFNy1O2wGiPTke
	8IEOsOPACEs8lOE2CuKEUpN0XvkW8vy7k+E9T1E9qH7CSmEHidotjNHDuYXsjGhA0kclqEOXsKd
	0cOxel5DSqzBsxdujBVIjwzvbbn4pqLbkP
X-Received: by 2002:a05:7300:4313:b0:2d8:b814:29af with SMTP id 5a478bee46e88-2f54b89a0cemr12637813eec.3.1778521296814;
        Mon, 11 May 2026 10:41:36 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm16899550eec.27.2026.05.11.10.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:41:36 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH 1/2] staging: sm750fb: rename CamelCase variable pvReg and drop prefix
Date: Mon, 11 May 2026 10:41:23 -0700
Message-Id: <20260511174124.5345-2-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511174124.5345-1-guojy.bj@gmail.com>
References: <20260511174124.5345-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames the CamelCase variable 'pvReg' in struct sm750_dev to 'vreg'.
Dropping the pointer prefix 'p'.

This fixes the following checkpatch.pl check:
CHECK: Avoid CamelCase: <pvReg>

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    |  4 ++--
 drivers/staging/sm750fb/sm750.h    |  2 +-
 drivers/staging/sm750fb/sm750_hw.c | 12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 996a586a3727..d2fe789efe31 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -755,7 +755,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	 * must be set after crtc member initialized
 	 */
 	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
-	crtc->cursor.mmio = sm750_dev->pvReg +
+	crtc->cursor.mmio = sm750_dev->vreg +
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	crtc->cursor.max_h = 64;
@@ -1059,7 +1059,7 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
 	sm750fb_framebuffer_release(sm750_dev);
 	arch_phys_wc_del(sm750_dev->mtrr.vram);
 
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->vreg);
 	iounmap(sm750_dev->vmem);
 	pci_release_region(pdev, 1);
 	kfree(g_settings);
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index d2c522e67f26..a40dbcc2e6c8 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -97,7 +97,7 @@ struct sm750_dev {
 	unsigned long vidreg_start;
 	__u32 vidmem_size;
 	__u32 vidreg_size;
-	void __iomem *pvReg;
+	void __iomem *vreg;
 	unsigned char __iomem *vmem;
 	/* locks*/
 	spinlock_t slock;
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 6f7c354a34a1..98983b1192f2 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -40,18 +40,18 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	}
 
 	/* now map mmio and vidmem */
-	sm750_dev->pvReg =
+	sm750_dev->vreg =
 		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
-	if (!sm750_dev->pvReg) {
+	if (!sm750_dev->vreg) {
 		dev_err(&pdev->dev, "mmio failed\n");
 		ret = -EFAULT;
 		goto err_release_region;
 	}
 
-	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
-	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
+	sm750_dev->accel.dpr_base = sm750_dev->vreg + DE_BASE_ADDR_TYPE1;
+	sm750_dev->accel.dp_port_base = sm750_dev->vreg + DE_PORT_ADDR_TYPE1;
 
-	mmio750 = sm750_dev->pvReg;
+	mmio750 = sm750_dev->vreg;
 	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
 
 	sm750_dev->vidmem_start = pci_resource_start(pdev, 0);
@@ -75,7 +75,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	return 0;
 
 err_unmap_reg:
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->vreg);
 err_release_region:
 	pci_release_region(pdev, 1);
 	return ret;
-- 
2.34.1

