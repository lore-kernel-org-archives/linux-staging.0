Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44D826B08F
	for <linux-staging@lists.linux.dev>; Sat,  4 Jul 2026 19:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783192146; cv=none; b=SwyfXhMQAWlacD/QJJyeZ+geo2Zl8yOXAQAkZOmfFU/sytKBzGeIFgPJCV7wsaqdppBbBNg1vkGcPQOBdDW2jaIzS8ouE4kRTNwsoDGb66Rgpwy4yYY0bCIP7u+oScSJKJe3pEfZoWoQEDZ0XjNcp6bM63VXyi6NVR7bJAjpcmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783192146; c=relaxed/simple;
	bh=A06Yy2EYDfHEtoWJM6CBiEhn33Kee9RzFJyasyjw0wY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OJJLcm7HDCEJ0IVDoQkDWHUMICDB/QRodazFLAEqrLgN2G+fVqDrvscuIn5tXhKPgT+njMp4dJG4G7N7hkw/bWzyIDXmrN0CCFrXRE/5jdWQg4CTN7EDA0LGo0IyTtfdi7+0auxewyYVgoxVhQsPKKlJlZf70Mgv8vxVwEJSLXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFgD13SN; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFgD13SN"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-493b27c7451so24236745e9.0
        for <linux-staging@lists.linux.dev>; Sat, 04 Jul 2026 12:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783192143; x=1783796943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VRh4MeESNZjA8ZY8SVwMDtx07Fu+whGeI3UAREbb+eo=;
        b=MFgD13SNm/iryWWkOr6rSsqAyD3+u3I3aKGzsiG9N5R+x+dZkOfm88ztRA6pngj6XF
         tI0+wvVk+Z0QFB/foBw2B4hDNnxJYj6mTsNxEoTCJnvVcl7wSJoqlsYIz6AXhZIin3Q4
         caQzCAJQMz1K71Rp1Sm6ZHxFe29zotsm7nwPJtXZ5OCG42Hsw00O40g0j6+GBDwb42A1
         iC6OSt7fRcDxrj9Lfiz3GJYjTYEjJNtb70Bxnsr5qMB827D88U+XH89lZIVCfpBcyAMU
         edqn7A3twd+f0o/+Yd9oZnR/A4PqA7VNLQP9aMQPQuJEgIXVx/gd25e8Wq0nHn4a5jOb
         GVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783192143; x=1783796943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRh4MeESNZjA8ZY8SVwMDtx07Fu+whGeI3UAREbb+eo=;
        b=RwjmO6nZ69jhPXa52mwcFLPC4ssDnUbVMMwugAPG5Pby08RU5vW8pbH3NG5i9Lp5EG
         iDDVwW/0nnAAvEef7kiRORzfUgUoWBSyofpPvue8W7/0j7qWkL7+Bs9WU7as9seYa6ZT
         NJut7LjJH/0PBLnyQJzo3vHoobE9TPEOtzuxXNcSkruEQupKtv3mmwKrioT/Sq37IxJ5
         eS+BYO8y+5VPbpt1jcB+TNLm5RfuLSuluXDqCpJrwAEhtYvGkQupXEQxnYYxuhIJt49V
         qRxUJeh8hHoukuCJmxG6RGvZv+HanlZOB0nHM0KB3p4EqMiJ0uIqnr27r+M9Ansn6njv
         0jMA==
X-Forwarded-Encrypted: i=1; AFNElJ/AUMi9V1Do3CgoAp9dCkr4xnDrHJ6RWA7lDwyZcKHBxbU/ABQH5LN+QfpOza4prU8W2ZEGcbmt1yOVe97D@lists.linux.dev
X-Gm-Message-State: AOJu0YxXpUJXiiFsvJn4cp8upCE+6lF/VzSwRJxVe/oKinbpA1JUsgFk
	AZxzag5KP8IVkJcEs3D53jCNnhugG0tGHUiVtUUcoq1ScK4G1wauSVDS
X-Gm-Gg: AfdE7ckIFmnLBJvIGC6o6LFktiutBc2GgkeyEcdH/3jdcUYFL1R9rOz1AwLaamWaobp
	sx0morgJ9NGvYh/tNSAnkYXPLX2zKDLoFPH7mxTqb4MhLxSuke/3r464R3KTtRWxNDbcsyJ6T34
	LalL7RE7xxKSDBdusw7iK4goM0cj9Q+EwrQASDn51fL72pPXrUWsEHr9mYiKOxP72cWaf+XR3bf
	eaotZKZbtS4bama+om3Q4BQd9LmIk9Fdc3jhw7uzVqGN1O1VHKebJpwh1gQMJP4zpBvqhaCVZ1x
	Kp5HjiDE1AEA1ZaS7ZyUoMjFg3sUxBBZMrgqSYw01bTY9UlCyAlMecb/4m/qm9lVPRUsHMwh2Np
	yZjAbdPY5VRshUPFY9DGQ4jI0D+aNiJhkVVgbaebpLMX+3SW/cwlzNreRH0vxIrDE2ptT2nKmx1
	SRWKDWl51HHBygC3szqJyR
