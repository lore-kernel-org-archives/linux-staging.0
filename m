Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11A931618B
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 18:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772215912; cv=none; b=JTU01bf5Ddud3rR4AHSW6tBzDx0nZarhlwP1vWiph8BMYaUiGk1jx7/aV9jYc4137ZWCoaJKEGqQr1+7dEICTOiWMLJgVcyiaAvbeRXQA7alWZag6KiZbA1yUxTD6xh32cWeWnO1qF8RZNZysf4TLsMGecKFCeWAi+ozO6297D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772215912; c=relaxed/simple;
	bh=DAOdtSJZ0Wqs2OaCNpXJMpvuDmDXOU8oUWOLtXvalh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IZSq3Kh4u64VUZL9mgr6JqizZFXbYbMpEgXVC2D8Zfn97U/lCSqFhOlIYvmOHqVTWMGFw6h3hMcMMX3dQoXHPv3vMa0eNg41vgSEXxYTt13Z+XM/vBfCBVqM0IQ29R2f/22C7xEGBXv6bgjqFsoMy6PCSJKxekoJi/KZavPx8hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUytCifX; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUytCifX"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56aa0de09e0so619914e0c.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 10:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772215910; x=1772820710; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J73AVUIPfbTzwwpl4W7dg5hhystNfirpCSzGL61zM1E=;
        b=DUytCifXhfCTrdEaUGHmXsHnOeUtTgBdXsCztf7CLuVr/1G7f3d//Tsemn5e6H9qqV
         fmvPSRq7FMtrGim9Y29Fa3Vdb64Qn2kUQPbS4h/wHMzIQR9jUdqWaeuCdsPKDccKneBY
         RHQE+/O6BG5ox1HaoDymRQc12M9bXRjnAamwdWvPFGMJpP20pcgCb0CGIqP7C/cj19Zq
         Piml43B3c3293Z0OR7hsqKxb9Ojue6vzjs4bD0xY/rdvk39tW0xs/d/QtKYHdy0qCkF1
         EfIyj+czlTaOpgOvDw77r9UBd07lsztGf7pxPlXxyJkrzToaMkKZiwdD+fOjw2l01Ux5
         GbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772215910; x=1772820710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J73AVUIPfbTzwwpl4W7dg5hhystNfirpCSzGL61zM1E=;
        b=C/0fOqNJC+v43T4PEQo5DwYbf3ceKz9A63qK5MvqjyNjUVWso8JIYkP1glIBp7PCrQ
         vUoZc97awgN7WaiE2R+omHlX6YCzy7byZq90A0/U9k7bFKkYgmGEMpQZtpJNpfslKfLP
         T2sjWRinLGlsnzp0pG+vsrnJ4Tp2/qtXptTSUL+KqZ8fDhsawlGksnwArl95zaWuFLRq
         pTKL4lENPeFCCqCLKM4fwV+qCrrE7R/mEkaYQhV0W5kH4ZLtStzksOtEGQoHVOrBD1qA
         rf8LDFs6m8dYcIj94aOksXVvcD2o0kU0d8JMkT070nrEUspu4e6TXU1T/yDOwd6pLSvl
         GPFg==
X-Forwarded-Encrypted: i=1; AJvYcCW7q5ZKAl57aFXkJFIzbDKt+NXsOhlEBjkUecEc4t6WiDtnj70IudqLQUKo4EZhpK/HrjbkWEpbfOYzfeFQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzZcCEMVwJVr1gvIpIVmTYriVj0yUca3LrdyhKOE7u/bJv+7GOr
	ow5KNOWydj8oD55zljEvCFJSWuXmTa9sFIq1gqg4RlXmmCGC2+7hQaI5
X-Gm-Gg: ATEYQzzXiKVwB3I9TksThR9tKEvbI2+8domyexXUrv1EwLSdY31y13abiAbvixkIa1Q
	7e/NX/2gLDcF8Z03XCdIDn+Ue+3QzQLXhDFX4rnIJcI834eJLMvfikVRdAN19S9QL1J+9JM3Rhx
	hW3zBM8IPDc8xU22Ifpei09c+zHL134in9M57vBdEWlZCaW2wLJ6KhGDTQhq/SPy3xMOaS9JMbc
	YZg3z9bEO8Znevw4SCs1ZWZBEXZdhidaFyW77V+LT1h6suecsndlMAuXNGiIFJ9PjWObzi5tBnI
	mElxtQL8rO5jskKVDRSD65/5n2MWSeDpF/3EPol+CBuIWvjF6UlaOX1wWnlsKREqh/3nTLJTiBF
	decv+MBsmgeByK2+4djDkdpioUUxDLO/x7uno2r0nqUwdvI30mSnkS9jcqgFzxibFYwUP/2NloI
	SF69WZ9qnuP6MipYsWRIkmLQXi
