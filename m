Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B1B155757
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 14:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769868327; cv=none; b=BO38+qpz2accK8MM6cOF98pKfWjnGA7xVu8hI3e8/TvMNs3m/rfKdEqQrVMn5/0/9PZ7WAYRFLQiyi2AUdVfb4YW4T02Cs5+15k7MZIMGVskcxTDkDzlltIBnYvW+ZfBSFF+2mQ2Fry2bKK3hivo1LQ74a8bKTSW/OOTF3z3cjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769868327; c=relaxed/simple;
	bh=EeGYiCuIw0qW63Qm6X9O4YJ+/7Q+IiScgdzQQVQ7LHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dX8ec7urGOPKjbEIbc24i/yOijGL4Ctc+CiZNgBXewIEnecUAiu6x2Sdh6ToXHgjdca4WdWHEsrzo3nUpBzSs1lRTiJ+bid3ebN49Xq1SjlwgAgyAii2JCNRKvUhYjgO4FO5Yd29Jf1yleaQj5SjlvIyBbRfq0pLdBomCCSt0LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdD+Xj3R; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdD+Xj3R"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12331482b8fso4735731c88.1
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 06:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769868325; x=1770473125; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y39p1Bs3v6Mcy5NEY0qveLmYL8nGeXAC5idb6QgWBkY=;
        b=AdD+Xj3R2mGQJmwi+K4V0Hd0jBjQmY8QT+Y4nYhNVE5bjiej8nkJURcaYZ8NVJXGPG
         ZoVPWktquRwHeqrJMcEcBzFV0T5Zkgb7wRUXi363kRckc5cEXihze9+MbloecolYTAGx
         25mOOlaZMchPKRXoEuPTSnyV4BJ2ENwnx4UzZRoYvKnSuu2bljzqfulMuBfK6l4520n1
         fJ6CO+kmuiuXgA+rbBimEskM5xdZ0D7H30JA4JsHJTf/XQzJbtWyzW/E3couXI6neGnb
         HHoigkqKV8KaQYjUN9Hr862KCySlEX349N3aeMJNTq0erXCnUgW7VwjKz3ybkn9JDuVR
         IERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769868325; x=1770473125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y39p1Bs3v6Mcy5NEY0qveLmYL8nGeXAC5idb6QgWBkY=;
        b=hoPLxbdWA4PwMjZCKHvUM8cf6CE0lXV2GkHNYUAhmAXJYkMPXydzi6TUsEqGurqvtR
         rUd34RHRURcKOLsH/4trk2pDhKdiMemzwTKq5v7dQWmA11JMIgaCuMvL8lP04tubqrGV
         FtkFVEtD4en7JBer4ehpxRhQLzHBf8Op945tLWx2hUCjslrHU9sDURa2EexhnhwsH3dt
         FnDujqsNbYIN0R0/XfBLp/0SSZ9O3+uH6OPrUsHLKxeXiF6x0+YVIm1qaCxhtSxTsCOL
         Yhybsu2ThLvcGSP9lYa3sQo82/s75XuwqUolJrHuk6XVHcPppsHCePwGJOLHVDbIkrHU
         ag0g==
X-Forwarded-Encrypted: i=1; AJvYcCVEg2Wvbp37d4bkvxitma9z5+q2P5fZOlKvIhzkEu1ked79SR/i8aq79wiVSL/kzpuk4+ZCOc80j9mckrP9@lists.linux.dev
X-Gm-Message-State: AOJu0Ywdp2CC6iQVhP9GSUhTwhQ7eie+RC30cNpiAEQsv4pPoBcBIYRG
	zIWvBRUoZxa1ly/qKum/lCHJLT/gO+FfTJsr9ar7e11CdOdMitKYDIBk
X-Gm-Gg: AZuq6aJcrZvdhKZZ597gdYYJc0WyAQmt+qAY8fyd3Ippqi71GdIhoTWMxQbrWPkQZdh
	LoBFmAC5IPzRJeXvBGZa8+7urgenatiOut1q+w5aNef2YsMYOfBTOS8hlvh7BiyYPMGDTMK7o9Q
	TDgzpArJIU3fjC2ucWbASV/vMR2wvJUEgd7EsXEG2H+NDZ9DlCrRcYSaHf7deyaKH+0gWllv+Ob
	qtboOTErlbqjZYg/sUfo8TRvpS3U/CrU0Gc9rQmmddSbSkVp+9MFmWfs/ZIHNP6Q/lFQF03VTkm
	ORj7xpZ1Vv3hM3nnsnxozewq1/WAtt7VT0a6BivMTu7o+qi1uPyOZaI/1XBnBveeevHJ5OtzaiX
	lfR8CjOuoAncwKyWI390G/MUjHiMxUu6rCI6itwWPWbUtY3PZPggBqPxCuCuAtGbytMfqMQHjFS
	wGrmqbZs8cYWuUsXKeg8SK5CSyo4v4PBZD
