Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D631369965
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770039273; cv=none; b=aNtr4xeWeX+R7U4xHV4zRuH7QJAJ3UyRdG8TVlyrPJT6qsQlaUim+ENM6eyRrM84xCIJ+yAztO5EzUQmYbX3bHi/3Cvuabk+Ggz5S1GpE0VkdPtsFLeWCM+gduhm/9Y1qlmrbjfjj29+1fJjHGMcvDM/Or4QjdI5MgC7Azu9Bdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770039273; c=relaxed/simple;
	bh=FqohdCnNAx4WnMf0PB7ebL9iTd7WmrgZUOv0vcX+GEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IFNepDiapEgzODkA/AJhaUNrfbp7sn5wVQtE/jCvbcC9F2/HQhTNrJiyT1BPrt/FERz+2y5yjY2FZXPc1KhKtgvrGDf1NuU3M4E+2Oaxown6tSK7j9dXYF7M9xvmkXIpIncTe/98SpFNuEMJF7NRQ26Nelbz7aqSDWMLcLT59pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5CeST8n; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5CeST8n"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b740872a01so9516622eec.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 05:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770039271; x=1770644071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yge6lb5ZG7qLUrOkaknUBPOnrzubHT+OI5LgZ8GcDj4=;
        b=Y5CeST8nnUExFS6e/K0WJuiJ261eS9ET52HoyRfQbANPDA9bmW+2RHotRQePuLIQXI
         OYImkrTheMxRJ23Glv4uOGGfFcBr2MuxcYHOunHL7bVAU0K20sRLByaL6RO4siNOiM4/
         j+K6EwR1xBKkegyEC4xnFM6Le/LAMF4ZFoLKnRdEXHdpMIPuzy3tCQJuzTCpOkw0o3sa
         URE5m5wjvdV3uofvz3Nxz4S7hnBcPFpAEAqpxVMh751dYMltzsrvWzw9m1AxjiKos9Ge
         gCWNlcjcunKkp4Tq6i0xWp/+EPv0FCe4nbsHdMSLDc+vl4N19O9FXruXATIJZhFN+4vd
         JtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770039271; x=1770644071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yge6lb5ZG7qLUrOkaknUBPOnrzubHT+OI5LgZ8GcDj4=;
        b=Z1ppw8dRz1imm3oSa36oh26np5g/gjpzX5gcysh0UrSX0GMY4rMtxRAb1wzvnz1hhz
         rBe4R/VQp7YO4krXDjt08jkoZ/bijgFrqpuwf1A8E95qSHHA0kCqRd6rvqdS/3EzW+gw
         fxX9EiccvkZzTHCgFPkUZ06bf7Krkcr5x9KSLtLRuaStrVTsF+5ji3G/02wRv31eQ0wz
         +5T/PrhdT9nwqo0XhnSdgg7rZXFMDzHQ9b/iS4KYKMmqLZbDl4uvhPcezF31Qa2p5lLC
         A4OKHsUSRcdGFLm6SorfnEAgx0oA0hxZ3rPweaLvMXHrpvWadrKrkjrBwDcaOfyryFbG
         QmHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgAxURyPHkGq42IZX0nvtNtW3as0dyC1ROGOdhtGc+529ZIUr3G/EN6sV42Xs4gm2Def0mdjIgr0hGrSla@lists.linux.dev
X-Gm-Message-State: AOJu0YxnRsOLAw2FeYpFTOXI5Hbl3hwqrg618QMRZADFWWbLLLfn3v7s
	ZjGt5v3xrQGEeCVykSA65euMDkstLrhYxC8cjS6Lc9ibej/A0M9rnTXb
X-Gm-Gg: AZuq6aIIk1RV4NpymDBf43my0zKVam28iwcpq+XWu5V8bqB3Hb8WK0ZHE1I3blS0+Jw
	i04DbLR6Y3Uk80P0UzN+8ewaLWxDTyQNRJSJH5SRi9xtkD6WLohiS3krF+rO7roxRS6pBW94n6+
	MxtBSrkkwDWVBrP/CY9xyMh/jesJPi+5zcig1rgLo2fIiUvi5gyLqbIztMmhGHfPBy5UbBB06tc
	9LDEhvpNzJLK5XyrkAQ8BOsLA+GE+Kte2HsGF1XNWWn8wQyo1+NI5lFTGdG79liA3jgx3QKWc7H
	YQGy7CEkP4zVyiremNIXjSOpURUJRNZWUa0mevZ7Nr9XHK8RoLxCE0Ud4+AurKpIe02O4cC+4B5
	elHwUuO3aYEjDfFNc3ITjrQeyCHWRSjqTwpcykYKED/gSDkNzJL+KOe6A06eVf6tU9id0R6pqZF
	oIWAIRJUetIr79FpTDk7wqBQnb0S56AEQr
X-Received: by 2002:a05:7300:a494:b0:2ae:5bde:a5c5 with SMTP id 5a478bee46e88-2b7c88ea6f2mr6048802eec.30.1770039271154;
        Mon, 02 Feb 2026 05:34:31 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1af8a7bsm20097282eec.34.2026.02.02.05.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:34:30 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v5 2/2] staging: axis-fifo: refactor device tree parsing
Date: Mon,  2 Feb 2026 10:34:19 -0300
Message-ID: <20260202133419.20112-3-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202133419.20112-1-gustavopiazdasilva2102@gmail.com>
References: <20260202133419.20112-1-gustavopiazdasilva2102@gmail.com>
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
Changes in v5:
 - Added missing newline at the end of the file.

Changes in v4:
 - Removed extra blank lines in the commit message.
 - Added "rx" and "tx" prefixes to error messages to distinguish between read and write width failures.

Changes in v3:
 - Split the original v2 patch into two separate patches.
 drivers/staging/axis-fifo/axis-fifo.c | 75 +++++++++------------------
 1 file changed, 24 insertions(+), 51 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7bc7bf191250..08717b48b1ce 100644
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
-- 
2.52.0

