Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B202DCBF7
	for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 08:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754902500; cv=none; b=TGhBVuA1C17KYP7F0qOoG/4OUko2/kykV3e+hl7tTRAJ5eCFmwiw1ITVn1bMnAD78JEh6de6YGeRCo9bTrUB8U1f8mKQ/lcY61k2jeax+s5D0UsBkElTH9lzYkjSeVtZqU3D1F4Y2qU2zBtYtXA8NRdA24JEspPRBU7KHtn8iYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754902500; c=relaxed/simple;
	bh=VG6PWBB/5tMPvLzF6xGjoyk6UV1hR54oWT9n+hvDuEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2rtu+CEa4Ss4T7gKI3dCkLruHAAXF86ixzEu00klOdW2ohYD3UTia3FFX47cYP+3HJro/nfrvEgMf1nUBTYvogP+hb6Ya0/hgUqbOU1rMNqFVXeH+f0uY6Nm9Z6lNHn+3GB9aC3/9NzHXwwJWmOtfqdxEfp8YYGPv0i5GWBDKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVG9BpGR; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVG9BpGR"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-af958127df5so618937166b.2
        for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 01:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754902496; x=1755507296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XR9qdCVqEjtc6+fwt52lhLQBEhkPHeI4a9cD0bCXdeQ=;
        b=lVG9BpGRhjphVKjoMOng5kSYTYsY5RgbdkQ8RG7p4ZPd47OYpr7S4vSQMhXzbqZ/vc
         5jUAANVyzAP3dHU6Qa3vQbFMmxnGKsHWJyPOxBkjf6MJOw8YJQI4IRPKL8RhquL9b24q
         RGdY8Oe+bSsCEuI8eK0uCHWN1NGf6M702McVmFpqAql9be2wQ5OXfUPEDqWbC16y5Mca
         j1yBjhksNqfpujMKwo1xz1DSNHpFNx26DGoWmRJitC7sDvn2AcqXstebh6WDzN2tmTtT
         MA01iHbwVlQN0LVe9UQziKGinAiBNsieEkfIlEDV41uzqWuje01Z3elxw+eW2+C0EP7/
         D7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754902496; x=1755507296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XR9qdCVqEjtc6+fwt52lhLQBEhkPHeI4a9cD0bCXdeQ=;
        b=tsTBqDY2dQIrljVc+CQYpqqlQk+130i2V7nY+EuRPBK5PVPVkBY6BM3Hx8DHyfGUpu
         /MpuCdsagDBrFkNw7f6Q527AhKgv6gBnbzCcWZmMoCBiQ8wb+JYA76vvqcgMKcowZavw
         UvxwLk7XGnZDYARiWYHj1RNfMfcYU6RTuRCFPP3BAR+cnFII8KKzMNdx9ybmE0aqelUb
         p21+HUUMT4ttGfSrah3H3/co91blFWws040VahMRvOPxlxSqrN9CmC4jmJeifB3/dDDn
         7r2zDPYlWa4wN9t1bVwvcrpFdkxtEzCgII+GmLNZW1VTsOPnYxemi97UE7KiTspHdGek
         YWXA==
X-Forwarded-Encrypted: i=1; AJvYcCUqimmesKhB26fn2mGcFvbVrGSuEHFFnaFvasJOpX1n7pj2CT8qcr2MlSOquCiZf4y9U4gpp6b+sA6F7tB0@lists.linux.dev
X-Gm-Message-State: AOJu0Yyv+3e+ct7M27flaxSeuOYWDEHmGn/4kheYP+xAxiDC7Jy7HBko
	c79r8NmaThNwu+tuQpaV4uGNQqJ8VXd6kKlNjkJy0Cj+MhAUY+ZxsLG/
X-Gm-Gg: ASbGncsz+ScLHo/OB33V5hFQ1jggzeHFJE02e5oMbIyXGVb6tGHTVzl0K0lUSX/Lw8G
	5rgDrujAvPfBKTsvcDpJYVQ2QJr1RE4HMMN3ipz6RfPC0N/w6QK56AqY5JpIYdCyPZNpRVEj8uk
	O06vh5DBYZvUoVfs4uev57gbswdg0e7M/3mexJaadQAxuHvA7r3dlpJTxRLOeZ4N1V8NV5OV1aH
	ZtfWxQl1Cxb8++Jdlm6mKJ2qdcZDvIFfVDgv9d4bnLU8dYmT6tMp+62P64YsG2C8UGREaA++C6J
	L+/UTqalMVCxBkRgapCUO9Rp19IILKzey0kieEJw4fg2Bvc6BawssQo7l0oI4N6qw+LbqDx8OEF
	u7VvbTTnaNcUbC1x9o+1sv0n1lKFBuFrCpA==
X-Google-Smtp-Source: AGHT+IH8Fm7gghXlK13iQCuIgoR8rOQNScRMP/oXs3wdL9JIvaCNmWwrxdyN/oPIKqpBCVYGVdNpMg==
X-Received: by 2002:a17:907:972a:b0:ad8:8719:f6f3 with SMTP id a640c23a62f3a-af9c645b793mr1029294066b.22.1754902496483;
        Mon, 11 Aug 2025 01:54:56 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91ee3c1f7sm1924687166b.68.2025.08.11.01.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 01:54:56 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH v2 2/2] staging: axis-fifo: use unique identifiers in device names
Date: Mon, 11 Aug 2025 11:54:17 +0300
Message-ID: <20250811085417.2641674-2-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250811085417.2641674-1-ovidiu.panait.oss@gmail.com>
References: <20250811085417.2641674-1-ovidiu.panait.oss@gmail.com>
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
for axis-fifo device names (i.e. axis_fifo0, axis_fifo1, etc.).

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
Changes in v2:
 - add mising ida_destroy() call in module unload path

 drivers/staging/axis-fifo/axis-fifo.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 06f7cfab4c6a..e8aa632e0a31 100644
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
@@ -798,6 +805,7 @@ module_init(axis_fifo_init);
 static void __exit axis_fifo_exit(void)
 {
 	platform_driver_unregister(&axis_fifo_driver);
+	ida_destroy(&axis_fifo_ida);
 }
 
 module_exit(axis_fifo_exit);
-- 
2.50.0

