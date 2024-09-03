Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E711C7687
	for <linux-staging@lists.linux.dev>; Tue,  3 Sep 2024 11:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725364180; cv=none; b=twOsMXLqA1VD2/DfxC38SVSYxLdjd2N+u56jw0rM+aQLPoQXuQGRfGwlNtHJoZ+KdrZCgBHEe6tzhQobdcic5pD6CSABYgQlhxITck4wEzKrrZltp2ODO06ExKMWWFX6+QMxYCYL8MrCAyWo924D7sJ5VXsWICTTyyV/s26bB/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725364180; c=relaxed/simple;
	bh=hg2nMzLMkXMJQSnFT++plnotGh0SMsPXzQ8K0k1UGHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V+VmE4ZW79d8ZhMqLqvrvl/UlkOtP9xvFfn10yMuopO6lVgPWuR83TDzMlnubVsXzIc2XMggIqMXqZznGZ+mWeUHc7T7a6iMFI2GckjB6LyJE3g3KXiHF4ztL3wijnFDurzuQxkuLUP+Hb1jNyN0DquDwE4CUN0l2nLgxGrW0P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BO4+8E3G; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BO4+8E3G"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2da55ea8163so641155a91.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Sep 2024 04:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725364178; x=1725968978; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U6C7QkWlVDKnT2CWXcrqEZKngVRL71CQp2rLjnAagZU=;
        b=BO4+8E3G4xYCekRx7ZIWsFsGKk43oS7KqIoBFEM4UlqHZ+w/VUC4kxidhnguRdJFmE
         CyDHFlGNkcMvHXJI8QeUGTJyQwnlQ1UwqB0/rnz0r0gkj8jhbckahlxMhzCOuHcm/5Ai
         4VweuxIsucBDufWEcrjlOCOGcaJKw1CdQiIPdmJFfYJ20sZY3KisNFsjjt9P/oEYYT/L
         3SKaFd/NP3G+7tWxIiuBaRlM1uC462It1AAApsYoPF08/2z4WSsAlSaPelUbtX3xyFz5
         1eH97nqgueH3sA02M3weV0yGpCi/mu192bxUZ5XewqV1dZcHusr/mnSjhaABDesEGCaY
         UY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725364178; x=1725968978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6C7QkWlVDKnT2CWXcrqEZKngVRL71CQp2rLjnAagZU=;
        b=YTzLx0BaNFA/IbKqdSHnCsMDdrYZjgHQPtu1ZI/GRf7JGMAl3LNns3JG00O/o3XXur
         BPZW9tkFsvPwQd58wfk3m1ZxDlouubUu/Yd5xU6e+YelU6Az2MP08B8Qjg2cyjIyOk+W
         2RgdxITwNVLdNf4ibU0Gh7zol+XcNmwRaRlSqG9etj0KDjuvwOxk8nOuVZtTxK5h8OIs
         khPlGy2i3fQjR6GAXK79C/gCFbR9xvI3d/iFcWICXTviuQp9wC2pb9XQn/zkkruNPhYg
         /siztC+uPGSAryGh8zgcMlKbji7RaYr9AS8rG05S0VpbhD0EkRjyoeAf0xcj58pn/f+Q
         mmwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk7r7QMZbfTu+XUp43tf5aie7AOIYeF4ojCK8jSCUc4eiWTptNeMnIal78TS0LOe6sXpNjIQrvcbBIjkMa@lists.linux.dev
X-Gm-Message-State: AOJu0YxJPss2GFScSrYU8gM5gsYszaVPslcDIqhTZZO4mgTDQnnU3ksR
	EIn3X5D6RVYdyxFtesMaNUhV1/XsqvXtkvBGXLFzw91BBlinWWex
X-Google-Smtp-Source: AGHT+IFNV3FArPUfswa8M56Sn3485ijYAdQYs9HZbjTrSUzH+sRJtgY65inZ+m7W2suJ2zZ1NYY5Ag==
X-Received: by 2002:a17:90a:ce8f:b0:2d1:ca16:554d with SMTP id 98e67ed59e1d1-2d893284d70mr8485199a91.4.1725364178208;
        Tue, 03 Sep 2024 04:49:38 -0700 (PDT)
Received: from fedora.. ([106.219.162.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85afb2d88sm11108780a91.0.2024.09.03.04.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 04:49:37 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH v2] staging: vme_user: changed geoid data type from int to u32
Date: Tue,  3 Sep 2024 17:18:51 +0530
Message-ID: <20240903114849.4953-3-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Geoid is a module parameter which is set by root user.
Its valid values are between 0 and VME_MAX_SLOTS. So, changing data type
of geoid from int to u32 since it will always be positive.

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
v1 -> v2: changed data type of geoid to u32 and removed negative geoid check 

 drivers/staging/vme_user/vme_fake.c   | 6 +++---
 drivers/staging/vme_user/vme_tsi148.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index c4fb2b65154c..4a59c9069605 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -79,7 +79,7 @@ struct fake_driver {
 };
 
 /* Module parameter */
-static int geoid;
+static u32 geoid;
 
 static const char driver_name[] = "vme_fake";
 
@@ -1059,7 +1059,7 @@ static int __init fake_init(void)
 	struct vme_slave_resource *slave_image;
 	struct vme_lm_resource *lm;
 
-	if (geoid < 0 || geoid >= VME_MAX_SLOTS) {
+	if (geoid >= VME_MAX_SLOTS) {
 		pr_err("VME geographical address must be between 0 and %d (exclusive), but got %d\n",
 			VME_MAX_SLOTS, geoid);
 		return -EINVAL;
@@ -1289,7 +1289,7 @@ static void __exit fake_exit(void)
 }
 
 MODULE_PARM_DESC(geoid, "Set geographical addressing");
-module_param(geoid, int, 0);
+module_param(geoid, uint, 0);
 
 MODULE_DESCRIPTION("Fake VME bridge driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index 6b6ad781b966..31a44025e08f 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -36,7 +36,7 @@ static void tsi148_remove(struct pci_dev *);
 
 /* Module parameter */
 static bool err_chk;
-static int geoid;
+static u32 geoid;
 
 static const char driver_name[] = "vme_tsi148";
 
@@ -2252,7 +2252,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct vme_dma_resource *dma_ctrlr;
 	struct vme_lm_resource *lm;
 
-	if (geoid < 0 || geoid >= VME_MAX_SLOTS) {
+	if (geoid >= VME_MAX_SLOTS) {
 		dev_err(&pdev->dev, "VME geographical address must be between 0 and %d (exclusive), but got %d\n",
 			VME_MAX_SLOTS, geoid);
 		return -EINVAL;
@@ -2631,7 +2631,7 @@ MODULE_PARM_DESC(err_chk, "Check for VME errors on reads and writes");
 module_param(err_chk, bool, 0);
 
 MODULE_PARM_DESC(geoid, "Override geographical addressing");
-module_param(geoid, int, 0);
+module_param(geoid, uint, 0);
 
 MODULE_DESCRIPTION("VME driver for the Tundra Tempe VME bridge");
 MODULE_LICENSE("GPL");
-- 
2.46.0

