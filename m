Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174EC3644D0
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 12:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770035015; cv=none; b=WhWT+enOLNJecwRvx8W4Vc/z4v2egKC4Po7vP6E++Dl8Uaw4hbGQsky5ON+3FC2D9/9ZV5uR65L+5tBndJOUsQB6PvbpFUbacPA93zYyYW8B42orQWtwQW1fj/lpdPsOL/r98bZq/1GBp0u6DPTHaTlMRqTL3HnTeu7TpL7mkA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770035015; c=relaxed/simple;
	bh=e9AqIPjSLlkyiYwEgC43Ct05qSwqoUG3rJ3QrJvvDUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CDirb1XdwV9L0jkaLUC3hEoI2zO8K2pX2XPLcJbWyedogFcwnI6q4wNwvq6br7+g2xiYC7oKvOfoiSG5yTXDLBFTzMpMCJJv9trp/8tu62rd5/wbE/z+0S1N2YVFE+UcoSnMMKIKGu2ekKObSq3oJIq9eRMairvBDYsSkYmXgmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYd4zvP1; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYd4zvP1"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6495d592c45so4103341d50.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 04:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770035013; x=1770639813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YpDlLeKFJfdeZAVVwhs7IrX+a6NGtfWbvPASIEy3Xc=;
        b=FYd4zvP1kBQLp6FtUQttFMc5GLO8+1FWCRbvasfDUxqnVEVGWdRPr5xrUfAmg7j0Jn
         NMq2gB25D/rJz6VWv7doWV6yThmOlugBsV5ZHwyg8Wa7PKvPMqj0Tik8DkkXH5bwYraH
         +uH+j5/seqP3N6rKUjQIBM4rd+UIA5Fkxe/mvORdddL6tGO7vCXUkbVrbc20XpwtDiFK
         oW8jOvX2X0JgKzTKOoVSOqlIv/JthYOQO1de6zc/c9VjeOPr8+tiOjv3UsrzFik68VLR
         NyqZfQcyzLrBhnAh22DO7r/cZajuxkn1X12s+wqhZ+tNVqTb4hS7Goz0AEHdaBeAj0Bi
         Y2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770035013; x=1770639813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0YpDlLeKFJfdeZAVVwhs7IrX+a6NGtfWbvPASIEy3Xc=;
        b=DT91eux7/EeeLwcfLGGJqsvKIJH2RWLHEBVzRQPr4Jtw7K2z5pHMpg1h9RG5EMKqs2
         6l0ma9a1uHKZceWckdHbqlJ5yGT0BmjXMSs5622GxeyMlD8wdHo2wVesMRtqsW+IZexo
         zG1BhXHI5AsueScjij5dnujVgxcKFfR4nS5m37S4/02DCDIume7pnN+k4ldw7XBteq8a
         ZoVoZCBW1LkH49F4O6CKfInECH4vKnFdogVaAB7tJePlAJ07uaTyXns6BoRcaVd3EhF9
         BB2/ZsPDr1gitidilOGIlkZqpUe4bjc/xjFephDn/Y3OeTk4TJgcJoPJNApJxsUGj6EP
         CmAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlEpU4w+BQBDaB+xSIEuQnmkroK3z2ufuhGMZwvH3GU0bWZsvqZ/mSGlVetmSuF8lQrRyEp+cD4nnO5/+Q@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9dDBYruICfs8qNAw85DY4nYN0+dJGUHEjkhjS5eOswUxUcOV0
	VQlxA3uGmBx5+0nJzmHl10rhmuntDgEzIL0YS/q0/uSJp6g0XZqaiYoF
X-Gm-Gg: AZuq6aLBOXLwY4KSIITumKrFoTds8MPrng1JJaRSHExX9awJqk+wz3q5jlu+uVDLzo0
	3Oq5N4OQTkvn065jySEnriWI7zbgyUPnkzCOI5RUiMLMbhajV1g+m90V6etkQGNo6RLICH5XNKd
	6Zs5ixgta2LINtYagIWVdGqd9b2TRBl/B8yVCpAzJE91Bs5E0SP7j7gBfuHcX6Mt7Hzx+Q/xoRe
	LJdRRRbKYp8tFwYHsTfxBMlmSwJgXapwj4/Bn9X363Qw1TBNdDVzZk07Fxp94OEsm1XXt8XLAjH
	WQXo2NC6JNbM585LId23IICy5BoR/50kMg/NkmQNX/wqp1G2XooVwX5uEBSw6NBjXWInJKzyX4V
	YodFFaHRG/54bkA/qKsldSyLb9vcGjC+ZlcTWcNGQFngnDmAY7Kb80H6jNfanQsCkWX2bd74a2b
	7fO2kSSHNEphU5UNa4PviGNkk/wYc4A0wuU9LfuOwDee0=
X-Received: by 2002:a05:690e:4182:b0:646:7e12:48d3 with SMTP id 956f58d0204a3-649a84efa2cmr8274525d50.82.1770035013066;
        Mon, 02 Feb 2026 04:23:33 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649b30b5825sm4981931d50.24.2026.02.02.04.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 04:23:32 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v4 2/2] staging: axis-fifo: refactor device tree parsing
Date: Mon,  2 Feb 2026 09:23:17 -0300
Message-ID: <20260202122317.13821-3-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202122317.13821-1-gustavopiazdasilva2102@gmail.com>
References: <20260202122317.13821-1-gustavopiazdasilva2102@gmail.com>
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

Changes in v4:
 - Removed extra blank lines in the commit message.
 - Added "rx" and "tx" prefixes to error messages to distinguish between read and write width failures.

Changes in v3:
 - Split the original v2 patch into two separate patches.
 drivers/staging/axis-fifo/axis-fifo.c | 77 +++++++++------------------
 1 file changed, 25 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7bc7bf191250..779de1b22ef5 100644
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
-		goto end;
+	if (axis_fifo_get_u32(fifo, "xlnx,axi-str-rxd-tdata-width", &width) || width != 32) {
+		dev_err(fifo->dt_device, "rx tdata-width only supports 32 bits\n");
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
+		dev_err(fifo->dt_device, "tx tdata-width only supports 32 bits\n");
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
@@ -700,4 +673,4 @@ module_exit(axis_fifo_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jacob Feder <jacobsfeder@gmail.com>");
-MODULE_DESCRIPTION("Xilinx AXI-Stream FIFO IP core driver");
+MODULE_DESCRIPTION("Xilinx AXI-Stream FIFO IP core driver");
\ No newline at end of file
-- 
2.52.0

