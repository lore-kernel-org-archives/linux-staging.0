Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078DA21C9E5
	for <linux-staging@lists.linux.dev>; Fri,  8 Aug 2025 20:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754686139; cv=none; b=QjQHrrlwEcLaepmQ97hKsnWCz0tMVIhpOcNbKUIk1hf+vVmzZldTRXVAK7J5ojqGCSLqNEMrRJJhqSjnCYfH75gD7I48gpvA5j/wfPrbrVuH2Wr/S+rFm1dv8Os8WAFuxwXGIaTHgWOxbD7EKHCHWWAQykZ+wzAk9xTIlWOO7xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754686139; c=relaxed/simple;
	bh=aFLGwrKXkKiDJqwVr4jZIU+eApLQHJ1frFbyUU1xJus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sxUbyxOmwzL1ojfC2BFABv5S5kZvkwJMF7Qgd6uCNFw17ldu3aLMgVt1tSebJDW4OO+ql7N5lweercZ58+iIFhp9qgx40On9fXr1rypQ+v9L+Izsq+/jMzl5CDX+o/tjf8Wk1NtGRrpcyFntA95ppxFRsFT+hEzhzSZrjgeX6yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHSj1iic; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHSj1iic"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45994a72356so19780005e9.0
        for <linux-staging@lists.linux.dev>; Fri, 08 Aug 2025 13:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754686136; x=1755290936; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7ziBuQ1vTW5WB/7L4QBYJ42H/q4ZCWd+CAfqSHV47I=;
        b=QHSj1iicXcfA419dEYaAkigZNlUBA5Isdi1TE0V9K/7GuUzVTztzzyw2gjduNYdoDL
         D2kXR+5wvahHOMZ7meXwUs+ZR7FSzXV7IlqWi+YpppNslKQtKj2Mc4E6o4lUZHTyfYpX
         XkU8UU02umchV/Phgzz8CmbMICccW3UCKdQzETyM8trBALI24MO/nnuP9spke6lfqXUf
         hx3/XNH985qZ7NIl54yvVq5lKcyvRghEePbjLxiKkGg4liouGP33mqsA/cT05FVRehar
         HwsouBamb8jFoUUasWeywVhUD4FKQLB9eexURAvuezrzrHpN/hioQqBiC5bP5mGv2cGi
         vHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754686136; x=1755290936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7ziBuQ1vTW5WB/7L4QBYJ42H/q4ZCWd+CAfqSHV47I=;
        b=FHW5xjwn/iIoV9HDNoLcPZRodeMccLTxDOaj/iW3V3E+d1xawMXliAcv+1qUZZs+wH
         m7SVi4zWyWkREEicunJV85hqHEaM86HV8kdd7AeM7vhL9vqJY/xxDTrdvmhZPLcXNOdr
         bV+TjOhBmSkGlEIbKUrBfr4QD1poJcTaLcS+ELWV2A38eV7SInocIP7XwAEEl82HRzuw
         T5MpO+aQDoNhhSGikh6gQ3XacVUNgfkrA+DdZwMOOtqQRKvVVt4n5TH0FG6IGDsKtIvZ
         ZDxDhivtPwTQY9uoQ4H6J81Jtra1yfOrouNtNf4kO4xpgw+Okkkn9vk8K6817TQCbFjk
         uUmg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ7zHHy/qCRBs2nlYugI+cVviE/ILvl57Am2iqNiGHPrCKFIMD6dxHyYuqXAMTXUPQYoVlYAGdJaxIUT7Q@lists.linux.dev
X-Gm-Message-State: AOJu0YwdF/1Orl7XHz8gi7E43yYufpkILSYZ6h4it6A2yd2YzxxOAkJk
	jmHLkO991cdk2UTK/yBHUKQrc0nrBwP1qMNDzII6dF7eE/yYOXBHmnjh
