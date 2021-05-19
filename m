Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734CC2FB6
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 15:13:16 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id m124so9656431pgm.13
        for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 08:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=itfac-mrt-ac-lk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=p1U+oAmLN15Il7adctUFj5XirLGOy/razNk7lJyJFbo=;
        b=n40THdRfAoBafaZbp00vGauvtDhhN41cyBhmX8LROnMMA2m4ryRmfFtwciXVPn2wEG
         JZMzcViWQpO/rxkeJqvd/yRjxqy+ERr9O/Rinc84y8DQ4yeX3Mpue3T2IiUJT4nyMEEX
         x859Z7VW1AeD8g+3niJPNx353nqxBt7Iv6z+dMhi5MxWU/eo3vrCswTLPh4/WqI0ju6F
         ISRZzhrXQaFwphhLhD0KkRg6gOIC62kqWBCQ+FVHCkYnN4x7vY/JzqNO3dn7sws50CGx
         wXbhgI/tNTxNoTTev1Eici2LlWqZP+c40KOH248Az9A46p1UmMtRbKdLHkvaU4CTBOcD
         nZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=p1U+oAmLN15Il7adctUFj5XirLGOy/razNk7lJyJFbo=;
        b=OkbIKjqzhDrZmeGDi0ddCU/k7NtmAPhAmK1REk0v32PgTSdCoHZtFiAnBXp781nu4i
         ixHyr2hJ9PjZP81HlieUBbBm92F4hKY7V6xUcbrABR/su+nKHpNvvDq7dxqu/nGPtyjc
         yFCGFQy5ad5UrbYskEGv9rBWhmN2oiJWO4NC6+WmowE0lSHuudpyCwPrePCU2Hh2FfUn
         6Gx0MIMR3JVA5feoRrTNj6dk2hBxYjOZt494mGT+ccSDtT0kOCuUAxEQ0U13baYA/X1D
         Z4oxgzRjnvD8E8E3GG2nibzRoB/crUTV5w/CVhHC7zn63EBKJG4nDWmxqbhxdh9/zsqy
         mH+Q==
X-Gm-Message-State: AOAM531e2q5Q2tGz2S0rt4prmFEigL21pKCyfBxX3tsRijU5U/obebpO
	VXC3NZwtDgKlq3QjaeUGHA8I
X-Google-Smtp-Source: ABdhPJy/Myxcy7bbgNjO9/KwP0pk3uC5ShQibLxNRwLOs5F4vzS/w4fcBWkjdNPZmN3wbPescTZr+g==
X-Received: by 2002:a65:6a44:: with SMTP id o4mr11269699pgu.145.1621437196050;
        Wed, 19 May 2021 08:13:16 -0700 (PDT)
Received: from localhost.localdomain ([2402:4000:11ca:dcec:9f88:85c9:3532:e27b])
        by smtp.gmail.com with ESMTPSA id n23sm2408025pff.93.2021.05.19.08.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 08:13:15 -0700 (PDT)
From: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
To: ash15.sulaiman@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: greybus: fix open parenthesis issue in gbphy.c
Date: Wed, 19 May 2021 20:42:58 +0530
Message-Id: <20210519151258.25845-1-asha.16@itfac.mrt.ac.lk>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This fix "Alignment should match open parenthesis" checkpatch
 error.

Signed-off-by: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
---
 drivers/staging/greybus/gbphy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index 9fc5c47be9bd..13d319860da5 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -27,7 +27,7 @@ struct gbphy_host {
 static DEFINE_IDA(gbphy_id);
 
 static ssize_t protocol_id_show(struct device *dev,
-				 struct device_attribute *attr, char *buf)
+				struct device_attribute *attr, char *buf)
 {
 	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
 
@@ -221,7 +221,7 @@ void gb_gbphy_deregister_driver(struct gbphy_driver *driver)
 EXPORT_SYMBOL_GPL(gb_gbphy_deregister_driver);
 
 static struct gbphy_device *gb_gbphy_create_dev(struct gb_bundle *bundle,
-				struct greybus_descriptor_cport *cport_desc)
+						struct greybus_descriptor_cport *cport_desc)
 {
 	struct gbphy_device *gbphy_dev;
 	int retval;
-- 
2.17.1

