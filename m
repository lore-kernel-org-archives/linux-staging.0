Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706051;
	b=fb20/mVb3OCLORhHZOxiOesbcRUjHLAaeCpQBsvh+sE7m0Nim02z9ZliINRWrLv5kO+n
	 bLXx8YPZ+Eh0YTZR0RLp1GIP3t//JG1QPFcc+jgvRV/g4qoTcuHGA+5KhaEG7JGaer4Sj
	 AWv7TQHi0IgUbS41PgxbVjS45yRFUz0gXZ6PlT7GOk9S7werDaEyhXT/4Uh271Hr8iS+h
	 jXvN8s9y3YZukqUvv54PSN//+BRGcvRyuUxaD/jgwXyYX3SJGhuU65myb12jGPXo9RgAS
	 fMBSqwJBjtcA/bue/ogFmRJvYlfD1wp5kMoYbYvdLNesJVBOSx81G8zRak/bkSfGtCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=DdQj1OJsqke15LiuITwTZ1lLiXe/9jhrUAiWS1KivmE=;
	b=H5f+fD5P6Qy2Wi3+AouHn7kRm5zkEu6yqhaYlG+hNWxiWqkPnjv1EG8cyFOuLP8Mm5cg
	 4/lySUnXRF+NpOU3v6+pAEOEfpWOR1Av+j0rme6O7D3jANpKCjUfrp9amGfHADFicRZfa
	 VKTGpZ9UbkpRbGg7xgksKsF4AQnUxhhGWWYSLiq4Si5KWGkt7wMik+9S8noM2oQV0EeVd
	 J8n8AWX/NZWnEk6gHLlFPz/DDUUiXy4cKgHgaixYBJJRQrLllN1ZgKy+0/n9YC038/JMl
	 P8wOTUIcHnMJBFFfLWnuCNpA/J88gf+OAWoZoY5mG6FVa1KtX4oZLzcMmnkZPE0bWqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="dX6Mp/rb";
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04D4606A31D
	for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 21:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B04D4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dX6Mp/rb
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so205608241.0
        for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 14:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792706050; x=1793310850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DdQj1OJsqke15LiuITwTZ1lLiXe/9jhrUAiWS1KivmE=;
        b=dX6Mp/rbM9+j9eXphyyBOKu2oQv+H8bDoFy/Ck1neYKDssl2YuUpmkvrfPpNTJvV9e
         3w1dsXHIEYJjTS7fpaa38n8IC8wbO/peKmmvQHEXxtAabJgHnc7aZ3zJxQNi4ieq109F
         4N7ucX8EINT8qIRB4/ioKX3AwPxNYK8lBmL2ZDWeAKMrkc6X6lkOpyb/U+TMwO+VwiOO
         KXS+fkp2tpgVNUpwNMFaHQ9POff8ddsDaknvHijcIfKSkoaOZXhGwOusGTEfJ2Pt0ZRg
         +KLArqZOCqsvUJEcuoE9/yNR6QOwlwM1qZCjtRh1jJIE+XD2AYSx+ZfHguyOuPp0doKU
         5pCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792706050; x=1793310850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DdQj1OJsqke15LiuITwTZ1lLiXe/9jhrUAiWS1KivmE=;
        b=ndfh3t7InEXhwEBKQGbPO9EmuJIgpSVMJdCxYLupegYU/ewp1tTl/ag1sccPLYi+1x
         uxHPSRm3X6R0pi92LrYG28S7fbYWWEF56LPt2MUs6w3yARTkW85UCq5tgnlRR1m4VJrx
         LP4tbADjtkvDrLk7n5SRiJzNtstheDii74IAMIUWPGbAYshh6nC87SghFh+9MZ9gedMu
         qkkthYVF1LjYERSmWiA76TCgsT/+3WBcBthJmdpRlz9XIyVklX+6B+LZRx+4AYgTQ1lx
         KEHnq4YwdAu8NS+8b39ILuuXy1HRUG3YzyY9CDhy1G/YjnnJnKhssi56iHKl2Tt7f9Cg
         tpcw==
X-Gm-Message-State: AFq9FYKB3us3FNhHIzCeJ1K+73Te87Vy/5PfjjfjotFpM8RtB0UZafne
	YE1ftiHyqdFIIapGkteyypAe57S98TH9xMEEWNNtjBBU4VHJdnczbY6U
