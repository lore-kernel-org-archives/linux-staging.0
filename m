Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C1F1CDFDE
	for <linux-staging@lists.linux.dev>; Fri,  1 Nov 2024 17:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730483272; cv=none; b=nQswmKC73AEZwgNMlPegUSP+1qHXqCTzVxB2+RQ+5eC6ty+P0Lsb+r0IHmGuzaaLzxld1ZI2d30IaaQjBIbKRDYxB3nNV8HFlaCkK+0YajSrq9yCTaEDRc/Kyjfwq70xQqkAKBbYUMdg3H2kQIsFFxqGDKctt4Aj+7fhrX5sBI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730483272; c=relaxed/simple;
	bh=+2ZbUe5U+E2OEYIW+993vuoS7rTvvL1M9Xv6zVjD7cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HW5FNkpqDN+4fbiGxhiyw18jYMbPAwfHB6OlixmoHZ4Hr/+NSFvoNJzeMsYFBcqvP+vpUqc3i6O/XzV68gv0vKc0vzB3lBXZJXm7TeupufOILbc2Y1ddCiBPLYJai//ievzzpTsmQuQBVL9jX5qxaSV63D9Tv22rUOlaWeSjto0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWgchoMF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWgchoMF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-431616c23b5so13479725e9.0
        for <linux-staging@lists.linux.dev>; Fri, 01 Nov 2024 10:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730483269; x=1731088069; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SaeLrECpXROHY7pwjLzQVPEarLzFsCZ3cJ6sERHUL3A=;
        b=HWgchoMFoWEPef0zUqdN2w3xsW4gpqLNHCR0IOQv81h7KrjKvzxANIRVmtmi2mWoHh
         alXF1DWsi4CH2GcxultQ8Yj4jpetb2ksOM69Rxsb+MXNmCPGC8JhE4qiZUdJ2WGjXvc2
         CTjzdh6YjfeRI+1GFZ8I0TcRGF1qXvFG5yj3vZAyhjwFZxJLzk40nrD1LHAOumClGffd
         NZzGrM6813lYdzXvugEN46WUOL+XEKqB7OIrS8DijiW8xEukU53VfRUMfDQjbkHACffV
         R6ZFnJMP8PW8numc1kddB0RYpjkcnf7kQrUSluITF2lq43WYXayo476lQUPJAfotIV6r
         8FbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730483269; x=1731088069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaeLrECpXROHY7pwjLzQVPEarLzFsCZ3cJ6sERHUL3A=;
        b=RMCyssOEJWTbHdJw6mRJfPEc3yu06bT4BmfINOgjeZDt+22NQzdEakaF0QdvIIHYDp
         8UggfrwuiU7w4/UKEYn8rJHrNUxEAwk07X3Mw8uFTyVJRF3/7G6SZTkgmZhZh/m4Kf2e
         1BBCQfeDrrT/zUtKFyldf6GbdBDaN9ciDdjjXIbApxK5Mu/3Xs5C24++jSCGepDVQzqk
         6a61WOciJ6wy7/yfOjvA059Ee1fJnp52z5gnLi1vLzrEyS/btrON+ddEWzBw8+YRAMLa
         XXVJXIFJebjWCdCHdr+QfEuPNtvtCUoW0Rl8NAcUMfd9PqvS70Mwpm0Xty1k0nMjjGJ5
         0FLw==
X-Forwarded-Encrypted: i=1; AJvYcCVRWBEpjVE0ZfXjKLWaQIRvolwP372iu72O8VwMSz4P3OsVZVuDYjreN5tKpALV+2TI7hFCH0i2Gv1faEgg@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9B7sCVb5pI7KO6ZsVze1ZSufxQtb5+d3Xl4mLZ5LR0F5LIwYJ
	c4d8h1Q7tQpE5AdCGbj3WV9cmKWDjt6cbKI/aftAe7GclW8fpMHD+A4N3BCN
X-Google-Smtp-Source: AGHT+IH18wIXFH8jKPj32LWrbFUjspDICIELrUBuEIIAl+hXdssGLPupA/vj+6w12Y0agJdPXDLTzQ==
X-Received: by 2002:a05:600c:3b0f:b0:431:4e33:98b6 with SMTP id 5b1f17b1804b1-4327daa33e9mr63453325e9.5.1730483268369;
        Fri, 01 Nov 2024 10:47:48 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1185b4bsm5732933f8f.112.2024.11.01.10.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 10:47:47 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 6/9] Use dev_xxx for messaging
