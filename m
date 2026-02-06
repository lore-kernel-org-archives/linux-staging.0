Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A682366DAD
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 13:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770383523; cv=none; b=PV8tldUADMp5VZpdkP1PuBTcYONOyHa2luI688wfUwsDFBPeuUdwMPMEvysmrvxc3HsMD2YFKPNiEt4qLecAL3ilAaK4PWN+FKeNYhf5bZ/hjp7iAL6PPMtsdNSMebFlWdbYnA+n0PfFCmfSuL5QFs2YPpk7dGIXHHZMftydsYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770383523; c=relaxed/simple;
	bh=HqoehNkmR2zJmggy5jrXv8U+G6IF+67l8VlplDzGlIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gSNr5Z7GDZK2O23UQjZFRTnMOyd2vb9Eveymn+GhbHK3ZFmB3YWWqVBayiI9SZOTbPiIOtQhT6KRLurXY3Tnbi7lIfqT/Le4ZuIJqdQ7g0nu/IpcjxmMQSNa9XPqkHLz0mNzubantVTrYQTK1gRznqknSUTsvgnwKGVPXrmUv6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iq+umSFr; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iq+umSFr"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-649dbff9727so620837d50.3
        for <linux-staging@lists.linux.dev>; Fri, 06 Feb 2026 05:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770383523; x=1770988323; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUiGz5BYm72YfGXfMKvcmFPxgFmLy9shGbceZIko3io=;
        b=iq+umSFrX1sARjSpeqwP67gdzgn1SBaP8QLB6lCHuM5DV3FxHpmEDovYkFxqfKGzCc
         deRmKgqOtbuZO7S8/zHoUPuvCPzm5+nc6N5/ynXSIntT/6xqRD4j4dbF9xbumgQGWvZw
         jJD1vV71cfXC7r0j8bD/DK+fHDvSh2tzSEXAvk0h+lgVDnQ4qN4FuANZNxngwwZ22Hic
         JxWDuU+N/wwbdiLJmbmQZgq+xysYOPzYWOry+/RQeJ4AkJkUwCr2vaK+nUoyknFVGTkj
         8m9WgzifO1GozZSos/FYAmJHSMJYpEoCSq2Z+sR4LX54wqX3F9AXV5vzeZzQkBRpFmoM
         yQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770383523; x=1770988323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EUiGz5BYm72YfGXfMKvcmFPxgFmLy9shGbceZIko3io=;
        b=L16T2g5GV7VB/tleRDYqwp24D6oQg9OuYrMwO43+qV90Yg6GipqfrRpzOYJJEglW+a
         35INphokjl1rTJyRts5MDLBi/KlLHQJf1bFimk970nHcopQNgEe0I+S3ahvJO+kFaTK4
         7cXFFelK9LYPAgSlFg/QYqT3aTZvvS33okUg9yxyoOv5FHZJ/t2pki1NsTCyLLdJujO6
         k8EhSG8A/RoDnWmodsMkgRMk7Rb4Yb2mQ7703r6qvd6VnA7TMMRuL9qrLRYMS/L5HovZ
         L/mfcScxBx3oPFHX+udJQNAE0Ywid83l+hnEDr7Fxj8OcFKqPjwKE6ecDHeYuhwSOIbM
         2yQA==
X-Forwarded-Encrypted: i=1; AJvYcCUBjccX42+Hj8r4A7iX2lIq0YEkenG9Pf1dwGTrjIkZiZohl3CGe94ABkDaWfqf22fDPv5OQjQbeL3aZQ4G@lists.linux.dev
X-Gm-Message-State: AOJu0YzyOU/wuKJoEXO5lMeOs3D61i4WXAbt6btGBm5xcF3OqGyZyh08
	VxPXyMampH9MbyW2pB7i2TClYmjYgjk4yEu49EarIqI4tmercU8uQlgW
X-Gm-Gg: AZuq6aL3XXyFe2vfW13+extBYJlH5vL4MdCl0E8y5Gd3TTBl/hdizFVLQYx3OIxDY8e
	oKCl61mQx79OxywdyA8QlfZzivy4EDvkGKNUNynupstYgmfDzF5Ti/KvPMlsmJCjUtczjW/rQDU
	vxJ1NrlDVB1NHgXVciziIzg421/GpkJpkl/kgc7oYn256WOz3w3naffNHerIudJy8lvZnJcN8+o
	CiJTuCIZefARAU4ydrvD9ixEdh0hCR1g3zvesAZZ4KKWyIM5PlxZJ1VULVEvmCfxn86scxSjeQw
	tauMYYIyrvUlYPenVXjOjaGfTNlpExbqqskDpJyiAqzbnIiDPnK9OgXQ8ff0UsIDkXg7zW+4wjr
	k5WimMWq413USPYFmYT9sNhXdCXGoJoovbTQaVXgjBgdffbhZQ4i76uAAV/kS5eoR6rQCHHIz9B
	ZTSafYYWe85x/OaCMbEEcwbZvVOLaG0MFDEdLwyi1f2X+55S5O3C+hC/f2CojGreCy