X-Received: by 2002:a05:6123:2e2:b0:566:2494:39d7 with SMTP id 71dfb90a1353d-56aa0acb7dfmr1906057e0c.18.1772215909900;
        Fri, 27 Feb 2026 10:11:49 -0800 (PST)
Received: from nixos ([2804:1b1:b880:4e06:554b:5779:2074:421f])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a92049d05sm7452905e0c.12.2026.02.27.10.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:11:49 -0800 (PST)
From: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ovidiu.panait.oss@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Lucas Faria Mendes <lucas.fariamo08@gmail.com>
Subject: [PATCH v2 3/3] staging: axis-fifo: fix alignment and handle boolean properties
Date: Fri, 27 Feb 2026 15:10:45 -0300
Message-ID: <20260227181051.36207-4-lucas.fariamo08@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227181051.36207-1-lucas.fariamo08@gmail.com>
References: <20260227-unboxed-customary-7ce6eda1858c@spud>
 <20260227181051.36207-1-lucas.fariamo08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 55 +++++++--------------------
 1 file changed, 13 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index c64a7249feca..4b2cab2f8357 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -387,66 +387,37 @@ static void axis_fifo_debugfs_init(struct axis_fifo *fifo)
 
 static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 {
-	int ret;
-	unsigned int value;
 	struct device_node *node = fifo->dt_device->of_node;
-
-	ret = of_property_read_u32(node, "xlnx,axi-str-rxd-tdata-width",
-				   &value);
+	int ret;
+	
+	ret = of_property_read_u32(node, "xlnx,axi-str-rxd-tdata-width", &ret);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,axi-str-rxd-tdata-width property\n");
-		goto end;
-	} else if (value != 32) {
-		dev_err(fifo->dt_device, "xlnx,axi-str-rxd-tdata-width only supports 32 bits\n");
-		ret = -EIO;
-		goto end;
+		return -EINVAL;
 	}
 
-	ret = of_property_read_u32(node, "xlnx,axi-str-txd-tdata-width",
-				   &value);
+	ret = of_property_read_u32(node, "xlnx,axi-str-txd-tdata-width", &ret);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,axi-str-txd-tdata-width property\n");
-		goto end;
-	} else if (value != 32) {
-		dev_err(fifo->dt_device, "xlnx,axi-str-txd-tdata-width only supports 32 bits\n");
-		ret = -EIO;
-		goto end;
+		return -EINVAL;
 	}
 
-	ret = of_property_read_u32(node, "xlnx,rx-fifo-depth",
-				   &fifo->rx_fifo_depth);
+	ret = of_property_read_u32(node, "xlnx,rx-fifo-depth", &fifo->rx_fifo_depth);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,rx-fifo-depth property\n");
-		ret = -EIO;
-		goto end;
+		return -EINVAL;
 	}
 
-	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth",
-				   &fifo->tx_fifo_depth);
+	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth", &fifo->tx_fifo_depth);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,tx-fifo-depth property\n");
-		ret = -EIO;
-		goto end;
-	}
-
-	ret = of_property_read_u32(node, "xlnx,use-rx-data",
-				   &fifo->has_rx_fifo);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,use-rx-data property\n");
-		ret = -EIO;
-		goto end;
+		return -EINVAL;
 	}
 
-	ret = of_property_read_u32(node, "xlnx,use-tx-data",
-				   &fifo->has_tx_fifo);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,use-tx-data property\n");
-		ret = -EIO;
-		goto end;
-	}
+	fifo->has_rx_fifo = of_property_read_bool(node, "xlnx,use-rx-data");
+	fifo->has_tx_fifo = of_property_read_bool(node, "xlnx,use-tx-data");
 
-end:
-	return ret;
+	return 0;
 }
 
 static int axis_fifo_probe(struct platform_device *pdev)
-- 
2.53.0

