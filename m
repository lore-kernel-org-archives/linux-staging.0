Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447CA6D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 10:10:56 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id e12so4251191wro.11
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 03:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=wPByJzN/lrtdxw7IeGs/VhpNS5SPbMlWIMYIa7XkvgA=;
        b=Mv1KqnOmWXihqzCTJ7mc3sDMHB2wPVvBiahBlHsncEMZtquH6WvHTwwrUTTh6AONiF
         J7HgP0UHU1SZn+flahbTYrKdztw8UgHAP0CCxXG0/LHPpiomdNdtCQmSb4u8U+nGYMi0
         K9FOQJZaQT3Et3YjxjMePQsUoWgUZxmJedTqXXg1VseoePKRo9PcSAgwmLIIpdvExWXK
         hCxRXLox9jhtz5bP2po8hrakmCjWyk7JUp0ocj3G1iwpSWZHNRx0tORESQjhWPlx1fY+
         ABXFXsN40JndUn1ldyjab/Iu/C24XoCYUpqdBKTlu4p+O18kE2r2G1YsDyPwccwe6KOK
         cEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=wPByJzN/lrtdxw7IeGs/VhpNS5SPbMlWIMYIa7XkvgA=;
        b=odxW3DlQIuHpbF66epSH84NvUL/1dQ3BCX7eH+r9WfpLpOXlctiJXf+v3q+/SyqcVv
         g337dzxqIs5LuvzolhdSJLU2gy8HXYHV3DqnDEoA7SYRsOYQQqGGbjq9GqPM4h4N0NEF
         jM3FmbCboeFhR6W82z+gqBQ/YjZlyRgLetbsGpln3bJI1XcUb863bnN42VThOcRfyXRL
         oIECudDee0/3TvPytVRuaKNVQ3um+3qQDinx9gWSrQOvUtsgM6QBj0CQlf4xuXf8ve58
         OoNignCeq9c2lqRV9oqxpLWyyzYuNwAJdZ/F49Rl1Cr8V5AuIu0Aw1l3eW9L6mJbZdHl
         Wzeg==
X-Gm-Message-State: AOAM533NQGp6Ok8Wos0OY4eAbEyl10KtViZaOIgd5m1Vjd3BVc5CrwzY
	pGrnGJGAhXBMhDoV4QWOZHw=
X-Google-Smtp-Source: ABdhPJzF21Oel/0BU67OgtwJ2Z/9oyBl0+N2CQ9W+9/69ZNDuh80eCyuAPaG2Rmx5fOW9kTaY0xQ1A==
X-Received: by 2002:adf:d082:: with SMTP id y2mr2920830wrh.176.1617790254787;
        Wed, 07 Apr 2021 03:10:54 -0700 (PDT)
Received: from LEGION ([39.46.7.73])
        by smtp.gmail.com with ESMTPSA id k13sm46297544wri.27.2021.04.07.03.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 03:10:54 -0700 (PDT)
Date: Wed, 7 Apr 2021 15:10:47 +0500
From: Muhammad Usama Anjum <musamaanjum@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-media@vger.kernel.org>,
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>,
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>
Cc: musamaanjum@gmail.com, linqiheng@huawei.com,
	kernel-janitors@vger.kernel.org, dan.carpenter@oracle.com
Subject: [PATCH] staging: axis-fifo: media/meson: remove redundant dev_err
 call
Message-ID: <20210407101047.GA1491258@LEGION>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

devm_ioremap_resource() prints error message in itself. Remove the
dev_err call to avoid redundant error message.

Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c   | 1 -
 drivers/staging/media/meson/vdec/vdec.c | 8 ++------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 2bb1c2e9cb57..ed9281089738 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -853,7 +853,6 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	fifo->base_addr = devm_ioremap_resource(fifo->dt_device, r_mem);
 	if (IS_ERR(fifo->base_addr)) {
 		rc = PTR_ERR(fifo->base_addr);
-		dev_err(fifo->dt_device, "can't remap IO resource (%d)\n", rc);
 		goto err_initial;
 	}
 
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 5d4db7a5b4b5..e51d69c4729d 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1008,17 +1008,13 @@ static int vdec_probe(struct platform_device *pdev)
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dos");
 	core->dos_base = devm_ioremap_resource(dev, r);
-	if (IS_ERR(core->dos_base)) {
-		dev_err(dev, "Couldn't remap DOS memory\n");
+	if (IS_ERR(core->dos_base))
 		return PTR_ERR(core->dos_base);
-	}
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "esparser");
 	core->esparser_base = devm_ioremap_resource(dev, r);
-	if (IS_ERR(core->esparser_base)) {
-		dev_err(dev, "Couldn't remap ESPARSER memory\n");
+	if (IS_ERR(core->esparser_base))
 		return PTR_ERR(core->esparser_base);
-	}
 
 	core->regmap_ao =
 		syscon_regmap_lookup_by_phandle(dev->of_node,
-- 
2.25.1

