Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D9DB672
	for <linux-staging@lists.linux.dev>; Sat,  4 Jul 2026 14:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783173673; cv=none; b=E8jVKOoCLbqCfxE4vAhSDrYjcfj2gY71FEitLwT8muFqcAJiNd1MiVcY73V6fiDox2gmtO07ApkBc518KTXxK438nG60W7pxtIlNkP88Mmz9wUUQMGRNgY+Ab0nX7f22TrZnRJl5tMDS26gsuaVT5XC7WP0ZX0s4UrzLwZ8QOy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783173673; c=relaxed/simple;
	bh=X9dhOW7szVP4R7YiwC+ooewHbP8bEQ5HGQ+9OTzrZ5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dCmACMAg87oa4rAHVatVMH6YsX/ro7i5Iu6OIabijpasID5MnzTQ+w5EEgnEGLtqCURq9ti7kEA42A9D5IrQHca8JOOduEl1RIgbduj+VpTuOFX8TE9iN/YZVB8wcnpGQLQO6odcdhjfjn5IjgePRTJIm6Czq3hVTzvlNb3Qmfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rnNpMSQN; arc=none smtp.client-ip=209.85.208.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rnNpMSQN"
Received: by mail-lj1-f194.google.com with SMTP id 38308e7fff4ca-39b011ae0b4so10930781fa.1
        for <linux-staging@lists.linux.dev>; Sat, 04 Jul 2026 07:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783173670; x=1783778470; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QoW6wy5Ibs/c5PrDFE7Z/Vk7E0hnNjlbrEMZdtHLRLk=;
        b=rnNpMSQN6kWNCTqgZBdwTXaeZkMNJSzsXfmQgYUtpYZhPuq2VVDYp+5OuBHsxSMkfy
         bnE14oH5FyOPCwQmTQFcw+VNeaUdnvGiysEw7rZoXX6Adw8mkd7Ny8BdLd/qKTkDnzal
         am+7BltF54R0kcE4iHd249/GSPSfKOxTCZvc0YtLX9G6cbMpBjF2BBOxX1bp/O4FP5W+
         HV8Jf9xJKZgmgH6b2wiqIwCLu1lidDxhMKr1rouPqFAlXv1k0YK9djZ354H1EGggtRTP
         qc334p7pRNqgKfPd2MTL2q3tXfn3vwctxvcEEBHj6lvr8WQ9tBF5a1xzmcRMliLJ54TB
         ZaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783173670; x=1783778470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoW6wy5Ibs/c5PrDFE7Z/Vk7E0hnNjlbrEMZdtHLRLk=;
        b=ILSD40UThK3eqI9EM53JCenXLZvabN6W6DgjM4fM8bCfw6DE3jkvAj0AfhDfemTPSh
         LfeGekp5AMI9nNfZhp8ILoWi92P2WrjBsgDij8tyt0l7P676mPdAjuneCWPN+uNcK5/+
         UVsI9WSz2hbXWi20rUiWO9OeJ41unU2EZeNsKwKknA3EreJWRlZZbq8EiPyG0yKpGT4p
         3vr3v93xsAyg6KvnIqoTvy/QyFJkIYuPLNMV2YzXmEhAytUdhLZX6DQP/P3xJc3lZ6vO
         r7+dnjkEx9le5ui9V/cQ9MlyftuKqCMXlREzL1FXI547Rbromt2Qf5f0Fk4nvfXbc2rV
         zwoA==
X-Forwarded-Encrypted: i=1; AHgh+RrCKeNYY+q5A3Yu5FK+QuBHnURhvpqcq1TAgQvRFPx56r/EKqnWefBcpQybc6CSqu1xnt8AMLAIGXmEzeOb@lists.linux.dev
X-Gm-Message-State: AOJu0YxKDhvwE8nFMcInxNv4c31aFnRd5SMGvd7Lx5IZqMn0KMVXy+Ts
	D0Ja6Uxc7eZ1v4Aj7FEpoFNhgB+svXO9hnQXQMbIYvzFGnOPoMBOCry/