X-Received: by 2002:a05:600c:3b28:b0:493:b698:9247 with SMTP id 5b1f17b1804b1-493d1593adbmr39535475e9.14.1783192142995;
        Sat, 04 Jul 2026 12:09:02 -0700 (PDT)
Received: from myhost.localdomain ([89.253.41.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm261718885e9.15.2026.07.04.12.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 12:09:02 -0700 (PDT)
From: Ruziev Miraly <miraly.dev@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ruziev Miraly <miraly.dev@gmail.com>
Subject: [PATCH v2] media: atomisp: flatten pre_power_down logic and clean up staging code
Date: Sun,  5 Jul 2026 00:08:54 +0500
Message-ID: <20260704190854.114172-1-miraly.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor atomisp_mrfld_pre_power_down() by removing the redundant
nested 'else' block, making the function structure linear and easier
to follow. Keep both error logging branches intact to ensure consistency
in hardware failure reporting.

In addition, fix minor checkpatch.pl style warnings in the same file
regarding code alignment and hanging open parentheses.

Signed-off-by: Ruziev Miraly <miraly.dev@gmail.com>
---
Changes in v2:
  - Fixed an issue from v1 where dev_err() was accidentally dropped.
  - Kept both error logging branches for consistency with original behavior.
  - Flattened the code structure by removing the nested 'else' block.
  - Fixed checkpatch.pl style issues (hanging parenthesis and alignment).
---
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 39 +++++++++++--------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 2d72467eb..78cf09753 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -439,14 +439,14 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 	u32 irq;
 	unsigned long flags;
+	int ret = 0;
 
 	spin_lock_irqsave(&isp->lock, flags);
 
 	/*
 	 * MRFLD HAS requirement: cannot power off i-unit if
 	 * ISP has IRQ not serviced.
-	 * So, here we need to check if there is any pending
-	 * IRQ, if so, waiting for it to be served
+	 * Wait for pending IRQs to be served.
 	 */
 	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
 	irq &= BIT(INTR_IIR);
@@ -454,29 +454,36 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
 
 	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
 	if (!(irq & BIT(INTR_IIR)))
-		goto done;
+		goto power_down;
 
+	/* Clear and check interrupt status registers */
 	atomisp_css2_hw_store_32(MRFLD_INTR_CLEAR_REG, 0xFFFFFFFF);
 	atomisp_load_uint32(MRFLD_INTR_STATUS_REG, &irq);
+
 	if (irq != 0) {
 		dev_err(isp->dev,
 			"%s: fail to clear isp interrupt status reg=0x%x\n",
 			__func__, irq);
-		spin_unlock_irqrestore(&isp->lock, flags);
-		return -EAGAIN;
+		ret = -EAGAIN;
+		goto unlock_exit;
 	}
+
 	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
 	irq &= BIT(INTR_IIR);
 	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
 
 	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
-	if (!(irq & BIT(INTR_IIR))) {
-		atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
-		goto done;
+	if (irq & BIT(INTR_IIR)) {
+		dev_err(isp->dev,
+			"%s: error in iunit interrupt. status reg=0x%x\n",
+			__func__, irq);
+		ret = -EAGAIN;
+		goto unlock_exit;
 	}
-	spin_unlock_irqrestore(&isp->lock, flags);
-	return -EAGAIN;
-done:
+
+	atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
+
+power_down:
 	/*
 	 * MRFLD WORKAROUND:
 	 * before powering off IUNIT, clear the pending interrupts
@@ -490,9 +497,10 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
 
 	atomisp_msi_irq_uninit(isp);
 	atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_LOW, true);
-	spin_unlock_irqrestore(&isp->lock, flags);
 
-	return 0;
+unlock_exit:
+	spin_unlock_irqrestore(&isp->lock, flags);
+	return ret;
 }
 
 /*
@@ -839,7 +847,7 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 	/* Register internal entities */
 	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++) {
 		ret = atomisp_mipi_csi2_register_entities(&isp->csi2_port[i],
-			&isp->v4l2_dev);
+							  &isp->v4l2_dev);
 		if (ret == 0)
 			continue;
 
@@ -847,8 +855,7 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 		dev_err(isp->dev, "failed to register the CSI port: %d\n", i);
 		/* deregister all registered CSI ports */
 		while (i--)
-			atomisp_mipi_csi2_unregister_entities(
-			    &isp->csi2_port[i]);
+			atomisp_mipi_csi2_unregister_entities(&isp->csi2_port[i]);
 
 		goto csi_and_subdev_probe_failed;
 	}
-- 
2.54.0

