Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B1936CE18
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 14:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770042064; cv=none; b=H9EDTTEIPTur7jqfzljXVFe0acnch/Q3voaw2+zmZ6pa376cLNKVRynhl3iG4xTqX5JlgLcblLJ5CsgPMThCLPJFy9XG7p9mPUajj1nfevXoRAJZSH0gWpCUJ0N1A0gWqw1Va5N7C+b1bRZyLf2X761zdH7673zU5F2sz72vN4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770042064; c=relaxed/simple;
	bh=XYdJGA7GUD+1E1EflZYDYVUKm5sLrTgH7OZ/r89xzFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l7vOEFu7flqi9d0iub8bD8J0DZ0XYnRx+bLS1K+WjwARdZ8dZm3q0rHCcKVXWkU7NwLabFGAMSkCkxYxWCg6J55XdkkVIm1WDHd7O/gxW1/e42Un+QJMm7Sy6TM5jcmDX8/7PvYyor7n6BVEbiYUcuem7OPXYKmZWY/eBrHiDUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUQIcS7H; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUQIcS7H"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64931bbf70cso3854370d50.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 06:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770042061; x=1770646861; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2DDMn/HUt5Co9aCezWdd+kTD6C/zFxK/AKWJd/nkuU=;
        b=fUQIcS7HrwYV/PEnEW70rvb7l5Dj2Bggc2IhaY3s0BDrx4Y8nCiwU9wV6OnS7Ds6MR
         z3sh4/YJhTFbtuPIJrZA41kCDlaIlVkosYeDcy3Cxrnxlt0ITi1f41euMFKFlVYo0h5O
         wu+gUK5Q36WAJGOjHKIeZlfBCIRLybrsZV1BadfFNcpLbQ/wQiqYQcmfxqiMyRTdi296
         H+At+tFYeOou6lfHa3xyCgOc7/5UsylQGZAwWneAGS6SDaw7Cqnf4kPp+pOYonHecNPe
         jKVyGDCqszKb7RE+sNTHhGfzJw3PpRkBZF0DsVdsxeb/Kvke/UIlybv3ElJ4QANoURyl
         WBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770042061; x=1770646861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X2DDMn/HUt5Co9aCezWdd+kTD6C/zFxK/AKWJd/nkuU=;
        b=nYWhytbAnQWxlmrUniw1Ic+btwWccGpkSw/TF3MNuOr7haUpL3UrXKk1ZhzDF0l4M0
         771Wpo9Y9lXKwFsYs4eR9VMfx0VtlE1BMV4nyeenMCy+XCKBZ92Yxj35z/pfnDh0tpYA
         khBcr34/x502DrV4QTVOH+pPl9Ag9xxfB7YpN8C5onpr7oZIfPBke+wr1+HBIjbk4h4x
         HB7EoV5J7rmub4ZWY9P/ogK+BR1CsgqrnjXAIGnMIHpplEE3eQJq60fv5LeIjm0MrV1a
         6G0EwqEa2x4keC2J4NHMwFF+5tGh+CbjBU5PxyBw0gOBnhNmTfg2tD1qsaLMUSa9PrQz
         +4EQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5OLS8AiKB2eeBpK8UIPHSGf0Lt6elUILD7qmQxPaYHb31rKinPET6G08qff6NYfQHrxRZVJ1a/X7di3UV@lists.linux.dev
X-Gm-Message-State: AOJu0YwM4XUEdCsMmrMexi3JeyMc2ClawuK2DlVCMikC7D5wnsxCCHXB
	ejMXtajTpgNvZjmRSmmIx32KxJLAs+Z4DNwZ9KJNUawwn3DN45AmgQGD
X-Gm-Gg: AZuq6aLt3PrnO1NLBFn6Uo7aMp8LgWKKD/bl8UWxtNdNHHhVG4Iey03TgjzhXcWozoZ
	WPSYrnrNpBzIKo+mU+n0JIjMu2gnmzmzla6PzD1WModMjbLx/z9yFBS+mRdNoSATtKBP/e1caBj
	74NVY/gGO/nXZV55oEtGnCjxWkWVJKR8rHZANhbMnwmooM8mwktQWcX22ZgE5BVikchXy8FXce8
	yuK91E4U0aP9LjlvTRxo5n7PYTbXOpIv7et//Lw/PD/0m3MT3KTfcnUKtF3gHa7A1aidYpRC4jr
	egXTwUPE8pQVjDjhWMJZbQyxONvs5O2KBCFuWmA+Jf6nct3WyXqEbkVqfTqA3EvINQAs4Q483xh
	+AQulgJ8MzxSMADiTfdyCspa91wk1Wzal3wVu7dcIlyn9nP6qkBjuPfvDa0dOuPnGrYdJrd1skq
	AmWyKVBQldZvia+/7Q2J8WG+ueRwvjS8LJimntde4u6YaGKr8o+DuwSOSSQ3ljhLbH
