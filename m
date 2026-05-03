Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F832E8B81
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 17:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777828945; cv=none; b=dd7G4NaUOppPhpjLe0ghzF5c3O0h4JA+L1xGtqHipf3foy4l782ATa46F0Dao/HiuCyeJOGm1BxEk+pLnTUWbokgvwVclKKIvtx82VLmrzvmN2uJHvgkjRBo19XNj5PxtpnGy9sI6QViNSOfLIN7gWFvRj4P/BeKawzX/ki7u4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777828945; c=relaxed/simple;
	bh=aD59ht4Z8ccP5j0CsxyfzMmCi+t73MZoK0HM0pakRB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gC+NiiPc/BZo/iy8GMJSZw6TUL/CN/sb5AVVhJjcsRUry/sTPwbtnNmKbk0mM3IEYMu7Urobl6Exkn8EHAWPTmFhOxjlU2RMePpdSgHx4+KA/9XG/LAVRGxWI3O+RFQGAJ5Dpb1iiIpbSxsgGawJZT8tbZmJkY1dZ6N86pBqm7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9b/JmVs; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9b/JmVs"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-836ebdeb969so108183b3a.3
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 10:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777828943; x=1778433743; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJnjzlMwpMniUmbSXdrplWdAlDcFpdzwd1bfSco5uao=;
        b=J9b/JmVsmoWj6TnABw48ysfaIb4YBxGftl1CXU15lQxpOr2T9KxrFTC8VrYL63UfRH
         sodxseCHqO+v99BWugHP0T04mv/QrQ4CmnsykAKyEBCgY/LFP/bh+D0naTKtg6ImNNWj
         lMkRt+iCyznsO+L+zRTt10kRVa70zOQc/kfB0ccHPiSVdU6p1woqDJbDr0OQsXOhiCw1
         XIk+KT/7a0FsGena+C8SJ2rVge6IYnf7m7M8nv+7cQtv4IgIACJ4+UvcAgawKH3J59Ii
         KhVwDu+VSpJFgI8rIvzyW52wdenoT7OIUjbea4+OoFVTJ8e1J5XasQfEfOs9BAgCRERi
         7q7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777828943; x=1778433743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJnjzlMwpMniUmbSXdrplWdAlDcFpdzwd1bfSco5uao=;
        b=C12OZhr0Wo95hSKU0EN/V355SaLV1dak2g+oEpfxnl3tExkf0DUrHCVG9IKANce1A9
         0ComrPE6USqSUT7TAETLnzKasHZ8ov8igv9F9Ki/fiYbfn8mEz2uINxN4S5wPq5nvUus
         vY6r1g5SNpy8XERMH8RDfDorBuuzNtNrjKq7UKNvW+/enC7AeLntFB5Zqi+gBh5/cAEO
         L8YA0pXezpViZyYY8JNG2zCmzkFX+JfXdq+EQ2bJ5Q8wxpGekPTmpPj2dlvSU6fhDtjM
         rV4rUIiGpWYV9YJnzaWGSh1St02pNqmde64rwv+54Y/dtNKD1hPj3sUxdLQdwqiEPC6P
         w19Q==
X-Forwarded-Encrypted: i=1; AFNElJ/pzE4wS5aelpqJsStVfZS8pA1Opxrhv3nGfiAzF0ZMjS11FcncpbKPUADSEls7AYkMKAKsLF3ixYdVgfOr@lists.linux.dev
X-Gm-Message-State: AOJu0YxyagXCLlgZ/rCI7HOnOAbDsxki8ugNWmeidMtT+E3SHmi5QMn7
	j0Y5THJyEECZg4gs+etNTwLWfXk0ObJ6/aKPoFWYeSPYDq6aN+nQqd7n
