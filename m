Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB7818FC85
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 14:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683499; cv=none; b=sdWeKIQMJWe7SAEkCOu3QChrKRIs41vJiU8GYlIr5rKnKQ7iGTrkerUqSlu0tv21c2mH+HCE4HTMuZKUdY64hXkyOtJpL88NkZYHjV3mZMcGaQJwH1DQ6oH0syURSRpIy+4REmNhiv76Qcz+LSZjDYNMhuyE7SPAyMUqbaNj3VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683499; c=relaxed/simple;
	bh=5atMg448e2EGeYdg2+Te67O/wq4PwN7quv95XWt3Jfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n5p9uD+0DMJtSatJ7Bf0XcAPspjFBNfpTozEfObS5fJzC5MKxX9nCxE46P0YUBRZTdE3BOs6dvnvKa4hfbcf3d3olt8zYqE83pcH7L9V+xdcvjU2Yck4zQKmasaOxP/LFz3slM+Ae5Knev/N5Wske+6ygqSSkPDDgPqiTESFtPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fC9YtRvV; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fC9YtRvV"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20202df1c2fso34754445ad.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 07:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724683497; x=1725288297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5yUACQCvV96K8SrB4TqRyd+0MwkmzrdW10K/Vq/2NiM=;
        b=fC9YtRvVLt4r8VltlsG4FRemM3kQarSl170MuAR5L1Cs2n2DyxOS41iuI0/YZKBQji
         OwV1cLrHEKF47AJFr9OgEfQleduLn7GGYFbpHopfgru9BGNVIaEsYj/IxqXbVj9Ca2bj
         q65fTbpndtLsRqPHCWSO3w8oW/CujH3ovHK/dePLnOxA492U9+Y6pKB4+mnipD0AKve7
         6oQLhPk0udK9r3CveYm0PrJbQ0ocBAtiu34GUaS7NMlXaW75KNs/QV/B/y91hqeODGy6
         vQ/MxU+RsnccdT6RswgS9VmnGnrg9uXVoHEoWEk2v4DrQBNxuT4ifDyxTPdzys+QeUgg
         6+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724683497; x=1725288297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5yUACQCvV96K8SrB4TqRyd+0MwkmzrdW10K/Vq/2NiM=;
        b=RhlkkzCeCNU6eaOFIUxSDbSAF63v26MwYJBAhpl6KNDtF62lEWUQeHTTanu+C5LtAN
         +xPCAgyFfga20Qp32BY95aWbvIPBekv6/h4VZS1pbl1REGANySqrUP4ICA2eer8OQkOr
         IO301S5tRkcywqosOATH8gOB6+eBzcZYI2OkhtfXf7o19xE99oFeCfMZyI5cp4OA/jEE
         MxLS4tYLrq78MsFiBdIrtXgo3XSyh0KTB4xB4ojQYsjufsWr+JchZrMPr+5MMDxe8Ooh
         ys8YOCk37sFi78/O1jMYIqx3UaYtqn6GXQ7gSu0eiHvjBOAFWinxDb6nX1Pb5iO1ePM3
         j4NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVoFpbmBf0G9l7VvlWwapiyOGRxjIFcXH6VeRb1dpNELQDFYrVB7v3jvwcRAu6Yptyq5bttthuS+VUKfr+@lists.linux.dev
X-Gm-Message-State: AOJu0YzJHZ0iZmmfmJ843gce9zx0hJYCLhgdpchcmvFGNyp9VEvshQbV
	jLRIGI/rPl/X/YTSioSHY2unpNIhAEvREckigRdvjttN+ox286qO
X-Google-Smtp-Source: AGHT+IED3w24Otal8KliDAIHPfYfSjFwab0AXqK51rsAXHujqmca71cIDpP7dNu8Z5W1U7N+2pR9Uw==
X-Received: by 2002:a17:903:2343:b0:1fd:8f4d:2392 with SMTP id d9443c01a7336-2037ee063b5mr220812825ad.1.1724683497039;
        Mon, 26 Aug 2024 07:44:57 -0700 (PDT)
Received: from fedora.. ([122.180.189.45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855dc28bsm68385415ad.133.2024.08.26.07.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 07:44:56 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] staging: vme_user: Remove unnecessary type casting and data type of geoid to u32
Date: Mon, 26 Aug 2024 20:14:30 +0530
Message-ID: <20240826144430.50488-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed unncessesary typecasting to int.
Changed geoid data type to u32 because it will always going to be positive.

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c   | 4 ++--
 drivers/staging/vme_user/vme_tsi148.c | 6 +++---
 drivers/staging/vme_user/vme_user.c   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 7f84d1c86f29..8d4129c11e73 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -79,7 +79,7 @@ struct fake_driver {
 };
 
 /* Module parameter */
-static int geoid;
+static u32 geoid;
 
 static const char driver_name[] = "vme_fake";
 
@@ -1283,7 +1283,7 @@ static void __exit fake_exit(void)
 }
 
 MODULE_PARM_DESC(geoid, "Set geographical addressing");
-module_param(geoid, int, 0);
+module_param(geoid, uint, 0);
 
 MODULE_DESCRIPTION("Fake VME bridge driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index d81be8e4ceba..231eb17b6aa1 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -36,7 +36,7 @@ static void tsi148_remove(struct pci_dev *);
 
 /* Module parameter */
 static bool err_chk;
-static int geoid;
+static u32 geoid;
 
 static const char driver_name[] = "vme_tsi148";
 
@@ -2123,7 +2123,7 @@ static int tsi148_slot_get(struct vme_bridge *tsi148_bridge)
 		slot = geoid;
 	}
 
-	return (int)slot;
+	return slot;
 }
 
 static void *tsi148_alloc_consistent(struct device *parent, size_t size,
@@ -2625,7 +2625,7 @@ MODULE_PARM_DESC(err_chk, "Check for VME errors on reads and writes");
 module_param(err_chk, bool, 0);
 
 MODULE_PARM_DESC(geoid, "Override geographical addressing");
-module_param(geoid, int, 0);
+module_param(geoid, uint, 0);
 
 MODULE_DESCRIPTION("VME driver for the Tundra Tempe VME bridge");
 MODULE_LICENSE("GPL");
diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
index 5829a4141561..fe261eef9153 100644
--- a/drivers/staging/vme_user/vme_user.c
+++ b/drivers/staging/vme_user/vme_user.c
@@ -130,7 +130,7 @@ static ssize_t resource_to_user(int minor, char __user *buf, size_t count,
 	copied = vme_master_read(image[minor].resource, image[minor].kern_buf,
 				 count, *ppos);
 	if (copied < 0)
-		return (int)copied;
+		return copied;
 
 	if (copy_to_user(buf, image[minor].kern_buf, (unsigned long)copied))
 		return -EFAULT;
-- 
2.46.0

