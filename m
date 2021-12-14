Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404E12CA5
	for <linux-staging@lists.linux.dev>; Tue, 14 Dec 2021 16:16:45 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so14093663wme.4
        for <linux-staging@lists.linux.dev>; Tue, 14 Dec 2021 08:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZX+m9eRP3G6qa3o26UuCwjfzdvb0rxacvbcUwg9LjVM=;
        b=T7EoM7c6Sk022NWt5q8QI8ShLGTFYSNYidgGL8J4+k0ABRAXcsARMRQMbJ0Zc5gLME
         vwl/OnAi09m6K9yCcSLj3M4uiDaS9NG1ibkgun+W+I9+ETW13U2juydwXkKP6CNaccE7
         2ubatLNZY9OiZS/uiWFGCltszRFE0qfrVtx9t+RdUyaeUKny+ETTNkjlzlBKjdGV5Ps+
         OtZI2/oK3d5/+Dx7Ptdw2Uj4y1QvK6Nyy6K8jlkdUxxCsxlTUyc7cOmxOzdtzafk3fUs
         rzOt6SNbm0SYqDNG0V7Kzcs/UaXuuMQfmk9TDaBkodkpUpYuwNlpPpFVdj7ZYd0twO/M
         /RoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZX+m9eRP3G6qa3o26UuCwjfzdvb0rxacvbcUwg9LjVM=;
        b=CWTC3sO4+ohJ9cYVwGghvSoiM26i6EfhsS6HgDrcNyWAEk9fO0EpW+UpAwoulnXy4n
         +hgSsAjzzxLPNSHFrYfFcwtBdkdR/w0K6fCX1VCHUg12kozu66cK8FpQLBzEdesvYN1n
         w7FkN3h2X6zjbWGOKA/6/2YE9BLiISNgWF7zpeM/qzxBGaiBnrYWRDOYbUVTrGZXeKnj
         lxVASegZy6StrV2WDi5WFgIF2Pd0kcUcd1bBagM6ZlAV1nYW5hHA1eAmRtwcpv6jEYJT
         03tBOKRZlSY1MTNPEQQQ4N5erdUU/L6TSYlTr7yaUkc9WblKB7GMu/BU2iLazfMMHEB+
         JpKQ==
X-Gm-Message-State: AOAM532RwE1FrDXXAD5Pi/gkHe72u7CYWprlGGcEKPelcVt+Uf0WZDgB
	MITHqHmseg3xZFF3P+grSEA15w==
X-Google-Smtp-Source: ABdhPJw6Q5uDW7bfECCayVdeOzj/tVZOc9GBRSpmdGpoot4fKLzdcuBHluJ/v6BPqVrCAASIM86lFw==
X-Received: by 2002:a05:600c:3b28:: with SMTP id m40mr47730200wms.100.1639498603551;
        Tue, 14 Dec 2021 08:16:43 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a9sm295116wrt.66.2021.12.14.08.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 08:16:43 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v4 02/18] staging: media: zoran: use module_pci_driver
Date: Tue, 14 Dec 2021 16:16:20 +0000
Message-Id: <20211214161636.1886900-3-clabbe@baylibre.com>
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

Simplify code by using module_pci_driver()

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 3bc0e64f1007..f1465fbf98af 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -1314,23 +1314,4 @@ static struct pci_driver zoran_driver = {
 	.remove = zoran_remove,
 };
 
-static int __init zoran_init(void)
-{
-	int res;
-
-	res = pci_register_driver(&zoran_driver);
-	if (res) {
-		pr_err("Unable to register ZR36057 driver\n");
-		return res;
-	}
-
-	return 0;
-}
-
-static void __exit zoran_exit(void)
-{
-	pci_unregister_driver(&zoran_driver);
-}
-
-module_init(zoran_init);
-module_exit(zoran_exit);
+module_pci_driver(zoran_driver);
-- 
2.32.0