X-Received: by 2002:a05:7022:61aa:b0:123:2d62:2e8d with SMTP id a92af1059eb24-125c0f79c9amr3140457c88.3.1769868324638;
        Sat, 31 Jan 2026 06:05:24 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9de948esm15567134c88.9.2026.01.31.06.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 06:05:24 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH] staging: axis-fifo: refactor device tree parsing
Date: Sat, 31 Jan 2026 11:05:17 -0300
Message-ID: <20260131140517.29771-1-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the device tree parsing logic in axis_fifo_probe() to reduce code duplication and improve readability.

Create a helper function axis_fifo_get_u32() to handle property reading and error checking, replacing repetitive of_property_read_u32() calls.

This change reduces the verbosity of the probe function and consolidates error logging for missing properties.

Signed-off-by: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 76 +++++++++------------------
 1 file changed, 24 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 509d620d6ce7..258bb95f03d4 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -482,68 +482,41 @@ static void axis_fifo_debugfs_init(struct axis_fifo *fifo)
 			    &axis_fifo_debugfs_regs_fops);
 }
 
-static int axis_fifo_parse_dt(struct axis_fifo *fifo)
+static int axis_fifo_get_u32(struct axis_fifo *fifo, const char *prop, u32 *val)
 {
-	int ret;
-	unsigned int value;
-	struct device_node *node = fifo->dt_device->of_node;
+	int ret = of_property_read_u32(fifo->dt_device->of_node, prop, val);
 
-	ret = of_property_read_u32(node, "xlnx,axi-str-rxd-tdata-width",
-				   &value);
 	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,axi-str-rxd-tdata-width property\n");
-		goto end;
-	} else if (value != 32) {
-		dev_err(fifo->dt_device, "xlnx,axi-str-rxd-tdata-width only supports 32 bits\n");
-		ret = -EIO;
-		goto end;
+		dev_err(fifo->dt_device, "missing %s property\n", prop);
+		return ret;
 	}
+	return 0;
+}
 
-	ret = of_property_read_u32(node, "xlnx,axi-str-txd-tdata-width",
-				   &value);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,axi-str-txd-tdata-width property\n");
-		goto end;
-	} else if (value != 32) {
-		dev_err(fifo->dt_device, "xlnx,axi-str-txd-tdata-width only supports 32 bits\n");
-		ret = -EIO;
-		goto end;
-	}
+static int axis_fifo_parse_dt(struct axis_fifo *fifo)
+{
+	u32 width;
 
-	ret = of_property_read_u32(node, "xlnx,rx-fifo-depth",
-				   &fifo->rx_fifo_depth);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,rx-fifo-depth property\n");
-		ret = -EIO;
+	if (axis_fifo_get_u32(fifo, "xlnx,axi-str-rxd-tdata-width", &width) || width != 32)
 		goto end;
-	}
-
-	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth",
-				   &fifo->tx_fifo_depth);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,tx-fifo-depth property\n");
-		ret = -EIO;
+	if (axis_fifo_get_u32(fifo, "xlnx,axi-str-txd-tdata-width", &width) || width != 32)
 		goto end;
-	}
 
-	ret = of_property_read_u32(node, "xlnx,use-rx-data",
-				   &fifo->has_rx_fifo);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,use-rx-data property\n");
-		ret = -EIO;
-		goto end;
-	}
+	if (axis_fifo_get_u32(fifo, "xlnx,rx-fifo-depth", &fifo->rx_fifo_depth))
+		return -EIO;
+	if (axis_fifo_get_u32(fifo, "xlnx,tx-fifo-depth", &fifo->tx_fifo_depth))
+		return -EIO;
 
-	ret = of_property_read_u32(node, "xlnx,use-tx-data",
-				   &fifo->has_tx_fifo);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,use-tx-data property\n");
-		ret = -EIO;
-		goto end;
-	}
+	if (axis_fifo_get_u32(fifo, "xlnx,use-rx-data", (u32 *)&fifo->has_rx_fifo))
+		return -EIO;
+	if (axis_fifo_get_u32(fifo, "xlnx,use-tx-data", (u32 *)&fifo->has_tx_fifo))
+		return -EIO;
+
+	return 0;
 
 end:
-	return ret;
+	dev_err(fifo->dt_device, "tdata-width only supports 32 bits\n");
+	return -EIO;
 }
 
 static int axis_fifo_probe(struct platform_device *pdev)
@@ -646,8 +619,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 
 static void axis_fifo_remove(struct platform_device *pdev)
 {
-	struct device *dev = &pdev->dev;
-	struct axis_fifo *fifo = dev_get_drvdata(dev);
+	struct axis_fifo *fifo = platform_get_drvdata(pdev);
 
 	debugfs_remove(fifo->debugfs_dir);
 	misc_deregister(&fifo->miscdev);
-- 
2.52.0

