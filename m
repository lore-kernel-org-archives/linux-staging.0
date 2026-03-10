Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761D71F4CB3
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 00:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773102436; cv=none; b=WfNNgujwgPwFhfb4scjlATA4EuXk/qCuRptEbFJrX6t+GAr3rH2zeJwzo9zK8BsDWYQWQlcfNXqqGl25R6zBNPSdTNeqfextREV0GT3vfCJXhEZFs7HYEFguuWpgNpql7ZXa1ERRI0P4KEQDXJqxxF2jMtqHbPbQLjWvgdFYoYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773102436; c=relaxed/simple;
	bh=XJlz7TAx+3J7IJ76cfvjfM28sjsC5jwU+vA9iaG8HY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n9PBotMeW5kIlX6TM4UWV+66E/H/hNCETvaCTfsJSmFmku3SEfafVUVT1H35F6/JX8fbOeDLAOHCSOtCm9s+UtjWV2qSuoFJeZLTF/gXp/9Ro/HhdOaobujp50fic63LDtopngeMFOsmkWrZ1IYraEXP2l6e1l8zp7XT6sI5/KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zlujzl6Q; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zlujzl6Q"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3598c1ad542so5367008a91.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 17:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773102434; x=1773707234; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kBSFBJjMJpbjZ3yrhCcXTD3ypyojE/o7DNoxI6+C6lg=;
        b=Zlujzl6QEW6uMZaLUHb0svIICPEaNfi90aOjb+4EmIxn7IOrrMeUVXPl6yBn/vKlzk
         g8nYwE5mgYh5mZnOfrz73AnsjiQDcTtRl++ds0i30uClc7aCpH/MvG/tphAJSQK6NQDZ
         /th5A9f+zmMSgDIedhMXF6yOP6lFhMTiGRpAS37Ivon3E36mna0qxptgpdoyLRhLDoJW
         Y/K+ECVIq5YWaUqg4qK257f6N/hvCx4FlkuGG+eGSkA37OML2xVINsQHP39+x75bUtLO
         zOGaTPGNLUpV0ttj8wq1+zef1yFQFqV3UrYrwPH3OCWrG2zka9UHgjvf/ioM7DUxPFI+
         eGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773102434; x=1773707234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBSFBJjMJpbjZ3yrhCcXTD3ypyojE/o7DNoxI6+C6lg=;
        b=Vetaz3cO9jmsXmOaFY0OFSkRhOez0xDRL+XRhxdJYHeID/6TbkcMgheYGwZM/24upI
         itXFAS6dLVFgvKbyWT8m0uIlHrz8GscDUcDEt2ltG0VHTvFqyBdt52t1qNhJBzAJH9XE
         sWqrxL/bNF/zbaiv0cZnf2CJ1v/WRn/L6RDOOvmMc8nbUMEimaorpQafO8CpfIyTvJVp
         kkKssB6XUZ6U9NPXVYV9S/vWK70UINlpldRW4VrnuKbVDRFvWHqrhzXz6M5e+qM2tL2d
         jmm60bplq5BwVqKqk0IxmBoux8/0dyl06epShpCfX7Wo+GYIzzXcwqUYYnrH/q/gR7D1
         Xdeg==
X-Gm-Message-State: AOJu0YwKyMvPvFRSXRkHHBkfHMYZHWpXVFyFhl+Ynsizx3jdUsx8OHJP
	j3UN6YGpiH6yZornJZcOjAYUGvTCn26FbRltTU/S6mSILHglBON0YbwMSox8IlW2jDU=
X-Gm-Gg: ATEYQzzSISsCMaiW55IgeUWtBtZ41jahUF7rFtkIsJ+ZGW016KGyB70aKEHTtZ79+cZ
	p3cVBVFkAdMepgJ/6PN7z0lr2X0Q/hxRyyK6KlwbwNoGjVnuFtzl71DrehIskKMj6E5shJXUAKs
	93EX+SIWmU3rRS08EIE0xamB6mor42KDyWkAsBkNE3Qu4yEmPGKGtdgC2tRdWRUPcfeCk78PrD8
	3hkSceMCfQY/MQlXY3XOii2geNWxB/xzYQLANBrwY0svostyPWaXlT0x82rPtGQIAKUq8sBaLIp
	G6VyL/GaQYZ5AOlAubomUpIjrabnlCot5prC8TBJRW5MiF8o9n3a9Hc20YgLgVeov7+/aOOmCEr
	MLglaRIFtdulcNZc+CGiF+F0TNrBlvIsBYnIFd8K7R8MZugheo0oH267QXp/coIgXtrke+ACdDI
	2SOIeWWX6DdhxF6m8952rtMLQSrGYJXdkQ0qW/NsD4xMKpNNRHYgyXR1teUVUCEBXtdLtYkM3+/
	5YZ7JcW7w9kN1ZP
