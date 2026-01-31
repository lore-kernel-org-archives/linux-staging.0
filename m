Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BF2237713
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 18:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769884075; cv=none; b=EruqTsbzy/ENygb29xTHZcbIIyXB1gvBc+M12G+0mJGKRbGEvgJUDhFQAeuyfXjKAeZ+pG6/OnU4X7KCFqxjkb6LawfUlx+2swcF56R7E0QQdzfbrvYZvCAYTi53UA0ESIzbVspey8BXWVeg59iSyILdNK+CbLbQ+WZuB+RlgkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769884075; c=relaxed/simple;
	bh=xLzXKkc8Szv1bnEzPfrf3KYJ/WlAtIUwB2HsIiTkSoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q9rVav8CIWKBK7l5QQVLzviCjV7kxbmdhpUMb3YYFxXUzAZ5rYG8K5HvDgwPO9BfkUwRHhuB7Wz3WCa3AEVk0ZUZ4Kor5LocE4UetIuSnsQqcYrV7b5Mk3Imf9C3fNJuQ08kz8jRLbrlzo3YOy5U9C27WGwS/iK+SDewRTGIGJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGb2mwcE; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGb2mwcE"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b71557299dso3341558eec.1
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 10:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769884074; x=1770488874; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJkcfXhz9FYUNr4TQrjyMkEeIDXF/HSRncJSJNXfcRg=;
        b=JGb2mwcEGO7Xe+hTmEG+OH5bWt+ZGaXl/LKmlEeMm/1+ehelLt/mjc1SYCAY5a6NBQ
         thE1mXPRYCEKudEJ5oiQ+hfR6ZEVOATQbEoXqG5nDBFEUkW87fwex6V5rWTWzUBAEuPs
         pIzyqSb8H6tVf7W/p7dCRc84WQDp0tiuFi9Z2jKBcNnr274ddCmnorp3SoMyyR79Uicy
         0kTn7i1oDf4E4zJj2MiEOxySTRP6erbvxEM1Y9gjgdzWjR82QjST09xMnWhuZNdZOjzI
         0XrDMUmr9edLy9Z13ImDmQPTGZdOl5DeXugt2rkNLxOD5A4sdEEvuxV4bF1ijkJQ57dY
         zWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769884074; x=1770488874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pJkcfXhz9FYUNr4TQrjyMkEeIDXF/HSRncJSJNXfcRg=;
        b=Xz9ohjtqykYqwc2fIvnzmKn6VBb5AW2CVOmPG4ujfj2GietTpgt10g4CWuxV0oza9o
         qgn3rB+XVATxI3EpHJkT1oEN2UsdZoosAd+bHR2tUWmIrlq6QiLzv4dd1t5S0RTp9qCQ
         ZqQ7Tp+lGvGqFZoPr4FH7kwQwJUJ65L+lFYOOb/lDJn7GnVQzcI50RW4MDtLgcMz7SC/
         CmRHXq0pmFx8Wa02NrQckPiKHuQnKY3xgITTCEj8nvUL0qIuFu4Sf6F7p+KIMaf/jeI4
         tODitm24p4yr7759IJ/cURPsbLwFu6K7gR3y+hDwlv20hFyRs+KF/i0KwlRYRUxpt3Aj
         w4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVg28l9u9rJyPT7Lvy6+FQPthOiKzZBncyhD3ABKRDUUxv5Pqh1TPGBlSXg7X04xoBuGX27nm8epD9e5D1H@lists.linux.dev
X-Gm-Message-State: AOJu0YwrQSI1sGYNbVOPspiapZR0QXbeC9qY5IO1zlxbtNRKZXTLcR7E
	ZoSSMdYdxn4HkD9qen+FB2qPU+Y+p201ahLGBcUt4NFy7PwFTKDTPwpd
X-Gm-Gg: AZuq6aJFbwnj2awSd/P5DiTh8W4f/w+VVcbkDbKCoF9I93bwe1pLj7AcRci/z2hJTBl
	ypOgVZrU9O3naPfoCxmnHWewdRx5GXmcc0R61IYHXaqk1ou9jKMiUFMEiGgy24R/wsFFcb0FN54
	n6duA4SvgjdlctivMhZdUkazrZC4Fpk5TMVa2m0qVwNOK7wfGfWeUKgLyqzCrJYnAYeHrTyDGRO
	HVg8b3ID+Bwd3Wx5CM0p0I1IndkYyELqnIfs7riWT8MoUnT7T/3UwiE+gL+o513ksH4AfpxPuuQ
	uz96e2YxCLB1OfIc9nLmRGo5M6/y2o0IkOgbbD+iClcNa+z71ZgsQYUtVfW7HOVBtcqiJWwr705
	FuT3Y03pUDaBX3B6q/ccUWP3UqyMGAWbDQupwBpExNtgVgjoS5DO78KTjY3A6Gx21e/VOAKy1o+
	ezkP7d26hKEu8kNQwwVUgGi/jwz3boGA3g
X-Received: by 2002:a05:7301:9bc9:b0:2ab:ca55:89ab with SMTP id 5a478bee46e88-2b7c894bafamr2627178eec.42.1769884073597;
        Sat, 31 Jan 2026 10:27:53 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ef3b3sm16105513eec.12.2026.01.31.10.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 10:27:53 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v3 2/2] staging: axis-fifo: refactor device tree parsing
Date: Sat, 31 Jan 2026 15:27:32 -0300
Message-ID: <20260131182732.62857-3-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131182732.62857-1-gustavopiazdasilva2102@gmail.com>
References: <20260131182732.62857-1-gustavopiazdasilva2102@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the device tree parsing logic in axis_fifo_probe() to reduce

code duplication and improve readability.

Create a helper function axis_fifo_get_u32() to handle property reading

and error checking, replacing repetitive of_property_read_u32() calls.

This eliminates the goto logic for error handling in the probe path and

consolidates error logging.

Signed-off-by: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 76 +++++++++------------------
 1 file changed, 25 insertions(+), 51 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7bc7bf191250..1e3059ec4fbd 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -482,68 +482,42 @@ static void axis_fifo_debugfs_init(struct axis_fifo *fifo)
 			    &axis_fifo_debugfs_regs_fops);
 }
 
-static int axis_fifo_parse_dt(struct axis_fifo *fifo)
+
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
-		goto end;
+	if (axis_fifo_get_u32(fifo, "xlnx,axi-str-rxd-tdata-width", &width) || width != 32) {
+		dev_err(fifo->dt_device, "tdata-width only supports 32 bits\n");
+		return -EIO;
 	}
-
-	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth",
-				   &fifo->tx_fifo_depth);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,tx-fifo-depth property\n");
-		ret = -EIO;
-		goto end;
+	if (axis_fifo_get_u32(fifo, "xlnx,axi-str-txd-tdata-width", &width) || width != 32) {
+		dev_err(fifo->dt_device, "tdata-width only supports 32 bits\n");
+		return -EIO;
 	}
 
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
+	if (axis_fifo_get_u32(fifo, "xlnx,use-rx-data", &fifo->has_rx_fifo))
+		return -EIO;
+	if (axis_fifo_get_u32(fifo, "xlnx,use-tx-data", &fifo->has_tx_fifo))
+		return -EIO;
 
-end:
-	return ret;
+	return 0;
 }
 
 static int axis_fifo_probe(struct platform_device *pdev)
-- 
2.52.0