Date: Fri,  1 Nov 2024 18:47:02 +0100
Message-ID: <20241101174705.12682-7-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241101174705.12682-1-dpenkler@gmail.com>
References: <20241101174705.12682-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    Change pr_xxx to dev_xxx

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 .../gpib/agilent_82350b/agilent_82350b.c      | 70 +++++++++++--------
 1 file changed, 42 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 3aa624486c0f..53006d0cc79c 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -52,7 +52,8 @@ int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_t lengt
 		retval = tms9914_read(board, tms_priv, buffer, 1, end, &num_bytes);
 		*bytes_read += num_bytes;
 		if (retval < 0)
-			pr_err("%s: tms9914_read failed retval=%i\n", driver_name, retval);
+			dev_err(board->gpib_dev, "%s: tms9914_read failed retval=%i\n",
+				driver_name, retval);
 		if (retval < 0 || *end)
 			return retval;
 		++buffer;
@@ -88,7 +89,7 @@ int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_t lengt
 						  test_bit(DEV_CLEAR_BN, &tms_priv->state) ||
 						  test_bit(TIMO_NUM, &board->status));
 		if (retval) {
-			pr_err("%s: read wait interrupted\n", driver_name);
+			dev_dbg(board->gpib_dev, "%s: read wait interrupted\n", driver_name);
 			retval = -ERESTARTSYS;
 			break;
 		}
@@ -102,12 +103,13 @@ int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_t lengt
 			*end = 1;
 		}
 		if (test_bit(TIMO_NUM, &board->status)) {
-			pr_err("%s: minor %i: read timed out\n", driver_name, board->minor);
+			dev_err(board->gpib_dev, "%s: read timed out\n", driver_name);
 			retval = -ETIMEDOUT;
 			break;
 		}
 		if (test_bit(DEV_CLEAR_BN, &tms_priv->state)) {
-			pr_err("%s: device clear interrupted read\n", driver_name);
+			dev_err(board->gpib_dev, "%s: device clear interrupted read\n",
+				driver_name);
 			retval = -EINTR;
 			break;
 		}
@@ -138,15 +140,15 @@ static int translate_wait_return_value(gpib_board_t *board, int retval)
 	struct tms9914_priv *tms_priv = &a_priv->tms9914_priv;
 
 	if (retval) {
-		pr_err("%s: write wait interrupted\n", driver_name);
+		dev_err(board->gpib_dev, "%s: write wait interrupted\n", driver_name);
 		return -ERESTARTSYS;
 	}
 	if (test_bit(TIMO_NUM, &board->status)) {
-		pr_err("%s: minor %i: write timed out\n", driver_name, board->minor);
+		dev_err(board->gpib_dev, "%s: write timed out\n", driver_name);
 		return -ETIMEDOUT;
 	}
 	if (test_bit(DEV_CLEAR_BN, &tms_priv->state)) {
-		pr_err("%s: device clear interrupted write\n", driver_name);
+		dev_err(board->gpib_dev, "%s: device clear interrupted write\n", driver_name);
 		return -EINTR;
 	}
 	return 0;
