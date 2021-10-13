Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D1B2C94
	for <linux-staging@lists.linux.dev>; Wed, 13 Oct 2021 18:58:24 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id m22so11767286wrb.0
        for <linux-staging@lists.linux.dev>; Wed, 13 Oct 2021 11:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3LHPDY3kMpnJAm0T8AaCeTyE7uf/LEhpftdR1uzKAKo=;
        b=HZr6vn6r95DGJh75IxvsNPy20JYk18tx0+R2HbzZTxZWxtuvkWgmEdQxbicqIAteHT
         YSy1owofRejoV7zFOPr0E6vU8BE0l0j61q6gCVCHVXSgyzwk6/gct7xr9K/Cmm9C1lUM
         91az4pu5wzKnYvyFmbzkemjCABbcdSyiRp+UF3CZvvVDWWyuDgq6b0RCfXQJsO/AIDZP
         eQj3OeH+f6gfNWoc1qD/tdazwDK/bZHvnviAqZf27J4WCYIeXS5Gn6EKkl9jcVo7tvJk
         TQJyU8nIE4GKoQxTOn4nuWq3P52h89sLq0tgCatqPuCOHXiBg8C3dupTmpIyLLZB6DJM
         7t6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3LHPDY3kMpnJAm0T8AaCeTyE7uf/LEhpftdR1uzKAKo=;
        b=VOipMGtVHVmsXJzPzFK/Fr/Pc3hn1Ej/fm1Be1QodQW4L5QdSfvK92PaF7Iz49w+rh
         UD0ObXOwIsiwVupTOrZaMVXs9a8Lb10L7cYZAEeehakjGsmB0ZDt6xqlDn7qK+VAisU3
         hENp4EKIrKPqXkNqC41qR51dDSmQv9X4zICLiT0aG/jF6yRAmX6gKCaeiN2nETm7zy4j
         eR5c5xa5yufL4xw5bxfUXKrrNgtYiiAXPbLPfuc3NlX4HznhF9RULxBN/h+zKkluVcvI
         umxwehDhs3v9MyyuiXL6vrBkPndZVPx9gVRMpIbC40iva53iWT09ZNx+82GvCFuRB8GT
         s0uA==
X-Gm-Message-State: AOAM533/v3P8Em+bjLGZrcujRHsfK2PbI23HBUGLq0+G2s/z0vvymW4+
	FtI6EqKeRJi6zgDtRJPvVe+bfA==
X-Google-Smtp-Source: ABdhPJzvdZhsGfY6dZ6ucVvnv9IBWKAI3FFz6SFEXeKM7wFbmlQt8vov1bzfTxacvUBPQUi+OO87VA==
X-Received: by 2002:adf:f902:: with SMTP id b2mr1011711wrr.265.1634151502535;
        Wed, 13 Oct 2021 11:58:22 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e8sm573059wrg.48.2021.10.13.11.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 11:58:22 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 07/10] staging: media: zoran: remove vidmem
Date: Wed, 13 Oct 2021 18:58:09 +0000
Message-Id: <20211013185812.590931-8-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013185812.590931-1-clabbe@baylibre.com>
References: <20211013185812.590931-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vidmem parameter is no longer necessary since we removed framebuffer
support.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index a0739d3462bb..a079fb6e27a3 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -39,17 +39,6 @@ static int card[BUZ_MAX] = { [0 ... (BUZ_MAX - 1)] = -1 };
 module_param_array(card, int, NULL, 0444);
 MODULE_PARM_DESC(card, "Card type");
 
-/*
- * The video mem address of the video card. The driver has a little database
- * for some videocards to determine it from there. If your video card is not
- * in there you have either to give it to the driver as a parameter or set
- * in a VIDIOCSFBUF ioctl
- */
-
-static unsigned long vidmem;	/* default = 0 - Video memory base address */
-module_param_hw(vidmem, ulong, iomem, 0444);
-MODULE_PARM_DESC(vidmem, "Default video memory base address");
-
 /* Default input and video norm at startup of the driver. */
 
 static unsigned int default_input;	/* default 0 = Composite, 1 = S-Video */
@@ -1163,10 +1152,6 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		jpg_bufsize = 8192;
 	if (jpg_bufsize > (512 * 1024))
 		jpg_bufsize = 512 * 1024;
-	/* Use parameter for vidmem or try to find a video card */
-	if (vidmem)
-		pci_info(pdev, "%s: Using supplied video memory base address @ 0x%lx\n",
-			 ZORAN_NAME, vidmem);
 
 	/* some mainboards might not do PCI-PCI data transfer well */
 	if (pci_pci_problems & (PCIPCI_FAIL | PCIAGP_FAIL | PCIPCI_ALIMAGIK))
-- 
2.32.0

