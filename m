Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C360194C62
	for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 09:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724749820; cv=none; b=UTI5g7dryfW5AOXqEg+UfAvktDDGIVrtpFHR1QgGkcY+LAkUDktXAaPUy6O/2WGzKxCNJUxBooqXxQcMv7FQ3VhdpU0xAVmE9P2uqtC/a5cBdEReFs5B+/ZHAnBEoErQUY4oK860EF7VQwSL7JbIWwlv9usX3eHRnx/UUP12dzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724749820; c=relaxed/simple;
	bh=SjJOIJDonqyCbGBVsptkveUfW+eSL22SDCSdNNhBrzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dINvtX2XI3OYE4UEV1Z3WaXRO+cYiMenZ+Pc7oseoRxh5WCRdUhvcNmlMCZHKxHRvv5q0+hjG6sYGXLNS3ByZtBhuqH2OHnQq/d1XfgHoM/OUHK+YZlIi69AAkDpHz58IIP/Oz7NoBCJPURcVTdMmSuSao/3MiK4msn2YdTbUOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhFUQ6Lq; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhFUQ6Lq"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-715c160e231so607122b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 02:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724749818; x=1725354618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NpgI7qvi8/v8UE8AR/QkH1xctnOGEtIqR82DIL0PGgY=;
        b=GhFUQ6LqW5v74M4DSAnFKK/8XAwr0N4dVZ+pV8JeVTU0eSgHyBn/OjxvAMyo3huDMs
         JMRfT+OuA2vMXm5nl+tY/TiS4qIF/vVqFvFIgd9uWGJXD3890h75xdbpcVcxtXYjmqsI
         90HqxLJcLL32igdLJbSKBLSIiWZoisJKgggvcYs0FzjoLuZffoe+rDKHlBJRok5/ii5g
         JUCyqOD+KRcl63aM4/C/eTERyIc9tTL7WYCjLGeOPJfojkTs4mMcGkRVZtDFDDKjvTpv
         +W4BYARnemPyr82e3172kjTTaDQdz0aXCFUK0eleM5pxUR7F/tZvEq6d52A8JXWbXnTp
         hXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724749818; x=1725354618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NpgI7qvi8/v8UE8AR/QkH1xctnOGEtIqR82DIL0PGgY=;
        b=VRRVqOV27kKIhQTgwq4ro2zHO4New+yhvCmRlyJnUCXwA0/Oq32QqwdzlahWgMfJfV
         1gPuBmIigZvO2cXNHotkggMQ1rg1ZpPmbIVKhs97RhbbDf6p4yrxhjdHABaz8GiKT+uJ
         LUBilOkGAtN6c8hDSyQ9g2SnDR2Zo/M31LtZLpNQ/bhxk4t+dXbWUXt9L/4sPRpF9MSb
         WqTjXw6GVFbl/qQVSuV9oKAnoGbsWQmSwsA6WamxAk0XUF5cdSSjzkUbzg5GJE6gIeLz
         lwgJvVMbDQn8kaR7xTHcaCWktVK8vMILBNRfdf/kIaVsSuu49PAeFQmToh6yROzMq6EH
         e0Og==
X-Forwarded-Encrypted: i=1; AJvYcCXINACGD6C4hsmwSYtTklmIK+nvi7W5axSMBi4ERpQQEUZLL/4B/gPSZ9LqW/I23z3ugEJnXThgMP7F8WI4@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf3yrOt29h9fBq+qYNadud5A0AuXQkZX4OpTkdaV6ec85LXS+T
	FfeGwWKSbVW5wmnFvP2EydXi7Az+hRfRxdkJHLcsvvDaac4nszJ9f3f04zMSTMg=
X-Google-Smtp-Source: AGHT+IEp4F23A8FqnAiZiVhKzZdRj7Hw+WbU+hcF+rxcWDfP9CmhJ8mQv3vTlx26C7YOKtzlm4iQtA==
X-Received: by 2002:a05:6a20:c709:b0:1c6:fbc8:670d with SMTP id adf61e73a8af0-1cc89ee58f0mr14191085637.43.1724749818030;
        Tue, 27 Aug 2024 02:10:18 -0700 (PDT)
Received: from fedora.. ([122.180.189.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434333e61sm8195275b3a.192.2024.08.27.02.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 02:10:17 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] staging: vme_user: added bound check to geoid
Date: Tue, 27 Aug 2024 14:39:55 +0530
Message-ID: <20240827090955.49339-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added bound check for geoid in probe function because geoid will
always be positive and less than VME_MAX_SLOT

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c   | 7 +++++++
 drivers/staging/vme_user/vme_tsi148.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 7f84d1c86f29..d8f4ba29da0e 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1059,6 +1059,13 @@ static int __init fake_init(void)
 	struct vme_slave_resource *slave_image;
 	struct vme_lm_resource *lm;
 
+	/* If geoid provided, validate it is positive and less than VME_MAX_SLOTS */
+	if (geoid < 0 || geoid >= VME_MAX_SLOTS) {
+		pr_err("VME geographical address must be between 0 and %d (exclusive), but got %d\n",
+			VME_MAX_SLOTS, geoid);
+		return -EINVAL;
+	}
+
 	/* We need a fake parent device */
 	vme_root = root_device_register("vme");
 	if (IS_ERR(vme_root))
diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index d81be8e4ceba..9ec981cd2009 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -2252,6 +2252,13 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct vme_dma_resource *dma_ctrlr;
 	struct vme_lm_resource *lm;
 
+	/* If geoid provided, validate it is positive and less than VME_MAX_SLOTS */
+	if (geoid < 0 || geoid >= VME_MAX_SLOTS) {
+		dev_err(&pdev->dev, "VME geographical address must be between 0 and %d (exclusive), but got %d\n",
+			VME_MAX_SLOTS, geoid);
+		return -EINVAL;
+	}
+
 	/* If we want to support more than one of each bridge, we need to
 	 * dynamically generate this so we get one per device
 	 */
-- 
2.46.0