X-Gm-Gg: AYBFou06PEphd9Ev9Dvk/wIZTHOcjF3Foa6OMfvkVMXqNG7/2vx1KDYV3tFY05vDKib
	3hyvNteWoUfnhBG7/M53syaM5o/thg+pvM1QBK5uearLxgJrIetVMbt2cjHxM63B3Gr/qXW0YDw
	Fry2CXtJyTHokJYXu+vAmmwpCvAPUXeJcjzG81L6P7W4H2RV998vw/2DZwBFsuKom0Jr+RTh/ib
	PHiK6olNfvngQMGWY6fv4uTPjpd9C+f/3pmzQupHu0+uqsbtAuAOYQm8mVs4azuBrNgGWmjMOoA
	GQ12KADxiE9Sd20TdATegZ9ygBC+jm/GbsbNfpT+KCaprMV3B1o7GxjrLRO+hgD0pPsrfmgNvUL
	2lAIKUgyI0nLAYsa3Qfd7jtOawVpq4UYKqErDjjzUBiFSktvflO9RZh6SnRa0H+COOhyv2llKvz
	QuZAAL4VE9qbfF61PStZGeM49AP0LHZSlXX9OeLikeQaqWWyrGjzgxr3MLvFI65nO0P/NJbAh3k
	CLsNtfjjjaiLazlktMGG/g/+P6/adhpuDMO9Cxo+vWLSBBczHcXL2TdRUATaxiRvHyBJSyiwmVT
	14WvnX2iMZt8Gei1+bJ+Xw==
X-Received: by 2002:a05:6102:6f08:b0:7c3:9982:67d7 with SMTP id ada2fe7eead31-7ccc32180c3mr272610137.16.1792706049491;
        Thu, 22 Oct 2026 14:54:09 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13eab957sm434761e0c.6.2026.10.22.14.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:54:09 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH] staging: axis-fifo: Fix three real issues
Date: Thu, 22 Oct 2026 18:53:49 -0300
Message-ID: <20261022215349.87471-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix three issues in the Xilinx AXI-Stream FIFO driver:

  1. axis_fifo_debugfs_init() did not check the return value of
     debugfs_create_dir().  When CONFIG_DEBUG_FS=n, the function
     returns ERR_PTR(-ENODEV); passing it as a parent to
     debugfs_create_file() triggers a WARN in the kernel debugfs
     core.  Bail out early if the directory was not created.

  2. axis_fifo_read() returned -EINVAL when the user buffer was
     smaller than the available data.  The user argument is not
     invalid - it is just too small - so return -ENOBUFS, which is
     the canonical errno for that situation (see recv(2)).

  3. axis_fifo_probe() filled in a 'struct resource *r_mem' pointer
     that is never read.  Pass NULL instead.

No functional change for the normal path.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3d358f919..c19cb68de 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -148,7 +148,7 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 	words_available = bytes_available / sizeof(u32);
 
 	if (bytes_available > len) {
-		ret = -EINVAL;
+		ret = -ENOBUFS;
 		goto err_flush_rx;
 	}
 
@@ -378,6 +378,8 @@ DEFINE_SHOW_ATTRIBUTE(axis_fifo_debugfs_regs);
 static void axis_fifo_debugfs_init(struct axis_fifo *fifo)
 {
 	fifo->debugfs_dir = debugfs_create_dir(dev_name(fifo->dt_device), NULL);
+	if (IS_ERR_OR_NULL(fifo->debugfs_dir))
+		return;
 
 	debugfs_create_file("regs", 0444, fifo->debugfs_dir, fifo,
 			    &axis_fifo_debugfs_regs_fops);
@@ -428,7 +430,6 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 
 static int axis_fifo_probe(struct platform_device *pdev)
 {
-	struct resource *r_mem;
 	struct device *dev = &pdev->dev;
 	struct axis_fifo *fifo = NULL;
 	int rc = 0; /* error return value */
@@ -447,7 +448,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	mutex_init(&fifo->read_lock);
 	mutex_init(&fifo->write_lock);
 
-	fifo->base_addr = devm_platform_get_and_ioremap_resource(pdev, 0, &r_mem);
+	fifo->base_addr = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(fifo->base_addr))
 		return PTR_ERR(fifo->base_addr);
 
-- 
2.56.0

