Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070213FC0
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 07:00:22 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id k24so5822892pgh.8
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 00:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mx3nDhHb+cYhtgK78HeCOT8qRwLpEWC5Qetf1O8Tuw8=;
        b=iyGJFiG+erqh1x40HUTRMuDlfwZEmK40x94VbarencMHIO8m9WEtig5OPGoAdqwkN8
         Bw23SEFku3SVufdK+WF1Fyt0iQc3VGBl6K1jmxDjCfQIQNsM0++7Y5ibbSMS/LFN6g7V
         9VfGiV1ZldsC1mOTFW7/GhqjfrB8daaHlY1icR9YL083R7rsxiFO10fvCBWQ8I5h6xrW
         4PYplxoJExPZ0+hVgk0w7F5Dcpx+5v47y7V1pAsi2B3YtOgsMll1JmoKKLXh1W31Ih6y
         R8x2Sf0Xzf22tI0AXzT21DgsaenRy1BxPjcsMdJ2gaYDJ+fIdUl1kxG1Z4rkg5RiC6XQ
         s3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mx3nDhHb+cYhtgK78HeCOT8qRwLpEWC5Qetf1O8Tuw8=;
        b=TUS13Wja35F5FE6YGM6H06QdLjVUx9JlryVnvQ2Wf6sfDUXIPqOHDPOgPfq8OqvB80
         jl9MWum3rupEoe6zaNcrmIrUAoqTaAVxpHfzjbIh51tOjIyTDHh4jk2JJLhL1DzhFW8B
         ey3GgExLc7scYb1RjjQiH+53EZrKD0AFwJGJCD4LeXrCisfjMip/EP27zISnTSyvZpu/
         XkArQqrmtDM7zPq9qH022cyfvy6rLP1ASFQFQuDGqDrjKbfbxkcIq3s8sCmw4mRp43BV
         Bu3SXb2Das2JWqXyxhfbLKdkmXY84gva30m0OymazvA5cOXOHsY3DoVOvhSGcMU5jhxJ
         Om2g==
X-Gm-Message-State: AOAM531CSyyUVrqEM53hjey7jfPHS1SrcPkVielW8/44GKg+CgrLoN5Z
	PxAjSGl+FYYvqkmMQFP4izU=
X-Google-Smtp-Source: ABdhPJxTmLde5whEnuajU/+gqaTHbvSiU5HaX7lFpiYl9/hN/9S/fhqzrXjRd8CamopoFbVVB44d3A==
X-Received: by 2002:a62:3342:0:b029:3b7:6395:a93 with SMTP id z63-20020a6233420000b02903b763950a93mr10627850pfz.71.1630911622352;
        Mon, 06 Sep 2021 00:00:22 -0700 (PDT)
Received: from localhost.localdomain ([124.126.19.250])
        by smtp.gmail.com with ESMTPSA id u21sm8045403pgk.57.2021.09.06.00.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 00:00:22 -0700 (PDT)
From: zhaoxiao <long870912@gmail.com>
To: mchehab@kernel.org,
	khilman@baylibre.com
Cc: narmstrong@baylibre.com,
	gregkh@linuxfoundation.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhaoxiao <long870912@gmail.com>
Subject: [PATCH] Media: meson: vdec: Use devm_platform_ioremap_resource_byname()
Date: Mon,  6 Sep 2021 15:00:13 +0800
Message-Id: <20210906070013.7362-1-long870912@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately.

Signed-off-by: zhaoxiao <long870912@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index e51d69c4729d..8549d95be0f2 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -994,7 +994,6 @@ static int vdec_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct video_device *vdev;
 	struct amvdec_core *core;
-	struct resource *r;
 	const struct of_device_id *of_id;
 	int irq;
 	int ret;
@@ -1006,13 +1005,11 @@ static int vdec_probe(struct platform_device *pdev)
 	core->dev = dev;
 	platform_set_drvdata(pdev, core);
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dos");
-	core->dos_base = devm_ioremap_resource(dev, r);
+	core->dos_base = devm_platform_ioremap_resource_byname(pdev, "dos");
 	if (IS_ERR(core->dos_base))
 		return PTR_ERR(core->dos_base);
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "esparser");
-	core->esparser_base = devm_ioremap_resource(dev, r);
+	core->esparser_base = devm_platform_ioremap_resource_byname(pdev, "esparser");
 	if (IS_ERR(core->esparser_base))
 		return PTR_ERR(core->esparser_base);
 
-- 
2.20.1

