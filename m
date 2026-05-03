Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FAE3594A
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 10:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777805148; cv=none; b=DwK4FOsZ3n7EYGKy0cJS4oLTY3S6nPG37s3oPJEQ2+GpGu6LPScpbN1CBl2MLhYJW6oopIAhYb6kygvvT2L8Ka72KYF5vuyVaf/X0xaoP2AlIXqTzswuPqUGG8i9TXv1BJ1hvnmiJc/4I/mdL0T7ABe1j7OoSHhPmiHCj7l09Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777805148; c=relaxed/simple;
	bh=3Gw5ztMRnekpJJ3bi/BLsPIk6CYgVif0Vdbb6jO8jmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fqgzhaq82JAWINq/DsZe/HOVAAKe8FRwvkJt8Y3UbpX2YRyB6EtXHwhkYhIwqBmH4yDxhRsdwZBjewV+zZh1VhXqQ3kUTlRHgjo144V3S2Ad9cXr1KWBUjzpWS1MpA6Q7HW7d6SmaPY5FEBb4P6os9H+jvM/8MDSr4OWZuh//hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZkk4M6A; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZkk4M6A"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-836ebdeb969so45134b3a.3
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 03:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777805145; x=1778409945; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A/HVCtDS4t0PzcvZs5I12kbBKR1Zgr/slYucxfNJFnk=;
        b=XZkk4M6A63RGg8SBJRA8K9KEH8JBYRy3Mz/yYO5h5lFl8sxNxmQAlTUYAEKZCwxzSV
         mZ33dM5MtV9Te/imeGNyjCooNGNlhoNrnbWryhMQG5a4aiFh7G1LbwyAjRlS5Qu6K5IR
         z1/HY+gIWZAcOabHNMaZ38km7PwphkDDkFpBBE81HL/UbBv2IAGpIecpo9icoVlViSPr
         Cv6axWG++fgs+4F8iCdgpHzdLkbkkx2O0R0aqs3M8Uwc5Up2ya/IqRyNiz73AvXmlN/4
         5LSO7TZWmgUywNs0WdRzohsTdjtGN6dzE7ArqMDPVm/Cpu0rf3PXOVtemYp4GhScAras
         lYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777805145; x=1778409945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/HVCtDS4t0PzcvZs5I12kbBKR1Zgr/slYucxfNJFnk=;
        b=Q4zDacQNcwMB5PO3MaHNpbKD/y5tmOP3+QWvKe3B7NkOguyGdVYhIJD8R5/FMzFrXv
         ksaZgkO7S+4XDR4X8cf2C1bZSUYXh5Rzf/+j87vWZDsdPyvx/nqJ6Tv5IBO/UUqzwzPP
         ty6T4DQoqrgZ18o9mT2SYS0prqzVuNCoQ1Pv1xImTUPewnein7eaHkO9rrpqbxZ/P1f1
         TuMQINICX+BLU/a0A/pEmzshlBL30KaKTDCZ5U5g+Sb+XyF0ChtYMJHhlTB1G1aRnOeS
         DLWhjP+V8rMEUpOI+r6eL8Z+synDjrJVbLbbOw0MxKw5BjiXdLBgEgsG0rgfQRIDzhgP
         lOPg==
X-Gm-Message-State: AOJu0Yw1YbLTw1aQdq7qCLZ0tn+fv3DO2FZlPaMWXTpUAMxiGK9O2hHb
	vSAe9UkvTOCDzxAAVOrCS6bf7Bq7pnBbQWNgxYz4VCOshqX0HrbED9t+yaGmFmyh
X-Gm-Gg: AeBDiesUksBk826/g0jkadqFQFynQnxkJ8iqdhBagKxDUD1LfPrjTaxQQGa+9TV89Vn
	FDeCUMj8EzOUcyv+mDytOJQhiU2EhlR4VN/sTAh0adtBn+Z8w4QAn0NGHeySrY/kybICR1v83K8
	baof08/cEQZB0WmPX/6Wdo4G9f0KuI+BDOQ0T37up9LnMtKC2gPQMIHDH1yXDuj74GBCzeZLdXZ
	8fX2OoCqOhQKaiIhVJ1IJv1xYXpjZ99KePNaGpqic4AzBT/YjSkuK5/TZY3CDrmja2b+B1LJYwN
	pj3c8X3WuDhh0Ain3I13YB+ZzaUmr2bgwj10IVRHj+m07VMSmX2iywCQ+AfOTB5zoUOKIuke4YT
	WAG4xL2yRzL1DoNGokGeRRQWwLHSdoHJtb+uTZLITX5o2Tl4SGDb7MgaQIBumk+XPcxwK4tXfs3
	pL2h/oGtXIphA7WYP7wWSB++oOU4i16aBrFV4SVI5cyWj3AkqeEe2aCS3/2ZvqNoBOgybKO28r+
	hAt4NsXGfWHtH564bNVvJOAFg2RFeApaw==