X-Gm-Gg: AeBDietp36SXda/bbfMESnMCsrjfry0UfK4j7pnx0yd/OoOvNN+m/AY9EqpDYso0R5k
	ulW2TowvLNKd4nGrV3GizJZrGOE7xzwtJkZYmACjUgWkpMQMiPimt1i+QT+Tvi1dw3Vx4z0iE7o
	GvWokgl8RLm8ODUv+PvdyWuzuCY+IxZTiDohjJt5iuqJGSIoRWJ3jtishs3WeRhFD1f1fkhgP2a
	Vq1hCoMStDERwpusVSA2vjtO8383SdZ4yc9pGVttq1Oy0tdvYh6lzgegew1RA1A/ldmjXDyIYay
	0Bgs6BEt0lh8nqTLFs4LL9L6+UNugpHpocD9onlwSnyP5bqsil/spRpCrUu3wE0ypdtRK7DYckl
	N7KGXM0oiLS12QEMvzkCgu1//LIKW0h8yTwcWMusq64aArh1zrCfHImzdoqRG7r5Zw81FkZ2bLo
	o95uLLBlzaSTjSPpXRz+O5TCG3ygbOfoOaKpUBAtss23js+QwACuDe7w8FneVsQmM6EJ5j/CFTl
	YKDiasPWovbPotZ6quykXT2wWR5vzRxeA==
X-Received: by 2002:a05:6a20:a109:b0:3a2:f05a:7952 with SMTP id adf61e73a8af0-3a7f1c52da1mr6699896637.39.1777828942939;
        Sun, 03 May 2026 10:22:22 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.115.140])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbca2c49sm7367257a12.26.2026.05.03.10.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 10:22:22 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: media: atomisp: drop unnecessary else block after return/break
Date: Sun,  3 May 2026 22:52:00 +0530
Message-ID: <20260503172200.94712-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant else blocks following return or break
statements.As control flow exits in these cases, the
else branch is unnecessary.Dropping it improves code
readability.

No functional change.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_fops.c  | 18 +++++------
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 30 +++++++++----------
 2 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index c7aef066f209..1aee082d34bf 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -125,10 +125,8 @@ static int atomisp_q_one_metadata_buffer(struct atomisp_sub_device *asd,
 					     stream_id, css_pipe_id)) {
 		list_add(&metadata_buf->list, metadata_list);
 		return -EINVAL;
-	} else {
-		list_add_tail(&metadata_buf->list,
-			      &asd->metadata_in_css[md_type]);
 	}
+	list_add_tail(&metadata_buf->list, &asd->metadata_in_css[md_type]);
 	asd->metadata_bufs_in_css[stream_id][css_pipe_id]++;
 
 	return 0;
@@ -165,11 +163,10 @@ static int atomisp_q_one_s3a_buffer(struct atomisp_sub_device *asd,
 		/* got from head, so return back to the head */
 		list_add(&s3a_buf->list, s3a_list);
 		return -EINVAL;
-	} else {
-		list_add_tail(&s3a_buf->list, &asd->s3a_stats_in_css);
-		if (s3a_list == &asd->s3a_stats_ready)
-			dev_dbg(asd->isp->dev, "drop one s3a stat with exp_id %d\n", exp_id);
 	}
+	list_add_tail(&s3a_buf->list, &asd->s3a_stats_in_css);
+	if (s3a_list == &asd->s3a_stats_ready)
+		dev_dbg(asd->isp->dev, "drop one s3a stat with exp_id %d\n", exp_id);
 
 	asd->s3a_bufs_in_css[css_pipe_id]++;
 	return 0;
@@ -206,11 +203,10 @@ static int atomisp_q_one_dis_buffer(struct atomisp_sub_device *asd,
 		list_add_tail(&dis_buf->list, &asd->dis_stats);
 		spin_unlock_irqrestore(&asd->dis_stats_lock, irqflags);
 		return -EINVAL;
-	} else {
-		spin_lock_irqsave(&asd->dis_stats_lock, irqflags);
-		list_add_tail(&dis_buf->list, &asd->dis_stats_in_css);
-		spin_unlock_irqrestore(&asd->dis_stats_lock, irqflags);
 	}
+	spin_lock_irqsave(&asd->dis_stats_lock, irqflags);
+	list_add_tail(&dis_buf->list, &asd->dis_stats_in_css);
+	spin_unlock_irqrestore(&asd->dis_stats_lock, irqflags);
 
 	asd->dis_bufs_in_css++;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 900a67552d6a..bef803ece2dd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -467,22 +467,22 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
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
+	dev_err(isp->dev,
+		"%s: error in iunit interrupt. status reg=0x%x\n",
+		__func__, irq);
+	spin_unlock_irqrestore(&isp->lock, flags);
+	return -EAGAIN;
+
 done:
 	/*
 	 * MRFLD WORKAROUND:
-- 
2.43.0

