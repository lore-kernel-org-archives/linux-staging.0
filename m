Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22E272
	for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 19:34:29 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id m42so506480wms.2
        for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 12:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TsNFpY1RRkr+DNPQxSAx+z1PDhyA43H0wT6kfJ2Z97I=;
        b=eME9O1/pcsGox5LjfX7xPVoCrlsF3VVOUBpSmani2lqKTUVyRqJiluvPcZL3a70haz
         ezOSnQ5oY5mg4iqKR4piTZdyW4BPP1A81mXV3wmOY+2Mx6fw3dHS5DbC8UwbIyIxy9/B
         F37EkoExJekgeAyATlAGIM8AYm9WXa1o8G2hCIHVmO9lTiaW/hepGMfeW44fXVe7ZB3R
         d8vj6Euu0zI3AvlF0nFYdD7Ki8HreGE0BdIbVkJPhjhDyQsWpQ7FtTMgdl5zY7wYXoy2
         iVzniBL2F3XJUSOJFtln+WR0UfcP8og2qdOlB+GsaRBW/sH/+Qrh1CtQQfoi5QOCAlmh
         Mnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TsNFpY1RRkr+DNPQxSAx+z1PDhyA43H0wT6kfJ2Z97I=;
        b=E6zaO2lKZXTv1xl7QFoTPg+ZMQYuBUymitFDZ0E9mTDINZEPUbEKWL3fuTPp3Ksm41
         yMdWvIxCfefJZ6IVJSjcBLsQSiL4+JCtLfTcPHWY1LvrOcuYi5KE+mnf5QEUFqRkldW5
         k+5TzNcBR6DPsCML4TMPI/sZUMqnkI6MBIutr8UoIYw8ozF9ltFkef9DmBsJ48FL17Im
         nWM0Ch+aRMazKbttvB+/plIe9J2+4H6T3Zjq0uMe0v3PfHIth7bdCVz5IDR5baxSeL8w
         8EVhrVCxlBUs8Gh506Bel1HoMATnBQ58ds1gtjw+7XBb55yYm7vWsOwOVMB5/uZLaumH
         8cbA==
X-Gm-Message-State: AOAM532oBbDUtq7rUTpDhMMkzdirO2iXxLN5HXTu70vBcH8v0np1yh/7
	L2fuvgP1L4NttDQcKtWz2BwWug==
X-Google-Smtp-Source: ABdhPJzl6RgoK75e15lPN0nE8cV0VDbdl5tXgmBcelZwY2x6GlL86ABMpt9s6+FbGBGktuDk2J+W5Q==
X-Received: by 2002:a1c:2355:: with SMTP id j82mr731765wmj.164.1635276868270;
        Tue, 26 Oct 2021 12:34:28 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id s18sm17676123wrb.95.2021.10.26.12.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 12:34:28 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 11/14] staging: media: zoran: fix usage of vb2_dma_contig_set_max_seg_size
Date: Tue, 26 Oct 2021 19:34:13 +0000
Message-Id: <20211026193416.1176797-12-clabbe@baylibre.com>
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

vb2_dma_contig_set_max_seg_size need to have a size in parameter and not
a DMA_BIT_MASK().
While fixing this issue, also fix error handling of all DMA size
setting.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: d4ae3689226e5 ("media: zoran: device support only 32bit DMA address")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index a00ad40244d0..4ea2fbf189b9 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -1282,8 +1282,10 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 	if (err)
-		return -ENODEV;
-	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+		return err;
+	err = vb2_dma_contig_set_max_seg_size(&pdev->dev, U32_MAX);
+	if (err)
+		return err;
 
 	nr = zoran_num++;
 	if (nr >= BUZ_MAX) {
-- 
2.32.0