X-Gm-Gg: ASbGncuRgQ0UWvAkRrDD9gLUuNm4G3cx6Ro2uNzMhyafuuBWDaNtpYYnkPUyFpf+426
	YvAI7oxgo84CBKywrjmIiCGwWQGERQxcNcUQ+XMwHI8epRWVktgiUSj8PnxN/imb4A0VOeHY3fV
	2uE+v7are8gTgCbqSgKI69uV19HXB2JY1iCxkjqfpOb7UxOTkSGOtfeVxUODEYRqG9+h7kJfDGe
	OfxnSRqB3Y5n9dnS/zypUZxk86xLpoDx6lWHbsPGGIiEpe8JvEJuOxXFlS3MyF3zjNmi4TO/ind
	EHO/1fxXH3V28VTVujuUEZDrYD19vtg9BXusC6nDtXeqxriPdQtyLoxg6An+6vOYinPBbdEh5qb
	AnGNqonEU38nDDW8q+ez33c8DhdYNLlWPtiEKsFPGQdL9
X-Google-Smtp-Source: AGHT+IEB8DG7xrFf8jvYLcxLQJXvP5Kp1Udkw4Ki44C4wWQrGHPxi4K8SAPJbeByCDCyegshsvwZbQ==
X-Received: by 2002:a05:600c:6211:b0:458:b4a9:b024 with SMTP id 5b1f17b1804b1-459ee0a9cb0mr92601495e9.11.1754686136196;
        Fri, 08 Aug 2025 13:48:56 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4533f1sm31815003f8f.42.2025.08.08.13.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 13:48:55 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 2/2] staging: axis-fifo: use unique identifiers in device names
Date: Fri,  8 Aug 2025 23:48:31 +0300
Message-ID: <20250808204831.2618122-2-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250808204831.2618122-1-ovidiu.panait.oss@gmail.com>
References: <20250808204831.2618122-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Axis-fifo devices use physical addresses in their name, for example
'axis_fifo_0x43c00000'. This is generally frowned upon and it does not
follow the usual naming scheme that uses unique identifiers.

Therefore, use ida_alloc()/ida_free() to implement unique identifiers
for axis-fifo device names (i.e. axis-fifo0, axis-fifo1, etc.).

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 06f7cfab4c6a..27e12af25bc7 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -107,6 +107,8 @@
 static long read_timeout = 1000; /* ms to wait before read() times out */
 static long write_timeout = 1000; /* ms to wait before write() times out */
 
+static DEFINE_IDA(axis_fifo_ida);
+
 /* ----------------------------
  * module command-line arguments
  * ----------------------------
@@ -123,6 +125,7 @@ MODULE_PARM_DESC(write_timeout, "ms to wait before blocking write() timing out;
  */
 
 struct axis_fifo {
+	int id;
 	int irq; /* interrupt */
 	void __iomem *base_addr; /* kernel space memory */
 
@@ -698,10 +701,6 @@ static int axis_fifo_probe(struct platform_device *pdev)
 
 	dev_dbg(fifo->dt_device, "remapped memory to 0x%p\n", fifo->base_addr);
 
-	/* create unique device name */
-	snprintf(device_name, 32, "%s_%pa", DRIVER_NAME, &r_mem->start);
-	dev_dbg(fifo->dt_device, "device name [%s]\n", device_name);
-
 	/* ----------------------------
 	 *          init IP
 	 * ----------------------------
@@ -737,6 +736,11 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	 *      init char device
 	 * ----------------------------
 	 */
+	fifo->id = ida_alloc(&axis_fifo_ida, GFP_KERNEL);
+	if (fifo->id < 0)
+		return fifo->id;
+
+	snprintf(device_name, 32, "%s%d", DRIVER_NAME, fifo->id);
 
 	/* create character device */
 	fifo->miscdev.fops = &fops;
@@ -744,8 +748,10 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	fifo->miscdev.name = device_name;
 	fifo->miscdev.parent = dev;
 	rc = misc_register(&fifo->miscdev);
-	if (rc < 0)
+	if (rc < 0) {
+		ida_free(&axis_fifo_ida, fifo->id);
 		return rc;
+	}
 
 	axis_fifo_debugfs_init(fifo);
 
@@ -759,6 +765,7 @@ static void axis_fifo_remove(struct platform_device *pdev)
 
 	debugfs_remove(fifo->debugfs_dir);
 	misc_deregister(&fifo->miscdev);
+	ida_free(&axis_fifo_ida, fifo->id);
 }
 
 static const struct of_device_id axis_fifo_of_match[] = {
-- 
2.50.0