X-Received: by 2002:a05:690c:7:b0:794:c2fc:73dc with SMTP id 00721157ae682-794c2fc7de4mr107452687b3.64.1770042060840;
        Mon, 02 Feb 2026 06:21:00 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794b2468901sm47292927b3.22.2026.02.02.06.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 06:21:00 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v6 2/2] staging: axis-fifo: refactor device tree parsing
Date: Mon,  2 Feb 2026 11:20:47 -0300
Message-ID: <20260202142047.30704-3-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202142047.30704-1-gustavopiazdasilva2102@gmail.com>
References: <20260202142047.30704-1-gustavopiazdasilva2102@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the device tree parsing logic in axis_fifo_probe() to reduce
verbosity and simplify error handling.

Remove the verbose error logging and goto logic. Instead, check
of_property_read_u32() return values directly and propagate error codes
immediately. This aligns the driver with modern kernel standards by
removing unnecessary error messages during probe.

Signed-off-by: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
---
Changes in v6:
 - Removed axis_fifo_get_u32() helper function entirely.
 - Kept 'node' local variable to avoid checkpatch line length warnings.
 - Removed dev_err() calls in parse_dt as requested by Greg KH.
 - Fixed checkpatch style warning (missing blank line after declarations).
 - Ensured newline at end of file.

Changes in v5:
 - Added missing newline at the end of the file.

Changes in v4:
 - Removed extra blank lines in the commit message.
 - Added "rx" and "tx" prefixes to error messages (now removed in v6).

Changes in v3:
 - Split the original v2 patch into two separate patches.
 
 drivers/staging/axis-fifo/axis-fifo.c | 78 +++++++++------------------
 1 file changed, 26 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7bc7bf191250..c482611bbde7 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -484,66 +484,40 @@ static void axis_fifo_debugfs_init(struct axis_fifo *fifo)
 
 static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 {
-	int ret;
-	unsigned int value;
 	struct device_node *node = fifo->dt_device->of_node;
+	int ret;
+	u32 width;
 
-	ret = of_property_read_u32(node, "xlnx,axi-str-rxd-tdata-width",
-				   &value);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,axi-str-rxd-tdata-width property\n");
-		goto end;
-	} else if (value != 32) {
-		dev_err(fifo->dt_device, "xlnx,axi-str-rxd-tdata-width only supports 32 bits\n");
-		ret = -EIO;
-		goto end;
-	}
+	ret = of_property_read_u32(node, "xlnx,axi-str-rxd-tdata-width", &width);
 
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
+	if (ret)
+		return ret;
+	if (width != 32)
+		return -EINVAL;
 
-	ret = of_property_read_u32(node, "xlnx,rx-fifo-depth",
-				   &fifo->rx_fifo_depth);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,rx-fifo-depth property\n");
-		ret = -EIO;
-		goto end;
-	}
+	ret = of_property_read_u32(node, "xlnx,axi-str-txd-tdata-width", &width);
+	if (ret)
+		return ret;
+	if (width != 32)
+		return -EINVAL;
 
-	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth",
-				   &fifo->tx_fifo_depth);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,tx-fifo-depth property\n");
-		ret = -EIO;
-		goto end;
-	}
+	ret = of_property_read_u32(node, "xlnx,rx-fifo-depth", &fifo->rx_fifo_depth);
+	if (ret)
+		return ret;
 
-	ret = of_property_read_u32(node, "xlnx,use-rx-data",
-				   &fifo->has_rx_fifo);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,use-rx-data property\n");
-		ret = -EIO;
-		goto end;
-	}
+	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth", &fifo->tx_fifo_depth);
+	if (ret)
+		return ret;
 
-	ret = of_property_read_u32(node, "xlnx,use-tx-data",
-				   &fifo->has_tx_fifo);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,use-tx-data property\n");
-		ret = -EIO;
-		goto end;
-	}
+	ret = of_property_read_u32(node, "xlnx,use-rx-data", &fifo->has_rx_fifo);
+	if (ret)
+		return ret;
 
-end:
-	return ret;
+	ret = of_property_read_u32(node, "xlnx,use-tx-data", &fifo->has_tx_fifo);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 
 static int axis_fifo_probe(struct platform_device *pdev)
-- 
2.52.0

