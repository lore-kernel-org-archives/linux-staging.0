Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B763E8330
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 13:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975414; cv=none; b=nzrNIVCfaaPSup2mfIp5/dZNNx7f+Kk59u+7lGUOxDz/BbqNucQa/Kxus62H8Mpfbr4yKx78IhGlV6g0/Q4/0+XDpDlrrgQGrRWm/K5wS++p0zi4uADKPh1ZGN2Olq2Eg1e7vvvoCI+vcl+8GEkINGzyLptlhYfPjO5Z9Yjli/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975414; c=relaxed/simple;
	bh=ZXy8nJ1NjBn/E9jJk3Rp6AGcNCXnarjNxrbXZD2pqM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PksaQjKEwUfNax7k3sd3iRGxwj1XtAw6Oia0K5/66bob55Xw7Fpa5id1joiOvvZIV0nAPcEyTRzJd1c7IDopFnXl2hle1ltJlQuhl+l32rwNvi2PtK2HPuY6yvN9i7uEeurtgnj/oAnJAkRdUe509K4VzXn6HkgRMUwSxD10TJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdVqRuM5; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdVqRuM5"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ba1e9d3687so85152785ad.3
        for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 06:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779975412; x=1780580212; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vRg/6Nk+YOIc8OudIWH/yY/KJ/fWck/2nnaW8higidY=;
        b=BdVqRuM535p/owtx6CHo6KbpEwWS3zeKTpUS02yWa68eDl3m80b3/XncO9URif7rRn
         tt0DvFk3p+GNcvYWjc6iibdx+VadzsE/7Xly9fMVazQD+FChD/WQ62vk4Pqn1FMgEn+t
         XXXy7037uJxaxVQN7avZpvBz+6zdlfLlgAc71sVYpt6NvswTviBT6zO0s7+I7faBiE+C
         dfmrKuB+46fNyrZrC0AkvRfB+Qk6scwjPPGzPWJiks46rUdfOUAjGdfLs8++jTZirkpP
         Bddc6sIqEtI91X8oKhCXG5SEhKRKmzgLRb7UaMvgvHyjsxAu2syan8cD06Cb8eEJmOXP
         4guQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975412; x=1780580212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRg/6Nk+YOIc8OudIWH/yY/KJ/fWck/2nnaW8higidY=;
        b=jIdGo8+qY+dN3wOzKvUkY+OlMfEzYH5+GXh13u8TRQ3lkts9+dn6Den7ndgiNbAG5f
         lk6VI6XGfjFN1cJshK+J0lPvTW1MQKQ+i8OJfLaSaNNkqnTkdGJHtky+PlaGJmXHAvyu
         q5HAjUdGzhA/mTVOkyMde0yeIS0CJw5SB36xCuNGfb6ss6ejaXeSSZj6LWwha8W2QhMD
         RnxMaHRVSGyHoJZ+Cn3+X92bS/puHkf6QG4pRnLwQBTmgGgDu5RrFWlIWvjKFfaMKjqF
         5PSUn1zvfcwfwqiWEY07r7q5+lmdsPhqwahC6S9LU7jm8uxygEiTYbmaI+tqyE+iLcD8
         7SFQ==
X-Gm-Message-State: AOJu0YyIP9oHaPRH58G2HGc1TBBHJoYQOMbMOgQkPf5r052M7dRzuRS/
	1WEdupynV8uiNuQnmra+U0PfH6vyFFvOpDwXstRsthqXM7TuJNKD3Dki
