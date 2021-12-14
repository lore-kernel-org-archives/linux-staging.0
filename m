Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA472CA5
	for <linux-staging@lists.linux.dev>; Tue, 14 Dec 2021 16:16:52 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id r9-20020a7bc089000000b00332f4abf43fso12937133wmh.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Dec 2021 08:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cc85KOSJveTQ5eUslKSoOpG1/P3POvZ1CMxkHgm/5RE=;
        b=eqgJZTbUd3GU32oL2NCQwxiUv24pUfxflF/jSVzxt+P8j074XM2jgaLEDwXREfnd4M
         E6DKK8HbLrvBppR6w6WDtlkt2PVeWUnfxvJiiGFhnTExAGt+oFdIfL2SqLwTAg6kYEoj
         sn3m0KPu7quufTYWBOflD9l+Ewe2kX9gRnetqTnhxWAxFAnk2MkVm77bC8H6N0I5J7Yw
         cM94CbIZ7NTrg50h2RdnrIeMZKRGsKbUCb2SNRuZVTf3kjMK5wcevbmAuLqBNT08brPv
         qouRVU0Upr1slpBB4IdYW3kzP7jtiDQEX6lyu2yL8hmH0HF2GeAEu6Buy7SrSTyyGC78
         Mw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cc85KOSJveTQ5eUslKSoOpG1/P3POvZ1CMxkHgm/5RE=;
        b=vBvR3tnAMY2M1jwA2uEdBc5tnRNfK6bFEMT0Ys5GvJFWeRglsWszV2ZP9gtQHGfbcV
         dSkkh1QIgkG037aKF28avsAI776z3VVc2AbFi21Jf4xJN5pe0IDq6denURWMSmHwJ5nG
         E3f9YFh6VBnTRLeL4l4pwBAq3/fbJqraHjL9+Qw46G10pQZW1665oxXBMzNOsX4Ur4x5
         sJK7mfKpHWQoR+ERpOmPmFpu1trcUvLPrwkSpUaviIosaQUCc9ey6TEqygq9kwriNDmF
         DKhS7ZQ1+We7dRktPXV/RVWjFBjFjQSw7djPd68Uey67bRTpHH0ewSCObsXGXkXUIG6L
         SRYw==
X-Gm-Message-State: AOAM533pX1G3egfrdiunorlGvqFN6kYgAF96C+zB9e8eEMxQTksXA47B
	G0ffm2FS6SCIURoHCm5/saBqSg==
X-Google-Smtp-Source: ABdhPJzuqu+bXvDNN6q7EtLdAP4LSz6ESuo5fKzElMyk/rK1gkQD/2D4OU2WFkSuVQS+IMIsGIm0Rw==
X-Received: by 2002:a7b:cbd8:: with SMTP id n24mr8115905wmi.150.1639498611085;
        Tue, 14 Dec 2021 08:16:51 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a9sm295116wrt.66.2021.12.14.08.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 08:16:50 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v4 12/18] staging: media: zoran: clean unused code
Date: Tue, 14 Dec 2021 16:16:30 +0000
Message-Id: <20211214161636.1886900-13-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214161636.1886900-1-clabbe@baylibre.com>
References: <20211214161636.1886900-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It remains some unused code from old zoran buffer handling.
Let's remove them.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran.h        | 14 ---------
 drivers/staging/media/zoran/zoran_card.c   | 36 ----------------------
 drivers/staging/media/zoran/zoran_device.h |  2 --
 drivers/staging/media/zoran/zoran_driver.c |  2 --
 4 files changed, 54 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index c36b33f42b16..654c95fa5aba 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -54,22 +54,8 @@ static inline struct zr_buffer *vb2_to_zr_buffer(struct vb2_buffer *vb)
 #define BUZ_NUM_STAT_COM    4
 #define BUZ_MASK_STAT_COM   3
 
-#define BUZ_MAX_FRAME     256	/* Must be a power of 2 */
-#define BUZ_MASK_FRAME    255	/* Must be BUZ_MAX_FRAME-1 */
-
 #define BUZ_MAX_INPUT       16
 
-#if VIDEO_MAX_FRAME <= 32
-#   define   V4L_MAX_FRAME   32
-#elif VIDEO_MAX_FRAME <= 64
-#   define   V4L_MAX_FRAME   64
-#else
-#   error   "Too many video frame buffers to handle"
-#endif
-#define   V4L_MASK_FRAME   (V4L_MAX_FRAME - 1)
-
-#define MAX_FRAME (BUZ_MAX_FRAME > VIDEO_MAX_FRAME ? BUZ_MAX_FRAME : VIDEO_MAX_FRAME)
-
 #include "zr36057.h"
 
 enum card_type {
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 4ea2fbf189b9..59df1e7691f9 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -60,20 +60,6 @@ static int video_nr[BUZ_MAX] = { [0 ... (BUZ_MAX - 1)] = -1 };
 module_param_array(video_nr, int, NULL, 0444);
 MODULE_PARM_DESC(video_nr, "Video device number (-1=Auto)");
 
-int v4l_nbufs = 4;
-int v4l_bufsize = 864;		/* Everybody should be able to work with this setting */
-module_param(v4l_nbufs, int, 0644);
-MODULE_PARM_DESC(v4l_nbufs, "Maximum number of V4L buffers to use");
-module_param(v4l_bufsize, int, 0644);
-MODULE_PARM_DESC(v4l_bufsize, "Maximum size per V4L buffer (in kB)");
-
-int jpg_nbufs = 32;
-int jpg_bufsize = 512;		/* max size for 100% quality full-PAL frame */
-module_param(jpg_nbufs, int, 0644);
-MODULE_PARM_DESC(jpg_nbufs, "Maximum number of JPG buffers to use");
-module_param(jpg_bufsize, int, 0644);
-MODULE_PARM_DESC(jpg_bufsize, "Maximum size per JPG buffer (in kB)");
-
 /* 1=Pass through TV signal when device is not used */
 /* 0=Show color bar when device is not used (LML33: only if lml33dpath=1) */
 int pass_through;
@@ -1253,28 +1239,6 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_info(pdev, "Zoran MJPEG board driver version %s\n", ZORAN_VERSION);
 
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
-
 	/* some mainboards might not do PCI-PCI data transfer well */
 	if (pci_pci_problems & (PCIPCI_FAIL | PCIAGP_FAIL | PCIPCI_ALIMAGIK))
 		pci_warn(pdev, "%s: chipset does not support reliable PCI-PCI DMA\n",
diff --git a/drivers/staging/media/zoran/zoran_device.h b/drivers/staging/media/zoran/zoran_device.h
index 6c5d70238228..322b04c55d41 100644
--- a/drivers/staging/media/zoran/zoran_device.h
+++ b/drivers/staging/media/zoran/zoran_device.h
@@ -47,9 +47,7 @@ extern void zr36057_restart(struct zoran *zr);
 
 extern const struct zoran_format zoran_formats[];
 
-extern int v4l_nbufs;
 extern int v4l_bufsize;
-extern int jpg_nbufs;
 extern int jpg_bufsize;
 extern int pass_through;
 
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 551db338c7f7..31993c266976 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -153,8 +153,6 @@ static __u32 zoran_v4l2_calc_bufsize(struct zoran_jpg_settings *settings)
 		result <<= 1;
 	}
 
-	if (result > jpg_bufsize)
-		return jpg_bufsize;
 	if (result < 8192)
 		return 8192;
 
-- 
2.32.0

