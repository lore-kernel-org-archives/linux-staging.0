Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D9B205E0E
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 10:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074857; cv=none; b=DBJd0cN2lDV7sTcEQiI4Hfg7CkHrfauaHI+xSv2TQJb9eu3aTZYuaBfiyc3BVTvFpNTxdKSCeCSpaS3lXuXxjLlDAJWYBU3Fw+qC9ZJPxaf8logfayLd9vxUuCiSlQj4S5KciQeZ3g+jtZBnvUky6bEf3MNCYZrXXKbAj5XRTUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074857; c=relaxed/simple;
	bh=UXXLyzxRETsC1bCs0BzCmf0TqtVoV4wY4aQYvxI2SWM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jHUFT4hNiboV7enrZuVtOMSQUBoGY3oppB+oPbWHRJO9HpLdvbyiT5pRnS/TeFYbafWgq2w68u4eatkvbgHdQ1Xgm/JcHxBJ5ekmMNO0KsQlX9XEXNvDyoSsKiWOqhYxzeNvQp7z1SMIV2cDfRJnIFlNeeOxK22/oFbomQ5ZyWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKxUclnZ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKxUclnZ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so550229b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 03:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729074855; x=1729679655; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CMMW6WISxalccZ13+6+AMnKOcdO+bnf3tzViTwYWYqw=;
        b=bKxUclnZDcR6l8rMTgfWHbVFA/JE9kcpuL6mfYCgrFJKCEOzEDp7gMZz9frgcQ9Sxv
         UoPh4bnHj6ux2ASFfHJjwXuArVU2f0bP7theabfjuVAzXfRWcgaJdnvM8SS33VWl+W+a
         Cp//GXC6DvtETDMegJ1dYTcraogKE4b8FFdTUQ2HoH1ppLyGmjNhzolMKyCcdsC3i5OK
         wYM1FBhh2CTsPmwmIHGutrcHDhsmoQm2qCxQhYP6OKU+i1Uug+f3HBHDvjt7nbukppPs
         rHuOtElq0MyiTUI7gK67kTYjKoEImpzpiILZ8rZ22KzlRbqX5fbeU6dIbO5EmGQgFp+m
         Iybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729074855; x=1729679655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMMW6WISxalccZ13+6+AMnKOcdO+bnf3tzViTwYWYqw=;
        b=iF0iu/GTdBoPJgVuRVwAVbLGxeCihFMv9/iM5k+xAOA67b1AXP0aJkN1XElfvaMVUw
         2UgbeDPMC6yGnXRp1U9IsUxSqLm92SKfUpR3KZwFsUGi95zQo037lz3kWVpRMKTd/ZAU
         4EWZrdfoPQvw7IdsH59dDXwk4HspkF0kxYU4FHYH8Ubt4kUw2OoiSyOA5eVziSXnlgo4
         8LJ0ptWwx6OmHlYIMjveSLLRKgBxQgd3OHXTdNc4glBdEDwO/eQottMQM0o0G3+z9JOb
         h3C2Kcz1YqL1k0nSamm+6SXRBdG6M9D6qL5JSZukWhVj4ZVTOvLjsGpkG3HWYa7kFXho
         LNNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNwLvfy535L6p45PVuJC6zlkD6IUURvNLCy42ebYNtrFE9XQRVP0yY5nP45O9+ugkDHB0pRzMcGNtjvs3Y@lists.linux.dev
X-Gm-Message-State: AOJu0YwbFLOAdLaDPa3ay9Inm4EJDXyykloXokiekhb5pziNguzGiuUK
	IJvQAQ1XAwy1oGJ8bvwW5bppZeCOynC0Q9hmfBpe+mh36AxGo0DT991Fogak
X-Google-Smtp-Source: AGHT+IFoSo8yfBkITfbAWie1n/b8MsknWXue1dS3xGBRZrEpTKBwLU/aVPHqnpE8nssMoSOL6y0CRA==
X-Received: by 2002:a05:6a20:9743:b0:1d9:651:7d34 with SMTP id adf61e73a8af0-1d90651859emr4405151637.12.1729074855106;
        Wed, 16 Oct 2024 03:34:15 -0700 (PDT)
