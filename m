Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5740C13AD1
	for <linux-staging@lists.linux.dev>; Tue, 18 Jul 2023 17:17:03 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fbc0609cd6so55686345e9.1
        for <linux-staging@lists.linux.dev>; Tue, 18 Jul 2023 10:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689700621; x=1692292621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cRDtp/WtEw9mLKqbxe9I85x6ziwi94Y2+xfVDhxRx98=;
        b=l35yAg6rLbX9bryJRqrdHh0SNSnkU2HjdV1QnN9k+iR1MDEyIHRodrxwx6D5yMd0Ty
         2riv5zpKPGWr7im5tYE4xWkAUZZiXWQHS7is8BiV43wZSm0Imt2H7poEsA2tsmnHpiJc
         LCL26sp6cjENNQjqthxsMGkg0DHwmqvkrM93ExyinF4DJZvg+nZTZgJpFTLkVRKjS2Yq
         jArb202ZSfEuSvOELPqI70eb+5cZVFsVR1RsKihhpHFg8hNmaJbV1haGcWOINg1AmpUy
         3Mf0mT6/pJ0pcsI7HTn9SB3vivnqCMWFF/Z9jrUnNoKKWuunSfMtEsKn/8OirxPAVkcx
         8VEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689700621; x=1692292621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cRDtp/WtEw9mLKqbxe9I85x6ziwi94Y2+xfVDhxRx98=;
        b=Dp0uudIRuwZZp6CPoFG8r4dvDBO3RX8iqEzdWCSa3Mq/YzAAHuQe6qw/XjfKRn796J
         hm2azQPztW8Ybat5MwzitMM0J15d6cZRYqLSs3q1pNLsSBl/xG17+EkCnMLszNVaJ4kS
         x3d+NBdp83vHAOpcHZMgQ5Mimj5OT1thoh6RMXCy0YBqMu8ZuAwZqXy2AOFPFJ1e7HRe
         lfrWFSj6JEWCxyvvBglWxQvwBueS1ZApC90GOYSXNYjbBnGGCXyR2bptkBWuVA079qR9
         Tf+4XcFDEbv8UYj9p/mvjPl5MzAXbmpp9xw9c+jx9FUiNNTQef91L9ff+o/QcuCV6/ju
         6JAQ==
X-Gm-Message-State: ABy/qLbl1pL+dkq/l9qNfIbaW2iV9/WEgJZSx1XaI6tp2Eupdqbrwqlv
	zaNjiGFyg1V8/o27dKLbBwEoC9ADuIjzfg==
X-Google-Smtp-Source: APBJJlG6LoYeezjNXpGpd5uIC0J1poUg9o9vS0RrXRrX0PkrfaGrt01RZcKAMG5YfuJpc/XYYaB0ww==
X-Received: by 2002:a7b:c387:0:b0:3fb:c217:722e with SMTP id s7-20020a7bc387000000b003fbc217722emr21174wmj.33.1689700621245;
        Tue, 18 Jul 2023 10:17:01 -0700 (PDT)
Received: from localhost ([37.171.244.194])
        by smtp.gmail.com with ESMTPSA id y17-20020a1c4b11000000b003fb739d27aesm10877952wma.35.2023.07.18.10.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 10:17:00 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: fbtft: ili9341: use macro FBTFT_REGISTER_SPI_DRIVER
Date: Tue, 18 Jul 2023 19:20:24 +0200
Message-ID: <20230718172024.67488-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using FBTFT_REGISTER_DRIVER resolves to a NULL struct spi_device_id. This
ultimately causes a warning when the module probes. Fixes it.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---

Changes in v3:
	- added changelog

Changes in v2:
	- dropped MODULE_ALIAS changes
	- changed commit log for more accurate description

 drivers/staging/fbtft/fb_ili9341.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_ili9341.c b/drivers/staging/fbtft/fb_ili9341.c
index 9ccd0823c3ab..47e72b87d76d 100644
--- a/drivers/staging/fbtft/fb_ili9341.c
+++ b/drivers/staging/fbtft/fb_ili9341.c
@@ -145,7 +145,7 @@ static struct fbtft_display display = {
 	},
 };
 
-FBTFT_REGISTER_DRIVER(DRVNAME, "ilitek,ili9341", &display);
+FBTFT_REGISTER_SPI_DRIVER(DRVNAME, "ilitek", "ili9341", &display);
 
 MODULE_ALIAS("spi:" DRVNAME);
 MODULE_ALIAS("platform:" DRVNAME);
-- 
2.41.0

