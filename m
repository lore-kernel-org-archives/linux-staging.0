Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5032CAA
	for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 19:34:23 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id e4so129135wrc.7
        for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 12:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=swEGGVp8+HI45UprzcHEDFUC6TlCIZ4vzEzvc39jOtk=;
        b=AP2b0sFj6Hhl3C/23pSETWqc+SJ1kCmJLy6DsZi22SBcfGMHyt659cW6XPvasxm5rl
         fhf/N7N4pthI4u5PZKqapZZd7LsjpuWnwMt2XcUte3AseU/64/qoUrWCI3OwDvo2gXON
         oUEUbAH3YcP5tZoICiXBau8EUNrmGW93lwoyYt8MruOM8PhI2pilDQvPmot+SU73abeY
         j6NaxxcCzt199Fnke4bjyYHEUcfqQCjzeUzkRy7zedN1Bmngxn7hSvSbIZc0ra3VVq59
         /AYqoZEWc1HGgC9OKez0wPANUy7n2ecM3/5oZACc3a88ma/JyzvBN9QGgLd5JlN3zoRo
         2LYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=swEGGVp8+HI45UprzcHEDFUC6TlCIZ4vzEzvc39jOtk=;
        b=i9eBb5btJliTKOt4EmhOGiPJ24rx+8zDMvVi8GlgQkZE8lqXMNcSHCjjnEVGPpG+mi
         3dXvodyiLKq0fNpwM2DLvkAsxX4uR0z9ayoPtxCb7DR6rSrpV7UON+quBPHWW2INn1Wj
         QPXPRzssDeyBWBYiF7PXyXQcW/W8Iqx6xp1bJeFvh5+sZaJ74l+npYkkU86MD44Vy96+
         9s5gjFyOUJPDrroJv44buNN/TYxEoS75KMsj11rPAxuFcV2Njx7apJjvV5Z38b/3upw+
         vTWkKdkZR3Z4Kwf+KMZJX+Is+AuT4xhAO4zR/+NHC5gcXvt3GTtRrRzoHSQMn092zxbX
         1BIg==
X-Gm-Message-State: AOAM532UsMGvgKbFcihaCRVHymSgom5dEdiH/IubPvbdi5IVA1rMVn2y
	OokVtcFtdHJ1hf+TWFh0gX/VbWYrgNshJg==
X-Google-Smtp-Source: ABdhPJwrZRrtHioQOddQjP2HQ1bNLKGF3uQJky4wtgQOcnlEykmxKlLP/UvYZ8qD1frUXD/rO4JK2A==
X-Received: by 2002:a05:6000:18a8:: with SMTP id b8mr18157726wri.340.1635276862201;
        Tue, 26 Oct 2021 12:34:22 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id s18sm17676123wrb.95.2021.10.26.12.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 12:34:21 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 01/14] staging: media: zoran: move module parameter checks to zoran_probe
Date: Tue, 26 Oct 2021 19:34:03 +0000
Message-Id: <20211026193416.1176797-2-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026193416.1176797-1-clabbe@baylibre.com>
References: <20211026193416.1176797-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to empty zoran_init() for removing it later.
Furthermore, this permit to use pci_xxx instead of pr_xxx for prettier
printing.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 64 ++++++++++++------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index f259585b0689..3bc0e64f1007 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -1067,6 +1067,39 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	unsigned int nr;
 	int err;
 
+	pci_info(pdev, "Zoran MJPEG board driver version %s\n", ZORAN_VERSION);
+
+	/* check the parameters we have been given, adjust if necessary */
+	if (v4l_nbufs < 2)
+		v4l_nbufs = 2;
+	if (v4l_nbufs > VIDEO_MAX_FRAME)
+		v4l_nbufs = VIDEO_MAX_FRAME;
+	/* The user specifies the in KB, we want them in byte (and page aligned) */
+	v4l_bufsize = PAGE_ALIGN(v4l_bufsize * 1024);
+	if (v4l_bufsize < 32768)
+		v4l_bufsize = 32768;
+	/* 2 MB is arbitrary but sufficient for the maximum possible images */
+	if (v4l_bufsize > 2048 * 1024)
+		v4l_bufsize = 2048 * 1024;
+	if (jpg_nbufs < 4)
+		jpg_nbufs = 4;
+	if (jpg_nbufs > BUZ_MAX_FRAME)
+		jpg_nbufs = BUZ_MAX_FRAME;
+	jpg_bufsize = PAGE_ALIGN(jpg_bufsize * 1024);
+	if (jpg_bufsize < 8192)
+		jpg_bufsize = 8192;
+	if (jpg_bufsize > (512 * 1024))
+		jpg_bufsize = 512 * 1024;
+	/* Use parameter for vidmem or try to find a video card */
+	if (vidmem)
+		pci_info(pdev, "%s: Using supplied video memory base address @ 0x%lx\n",
+			 ZORAN_NAME, vidmem);
+
+	/* some mainboards might not do PCI-PCI data transfer well */
+	if (pci_pci_problems & (PCIPCI_FAIL | PCIAGP_FAIL | PCIPCI_ALIMAGIK))
+		pci_warn(pdev, "%s: chipset does not support reliable PCI-PCI DMA\n",
+			 ZORAN_NAME);
+
 	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 	if (err)
 		return -ENODEV;
@@ -1285,37 +1318,6 @@ static int __init zoran_init(void)
 {
 	int res;
 
-	pr_info("Zoran MJPEG board driver version %s\n", ZORAN_VERSION);
-
-	/* check the parameters we have been given, adjust if necessary */
-	if (v4l_nbufs < 2)
-		v4l_nbufs = 2;
-	if (v4l_nbufs > VIDEO_MAX_FRAME)
-		v4l_nbufs = VIDEO_MAX_FRAME;
-	/* The user specifies the in KB, we want them in byte (and page aligned) */
-	v4l_bufsize = PAGE_ALIGN(v4l_bufsize * 1024);
-	if (v4l_bufsize < 32768)
-		v4l_bufsize = 32768;
-	/* 2 MB is arbitrary but sufficient for the maximum possible images */
-	if (v4l_bufsize > 2048 * 1024)
-		v4l_bufsize = 2048 * 1024;
-	if (jpg_nbufs < 4)
-		jpg_nbufs = 4;
-	if (jpg_nbufs > BUZ_MAX_FRAME)
-		jpg_nbufs = BUZ_MAX_FRAME;
-	jpg_bufsize = PAGE_ALIGN(jpg_bufsize * 1024);
-	if (jpg_bufsize < 8192)
-		jpg_bufsize = 8192;
-	if (jpg_bufsize > (512 * 1024))
-		jpg_bufsize = 512 * 1024;
-	/* Use parameter for vidmem or try to find a video card */
-	if (vidmem)
-		pr_info("%s: Using supplied video memory base address @ 0x%lx\n", ZORAN_NAME, vidmem);
-
-	/* some mainboards might not do PCI-PCI data transfer well */
-	if (pci_pci_problems & (PCIPCI_FAIL | PCIAGP_FAIL | PCIPCI_ALIMAGIK))
-		pr_warn("%s: chipset does not support reliable PCI-PCI DMA\n", ZORAN_NAME);
-
 	res = pci_register_driver(&zoran_driver);
 	if (res) {
 		pr_err("Unable to register ZR36057 driver\n");
-- 
2.32.0

