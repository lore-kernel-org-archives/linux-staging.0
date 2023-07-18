Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A2010EA
	for <linux-staging@lists.linux.dev>; Tue, 18 Jul 2023 08:14:23 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fbf1b82de7so33821755e9.1
        for <linux-staging@lists.linux.dev>; Tue, 18 Jul 2023 01:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689668062; x=1692260062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/eySJfQ7/Gc/AEP/cNfIUTGk9yVoHTH7Q2UCStgdmPk=;
        b=XzGeZP2wfi7lajh/fHbLEBJLGoAEiqq93llvJZk83NQLWkpkhmJAPN4y6D1tu3zrxn
         RFIt3dvm5FsiQrDmGigRFSxtj/klhPmQ86sy5b/xMdTu5m66zEilWY9Hjajhx+6OkUPY
         iqX2cNwwDpxwU/8UNAHY4k4e/nCqWiQ//ioPJ8/0tLJkljRyQXzDVpx2og+MBslxVCk5
         siOxXQU1aBTN3mWlYuQVKiamtHU829DnwSBRpsp7B6oFee9zU2kQbuwoPaLNEir5oKOJ
         0VCPx9V1Bd8q3ZJ8+oVMKF1zmAzJ55XtzP1Br+PzvxynBNdBcv1YWWnONYKkFtTWrlCn
         dCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689668062; x=1692260062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/eySJfQ7/Gc/AEP/cNfIUTGk9yVoHTH7Q2UCStgdmPk=;
        b=NSri9+qFYPEmsnPfnGqaUJnG6Ky9YxW692SdsdLFtD2E23AFGICAQP4uXSjv+OJt/c
         ef5PZ7YgKl/YQufYk+r06ePdCw0DvtyWNc6r10+Pc4/oi019dWnjzTAE8SjLgdxm8xVE
         5QxF076VF2qWrSC8t8w0aXMyk00IA8GXvkFZynz613enEyEjiHUgttnWWR+yCvUgEuHG
         CxGxOJxf94xDJj92WKe8eUhsTowymhSXsCkWoA7ytLLNuhdd0PtY/Cz82+W61krg/EuR
         MRSoTWaKHGKppSY7zmp1dMHNnYjgBeDfsC0GnHgPq7dczdPySNXQtJ4aghD37n2r9tTQ
         TY2Q==
X-Gm-Message-State: ABy/qLbeqWylYXxXa9Xmkew659r8TULm3m8ftRe3TaYCN6rqjy3p6EMH
	9BHzwwtDH9a5qO7v2CgG3Lw=
X-Google-Smtp-Source: APBJJlFUcyYNxBMp/Ez4i7yBxOUkaSiUF+hhVo3KRjjCatmyU6lTEJosDE+EkEfmsxzp8bFfdalcVg==
X-Received: by 2002:a05:600c:2046:b0:3fa:8422:158d with SMTP id p6-20020a05600c204600b003fa8422158dmr1225340wmg.18.1689668061660;
        Tue, 18 Jul 2023 01:14:21 -0700 (PDT)
Received: from localhost ([37.174.75.194])
        by smtp.gmail.com with ESMTPSA id e16-20020adffc50000000b0031432c2fb95sm1626137wrs.88.2023.07.18.01.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 01:14:21 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2] staging: fbtft: ili9341: use macro FBTFT_REGISTER_SPI_DRIVER
Date: Tue, 18 Jul 2023 10:17:59 +0200
Message-ID: <20230718081759.28902-1-rgallaispou@gmail.com>
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

Changes in v2:
	- dropped MODULE_ALIAS changes
	- changed commit log for more accurate description

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