X-Gm-Gg: AfdE7clN8Rx+7zXoXz1Rc4ZyYUKiPNa8tpe/AGDA0zEEnjEOHKJ/Hbxm9FfsYPpo2he
	60BO21VA+g8eutC/70QLBAz4+581y+YvkuQWdnGZxK88ECf3MTCHVLDSEVYqJf/2yUXrgYrXrC0
	BHutq/d1S4jNiZxlxJhTugnBqM8bo7ei6Mxqy+6Jo+RJLNjiJXNj6idojHYwWQMA/d11317q7Xu
	IO5h6qAjqYN5tvZtXgzqCv5xLUQ/n543odLjMnVCCXnzS498DgP+nvEUWxi3oG/K+zjw1xiRSLC
	ha5tQBm2PJg8YtUCbhb6VimYVpMaQrysKVwIHYPpg5GXwkRC0W+9YZ4weag0yD9QZ9qVxx25k4p
	cphw0LvoDMXdnCpLaxauFmZeHbTGMM+MLHdM9Re+FeFtvxKU8l4vtytMTcdm7fNPq162zwszPil
	MHAqNHXX6dItz5Ikr4krA=
X-Received: by 2002:a2e:a107:0:b0:39a:cfea:f17 with SMTP id 38308e7fff4ca-39b53c9e119mr7914081fa.30.1783173669522;
        Sat, 04 Jul 2026 07:01:09 -0700 (PDT)
Received: from myhost.localdomain ([89.253.17.10])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad18b5asm8604601fa.9.2026.07.04.07.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 07:01:09 -0700 (PDT)
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
Subject: [PATCH] staging: media: atomisp: clean up atomisp_v4l2.c style warnings
Date: Sat,  4 Jul 2026 19:00:55 +0500
Message-ID: <20260704140055.88080-1-miraly.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warnings in atomisp_v4l2.c regarding unnecessary
ftrace-like logging and redundant else statements after return.

Remove dev_dbg() calls that only log function entry, as ftrace should
be preferred for this purpose. Also, remove the unnecessary else block
following a return statement to flatten the code structure.

Signed-off-by: Ruziev Miraly <miraly.dev@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 30 +++++++------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 812230397..2d72467eb 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -345,8 +345,6 @@ static int atomisp_save_iunit_reg(struct atomisp_device *isp)
 {
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 
-	dev_dbg(isp->dev, "%s\n", __func__);
-
 	pci_read_config_word(pdev, PCI_COMMAND, &isp->saved_regs.pcicmdsts);
 	/* isp->saved_regs.ispmmadr is set from the atomisp_pci_probe() */
 	pci_read_config_dword(pdev, PCI_MSI_CAPID, &isp->saved_regs.msicap);
@@ -400,8 +398,6 @@ static int atomisp_restore_iunit_reg(struct atomisp_device *isp)
 {
 	struct pci_dev *pdev = to_pci_dev(isp->dev);
 
-	dev_dbg(isp->dev, "%s\n", __func__);
-
 	pci_write_config_word(pdev, PCI_COMMAND, isp->saved_regs.pcicmdsts);
 	pci_write_config_dword(pdev, PCI_BASE_ADDRESS_0, isp->saved_regs.ispmmadr);
 	pci_write_config_dword(pdev, PCI_MSI_CAPID, isp->saved_regs.msicap);
@@ -468,22 +464,18 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
 			__func__, irq);
 		spin_unlock_irqrestore(&isp->lock, flags);
 		return -EAGAIN;
-	} else {
-		pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
-		irq &= BIT(INTR_IIR);
-		pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
-
-		pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
-		if (!(irq & BIT(INTR_IIR))) {
-			atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
-			goto done;
-		}
-		dev_err(isp->dev,
-			"%s: error in iunit interrupt. status reg=0x%x\n",
-			__func__, irq);
-		spin_unlock_irqrestore(&isp->lock, flags);
-		return -EAGAIN;
 	}
+	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
+	irq &= BIT(INTR_IIR);
+	pci_write_config_dword(pdev, PCI_INTERRUPT_CTRL, irq);
+
+	pci_read_config_dword(pdev, PCI_INTERRUPT_CTRL, &irq);
+	if (!(irq & BIT(INTR_IIR))) {
+		atomisp_css2_hw_store_32(MRFLD_INTR_ENABLE_REG, 0x0);
+		goto done;
+	}
+	spin_unlock_irqrestore(&isp->lock, flags);
+	return -EAGAIN;
 done:
 	/*
 	 * MRFLD WORKAROUND:
-- 
2.54.0

