Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1F21ABEB1
	for <linux-staging@lists.linux.dev>; Tue,  3 Dec 2024 08:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733215292; cv=none; b=YraxrVjEbSJi63YDkyHE/syEZXYEZkKRYgloiYnh6CXTcyk/kazZnUMAVcAb+Im3T9oE76vX2YajEMgu/O/+il/rS6SINuT9q2cNq/5U25I55pjSBoRV6QzKxJEOeLWakXf9ICdJPzSL6YldEzkzF5U/Qk5kteKU9vUGV4Uw2Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733215292; c=relaxed/simple;
	bh=r9r7FRd26mBvpKsn+15bPXObLy6mfGx2gYncvPam+9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sCW4iqjaNlZT4UsrGbFsZepM0BYT0zOpdquDeZuZpJN50QTBY2JhuNYMxaHCV594tqWcgc/yF5T+LSREVkUUlc/6IW5zWPCCaYdxxN16v9FU+1URgec18uqz+OSvlLkRmt7wOCoKAQtThNhw7emx08NLDX0wWJWQtZPVDrkfQFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HF4FBu/y; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HF4FBu/y"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4349f160d62so44590455e9.2
        for <linux-staging@lists.linux.dev>; Tue, 03 Dec 2024 00:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733215288; x=1733820088; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lIiCQ/LtOWqMxVgD8JOR9CEqnVLqV0EXHWAZs4aGwUk=;
        b=HF4FBu/yS3HfPDJU5/jh6TfBuWXv0mJ0lHBd5rfqbwUnId1IdHnTJT90m/fVfiAKor
         RFJIEu76KOzLFaztTKhRW5FPjfa/85TRWqy0zIzSVuBW20mJWUueVuJIqz/MnS5IidN1
         CBti69D6YU/nsxtAl9ZUPibKAvUELyIdG1VgVMPYFgMQWPm+QA6zsOLAOyG3w0Pz/rKh
         mi228upqDMa5amtSRmP/v8OHZK8mVXXSdnfRdsTcSTq7ow8PU5PLortqeMEL+en0AifW
         1cBYwtxuZke8aTnHL/kllH7gEdqS2xDyJs1VOZqPlKuHWvXjn9chICXwLnq6OTz/yQed
         kSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733215288; x=1733820088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIiCQ/LtOWqMxVgD8JOR9CEqnVLqV0EXHWAZs4aGwUk=;
        b=IiSDxa3vZQVjU+pwpoS/tZlKYs5mqhz4NjDhRXIBNUpvTeLfmM8z1+MB0QYCjubvhA
         kZOnNlR8x2WVeU17eVPO5LMKMXDN4oMee88DAd/uPuoaNAXjGZ1PYPn+RIP5aRhU9IZN
         sfHPEV12d1D/xpbCdZcxXtbmDvqChbZyBJpnTBXRqrn8DT71VI6e/9k3wA7NSn8ErAbY
         aIn0wVU5X9PjKsULtN42L82ookXCu0WPO/KiBlLhzR3nvjwgzljNfq9wiEinBLQPGHrw
         EzCK+VwqVaKsGzT2TRkcLZ+1NaQgY2+U26oog1xsW+5qKYm9zET7LWM9LPXQcYSKIqno
         bMZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOBuVAnERgVDUK/JawIpgBNCuW1PodU4Aqz4F6Wp/U9W5HxJQXJXikZXX1nhdJ/66eOEtqxZHPmaVr08Er@lists.linux.dev
X-Gm-Message-State: AOJu0YwdEihEkYxRUXUDCZuXlfcrR7Q//lv5UhC/sNEajQzFLog/JoIY
	enjSLJ3sPpcDLMbKXfOb18Yrwhmrm2xpiIIuV+v+r18gKNRIXoQk
X-Gm-Gg: ASbGnctScbUp6OQwwREazHFOCjtltySghTmcu7pQLG2BEOXWfc707dHZoPBKnUlmCqV
	z/ibA1qltCAGCy1yio/0O4eRcrwAPDZi8dqtIyJ5pgcARMLnXekAsdIkAYX8tcqncZAHatug0B4
	GUwgAnufYxYswokPz7eXUFcj/6cIU2AKbkZqu++5H41i6RkYepAZQTyj6kOtRME/7UBFjL4a0P0
	Mn8/MeQMY6cJeggOP21jA0dV6ScQIF6ef0mM/KYPDoGkir7bJQNeS3ybWvcbdWxVd+CqlumBdJq
	vrCAaF8MjQ==
X-Google-Smtp-Source: AGHT+IHPkPssDtk7PbBN1/qeDFvWsc1gwOmzVsPYao+hA91SJiFqZGXTdrTL5ns8u/UOxTGEx2t+Lw==
X-Received: by 2002:a05:600c:35c9:b0:434:a5b6:273c with SMTP id 5b1f17b1804b1-434d09b1464mr12888965e9.2.1733215288246;
        Tue, 03 Dec 2024 00:41:28 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0d9bc5asm179763695e9.2.2024.12.03.00.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 00:41:27 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: linux@roeck-us.net,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH v3] staging: gpib: Fix i386 build issue
Date: Tue,  3 Dec 2024 09:41:16 +0100
Message-ID: <20241203084116.2228-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These drivers cast resource_type_t to void * causing the build to fail.