X-Received: by 2002:a05:6a00:4f93:b0:82c:e9cc:f61d with SMTP id d2e1a72fcca58-8352d01f1e9mr5423334b3a.9.1777805144953;
        Sun, 03 May 2026 03:45:44 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.115.140])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515acff64sm7320287b3a.36.2026.05.03.03.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 03:45:44 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: most: dim2: remove filename from comment blocks
Date: Sun,  3 May 2026 16:14:46 +0530
Message-ID: <20260503104447.64657-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant filename references from top-of-file
comment blocks across dim2 source files to resolve
checkpatch.pl warnings.

The filename is already implied by the file path and
including it in comments can become outdated.

No functional changes.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/most/dim2/dim2.c   | 2 +-
 drivers/staging/most/dim2/errors.h | 2 +-
 drivers/staging/most/dim2/hal.c    | 2 +-
 drivers/staging/most/dim2/hal.h    | 2 +-
 drivers/staging/most/dim2/reg.h    | 2 +-
 drivers/staging/most/dim2/sysfs.h  | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 327790436653..ec0e568ec12d 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * dim2.c - MediaLB DIM2 Hardware Dependent Module
+ * MediaLB DIM2 Hardware Dependent Module
  *
  * Copyright (C) 2015-2016, Microchip Technology Germany II GmbH & Co. KG
  */
diff --git a/drivers/staging/most/dim2/errors.h b/drivers/staging/most/dim2/errors.h
index 268332e5735e..d707daaac3b6 100644
--- a/drivers/staging/most/dim2/errors.h
+++ b/drivers/staging/most/dim2/errors.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * errors.h - Definitions of errors for DIM2 HAL API
+ * Definitions of errors for DIM2 HAL API
  * (MediaLB, Device Interface Macro IP, OS62420)
  *
  * Copyright (C) 2015, Microchip Technology Germany II GmbH & Co. KG
diff --git a/drivers/staging/most/dim2/hal.c b/drivers/staging/most/dim2/hal.c
index 38376d3e3f0d..4f137ef846a3 100644
--- a/drivers/staging/most/dim2/hal.c
+++ b/drivers/staging/most/dim2/hal.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * hal.c - DIM2 HAL implementation
+ * DIM2 HAL implementation
  * (MediaLB, Device Interface Macro IP, OS62420)
  *
  * Copyright (C) 2015-2016, Microchip Technology Germany II GmbH & Co. KG
diff --git a/drivers/staging/most/dim2/hal.h b/drivers/staging/most/dim2/hal.h
index ef10a8741c10..5d69a5e7d299 100644
--- a/drivers/staging/most/dim2/hal.h
+++ b/drivers/staging/most/dim2/hal.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * hal.h - DIM2 HAL interface
+ * DIM2 HAL interface
  * (MediaLB, Device Interface Macro IP, OS62420)
  *
  * Copyright (C) 2015, Microchip Technology Germany II GmbH & Co. KG
diff --git a/drivers/staging/most/dim2/reg.h b/drivers/staging/most/dim2/reg.h
index b0f36c208a57..51ae158802b6 100644
--- a/drivers/staging/most/dim2/reg.h
+++ b/drivers/staging/most/dim2/reg.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * reg.h - Definitions for registers of DIM2
+ * Definitions for registers of DIM2
  * (MediaLB, Device Interface Macro IP, OS62420)
  *
  * Copyright (C) 2015, Microchip Technology Germany II GmbH & Co. KG
diff --git a/drivers/staging/most/dim2/sysfs.h b/drivers/staging/most/dim2/sysfs.h
index 09115cf4ed00..60405cd473e7 100644
--- a/drivers/staging/most/dim2/sysfs.h
+++ b/drivers/staging/most/dim2/sysfs.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * sysfs.h - MediaLB sysfs information
+ * MediaLB sysfs information
  *
  * Copyright (C) 2015, Microchip Technology Germany II GmbH & Co. KG
  */
-- 
2.43.0

