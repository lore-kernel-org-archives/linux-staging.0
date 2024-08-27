Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC6A6EB64
	for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 05:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724738169; cv=none; b=Nhu/jRhVvJyFQyQ1uW5M+bGNvPPRl6Kxcigzf4c1U+Q6sHx5O41o80TS1n2BewWhljtpF8S6qhLc7t2+q4RPp8qemV+F9Z1p3oSvohW94pFw/954rAy8yEAGtpXzEQ64GS1oImydl1oaCqC1uR+PeQiwdUFRjJnbpTWerwKexyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724738169; c=relaxed/simple;
	bh=IUj7d6MyyD/+ZasNZAvTYpfp+WFcWVsB4JMhTzqxF44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BYQnQWe08SfGWO7NJ+KlGN/WWFZ2LkagloVq1WnwJi8FKg6G3U260mVc2aIG3RmBaLHX175EaVJ+LDJ5DY058kHTsEPh14engXAsMy7TreTYWbsi+49eX2X2uypOb0RFfV6Ty3g1uWenDL2Ef9++eeC8IVsk2vrpNz+A4w3x3no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glAT5glw; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glAT5glw"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20223b5c1c0so45321145ad.2
        for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 22:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724738167; x=1725342967; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7++II4ZyoF0+E2oWFj7dUGQKtiYcKou/Mn0UWilD5ns=;
        b=glAT5glwf/qFwm+1eW9iLtw+Ry7WVGe9VvkiBDa737tSi3oNSDYFZi0ED1hlCiDMol
         AHHudGaejVPB84fbzbJOYmy28WbSgoFQlW93U8ELcUZkcVxd2l77+JW+gkdJHtq5buhb
         +PHXCbMxgwOZZEhARqL6VLYHnk3v7SuEeNdEo07QjuiHLR4r9+nInY4vf7gzqIOufBzV
         gx3ltSxpvEoeZAQ0T5WeIWZ4m6y6wttGqfjzJRjAcZ9GxHoV2jHeEfvFU0nopgk/d0eC
         +m3GRVe7HoLpsBvElRgKAagI6kpOICIDZeDO8EpZyCUCcDcIhonnPwNBXYEllfxqd8RI
         UqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724738167; x=1725342967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7++II4ZyoF0+E2oWFj7dUGQKtiYcKou/Mn0UWilD5ns=;
        b=F6aeuhqQszJoL9NCmxlJqqb0QNGi07vyJ9s0q3pVqpTGf9R96AYpQfhGg1KQTEq/Z6
         C8rmM9IOcpYLPLNHk/AJzOMYLkcKpy9UcJenz9q5as79yBUsS40MiTNJ5vbdj3TRgNEz
         SRqUllGD6zCi9ThB+9jpinKXrdxGVh7oxgRBZM56Nqg9DSQ4JjhYNSCJxu6rT8J5GtmV
         iFyEmyUbOy9QCf8dODZmbwqEKZqPn+xSKoEaSSbYbbOHMk4SryTaxQQZB+zSBlh6KVyy
         +lWIFzdCc9zXhmZ+phZY5vgdYqRsXfkW8hPUIBljb91V7ELeLIlvTIHiVvZkfjX1a2Aq
         4e0g==
X-Forwarded-Encrypted: i=1; AJvYcCV5UAw9oH1M3BmKd894mDc0L3/sn+fJxYXCnqaMDN4K5xrPdsCmGPdBUQSJxAX9kcexXswIPfYSmZEyuJaz@lists.linux.dev
X-Gm-Message-State: AOJu0YwvoCTb/QbIoXS0NRlUZlD8H609MWAR9WJ7mOppYmO2owfk1Fdl
	Co+rXz8959VFTHKknx3ujbaM2E4fSc6rEMhx9w2xlDuWsvm6BpSw
X-Google-Smtp-Source: AGHT+IHwuLhY17cw7YN/6XClW4UKLX2849F/+Oz7y17YUrzjBBEpJgiHuEVGpp6vXEMRtZiUjR+p6Q==
X-Received: by 2002:a17:90b:1182:b0:2d3:c664:e253 with SMTP id 98e67ed59e1d1-2d82580d12dmr1950655a91.10.1724738167168;
        Mon, 26 Aug 2024 22:56:07 -0700 (PDT)
Received: from fedora.. ([122.180.189.45])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d613b1ac7dsm10989313a91.47.2024.08.26.22.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:56:06 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] staging: vme_user: added bound check to geoid
Date: Tue, 27 Aug 2024 11:25:55 +0530
Message-ID: <20240827055555.65371-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added bound check for geoid in probe function because geoid will
always be positive and less than VME_MAX_SLOTS

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c   | 7 +++++++
 drivers/staging/vme_user/vme_tsi148.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 7f84d1c86f29..d93a5d428ab9 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1059,6 +1059,13 @@ static int __init fake_init(void)
 	struct vme_slave_resource *slave_image;
 	struct vme_lm_resource *lm;
 
+	/* If geoid provided, validate it is positive and less than VME_MAX_SLOTS */
+	if ((geoid) && (geoid < 0 || geoid >= VME_MAX_SLOTS)) {
+		pr_err("VME geographical address must be between 0 and %d (exclusive), but got %d\n",
+			VME_MAX_SLOTS, geoid);
+		return -EINVAL;
+	}
+
 	/* We need a fake parent device */
 	vme_root = root_device_register("vme");
 	if (IS_ERR(vme_root))
diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index d81be8e4ceba..97323b5563e8 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -2252,6 +2252,13 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct vme_dma_resource *dma_ctrlr;
 	struct vme_lm_resource *lm;
 
+	/* If geoid provided, validate it is positive and less than VME_MAX_SLOTS */
+	if ((geoid) && (geoid < 0 || geoid >= VME_MAX_SLOTS)) {
+		pr_err("VME geographical address must be between 0 and %d (exclusive), but got %d\n",
+			VME_MAX_SLOTS, geoid);
+		return -EINVAL;
+	}
+
 	/* If we want to support more than one of each bridge, we need to
 	 * dynamically generate this so we get one per device
 	 */
-- 
2.46.0