@@ -558,10 +560,11 @@ static int init_82350a_hardware(gpib_board_t *board, const gpib_board_config_t *
 		return 0;
 	// need to programme borg
 	if (!config->init_data || config->init_data_length != firmware_length) {
-		pr_err("%s: the 82350A board requires firmware after powering on.\n", driver_name);
+		dev_err(board->gpib_dev, "%s: the 82350A board requires firmware after powering on.\n",
+			driver_name);
 		return -EIO;
 	}
-	pr_info("%s: Loading firmware...\n", driver_name);
+	dev_info(board->gpib_dev, "%s: Loading firmware...\n", driver_name);
 
 	// tickle the borg
 	writel(plx_cntrl_static_bits | PLX9050_USER3_DATA_BIT,
@@ -580,7 +583,7 @@ static int init_82350a_hardware(gpib_board_t *board, const gpib_board_config_t *
 			usleep_range(10, 20);
 		}
 		if (j == timeout) {
-			pr_err("%s: timed out loading firmware.\n", driver_name);
+			dev_err(board->gpib_dev, "%s: timed out loading firmware.\n", driver_name);
 			return -ETIMEDOUT;
 		}
 		writeb(firmware_data[i], a_priv->gpib_base + CONFIG_DATA_REG);
@@ -591,10 +594,11 @@ static int init_82350a_hardware(gpib_board_t *board, const gpib_board_config_t *
 		usleep_range(10, 20);
 	}
 	if (j == timeout) {
-		pr_err("%s: timed out waiting for firmware load to complete.\n", driver_name);
+		dev_err(board->gpib_dev, "%s: timed out waiting for firmware load to complete.\n",
+			driver_name);
 		return -ETIMEDOUT;
 	}
-	pr_info("%s: ...done.\n", driver_name);
+	dev_info(board->gpib_dev, "%s: ...done.\n", driver_name);
 	return 0;
 }
 
@@ -616,14 +620,15 @@ static int test_sram(gpib_board_t *board)
 		unsigned int read_value = readb(a_priv->sram_base + i);
 
 		if ((i & byte_mask) != read_value) {
-			pr_err("%s: SRAM test failed at %d wanted %d got %d\n",
-			       driver_name, i, (i & byte_mask), read_value);
+			dev_err(board->gpib_dev, "%s: SRAM test failed at %d wanted %d got %d\n",
+				driver_name, i, (i & byte_mask), read_value);
 			return -EIO;
 		}
 		if (need_resched())
 			schedule();
 	}
-	pr_info("%s: SRAM test passed 0x%x bytes checked\n", driver_name, sram_length);
+	dev_info(board->gpib_dev, "%s: SRAM test passed 0x%x bytes checked\n",
+		 driver_name, sram_length);
 	return 0;
 }
 