With CONFIG_X86_PAE enabled the resource_size_t type is a 64bit unsigned int
which cannot be cast to a 32 bit pointer.

Use ioremap() instead of pci_resource_start() / pnp_port_start() to
initialize iobase.

Reported_by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/all/f10e976e-7a04-4454-b38d-39cd18f142da@roeck-us.net/
Fixes: e9dc69956d4d ("staging: gpib: Add Computer Boards GPIB driver")
Fixes: e1339245eba3 ("staging: gpib: Add Computer Equipment Corporation GPIB driver")
Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
Fixes: 0cd5b05551e0 ("staging: gpib: Add TNT4882 chip based GPIB driver")

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
v1 -> v2 changed pci_resource_start to pci_resource_len for second parameter of ioremap
v2 -> v3 add changes for cb7210 and tnt4882 drivers

 drivers/staging/gpib/cb7210/cb7210.c        |  6 ++++--
 drivers/staging/gpib/cec/cec_gpib.c         |  3 ++-
 drivers/staging/gpib/ines/ines_gpib.c       |  4 ++--
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 12 +++++++-----
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 63df7f3eb3f3..356a3404e128 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -971,11 +971,13 @@ int cb_pci_attach(gpib_board_t *board, const gpib_board_config_t *config)
 	switch (cb_priv->pci_chip) {
 	case PCI_CHIP_AMCC_S5933:
 		cb_priv->amcc_iobase = pci_resource_start(cb_priv->pci_device, 0);
-		nec_priv->iobase = (void *)(pci_resource_start(cb_priv->pci_device, 1));
+		nec_priv->iobase = ioremap(pci_resource_start(cb_priv->pci_device, 1),
+					   pci_resource_len(cb_priv->pci_device, 1));
 		cb_priv->fifo_iobase = pci_resource_start(cb_priv->pci_device, 2);
 		break;
 	case PCI_CHIP_QUANCOM:
-		nec_priv->iobase = (void *)(pci_resource_start(cb_priv->pci_device, 0));
+		nec_priv->iobase = ioremap(pci_resource_start(cb_priv->pci_device, 0),
+					   pci_resource_len(cb_priv->pci_device, 0));
 		cb_priv->fifo_iobase = (unsigned long)nec_priv->iobase;
 		break;
 	default:
diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index 3dc933deb401..26c0cce1e917 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -297,7 +297,8 @@ int cec_pci_attach(gpib_board_t *board, const gpib_board_config_t *config)
 
 	cec_priv->plx_iobase = pci_resource_start(cec_priv->pci_device, 1);
 	pr_info(" plx9050 base address 0x%lx\n", cec_priv->plx_iobase);
-	nec_priv->iobase = (void *)(pci_resource_start(cec_priv->pci_device, 3));
+	nec_priv->iobase = ioremap(pci_resource_start(cec_priv->pci_device, 3),
+				   pci_resource_len(cec_priv->pci_device, 3));
 	pr_info(" nec7210 base address 0x%p\n", nec_priv->iobase);
 
 	isr_flags |= IRQF_SHARED;
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 9d8387c3bf01..b5f8ea57fd9d 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -780,8 +780,8 @@ static int ines_common_pci_attach(gpib_board_t *board, const gpib_board_config_t
 
 	if (pci_request_regions(ines_priv->pci_device, "ines-gpib"))
 		return -1;
-	nec_priv->iobase = (void *)(pci_resource_start(ines_priv->pci_device,
-						       found_id.gpib_region));
+	nec_priv->iobase = ioremap(pci_resource_start(ines_priv->pci_device, found_id.gpib_region),
+				   pci_resource_len(ines_priv->pci_device, found_id.gpib_region));
 
 	ines_priv->pci_chip_type = found_id.pci_chip_type;
 	nec_priv->offset = found_id.io_offset;
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index e49a952fa0d8..1e41a48e6fca 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -1400,7 +1400,8 @@ static int ni_isa_attach_common(gpib_board_t *board, const gpib_board_config_t *
 	struct tnt4882_priv *tnt_priv;
 	struct nec7210_priv *nec_priv;
 	int isr_flags = 0;
-	void *iobase;
+	resource_size_t iobase;
+	unsigned long ibbase;
 	int irq;
 
 	board->status = 0;
@@ -1427,18 +1428,19 @@ static int ni_isa_attach_common(gpib_board_t *board, const gpib_board_config_t *
 		if (retval < 0)
 			return retval;
 		tnt_priv->pnp_dev = dev;
-		iobase = (void *)(pnp_port_start(dev, 0));
+		iobase = pnp_port_start(dev, 0);
 		irq = pnp_irq(dev, 0);
 	} else {
-		iobase = config->ibbase;
+		ibbase = (unsigned long)config->ibbase;
+		iobase = ibbase;
 		irq = config->ibirq;
 	}
 	// allocate ioports
-	if (!request_region((unsigned long)(iobase), atgpib_iosize, "atgpib")) {
+	if (!request_region(iobase, atgpib_iosize, "atgpib")) {
 		pr_err("tnt4882: failed to allocate ioports\n");
 		return -1;
 	}
-	nec_priv->iobase = iobase;
+	nec_priv->iobase = ioremap(iobase, pnp_port_len(tnt_priv->pnp_dev, 0));
 
 	// get irq
 	if (request_irq(irq, tnt4882_interrupt, isr_flags, "atgpib", board)) {
-- 
2.46.2