Received: from dev.. ([129.41.59.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e774ccfa0sm2852374b3a.177.2024.10.16.03.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 03:34:14 -0700 (PDT)
From: Rohit Chavan <roheetchavan@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Rohit Chavan <roheetchavan@gmail.com>
Subject: [PATCH v2] staging: gpib: Replace kmalloc/memset with kzalloc.
Date: Wed, 16 Oct 2024 16:04:06 +0530
Message-Id: <20241016103406.1618448-1-roheetchavan@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch replaces kmalloc + memset with kzalloc in the GPIB driver.

Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
---
Changes since v1:
 - Merge similar patches in single one
 - Make commit message concise
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 3 +--
 drivers/staging/gpib/cb7210/cb7210.c                 | 3 +--
 drivers/staging/gpib/gpio/gpib_bitbang.c             | 3 +--
 drivers/staging/gpib/hp_82335/hp82335.c              | 3 +--
 drivers/staging/gpib/hp_82341/hp_82341.c             | 3 +--
 drivers/staging/gpib/ines/ines_gpib.c                | 3 +--
 drivers/staging/gpib/tnt4882/mite.c                  | 4 +---
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c          | 3 +--
 8 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 1296db4d47c6..cff555447ee9 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -518,10 +518,9 @@ void agilent_82350b_return_to_local(gpib_board_t *board)
 int agilent_82350b_allocate_private(gpib_board_t *board)
 
 {
-	board->private_data = kmalloc(sizeof(struct agilent_82350b_priv), GFP_KERNEL);
+	board->private_data = kzalloc(sizeof(struct agilent_82350b_priv), GFP_KERNEL);
 	if (!board->private_data)
 		return -ENOMEM;
-	memset(board->private_data, 0, sizeof(struct agilent_82350b_priv));
 	return 0;
 }
 
diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 59f6dde3d966..d32576c21988 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -1199,10 +1199,9 @@ static int cb_gpib_probe(struct pcmcia_device *link)
 	DEBUG(0, "%s(0x%p)\n", __func__, link);
 
 	/* Allocate space for private device-specific data */
-	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
-	memset(info, 0, sizeof(*info));
 
 	info->p_dev = link;
 	link->priv = info;
diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 81a952beee0d..847e4bea2cb1 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1105,10 +1105,9 @@ static int bb_line_status(const gpib_board_t *board)
 
 static int allocate_private(gpib_board_t *board)
 {
-	board->private_data = kmalloc(sizeof(struct bb_priv), GFP_KERNEL);
+	board->private_data = kzalloc(sizeof(struct bb_priv), GFP_KERNEL);
 	if (!board->private_data)
 		return -1;
-	memset(board->private_data, 0, sizeof(struct bb_priv));
 	return 0;
 }
 
diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 4e277997684b..cf92fc0b3337 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -201,10 +201,9 @@ return_to_local : hp82335_return_to_local,
 
 int hp82335_allocate_private(gpib_board_t *board)
 {
-	board->private_data = kmalloc(sizeof(struct hp82335_priv), GFP_KERNEL);
+	board->private_data = kzalloc(sizeof(struct hp82335_priv), GFP_KERNEL);
 	if (!board->private_data)
 		return -1;
-	memset(board->private_data, 0, sizeof(struct hp82335_priv));
 	return 0;
 }
 
diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index d37dd8335523..8ad1c885a9fb 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -459,10 +459,9 @@ return_to_local : hp_82341_return_to_local,
 
 int hp_82341_allocate_private(gpib_board_t *board)
 {
-	board->private_data = kmalloc(sizeof(struct hp_82341_priv), GFP_KERNEL);
+	board->private_data = kzalloc(sizeof(struct hp_82341_priv), GFP_KERNEL);
 	if (!board->private_data)
 		return -ENOMEM;
-	memset(board->private_data, 0, sizeof(struct hp_82341_priv));
 	return 0;
 }
 
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 9dbbdb048b9f..87f9d3789c5f 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -1063,10 +1063,9 @@ static int ines_gpib_probe(struct pcmcia_device *link)
 	DEBUG(0, "%s(0x%p)\n", __func__ link);
 
 	/* Allocate space for private device-specific data */
-	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
-	memset(info, 0, sizeof(*info));
 
 	info->p_dev = link;
 	link->priv = info;
diff --git a/drivers/staging/gpib/tnt4882/mite.c b/drivers/staging/gpib/tnt4882/mite.c
index 882cc4bc122e..0edf34d243e9 100644
--- a/drivers/staging/gpib/tnt4882/mite.c
+++ b/drivers/staging/gpib/tnt4882/mite.c
@@ -57,12 +57,10 @@ void mite_init(void)
 	for (pcidev = pci_get_device(PCI_VENDOR_ID_NATINST, PCI_ANY_ID, NULL);
 		pcidev;
 		pcidev = pci_get_device(PCI_VENDOR_ID_NATINST, PCI_ANY_ID, pcidev)) {
-		mite = kmalloc(sizeof(*mite), GFP_KERNEL);
+		mite = kzalloc(sizeof(*mite), GFP_KERNEL);
 		if (!mite)
 			return;
 
-		memset(mite, 0, sizeof(*mite));
-
 		mite->pcidev = pcidev;
 		pci_dev_get(mite->pcidev);
 		mite->next = mite_devices;
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index ef4b9ce36741..0a850926c118 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -1644,10 +1644,9 @@ static int ni_gpib_probe(struct pcmcia_device *link)
 	DEBUG(0, "%s(0x%p)\n", __func__, link);
 
 	/* Allocate space for private device-specific data */
-	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
-	memset(info, 0, sizeof(*info));
 
 	info->p_dev = link;
 	link->priv = info;
-- 
2.34.1