X-Received: by 2002:a53:c710:0:b0:649:dae7:dd65 with SMTP id 956f58d0204a3-649f21b975amr1696668d50.96.1770383522376;
        Fri, 06 Feb 2026 05:12:02 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649f255ea1asm2160559d50.18.2026.02.06.05.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:12:01 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v7 2/2] staging: axis-fifo: refactor device tree parsing
Date: Fri,  6 Feb 2026 10:11:48 -0300
Message-ID: <20260206131148.13643-3-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206131148.13643-1-gustavopiazdasilva2102@gmail.com>
References: <20260206131148.13643-1-gustavopiazdasilva2102@gmail.com>
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
Changes in v7:
 - Reverted variable name and type from 'u32 width' back to the 
   original 'unsigned int value' to minimize unnecessary diff noise.
 - Removed extra blank lines between function calls and error 
   checks to keep the diff as compact as possible.

Changes in v6:
 - Removed the axis_fifo_get_u32() helper function entirely.
 - Removed all dev_err() calls in axis_fifo_parse_dt() as the 
   driver core already reports probe failures.
 - Kept the 'node' local variable to avoid checkpatch line 
   length warnings.
 - Fixed checkpatch style warning (missing blank line after 
   declarations).
 - Ensured a newline exists at the end of the file.

Changes in v5:
 - Added missing newline at the end of axis-fifo.c.

Changes in v4:
 - Removed extra blank lines in the commit message.
 - Added "rx" and "tx" prefixes to error messages (these 
   messages were later removed in v6).

Changes in v3:
 - Split the original monolithic v2 patch into two separate 
   patches to isolate logic refactoring from type alignment.

Changes in v2:
 - Fixed checkpatch.pl coding style issues regarding 
   indents and line formatting.

Changes in v1:
 - Initial submission.

 drivers/staging/axis-fifo/axis-fifo.c | 73 +++++++++------------------
 1 file changed, 23 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7bc7bf191250..8141f8d02a98 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -488,62 +488,35 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 	unsigned int value;
 	struct device_node *node = fifo->dt_device->of_node;
 
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
+	ret = of_property_read_u32(node, "xlnx,axi-str-rxd-tdata-width", &value);
+	if (ret)
+		return ret;
+	if (value != 32)
+		return -EINVAL;
 
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
+	ret = of_property_read_u32(node, "xlnx,axi-str-txd-tdata-width", &value);
+	if (ret)
+		return ret;
+	if (value != 32)
+		return -EINVAL;
 
-	ret = of_property_read_u32(node, "xlnx,rx-fifo-depth",
-				   &fifo->rx_fifo_depth);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,rx-fifo-depth property\n");
-		ret = -EIO;
-		goto end;
-	}
+	ret = of_property_read_u32(node, "xlnx,rx-fifo-depth", &fifo->rx_fifo_depth);
+	if (ret)
+		return ret;
 
-	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth",
-				   &fifo->tx_fifo_depth);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,tx-fifo-depth property\n");
-		ret = -EIO;
-		goto end;
-	}
+	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth", &fifo->tx_fifo_depth);
+	if (ret)
+		return ret;
 
-	ret = of_property_read_u32(node, "xlnx,use-rx-data",
-				   &fifo->has_rx_fifo);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,use-rx-data property\n");
-		ret = -EIO;
-		goto end;
-	}
+	ret = of_property_read_u32(node, "xlnx,use-rx-data", &fifo->has_rx_fifo);
+	if (ret)
+		return ret;
 
-	ret = of_property_read_u32(node, "xlnx,use-tx-data",
-				   &fifo->has_tx_fifo);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,use-tx-data property\n");
-		ret = -EIO;
-		goto end;
-	}
+	ret = of_property_read_u32(node, "xlnx,use-tx-data", &fifo->has_tx_fifo);
+	if (ret)
+		return ret;
 
-end:
-	return ret;
+	return 0;
 }
 
 static int axis_fifo_probe(struct platform_device *pdev)
-- 
2.52.0

