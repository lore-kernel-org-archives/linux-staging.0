Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC1E44D02D
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 20:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772222965; cv=none; b=VWSaNNw8b06r41AKcqm4gDGBIRjXZQ5tBl4Qcq9MOywuLOcXol4KIhIOCIm1f/x1rEZuH2gxnzv55DHnwL/6hriq/gEklOledAqTOCUH2sOTn+wvkjw6ywO4FS9cWYsNUEHXKRf4SExH1+v5WZQDey6NhKutf/aP5YTw+CeDit0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772222965; c=relaxed/simple;
	bh=9LGQuAqrN49QAmVPvN5/tCzgSfV0JjbPlhmc81CPhYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cpGHzbUlsLQwU/4cHnKebE5kWAIldLohvajBzArowG6C0jKUU0BPqEYWnLtGFBgCNVV47S1T6l3TxtFetX1U/D1Jf9SuOdLW3mlJSf3/qZXQvvTZYVvVWQWP1ti3n3pxf8TDXK0QgTFSMvG//uEZhbDZPMMgSDe9ahkupbF+Etc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEu3zyzE; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEu3zyzE"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56a8d7bb872so2463460e0c.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 12:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772222961; x=1772827761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kz5e7QGVCBWSZEXYwi9uQzxLh5tMGX0778EbyzcSRSo=;
        b=TEu3zyzEaS7N5MpKBY0eR/LBJM/NtRnEXX9A78cFu6UY9GfyF3rNgW74SU6o2gLGf4
         OW7+hUL0mxAnurDzxwiQIXa21kXPWlfx2r/JE+ni5vu+0xxm3YG+PalFusCC5eGXjjns
         mLNOU2SKoXJ0tT9qW9BlgzX2msdJ1h6NsWGXc2KRzEa34G86kkhs9eqdcQa4jtXGSvk7
         uUVnrKtIlpsAOr074SNPs+RnVISJSqYx4yF69R7BPr6uSebvYFDsniMzCAXcfTYloj0l
         AliS1PndC7/FnqQoet5CLBw9zM6u7Oo2Wanjj0kTjDGHmNOfg8rwdwDE2webglR4OTEU
         TTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772222961; x=1772827761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kz5e7QGVCBWSZEXYwi9uQzxLh5tMGX0778EbyzcSRSo=;
        b=FoWmm70aPl9NWnGwt6UR0EgEwZnKP4xvwFDgCvm6Av86GYsWds+DACg1M7uZ/FmTwp
         3klW3HvnLfiT6M5mGKvZAZ986isR1Rroc/tOepX63M/xXudC8HoTPbfGU5qXzNniVFpB
         cMmR0fzmF+gZMDIlJdWZdXY59aN6F3xfVUYqlMICOD+Kt4+M58vL9Edf0IF2COc2yTZs
         0MY2cJi1PCYtpllxXePx3iYpVlrvDFivzWRI8Pp+VyQNYsL7TpP8OZTGm/aZ7ts2NJi8
         FY+8uG5VgcZZkL/DBGltd3C23EZk1hmOuWqc3KoEy5nEcsGlQb6hqf9WJiT3fxPu35by
         ZuaA==
X-Forwarded-Encrypted: i=1; AJvYcCUFBwltsmWQ8gPwuzXHiJ4N1saPgtrXSEczmH+u9rZa+EoNOCvqeeE6r5Lfo7ESQKC5oidYwnw4gvqPkWuI@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0/Jg4cfTfxNehC16Rd4i2cw8rMXbRjL3Vw5Vcbm26c3uovLC7
	tTHSmtkdtJPCevw3EgjSuuBuzLz4X4qLD1yrQx+sxwDeKK6OxFSgAOFP
X-Gm-Gg: ATEYQzzz4V0lgZ3HTjVM2mxVj8qoh1swebKbpQfdio4lcPJbeK6ugRajVLcch+gkPID
	lg4tcwQo1OawvN9xGhKtoUexiqElGP5tUVC9qtx9eJmtFUuljnUMNwuE7FYJ++42+cQOMUHE3WG
	N1grTy2f6f/f1tmlTvtnu0O40oqY9dFMon3wZLXElsvMj8mx61g7ImCfpbYv5OwqPRw/KUlKmSM
	SOaGCGlR8XuJ65gd4qSgcOiH++53zHMBxnIZx1IdGviRTinEbT0C+l+iuPn358WpUDNgzDiE/ud
	JcAm+w3rTNPBBdNx87wYEnJpLvQUfQvzQnzWWPoSom/c54XLlDYHWYSqkxDD2RZjqUnzZDNFamU
	7nnlPVThuKtPaQBZ1dkA+SZL9j4JVqoDqHYhBmrPSk/re0TCappCvNTxZh2n6bIZ+uvAdss5h5j
	i6TSxXAdToAHP16hjZtvf/qZNg
X-Received: by 2002:a05:6102:c86:b0:5ed:d33:a65d with SMTP id ada2fe7eead31-5ff32564152mr2980668137.34.1772222960781;
        Fri, 27 Feb 2026 12:09:20 -0800 (PST)
Received: from nixos ([2804:1b1:b880:4e06:554b:5779:2074:421f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1ea6f7fesm6479027137.13.2026.02.27.12.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 12:09:20 -0800 (PST)
From: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
To: gregkh@linuxfoundation.org,
	ovidiu.panait.oss@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Lucas Faria Mendes <lucas.fariamo08@gmail.com>
Subject: [PATCH v3 2/2] staging: axis-fifo: update driver to handle boolean DT properties
Date: Fri, 27 Feb 2026 17:08:44 -0300
Message-ID: <20260227200857.50880-3-lucas.fariamo08@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227200857.50880-1-lucas.fariamo08@gmail.com>
References: <20260227200857.50880-1-lucas.fariamo08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Device Tree bindings for the AXI-Stream FIFO were converted to
json-schema, where 'xlnx,use-rx-data' and 'xlnx,use-tx-data' are now
defined as boolean properties.

Update the driver to use of_property_read_bool() instead of
of_property_read_u32() for these flags. Also, removed the fixed
32-bit data width check during DT parsing, as the driver should not
enforce hardware constraints that are better handled by the schema
validation or device initialization.

Signed-off-by: Lucas Faria Mendes <lucas.fariamo08@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 56 +++++++--------------------
 1 file changed, 14 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index aa90b27197cf..cdeb944fd354 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
+					       >= words_to_write);
 		if (ret)
 			goto end_unlock;
 	}
@@ -386,66 +387,37 @@ static void axis_fifo_debugfs_init(struct axis_fifo *fifo)
 
 static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 {
-	int ret;
-	unsigned int value;
 	struct device_node *node = fifo->dt_device->of_node;
+	int ret;
 
-	ret = of_property_read_u32(node, "xlnx,axi-str-rxd-tdata-width",
-				   &value);
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

