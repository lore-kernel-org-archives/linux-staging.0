Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830D02CAA
	for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 19:34:27 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id e12so154002wra.4
        for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 12:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nB4e6hJ4iiTdgUlpoHX4JiHqvuWD9iBvhiQUSGuoJO4=;
        b=bp0jJ7ZceOzhwiLL2z456G+nLL1DoRI+t7YWJGoypcTUguXeiqTGtvK21TTZJ6H/mj
         vpMbX9pBg6JG8IMSV9aAKwktwpyGRUJdJrnI723z9KnyxGz5KLk9Xj2A2n/2esmLeF1L
         B2f6UkAPOzDe16/any8YTtfUY1W6NGOAC8VTni0Nhvp16xrBlydlHK2spZ7YBfaxj7Oa
         ejpNTtGBkchhJsF167fCIn4zXX5Fc4qGbu1QM4XaN0UrOnvxK4XUF8rv3is+oJfA+cc8
         fsEvpAwU+eNWZ1M65yh5knZsl9kBXc51/zjpoJ8k+OSaTzh3532S9rzbAO+8KTWXCT2u
         6eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nB4e6hJ4iiTdgUlpoHX4JiHqvuWD9iBvhiQUSGuoJO4=;
        b=kL9esbPFu8PUVS2/bey4qoYo2z28+deFTnlmVn+PKe2OlBLjMRe542FhBrwlJM3meD
         JjdjPXSaz9w2kUvlmm8khPRhsaup0SzDPq9Mj6AFMN1R34ufW/JdKlT9fYmDrILdMMNY
         stbtqruptpk8kd7140iRVnH8LLZAPzyNN9E9gWg5Y9MMu6stgfeka7BzM++gUIJT9Qb0
         SHKR+jP3oOwBff+DYktNbaJiAIYi7qGzHAhIPlp+tdKiMZAMMlYe9ZvQVeV+I8RN+KAC
         IqP/GvSq/wcak56X/H5X/AKMqwciwj+9d9tIxglTUJE3o224PF8liyr+5VWvPbAyDVFg
         S7Vg==
X-Gm-Message-State: AOAM5335+FXtYqUmJePfAsu5qDG/BVL6QDUu+oZigLpw0D9M3cODDuTy
	iutUGDwyAY8f85c/G2dHSGG4jw==
X-Google-Smtp-Source: ABdhPJx7GDzTAKUUvLyZ4g8I5al81toghj6qSIHPBHe1j4P4cW1PVSQsjbfbH3fEcpgNIL1GiVo0nw==
X-Received: by 2002:adf:bd8a:: with SMTP id l10mr34362048wrh.159.1635276865839;
        Tue, 26 Oct 2021 12:34:25 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id s18sm17676123wrb.95.2021.10.26.12.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 12:34:25 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 07/14] staging: media: zoran: remove vidmem
Date: Tue, 26 Oct 2021 19:34:09 +0000
Message-Id: <20211026193416.1176797-8-clabbe@baylibre.com>
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

The vidmem parameter is no longer necessary since we removed framebuffer
support.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index a7750442ef9e..9cd49f85a56e 100644
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
@@ -1218,10 +1207,6 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
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