X-Received: by 2002:a05:6a21:8885:b0:398:7fd2:5941 with SMTP id adf61e73a8af0-3987fd25c81mr5602489637.44.1773102434555;
        Mon, 09 Mar 2026 17:27:14 -0700 (PDT)
Received: from tower (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e183596sm10245803a12.27.2026.03.09.17.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:27:14 -0700 (PDT)
From: Mark Adamenko <marusik.adamenko@gmail.com>
To: linux-staging@lists.linux.dev
Cc: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: [PATCH v3] staging: media: imx: fix parenthesis ending checks
Date: Mon,  9 Mar 2026 17:26:43 -0700
Message-ID: <20260310002643.27465-1-marusik.adamenko@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove 4 checks for ending with a parenthesis by removing unnecessary
line breaks, and forward declare a variable for a function call that
would otherwise remain over 80 columns.

Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
---
v3: fix commit message
---
---
 drivers/staging/media/imx/imx-ic-prpencvf.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 77360bfe081a..2339b59af7b0 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -315,8 +315,7 @@ static void prp_setup_vb2_buf(struct prp_priv *priv, dma_addr_t *phys)
 		buf = imx_media_capture_device_next_buf(vdev);
 		if (buf) {
 			priv->active_vb2_buf[i] = buf;
-			phys[i] = vb2_dma_contig_plane_dma_addr(
-				&buf->vbuf.vb2_buf, 0);
+			phys[i] = vb2_dma_contig_plane_dma_addr(&buf->vbuf.vb2_buf, 0);
 		} else {
 			priv->active_vb2_buf[i] = NULL;
 			phys[i] = priv->underrun_buf.phys;
@@ -704,11 +703,9 @@ static int prp_start(struct prp_priv *priv)
 	}
 
 	if (ipu_rot_mode_is_irt(priv->rot_mode))
-		priv->eof_irq = ipu_idmac_channel_irq(
-			ic_priv->ipu, priv->rot_out_ch, IPU_IRQ_EOF);
+		priv->eof_irq = ipu_idmac_channel_irq(ic_priv->ipu, priv->rot_out_ch, IPU_IRQ_EOF);
 	else
-		priv->eof_irq = ipu_idmac_channel_irq(
-			ic_priv->ipu, priv->out_ch, IPU_IRQ_EOF);
+		priv->eof_irq = ipu_idmac_channel_irq(ic_priv->ipu, priv->out_ch, IPU_IRQ_EOF);
 
 	ret = devm_request_irq(ic_priv->ipu_dev, priv->eof_irq,
 			       prp_eof_interrupt, 0,
@@ -750,7 +747,7 @@ static int prp_start(struct prp_priv *priv)
 static void prp_stop(struct prp_priv *priv)
 {
 	struct imx_ic_priv *ic_priv = priv->ic_priv;
-	unsigned long flags;
+	unsigned long flags, timeout_in_jiffies;
 	int ret;
 
 	/* mark next EOF interrupt as the last before stream off */
@@ -761,9 +758,8 @@ static void prp_stop(struct prp_priv *priv)
 	/*
 	 * and then wait for interrupt handler to mark completion.
 	 */
-	ret = wait_for_completion_timeout(
-		&priv->last_eof_comp,
-		msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
+	timeout_in_jiffies = msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT);
+	ret = wait_for_completion_timeout(&priv->last_eof_comp, timeout_in_jiffies);
 	if (ret == 0)
 		v4l2_warn(&ic_priv->sd, "wait last EOF timeout\n");
 
-- 
2.53.0

