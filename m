Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421D74AA578
	for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 16:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821610; cv=none; b=fotCjsq5ntPDjysH0oEsOVbkMFtJuk8v2ZtbugGI6Wo8xSWsBQTpfNZSpivyIidAWLoVkJ/++BgZhraIK2XVNEfkP0jsUpIMSBRy3WE6DP0KXo9TcxzYtv7OXEQ+SK6r1a9cO8OB7WWEOOKEzdX75TWZ01RMBDANJwz7jdyXo9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821610; c=relaxed/simple;
	bh=RgV6tR5jcQa2cdmmaHtcrqW8KUs0QaaUYSr/3iY5+5c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sIN+Zr0kq5jaFq65vtS4HzOpJ6tlf+xVHw3Xcmz4/xhjFDjUL8nG06YG193tjC1S3OKvzdjdiU30WH2NMnIjfEwSvi3NODkUoIwIn8mnEoEKZQojdJTcxlK+l9cB0B/nFb74sw4QWLKCPyyr1f/t84xV1ZeAvIfrzIdCoaHb26g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--johnsingleton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FHOJUAE7; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--johnsingleton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FHOJUAE7"
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4db3db8687fso3472006b6e.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 09:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791821608; x=1792426408; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5arXL8FFSiMk7enaPI4H1eACN8f2tsnY0z06uFeb7M=;
        b=FHOJUAE7mn23EfxabNPUQjzlVWpPk96QM6NvaIBaoH8/p2c7aIQCBOuUf7AuYzOx1v
         7aBHd16gsOzKPFEykb9Os1qiTQeceq8xE5FhgKCI+8lRiLCJqYvHgeyTt5++avxwThYU
         +rrguc2xUA/pzN8yAr/iwyr4mOhwrxVo8Q/puit1/cUbM/QtP74ubVx64Ztg3UVMlvOj
         NOnXemooyyNGpXTk3Ub6XmABqad5+KdqRfhH11o3YcRiANoXT7U8sGV7a5dK12mLmVPq
         34hoyXdQs1XqMvv79lwM6/LhxZu9eB547GT6q4sU3DTeXsWprB28l5Vi7n1w9haX3VsO
         bKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791821608; x=1792426408;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5arXL8FFSiMk7enaPI4H1eACN8f2tsnY0z06uFeb7M=;
        b=okYFee9AN4hMwHXu72ugIL0MQ6l4l9/gTJqtJ1qjp7lQ0bkwJ1Qd+LpXC9/rhRacNc
         ER3LAxfarJTmZjHep9bG2CgznIOO59qqDk54SJeTk34b2m5u0bbSjNegxHvEjtHuTT8K
         nwX98NzIPF71uUMdvy6yy0ABvjphpssAjb83q7KIxKlTMgbrhr6suW3hC9XTDgcL4VTU
         gN2rwJm7fknjoFW2zGZxuiU9Bznsxprt19ZZ10/BHGN0CxhJa/g/Zcd6ZM4pvUnhHUy9
         L+sXyZ/Xr4ShaF26o5YzH6EpBrlXu95s5Z23lMBNQIrVtFjoJdc7clR2Oy/xW3PSdRUM
         otNw==
X-Forwarded-Encrypted: i=1; AKwUvBw7vaHozbo3MZwAEZ6ixhk0geqS5ltplvcQ/04FyUbsf+0pLHU4MBclRySWbweCeJlvozNsB6UavKzzqTu8@lists.linux.dev
X-Gm-Message-State: AFq9FYLxwFxcem6bh0OlUhAqbUPqaNmdPNyhdk5aTcj3Y2Y6oj+buzSn
	/MhLdItRdpcJjR8jt8HqoQUibMTtlMfy3ktThbFu7/sGg3ogypj0/CUHzD9lCU+A1ynkGxGfut6
	KSXCRnWFWMNDlH6+9/GnwyBScptz9DruPXg==
X-Received: from jaac27-n1.prod.google.com ([2002:a05:6638:c75b:10b0:60b:13bf:fe78])
 (user=johnsingleton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4f0a:b0:4ec:7639:2ad with SMTP id 5614622812f47-50c52471170mr8154333b6e.13.1791821607672;
 Mon, 12 Oct 2026 09:13:27 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:13:21 +0000
In-Reply-To: <20261012161322.930099-1-johnsingleton@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261012161322.930099-1-johnsingleton@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261012161322.930099-2-johnsingleton@google.com>
Subject: [PATCH 2/3] staging: media: atomisp: Remove extraneous dev_dbg
From: John Singleton <johnsingleton@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, John Singleton <johnsingleton@google.com>
Content-Type: text/plain; charset="UTF-8"

Remove dev_dbg calls that (per checkpatch) are duplicative
wrt ftrace.

Signed-off-by: John Singleton <johnsingleton@google.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c  | 2 --
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 4 ----
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..a7c28c261320 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -262,8 +262,6 @@ int atomisp_reset(struct atomisp_device *isp)
 	/* Reset ISP by power-cycling it */
 	int ret = 0;
 
-	dev_dbg(isp->dev, "%s\n", __func__);
-
 	ret = atomisp_power_off(isp->dev);
 	if (ret < 0)
 		dev_err(isp->dev, "atomisp_power_off failed, %d\n", ret);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 812230397409..d83c967fd125 100644
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
-- 
2.56.0.385.gd3acb90ef8-goog

