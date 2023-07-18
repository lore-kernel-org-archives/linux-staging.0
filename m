Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34AF10EA
	for <linux-staging@lists.linux.dev>; Tue, 18 Jul 2023 08:11:19 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4fb96e2b573so8815585e87.3
        for <linux-staging@lists.linux.dev>; Tue, 18 Jul 2023 01:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689667878; x=1692259878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HpSa3JuGu2F5rDkHmeBs8MJOc0K66x3Zvji8Ik/U/dU=;
        b=luKqgmR6miKDMTlzg9Q2mfg05kLQVXqLLBIjOFAOZiqm/QFsGNS7EihK1lq6wdpGWK
         rN8dc7CyYvzwroWLp6nOzy68lFyoRSWA+IALFI/K0LTISsud6I4u5w4O4l6rPiIMxX4g
         ytol2K7xSb2FpFwt0fiariP4YYLdGarplXSD4pYyoirOO8FpxNzn6WfHJm9iTdQvHZXC
         ri0Qbm4chtUws3WnZzaacn0akPcMS6RW8JHvzq8ccsntzStBwGiH4/bsgvPhxiPQAc3f
         GJh4ipwqlcsVErqM1phGfJd1o7dOQdQJOz+iSYmmfCh6VYaUPZcOEF95E8+h/OMlU369
         wCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689667878; x=1692259878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpSa3JuGu2F5rDkHmeBs8MJOc0K66x3Zvji8Ik/U/dU=;
        b=WJJX1S5TIVOmpIf0PAmAUKM6aE+WUQi1zfcQd0cqFbiqRnk9LvDNVLiWVBzRhmoSeY
         riRXUwp0JyjRFC8ftisQ0Uqy+bAnizq5Zo4+NCF2SB/NVkes6t8xTQ0knADvboCtnmdB
         w09YKPS3ajgesKcgLgev18WhfyzS7oGHi+9iErKqZAfPBtMqqDVUN4GQIeYR+C+4Ljxg
         MHGLTVLsi2id7mtWyNX7LK79pb1AC45BZf7Sg3mW1Y/CGnFcetuUz0XOLWlQteAVUXE1
         t1CPGGBJhM44E+WNF73t90Q3vssiwr4iMC3DYGAPmH1vdQAUjkqzh/VPBbNfpSRmHInF
         TVVQ==
X-Gm-Message-State: ABy/qLa3CbMTGZYwszWdQBV3tw+7UBhmH6DgXLCDZQA8NtcLyT+mBA8y
	KbyVVw5VWBs5ZHCKwYSEe2jxEdRTZBE=
X-Google-Smtp-Source: APBJJlHwD5T0hI02QFCRKs9CDtc0FTWE17lYnAwkmOzKvsDjYMJ9puMNcByCKr+Z7+Gf22wp4xWuzA==
X-Received: by 2002:a05:6512:3694:b0:4fb:8dcc:59e5 with SMTP id d20-20020a056512369400b004fb8dcc59e5mr1001179lfs.39.1689667877381;
        Tue, 18 Jul 2023 01:11:17 -0700 (PDT)
Received: from localhost ([37.174.75.194])
        by smtp.gmail.com with ESMTPSA id g15-20020adff40f000000b00316f9abf073sm1627560wro.82.2023.07.18.01.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 01:11:17 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: fbtft: ili9341: use macro FBTFT_REGISTER_SPI_DRIVER
Date: Tue, 18 Jul 2023 10:14:18 +0200
Message-ID: <20230718081418.28225-1-rgallaispou@gmail.com>
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

