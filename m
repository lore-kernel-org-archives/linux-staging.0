Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1FF2FDC57
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 15:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769875000; cv=none; b=CnJ1BlYYJQ0j9B4+V/m8Qc1bnnn6NjuAVmLKfxucham+sawrmX8Jes9dkgXbx5BGpp0c8S9OHuAUjdv5yFe4UCTpCGosqmvUfSVjWfObY0SIheZbfD48GpG9iw3Ry1OfN0DQDyRv+ilJj27rxg3nIcd4ueqT+0frtVDsLxzdzSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769875000; c=relaxed/simple;
	bh=yvmZQEEdgEXz9hJWAVyiozQa2g1OrdJcTkk+GH959oc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r2PrV7+3igF4MQK73QSizi32BZ3JrtW0r1DQu82/0iUv+RNTqLk2vVl25kjb1XbMhF4tWAA4Cw7V4oSN5cIDL9pi0HNxk3/edkkqrsJ1VbrqIAi+U/8gOrhqqFi8ZcKyDSWGCrqgiha4n9b7xkSFRXqyLrQDymsmLf3XhKU22Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+r3jNZZ; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+r3jNZZ"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b7070acfdcso3674122eec.0
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 07:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769874998; x=1770479798; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dUxsKVUxLbL7CRhW7Ytg5YIJOI1tbDjzyj7qQazcMAk=;
        b=T+r3jNZZ0yOeh7VRiDlk73o81QIJex0XwNmA8AH0HhSuXlcaDh51jQDkFNuTwG0Ep+
         lYnP20M/aUPGx3XMur2+Y9OA0V1tPi50Rc7yvmJT7eRRG4rEYWkWuet1F5QW/mpcLhqn
         gcy5coGE5OC9pmR3Ig8bUGYAfHQH0u+JyiQZrEdUF0mRg9Gd5a4TVvQ6z2plQKVS3Ao7
         j0qN8fEEe2Rcn6Fr0m/T8/gvq0aErIh3+4loc40l+51GEfRYavAZgCsbqoVCNj7Pk40A
         /vFZvoYMKszc0J8w2DNIiEloLp7EmhC/ksR9lDx2Yx8Gl2rifR4VpsZfeP5zXxSC1HW4
         3aNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769874998; x=1770479798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUxsKVUxLbL7CRhW7Ytg5YIJOI1tbDjzyj7qQazcMAk=;
        b=sETUX4cwIaquM0Yg7zfDpJz56aQyLn04vkNxSiJ9KNvQQcu+qPU3qSZeJMFdXdMJnr
         QCZ/f20Cs6/RAYw18XKQmH+xUz8zU6+vA1M6M8Cg5nl3nx3VwQBNw9Lexn+0ORSm4Gfo
         EylZj6S82n7BN+DY2ZRjR8zY6cV8zm5gNUlchrrCNhdWEC+nvclwsQh5NhWCDNnvysv0
         HHjlana195hUpjzmTcTFscHtpnATKwdv3sYpokcfp2ceVIP3aU1hsmh/gxjbg04lW4+4
         mwuAZMmLGb/ubaK9vcCfljketBuCMloDFwaevSdluVK1qMBz931sgJpfVTdh5rUkTJ6e
         UKKg==
X-Forwarded-Encrypted: i=1; AJvYcCW4WHMKMlBTMo5sg2BMzj1+iNcVOBpgIeg4JWvh4HzInPcHBtJi9Rd6P+f8lZVSECyV+lbw0fE2EFnqwJ13@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3wgmteLArhXpugTvZo1oKXP9piKAH63zjE3ru2CLS5hs9VnRm
	+PRA6T4+Mzk3M+/5m3pPgQe4LCf+JcgdPbd0tM7Zc9LN18hfMyWyUFdk
X-Gm-Gg: AZuq6aLsr83M4DAUaAf4hG/Se8cmYvmfCcLGzp8F1i6MjY8EPDkNnID0y40ojrD4MIN
	WZGOcZj7v5kKO76JwP1lTbbnTWwE2XHuHDQRaOtpB1ZVJ5d36p8Ku018iGXJ6KuSqRsSZLovxmL
	S2YhSy2r7NV4N5/KYnlGN9hys9+cldsKy3uPlx7b02dd/s5SPSjDv9ayiPbLHZf6ecuP6886cmU
	NGHfLSEfBqqqtFwOiUFjMwtlKJf0HGy4C8kxMyENUPdNoIE4IfR0SI1f4k4oc+KNNyXn5QIL98K
	4d/m0DxsjZyFAqvcZYSwuIf7VcwyJJ+UMRvyutTO6TexEi1LJ/yKg+j5krQPS86R/aA/Zz6S0e4
	Bd0mCsIjXRY9PXBLkFxALGY9mUt2C7UoAiPlo5+Q6k6SNYdvV7DjXv+a6IZoC2vY4yu9Gj4oy+A
	pLN3xunR20R5dafoVyVmRE/beAzI20zNd8
X-Received: by 2002:a05:7301:1688:b0:2b7:fcb:765e with SMTP id 5a478bee46e88-2b7c8940cddmr3184805eec.39.1769874998170;
        Sat, 31 Jan 2026 07:56:38 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a170ca0esm15881717eec.15.2026.01.31.07.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 07:56:37 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v2] staging: axis-fifo: refactor device tree parsing
Date: Sat, 31 Jan 2026 12:56:30 -0300
Message-ID: <20260131155630.41587-1-gustavopiazdasilva2102@gmail.com>
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

Also change has_rx_fifo and has_tx_fifo types from int to u32 in struct axis_fifo to avoid pointer type mismatch warnings, as of_property_read_u32 expects u32 pointers.

This change reduces the verbosity of the probe function and consolidates error logging for missing properties.

Signed-off-by: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
---
Changes in v2:
 - Changed has_rx_fifo and has_tx_fifo to u32 in struct axis_fifo to avoid casting.
 - Removed goto logic in axis_fifo_parse_dt() to simplify error handling.
 - Reverted unrelated changes in axis_fifo_remove().
 - Wrapped commit message to 72 characters.
 drivers/staging/axis-fifo/axis-fifo.c | 79 +++++++++------------------
 1 file changed, 26 insertions(+), 53 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 509d620d6ce7..f46cd211d359 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -121,8 +121,8 @@ struct axis_fifo {
 
 	unsigned int rx_fifo_depth; /* max words in the receive fifo */
 	unsigned int tx_fifo_depth; /* max words in the transmit fifo */
-	int has_rx_fifo; /* whether the IP has the rx fifo enabled */
-	int has_tx_fifo; /* whether the IP has the tx fifo enabled */
+	u32 has_rx_fifo; /* whether the IP has the rx fifo enabled */
+	u32 has_tx_fifo; /* whether the IP has the tx fifo enabled */
 
 	wait_queue_head_t read_queue; /* wait queue for asynchronos read */
 	struct mutex read_lock; /* lock for reading */
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

