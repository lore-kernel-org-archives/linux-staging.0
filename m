Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92902CAF
	for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 19:34:28 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id b82-20020a1c8055000000b0032ccc728d63so343286wmd.1
        for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 12:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CZZLzZT+BfXZxuiWnfdsUBig8FB5HFw4bFDfrJMVxBE=;
        b=rRr21svHPiBAMdumbdWFs9HRYbo1FEhV1gCA5PYy/5gKiUF/dLd2saj0FlQdCPsveV
         MDOzEqZJi5AqzbRQRtW0a6WaB37F0q+jLEDpVSc7RKnxCGiLONc4C4UaRbyBWgDbEnwa
         KI981m1SmHoqf0W8yVQUf78VzVAc9MYa+/x9rnk0X30gAj8Hr5qnyF/iMarwawInow2e
         caYiaGXBMVUPurNvAY30SYLcg/IW6SMK5uIf7J+KnR/GCaS9VEyg9RXeQLk31k3AZQot
         VY2VuoDGfOLaW2KnRzF/5DzWNQHmojB6vmZBKd4b5PyImIDVywj/3gqS5KDUlTyO8+16
         IeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CZZLzZT+BfXZxuiWnfdsUBig8FB5HFw4bFDfrJMVxBE=;
        b=CEgArW46nigdyjBTuSSBr+/Lt5WUVkBA9sG2/slOWjOuY4g0YGtOIFgBTy8SOKRLJv
         F4dRvWHa2EoTbt0hisVVeQ5mH0KT7fiDAHOGBEHk/80In/79/T7DswwxTCnWVuWClooW
         hVBOcTt0ojZtyoaG3Mw0uyBW2trbqoj2HuFjqoMJNK7547xiXW6ZulGR9S5xzGOVxFTz
         sboLgiupG+GsaLZEFeWSFqtKzt1bz0Udg+EANc8fwqQ9T+vcjZcd5jZnwWAa9WSlVvfl
         Z9ar2xzMvltAgVw3ZZvGOW5asdjZuczmFI7g29EOWajLOqPXj4D6/oeuLa8lTYfJvnFL
         iArw==
X-Gm-Message-State: AOAM530w7YNZ1pl+Rl/z7EcR2PWWK2Q0UisGhseGS4B5NQUCMFbQlDit
	yxOypPL5y9OImW4HcDv8xPM3MHw6EY3V3w==
X-Google-Smtp-Source: ABdhPJwR28XnboVDVbzayuMMW8KqBjRDLTstmZAW2sJePVpmjZ8z0qbOJsjxcheRlJC9GkcnwkYVdg==
X-Received: by 2002:a1c:9d0d:: with SMTP id g13mr713096wme.39.1635276867093;
        Tue, 26 Oct 2021 12:34:27 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id s18sm17676123wrb.95.2021.10.26.12.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 12:34:26 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 09/14] staging: media: zoran: move config select on primary kconfig
Date: Tue, 26 Oct 2021 19:34:11 +0000
Message-Id: <20211026193416.1176797-10-clabbe@baylibre.com>
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

Since all kconfigs for card selection are bool, this causes all selected modules
to be always built-in.
Prevent this by moving selects to the main tristate kconfig.

By doing this, remove also all "if MEDIA_SUBDRV_AUTOSELECT" which are
wrong, since zoran always need them to work.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/Kconfig | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/zoran/Kconfig b/drivers/staging/media/zoran/Kconfig
index 4067fa93d44d..faef008b8554 100644
--- a/drivers/staging/media/zoran/Kconfig
+++ b/drivers/staging/media/zoran/Kconfig
@@ -4,6 +4,16 @@ config VIDEO_ZORAN
 	depends on !ALPHA
 	depends on DEBUG_FS
 	select VIDEOBUF2_DMA_CONTIG
