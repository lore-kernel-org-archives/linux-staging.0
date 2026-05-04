Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641223A3E80
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 10:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777891057; cv=none; b=k/gId0dcH6vhUYBwkaA2PQShFXZuFtX+cXEJzpdx0Ynd2j6IcL2LsY2VCIWJ40xgLL+UTDWZXsfjpCCycugNy7t8E5hhjDC8sT/uwD+x1n5SuJCEEFA1c0gKJ7j8yw+VVSC9Df7+P7f5JSFiUkCjC0bZkHi7u8Nzb1XyR7qQ5OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777891057; c=relaxed/simple;
	bh=9tAaz20Ae5udo+1KfEibhpKitw73uVxHmbWSDrohfFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P73q7OXXDQpHJ4OrjAJQ2qSLtGwl9DtTqHXv2blDDwsSWiXpu18HTzuSO5cz1JT1XyZgW8lkiYruakE9J2EzsihkYXPaLRZikyMOSEqx2k0U2TNNLM3vTUrO28MM33fYRvT6nTf8EPgCnMBQWsrnrgn68dU9k3qQx2dzt+UsAlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAD6/tYQ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAD6/tYQ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ad21f437eeso22949195ad.0
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 03:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777891056; x=1778495856; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zwBefue+sqPVaGbAyP7uY++EiQcB2m+LSHBlyeXzufA=;
        b=BAD6/tYQ4b9rM2iCiCUehuQc2dgLADbwTZYC135L9bTU/wCQP2sJQ3eAlqlyXXPtI4
         /jtQlijWxt0QrQ9Y9nueMsGdbbMo8Q5TQeeZXlt8WbfEmBOFiJ63TsJoGKmHuTgLf3he
         GEA3qMH3uleDoSz7+sZ2fr08KlHtIHKIpBSQkinCJXnpNaWUw5SAkgE4pIJw1WxxCRoo
         5zPTktOPTKY4U2RY2kz5lo8vph++RJ+/djv4NiRjCZ7sRtkkQ+fZNjvgiu/9HCGGCgMt
         hG3jMQtP5OosckdX/L5es6VbcZWA2TFmxLczDjDMrjQrcb2hci8r8j5Y+x67I92dZqPn
         Wjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777891056; x=1778495856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwBefue+sqPVaGbAyP7uY++EiQcB2m+LSHBlyeXzufA=;
        b=c5hEEqWTVOZo/33P6ghqaedfdhkYZOri2B1nA5ilf3TeebNA0Qcv0ZcE7OeMsK5IlS
         WCrKakmMKFslRTE0am4Wp4qmh/6QdGzt8iflmpiaXdh/OYC0/L6N7z+ZyuRlCVEw9MCp
         lHKDbPIAd/TcClZI7D4VL5K9BV77tZdFmmriU1bLAl0m+DOOH9loETdBlO0+BiIXwelH
         qxISilbbDDV9YDxlmIRgGzFiVRM5ztNrCxhS6xx6Ygv5oKPQySoH94jkIOIe5HXWcoHd
         AG78xsDL4gsSnOxfcYgsiFYWmAA1KyG6BNV7GmH0PtGOpLCERr1Sy+2Ju42JMyASTbn6
         LU8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9UJLahBJvw5F1TFGWhuJKynMReOLLPF+M0EYiaEy75EG5m4uyP8BUOypXf4bXC1k73nCNx+7TVxGQWp8U1@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7kRWPn28typvsOrP4KCKxPWo8CSb3+R//dJmWj8hgcqJKl9Qe
	lxC2hv2U70gs8L1REy7d50Lh0OFLzbqHWNhJobJQyq6c9LEcCdDyyrU6
X-Gm-Gg: AeBDievk8sXJFZm+ACnIk2kKYUPVArdpgurStxfpK9W3YQwOLKlanaLYZlDS0lBvEt/
	mWG+oyg4HolfwjoBQllEfSBywQoc+w4qLelQEwvi6aoZYzFydx2Oman+rn51KaSIVMmt0lzg0sX
	aYxXji/QlFzlG2AwEtWJStFIG9XosSJi7IuxT/CShH3UW5yNFssX0VRuJdo0Z9ZrCwZNzCOhwLE
	ol2BIjXOiJi74qZregTYTqKuqJbgS6sZpY0SMUj3Ynh1uGfIXzb1DwnUjtpDtKC/BwaZYEEu63I
	zch+NZhCXfsVwUa9XgyTerlUQiJ+b2vR1BPHhmyiHDAhjvfR8WXIPt/qBqoPg6syl6yQzuwhc1E
	nd4DbPq3H7v9uwIa2pkreJYlWQ1rMBIjt0/IkXS3WyyY7x44bo+ywyT7ms18gqHYqtOjkw1i3Iz
	t3kLjcOI6CEeEOUON6DMb9Ps1w59ivzzm5+V7+SfVaT1t0n72bwvBELXdpyKeBfUNOT9QhjSJEw
	H/RYWyg15kiDYKwwjLgjDhmAI4huij07UXROErP3K8N
X-Received: by 2002:a17:903:120f:b0:2b2:4bbc:14b0 with SMTP id d9443c01a7336-2b9a44e3639mr144821845ad.20.1777891055673;
        Mon, 04 May 2026 03:37:35 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.112.102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba41784313sm13194525ad.40.2026.05.04.03.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:37:35 -0700 (PDT)
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
Subject: [PATCH v2] staging: media: atomisp: drop unnecessary else block after return/break
Date: Mon,  4 May 2026 16:06:56 +0530
Message-ID: <20260504103656.32945-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant else blocks following return or break statements.
As control flow exits in these cases, the else branch is
unnecessary. Dropping it improves code readability.

No functional change.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
Changes in v2:
- Fixed grammar and added missing spaces after punctuation.
- Consolidated dev_err() call to occupy only two lines.

 .../staging/media/atomisp/pci/atomisp_fops.c  | 18 +++++-------
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 29 +++++++++----------
 2 files changed, 21 insertions(+), 26 deletions(-)

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
index 900a67552d6a..32b07834d66d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -467,22 +467,21 @@ static int atomisp_mrfld_pre_power_down(struct atomisp_device *isp)
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
+	dev_err(isp->dev, "%s: error in iunit interrupt. status reg=0x%x\n",
+		__func__, irq);
+	spin_unlock_irqrestore(&isp->lock, flags);
+	return -EAGAIN;
+
 done:
 	/*
 	 * MRFLD WORKAROUND:
-- 
2.43.0

