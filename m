Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80E815A2
	for <linux-staging@lists.linux.dev>; Sun,  2 Jul 2023 08:00:05 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fbc587febfso24414135e9.2
        for <linux-staging@lists.linux.dev>; Sun, 02 Jul 2023 01:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688284804; x=1690876804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sAUhZCQsdk87kgdWEBUppph6/yxmaqqjG5LD2yozjmE=;
        b=LBRWF0qTQR1vdSojoeWP1/KHAKjxNGrEGOta35tbFekBwztv59f6JpjhB+swxUm03M
         uHYwSjcfeVZtjnG6peUR4eiZyK7foW8X8L2CF2rXFWKMoVjI120mABOGo2+Mi+zAMOqh
         ibiYMjp6XuoG02OvryQ8zxR5J/2+vvCATS69eOt3IQ2bQuNn4Y0PsfHoOUXiD9t3Q8u3
         8CTAQuItiUyFQVWHmevHWJ3bnWdgig+MdazSHOc3Vriu24pE+6Wj2ZX82nkOR6anjNGX
         Ng/aO+61ZqZby1IcBbTTHSPHEcQR382kW760yL9mqRuieCpmpWebiymU9urthu4IHxQh
         eoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688284804; x=1690876804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAUhZCQsdk87kgdWEBUppph6/yxmaqqjG5LD2yozjmE=;
        b=VRk45HFr8x54svVSYxxUcu/lH6C8tH1VhaOI3eVrQejH/sPUBohkV2e1UpEhPm2TsE
         83uLT/KhiaEBEgZvJA9KpdhgfDs/54/ar77x1/xKk19mcpPsEE2yLHtJP8RfL7SUvDw4
         MXBa77320xa/xPpkLSfKF2bR69Y+X7jHbY38bY7OH1ZAlDgPwgPVzfe3RaWJqfxJ5RE6
         nFeTljilzhhmEeiHrzDGxlZJUKit6TnAZ7XI/9+9tzlUPvgFZnVj+SadulJl+nMq/9i3
         /Pxi0QdZc/f2sII2LV4GoSDu5SI8+IoLYnQhrIhCSVZPol6yPNCJmJV3gwq4iRLQFAi6
         V93Q==
X-Gm-Message-State: AC+VfDxs5xo1alS2QWsXK3a8kCF9x2HbBLuPSZJyczrIev7P6jh2x0l9
	qIX3WpcCTRHjvBzcY08007g=
X-Google-Smtp-Source: ACHHUZ51p/7W85vZ05OKRDLNDDfo8EshPrLib7+JwjGfEjbu9EJG3gx3IjKjhfuy4GzOOT5vGJX+lQ==
X-Received: by 2002:a1c:750a:0:b0:3f5:878:c0c2 with SMTP id o10-20020a1c750a000000b003f50878c0c2mr4895518wmc.3.1688284803762;
        Sun, 02 Jul 2023 01:00:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:32f:1f0:ae0b:3bc8:c743:b2d8])
        by smtp.gmail.com with ESMTPSA id cx16-20020a056000093000b00301a351a8d6sm22710943wrb.84.2023.07.02.01.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 01:00:03 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: ili9341: use macro FBTFT_REGISTER_SPI_DRIVER
Date: Sun,  2 Jul 2023 10:03:24 +0200
Message-ID: <20230702080324.120137-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using FBTFT_REGISTER_DRIVER resolves to a NULL struct spi_device_id. This
ultimately causes the module to an early exit at probe time.
In addition the MODULE_ALIASes can be dropped.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/staging/fbtft/fb_ili9341.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ili9341.c b/drivers/staging/fbtft/fb_ili9341.c
index 9ccd0823c3ab..9528bf3cf711 100644
--- a/drivers/staging/fbtft/fb_ili9341.c
+++ b/drivers/staging/fbtft/fb_ili9341.c
@@ -145,12 +145,7 @@ static struct fbtft_display display = {
 	},
 };
 
-FBTFT_REGISTER_DRIVER(DRVNAME, "ilitek,ili9341", &display);
-
-MODULE_ALIAS("spi:" DRVNAME);
-MODULE_ALIAS("platform:" DRVNAME);
-MODULE_ALIAS("spi:ili9341");
-MODULE_ALIAS("platform:ili9341");
+FBTFT_REGISTER_SPI_DRIVER(DRVNAME, "ilitek", "ili9341", &display);
 
 MODULE_DESCRIPTION("FB driver for the ILI9341 LCD display controller");
 MODULE_AUTHOR("Christian Vogelgsang");
-- 
2.41.0