@@ -651,14 +656,14 @@ static int agilent_82350b_generic_attach(gpib_board_t *board, const gpib_board_c
 						 PCI_DEVICE_ID_82350B, NULL);
 	if (a_priv->pci_device) {
 		a_priv->model = MODEL_82350B;
-		pr_info("%s: Agilent 82350B board found\n", driver_name);
+		dev_info(board->gpib_dev, "%s: Agilent 82350B board found\n", driver_name);
 
 	} else	{
 		a_priv->pci_device = gpib_pci_get_device(config, PCI_VENDOR_ID_AGILENT,
 							 PCI_DEVICE_ID_82351A, NULL);
 		if (a_priv->pci_device)	{
 			a_priv->model = MODEL_82351A;
-			pr_info("%s: Agilent 82351B board found\n", driver_name);
+			dev_info(board->gpib_dev, "%s: Agilent 82351B board found\n", driver_name);
 
 		} else {
 			a_priv->pci_device = gpib_pci_get_subsys(config, PCI_VENDOR_ID_PLX,
@@ -668,15 +673,17 @@ static int agilent_82350b_generic_attach(gpib_board_t *board, const gpib_board_c
 								 a_priv->pci_device);
 			if (a_priv->pci_device) {
 				a_priv->model = MODEL_82350A;
-				pr_info("%s: HP/Agilent 82350A board found\n", driver_name);
+				dev_info(board->gpib_dev, "%s: HP/Agilent 82350A board found\n",
+					 driver_name);
 			} else {
-				pr_err("%s: no 82350/82351 board found\n", driver_name);
+				dev_err(board->gpib_dev, "%s: no 82350/82351 board found\n",
+					driver_name);
 				return -ENODEV;
 			}
 		}
 	}
 	if (pci_enable_device(a_priv->pci_device)) {
-		pr_err("%s: error enabling pci device\n", driver_name);
+		dev_err(board->gpib_dev, "%s: error enabling pci device\n", driver_name);
 		return -EIO;
 	}
 	if (pci_request_regions(a_priv->pci_device, driver_name))
@@ -685,23 +692,27 @@ static int agilent_82350b_generic_attach(gpib_board_t *board, const gpib_board_c
 	case MODEL_82350A:
 		a_priv->plx_base = ioremap(pci_resource_start(a_priv->pci_device, PLX_MEM_REGION),
 					   pci_resource_len(a_priv->pci_device, PLX_MEM_REGION));
-		pr_info("%s: plx base address remapped to 0x%p\n", driver_name, a_priv->plx_base);
+		dev_dbg(board->gpib_dev, "%s: plx base address remapped to 0x%p\n",
+			driver_name, a_priv->plx_base);
 		a_priv->gpib_base = ioremap(pci_resource_start(a_priv->pci_device,
 							       GPIB_82350A_REGION),
 					    pci_resource_len(a_priv->pci_device,
 							     GPIB_82350A_REGION));
-		pr_info("%s: gpib base address remapped to 0x%p\n", driver_name, a_priv->gpib_base);
+		dev_dbg(board->gpib_dev, "%s: gpib base address remapped to 0x%p\n",
+			driver_name, a_priv->gpib_base);
 		tms_priv->iobase = a_priv->gpib_base + TMS9914_BASE_REG;
 		a_priv->sram_base = ioremap(pci_resource_start(a_priv->pci_device,
 							       SRAM_82350A_REGION),
 					    pci_resource_len(a_priv->pci_device,
 							     SRAM_82350A_REGION));
-		pr_info("%s: sram base address remapped to 0x%p\n", driver_name, a_priv->sram_base);
+		dev_dbg(board->gpib_dev, "%s: sram base address remapped to 0x%p\n",
+			driver_name, a_priv->sram_base);
 		a_priv->borg_base = ioremap(pci_resource_start(a_priv->pci_device,
 							       BORG_82350A_REGION),
 					    pci_resource_len(a_priv->pci_device,
 							     BORG_82350A_REGION));
-		pr_info("%s: borg base address remapped to 0x%p\n", driver_name, a_priv->borg_base);
+		dev_dbg(board->gpib_dev, "%s: borg base address remapped to 0x%p\n",
+			driver_name, a_priv->borg_base);
 
 		retval = init_82350a_hardware(board, config);
 		if (retval < 0)
@@ -711,14 +722,17 @@ static int agilent_82350b_generic_attach(gpib_board_t *board, const gpib_board_c
 	case MODEL_82351A:
 		a_priv->gpib_base = ioremap(pci_resource_start(a_priv->pci_device, GPIB_REGION),
 					    pci_resource_len(a_priv->pci_device, GPIB_REGION));
-		pr_info("%s: gpib base address remapped to 0x%p\n", driver_name, a_priv->gpib_base);
+		dev_dbg(board->gpib_dev, "%s: gpib base address remapped to 0x%p\n",
+			driver_name, a_priv->gpib_base);
 		tms_priv->iobase = a_priv->gpib_base + TMS9914_BASE_REG;
 		a_priv->sram_base = ioremap(pci_resource_start(a_priv->pci_device, SRAM_REGION),
 					    pci_resource_len(a_priv->pci_device, SRAM_REGION));
-		pr_info("%s: sram base address remapped to 0x%p\n", driver_name, a_priv->sram_base);
+		dev_dbg(board->gpib_dev, "%s: sram base address remapped to 0x%p\n",
+			driver_name, a_priv->sram_base);
 		a_priv->misc_base = ioremap(pci_resource_start(a_priv->pci_device, MISC_REGION),
 					    pci_resource_len(a_priv->pci_device, MISC_REGION));
-		pr_info("%s: misc base address remapped to 0x%p\n", driver_name, a_priv->misc_base);
+		dev_dbg(board->gpib_dev, "%s: misc base address remapped to 0x%p\n",
+			driver_name, a_priv->misc_base);
 		break;
 	default:
 		pr_err("%s: invalid board\n", driver_name);
@@ -735,7 +749,7 @@ static int agilent_82350b_generic_attach(gpib_board_t *board, const gpib_board_c
 		return -EIO;
 	}
 	a_priv->irq = a_priv->pci_device->irq;
-	pr_info("%s: IRQ %d\n", driver_name, a_priv->irq);
+	dev_dbg(board->gpib_dev, "%s: IRQ %d\n", driver_name, a_priv->irq);
 
 	writeb(0, a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
 	a_priv->card_mode_bits = ENABLE_PCI_IRQ_BIT;
-- 
2.46.2

