Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C043019A4
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 11:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770636763; cv=none; b=YyUbeAZJSGjLMMIL4U6rB3BEzSku+jSwnlszM+QyVg8JuZCv76rIzmWKwg7Fc89q12e80qHp3tjfmd9Irsu63r588K/X7CTsFmLrMmfY/xlk25b63Bg9NGSd8kMR6H/NvUWIVSjqsSQnPbcHT54VC0Obz8u3p4AEUcFhHO7S110=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770636763; c=relaxed/simple;
	bh=66u1NkdMmjJnCO/QczK9JIyQQfycPkVqrwJGdeOcxfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WYMRkRl0v6LRyNdb+JYryHxysI5B36gATJVzSoyLtrMT7bzCfAWqaG7E+J++k91Af9XTdw5aWS181SLaaYfmcVCp+tgFpznqBM74MY1YXXX7rm+XUzus7snnkkU4oNpbOvWWFAbElfKQZPWLGkyyDny+sw1j0f7fSQg7WBFRGgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqnmw6MV; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqnmw6MV"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64ad9238d8fso1617520d50.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 03:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770636762; x=1771241562; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBBkEVXPXRQmgJvQuwj/kXUQfzs5IaXOQOuoI6wX6LM=;
        b=hqnmw6MVuLoNav0QcMTGlL/bApps8++tsSolwZo/Z1bJ6R0K/pgtGHZ2asDNeXrv8t
         DrQrkUW6aHIlw9h6bEm9QnRy9vpxBepmYjM9A9s3WoOv5cwngWVVWAhHc9BrUdgFayyv
         rfqxBagGYa8mbOefW4OQZcDUbuPqGXcK/4p9tNfEgPYMuukGSfK6GEcgAZLRuYuS+4js
         zGJgj99dtlPulAwvXtFFtTtBU6csIoVkyz1qW/S/sOR2rVJ7kFEviA+dfKntrgZGiIPJ
         ce095//gzy5ebFRllXROxJzGXSk7MwNc5TlXl7+RnKHeyzDBAOqppNrPB16lx0C12qf1
         NSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770636762; x=1771241562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yBBkEVXPXRQmgJvQuwj/kXUQfzs5IaXOQOuoI6wX6LM=;
        b=f+dFcHl9D1pb0kidN9EOAQlTXvPsqVwXjm6yoCGX/HMjy+EXGjhWM2mXLWNoSyfhX5
         25eJX5Z7mlui3Qs/P90gKRytslcR4rjxRwGIlh3rfc6DYPt+rY6I0dq8Z2BtoOOVNeXt
         /NHkASiT5SCAZupP2JVSjooO/c4PFZR9O2ITxz31pzw02L2I6AqsC9u8jGIBzifELsRs
         2ul7UShnfp4pDKGDljOmP7m+HG9J6TUprItwm+JH9NkF0jbzEJIPY1s4aCO7V39T3Bo9
         gmmba4LpA7VpryptJImJYPFfE26uFi8yybwSgAzI12Bc9jYE0jXUse8t0IFYQ/a+i+E5
         hIjw==
X-Forwarded-Encrypted: i=1; AJvYcCW+Kgu/bpJgR8sF/h4oc+DwC7tOwTIPj6qyM+P4ID0yLzyg9mlZUlYw6vtjnb/kJsC9W4jpy/MVyV9Dx4oX@lists.linux.dev
X-Gm-Message-State: AOJu0YzkTMnN6iXpkLJ+GHVxfX/0rQyVWnx5tqB9u5Z+DBFog1/HGLo7
	Gj2nRBM7uFZ64Ego4sN5Zdv2+rA5RpNVY6BWkGS+1//FN3xWXaU8AFGE