+	select VIDEO_ADV7170 if VIDEO_ZORAN_LML33R10
+	select VIDEO_ADV7175 if VIDEO_ZORAN_DC10 || VIDEO_ZORAN_DC30
+	select VIDEO_BT819 if VIDEO_ZORAN_LML33
+	select VIDEO_BT856 if VIDEO_ZORAN_LML33 || VIDEO_ZORAN_AVS6EYES
+	select VIDEO_BT866 if VIDEO_ZORAN_AVS6EYES
+	select VIDEO_KS0127 if VIDEO_ZORAN_AVS6EYES
+	select VIDEO_SAA711X if VIDEO_ZORAN_BUZ || VIDEO_ZORAN_LML33R10
+	select VIDEO_SAA7110 if VIDEO_ZORAN_DC10
+	select VIDEO_SAA7185 if VIDEO_ZORAN_BUZ
+	select VIDEO_VPX3220 if VIDEO_ZORAN_DC30
 	help
 	  Say Y for support for MJPEG capture cards based on the Zoran
 	  36057/36067 PCI controller chipset. This includes the Iomega
@@ -17,8 +27,6 @@ config VIDEO_ZORAN
 config VIDEO_ZORAN_DC30
 	bool "Pinnacle/Miro DC30(+) support"
 	depends on VIDEO_ZORAN
-	select VIDEO_ADV7175 if MEDIA_SUBDRV_AUTOSELECT
-	select VIDEO_VPX3220 if MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Support for the Pinnacle/Miro DC30(+) MJPEG capture/playback
 	  card. This also supports really old DC10 cards based on the
@@ -35,16 +43,12 @@ config VIDEO_ZORAN_ZR36060
 config VIDEO_ZORAN_BUZ
 	bool "Iomega Buz support"
 	depends on VIDEO_ZORAN_ZR36060
-	select VIDEO_SAA711X if MEDIA_SUBDRV_AUTOSELECT
-	select VIDEO_SAA7185 if MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Support for the Iomega Buz MJPEG capture/playback card.
 
 config VIDEO_ZORAN_DC10
 	bool "Pinnacle/Miro DC10(+) support"
 	depends on VIDEO_ZORAN_ZR36060
-	select VIDEO_SAA7110 if MEDIA_SUBDRV_AUTOSELECT
-	select VIDEO_ADV7175 if MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Support for the Pinnacle/Miro DC10(+) MJPEG capture/playback
 	  card.
@@ -52,8 +56,6 @@ config VIDEO_ZORAN_DC10
 config VIDEO_ZORAN_LML33
 	bool "Linux Media Labs LML33 support"
 	depends on VIDEO_ZORAN_ZR36060
-	select VIDEO_BT819 if MEDIA_SUBDRV_AUTOSELECT
-	select VIDEO_BT856 if MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Support for the Linux Media Labs LML33 MJPEG capture/playback
 	  card.
@@ -61,8 +63,6 @@ config VIDEO_ZORAN_LML33
 config VIDEO_ZORAN_LML33R10
 	bool "Linux Media Labs LML33R10 support"
 	depends on VIDEO_ZORAN_ZR36060
-	select VIDEO_SAA711X if MEDIA_SUBDRV_AUTOSELECT
-	select VIDEO_ADV7170 if MEDIA_SUBDRV_AUTOSELECT
 	help
 	  support for the Linux Media Labs LML33R10 MJPEG capture/playback
 	  card.
@@ -70,8 +70,5 @@ config VIDEO_ZORAN_LML33R10
 config VIDEO_ZORAN_AVS6EYES
 	bool "AverMedia 6 Eyes support"
 	depends on VIDEO_ZORAN_ZR36060
-	select VIDEO_BT856 if MEDIA_SUBDRV_AUTOSELECT
-	select VIDEO_BT866 if MEDIA_SUBDRV_AUTOSELECT
-	select VIDEO_KS0127 if MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Support for the AverMedia 6 Eyes video surveillance card.
-- 
2.32.0