X-Gm-Gg: Acq92OF/o5+FujU3uzsdbEAzTGQ0RkYypnXOs4OXwaBkPWb2JZPsiISwox4kCuJjbGD
	swgY0DNGk6KELboN4rf2abTjl1kcuV8kjMaYeQgqOUnq9Ep9VONRI8ywQ9veaQK9UQpuV27QM0X
	AVCjNrHQAWAGHIPcbrdVJ/U32xDwSGdyfq6Cd9hWiKBX8sK2iwKsdBAENdicbbjSof9j3QzzJiG
	P//XgQ8pTxmI4cmvz676xzeayKH0SyzzsSUpeYZXSBZad/+LHEDW2RaGMdmsIirSXCpoNAF4Eqs
	Bt0lhlfgBLtODhqJgoLbfTjwYzpzEoVixrrglSKJpiL0xsKmM+92mB++arhfb314jQRDpqLADFM
	nJDiEHmPRTH5fMiRa6FNI4/ttjqyk15LifCUl23i5qgrNkF2yaPy4wtwIudUiTuW4A5dt/eyir7
	6siSrajz/HbtpY+HTXAb/f6v9mtaSxrDEkV4WTQ0qy2LE=
X-Received: by 2002:a17:902:ccd0:b0:2b4:5f19:1d34 with SMTP id d9443c01a7336-2beb05eec0amr340480165ad.17.1779975412309;
        Thu, 28 May 2026 06:36:52 -0700 (PDT)
Received: from onish ([2404:7c80:75:55f3:d423:9757:6acf:6ef9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf13d83264sm8696405ad.17.2026.05.28.06.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:36:51 -0700 (PDT)
From: Onish Sharma <neharora23587@gmail.com>
To: sudipm.mukherjee@gmail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Onish Sharma <neharora23587@gmail.com>
Subject: [PATCH 1/2] staging: sm750fb: rename pvReg to pv_reg
Date: Thu, 28 May 2026 19:06:26 +0530
Message-ID: <20260528133627.10850-1-neharora23587@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename pvReg to pv_reg to comply with kernel coding style (checkpatch.pl)
and improve readability.

Signed-off-by: Onish Sharma <neharora23587@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    |  4 ++--
 drivers/staging/sm750fb/sm750.h    |  2 +-
 drivers/staging/sm750fb/sm750_hw.c | 12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c..8f01b3c63fe8 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -743,7 +743,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	 * must be set after crtc member initialized
 	 */
 	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
-	crtc->cursor.mmio = sm750_dev->pvReg +
+	crtc->cursor.mmio = sm750_dev->pv_reg +
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	crtc->cursor.max_h = 64;
@@ -1047,7 +1047,7 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
 	sm750fb_framebuffer_release(sm750_dev);
 	arch_phys_wc_del(sm750_dev->mtrr.vram);
 
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->pv_reg);
 	iounmap(sm750_dev->vmem);
 	pci_release_region(pdev, 1);
 	kfree(g_settings);
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index d2c522e67f26..0492b1afbb11 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -97,7 +97,7 @@ struct sm750_dev {
 	unsigned long vidreg_start;
 	__u32 vidmem_size;
 	__u32 vidreg_size;
-	void __iomem *pvReg;
+	void __iomem *pv_reg;
 	unsigned char __iomem *vmem;
 	/* locks*/
 	spinlock_t slock;
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 34a837fb4b64..95f797e5776a 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -23,18 +23,18 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	}
 
 	/* now map mmio and vidmem */
-	sm750_dev->pvReg =
+	sm750_dev->pv_reg =
 		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
-	if (!sm750_dev->pvReg) {
+	if (!sm750_dev->pv_reg) {
 		dev_err(&pdev->dev, "mmio failed\n");
 		ret = -EFAULT;
 		goto err_release_region;
 	}
 
-	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
-	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
+	sm750_dev->accel.dpr_base = sm750_dev->pv_reg + DE_BASE_ADDR_TYPE1;
+	sm750_dev->accel.dp_port_base = sm750_dev->pv_reg + DE_PORT_ADDR_TYPE1;
 
-	mmio750 = sm750_dev->pvReg;
+	mmio750 = sm750_dev->pv_reg;
 	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
 
 	sm750_dev->vidmem_start = pci_resource_start(pdev, 0);
@@ -58,7 +58,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	return 0;
 
 err_unmap_reg:
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->pv_reg);
 err_release_region:
 	pci_release_region(pdev, 1);
 	return ret;
-- 
2.54.0