X-Gm-Gg: AZuq6aK63MdntqyRLXbbkEI1+mexU6mjI+pXw/JrbICzoGG1Ks8nKKfxRwH6Mm+HrQE
	AUvFyWwBlIm4yoMZrD4GUrGb+hTg3+57qIIj1NdmYoPYejXgCVRic6DAMI3F0kdu+wnlHk6UUYv
	nz4QK350aA+cOn/qLN7vDwa606hsOwgCFPwHpPRBUZ8uxHz18twoBYvzmlPEABYFIUP8Kzy479c
	4MQPcbhW6jny+s0y/zqJ4SXz6XhnbyMWETDLQdDnLukstS/xa9UsRlRHp+EIL6cO5l7+Ohqvi7Q
	cy+2rT1IL6T4ZKhgfEYi4yfP8yTBUcMYFicvmZ4vQWNI/WZ4wI5ixDcNZxv/7k8fO0sbuTuLCGv
	XYqoWvfpSeSeeeeRqV/FTmFrEiBjLNlacVS1l0KJeyhwLbF5d42tiLpyvliay5d52m9HIVcukAL
	zpOnvT5FrkSompwGN/beV2RpDdsSfL+eJqZAiEvIcpLrDscEfaSKEJ+5qgOjcTOlEx
X-Received: by 2002:a05:690e:c45:b0:649:4640:f8ee with SMTP id 956f58d0204a3-64a0b8e0724mr8825983d50.6.1770636762237;
        Mon, 09 Feb 2026 03:32:42 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64acd247ee5sm8765595d50.6.2026.02.09.03.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:32:41 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v8 2/2] staging: axis-fifo: refactor device tree parsing
Date: Mon,  9 Feb 2026 08:32:29 -0300
Message-ID: <20260209113229.7871-3-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209113229.7871-1-gustavopiazdasilva2102@gmail.com>
References: <20260209113229.7871-1-gustavopiazdasilva2102@gmail.com>
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
Changes in v8:
 - Reverted line wrapping changes to keep the diff focused strictly 
   on logic refactoring and avoid unrelated whitespace noise.

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

 drivers/staging/axis-fifo/axis-fifo.c | 55 +++++++++------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7bc7bf191250..1f933ef87b60 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -490,60 +490,39 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 
 	ret = of_property_read_u32(node, "xlnx,axi-str-rxd-tdata-width",
 				   &value);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,axi-str-rxd-tdata-width property\n");
-		goto end;
-	} else if (value != 32) {
-		dev_err(fifo->dt_device, "xlnx,axi-str-rxd-tdata-width only supports 32 bits\n");
-		ret = -EIO;
-		goto end;
-	}
+	if (ret)
+		return ret;
+	if (value != 32)
+		return -EINVAL;
 
 	ret = of_property_read_u32(node, "xlnx,axi-str-txd-tdata-width",
 				   &value);
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
+	if (value != 32)
+		return -EINVAL;
 
 	ret = of_property_read_u32(node, "xlnx,rx-fifo-depth",
 				   &fifo->rx_fifo_depth);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,rx-fifo-depth property\n");
-		ret = -EIO;
-		goto end;
-	}
+	if (ret)
+		return ret;
 
 	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth",
 				   &fifo->tx_fifo_depth);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,tx-fifo-depth property\n");
-		ret = -EIO;
-		goto end;
-	}
+	if (ret)
+		return ret;
 
 	ret = of_property_read_u32(node, "xlnx,use-rx-data",
 				   &fifo->has_rx_fifo);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,use-rx-data property\n");
-		ret = -EIO;
-		goto end;
-	}
+	if (ret)
+		return ret;
 
 	ret = of_property_read_u32(node, "xlnx,use-tx-data",
 				   &fifo->has_tx_fifo);
-	if (ret) {
-		dev_err(fifo->dt_device, "missing xlnx,use-tx-data property\n");
-		ret = -EIO;
-		goto end;
-	}
+	if (ret)
+		return ret;
 
-end:
-	return ret;
+	return 0;
 }
 
 static int axis_fifo_probe(struct platform_device *pdev)
-- 
2.52.0

