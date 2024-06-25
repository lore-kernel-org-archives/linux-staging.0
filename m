Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D7D13B2B0;
	Tue, 25 Jun 2024 16:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719333302; cv=none; b=l2+x9Xcj1EWtbKhDKogBoNCypLvVOBxY6tlo4ktqA+lIVwiwFmGJHcqE9QQWJGJob9kOx/JPT+NZ6d8lSWmtTE2Ea88Oq0jci3D/v7ZTDondsGm4EQT7Z4juZ1lp8f/w8KealhgAbBT04gCAp0zUGzR65QW3rxLBBK5wHvWpk+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719333302; c=relaxed/simple;
	bh=bAsxVx0UvzMzKlZe2Vcp9z6yB46BDlBPDqTLhsJySag=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ShZQKZzfe5CaL4TRSXkILXeYwAFdPjOW6EiF4cLYf5vPV9IUSBIesTQKyMdOQrKR9vHS27WNDU5q8OVECO+xgUWmMmTmfVE7Wz4spmHBcD95WiyvL0zCyDDbUR3dfW2SYRT8SonWZ8L/ePUUYNUYEIYsQDNvfGhaW9WUI9rWdcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SeCdie2+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SeCdie2+"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-424798859dfso47920585e9.0;
        Tue, 25 Jun 2024 09:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719333299; x=1719938099; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f2D5WnbI6hoDNtONP1hohTOtNAD6BEhzID8lJ1CZtes=;
        b=SeCdie2+hVZIyNxzYmdtfHAfb/NQlke/+Dvrp2hhRyEPVfmV+sAozY2pdtpzChyooo
         EFUlE699ysFv9LR0IvKNjqcoUG/tQ8t1m8cQKzyqKB3a6Wi1NUSxoHtSXw79pY2p0YlG
         fGOSaB5I9zrzv1zHEOcWkOJKXE8IjInS527yhv9lt+O9m1P/bAZGGGuseTZvExE0ooaa
         zT4BYFjzxf8VMz5xSzvMMA65O+9aQmgAq4hIyTOBBCQqGK9H3wVmq7uxLm25T9fHPBWN
         8+WWCR+0wiNE7AgLssxj7UgvzIaeTNy+x4BZBFEmSwpVkKFkb9LdtPO/75Z85MOY9li/
         LLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719333299; x=1719938099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2D5WnbI6hoDNtONP1hohTOtNAD6BEhzID8lJ1CZtes=;
        b=q2HPSUYC9xVhbwBKO7O5oW8CR2Ha81W1DS/ORA6svLYXiotxBkXtD76eFFe2LPQZka
         C26voR7QFJ/hPz5mvkJ2mklGODOtQHJadWmxvjhmdIDC80R2lbto1VwWTVqCNUeAYwCr
         0pbljbo+RHuR7caYKTZlwNlT8CbdjjpIDs1B6EkfkaZfm0s7Nmpc90IO1YWf6C8/NmzH
         k+LoVDRigIfmTmb02jmKITlR3Wi8MeS3MggWrI3510HyPU3E116WxoOfROzvAtujaXH6
         CH6a6xEcRJ9qv27UQnnYLSwJM71aEcbpqxLDYmB/oao7LX+Lrp3irFol6Poy4V0VI598
         cCLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXbA6CE/bW0r+o55MGMstqvhe1wIXbYkMkLQP59ZXIOU5dthqVWziSwXmr0ya4pJn227nmBmmx3glnZUTdm+gG602XbcU5OMdyQ8INUr/idgEEOCcuSlwxL72BBzza45mUySd3xxNm0igPE2c=
X-Gm-Message-State: AOJu0Yx8alHb2Zku+wsdcY7EFi4WifEo0NGh37Qb2DT6Uibn10UroHox
	oMBjlQoKauLpNrz7hUHmEhXjVXiDwPiHt4FheTZtneHdgmA7tUzI
X-Google-Smtp-Source: AGHT+IGGyhODIpXfM2MCK3HCTtKZDoIwysdpuC9axXxzoGpIKWMr3flaE2pWWJ9AT7H/BxuHIv/ECg==
X-Received: by 2002:a05:600c:2d55:b0:424:a319:6b46 with SMTP id 5b1f17b1804b1-424a3196b9fmr14603165e9.18.1719333298504;
        Tue, 25 Jun 2024 09:34:58 -0700 (PDT)
Received: from localhost.localdomain ([31.120.167.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d208e4dsm217457415e9.33.2024.06.25.09.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:34:57 -0700 (PDT)
From: Teddy Engel <engel.teddy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3] staging: rtl8192e: Fix conflicting types error with net_device.
Date: Tue, 25 Jun 2024 17:33:34 +0100
Message-Id: <20240625163334.11117-1-engel.teddy@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a pre-declaration of struct net_device so the compiler is able to
use rtl_pci.h / rtl_cam.h.

Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406250858.L8rJMHQm-lkp@intel.com/
Fixes: 7dff0b27d9c8 ("staging: rtl8192e: Remove unnecessary pre-declaration of struct net_device")
---
v3: Replace ad-hoc commit id / subject by expected Fixes tag.
v2: Add commit id / commit subject  under description.

 drivers/staging/rtl8192e/rtl8192e/rtl_cam.h | 2 ++
 drivers/staging/rtl8192e/rtl8192e/rtl_pci.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
index 3a5635494385..9deffdf96072 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
@@ -12,6 +12,8 @@
 
 #include <linux/types.h>
 
+struct net_device;
+
 void rtl92e_cam_reset(struct net_device *dev);
 void rtl92e_enable_hw_security_config(struct net_device *dev);
 void rtl92e_set_key(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h
index c645775b2150..3e39c4835ac8 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h
@@ -13,6 +13,8 @@
 #include <linux/types.h>
 #include <linux/pci.h>
 
+struct net_device;
+
 bool rtl92e_check_adapter(struct pci_dev *pdev, struct net_device *dev);
 
 #endif
-- 
2.39.2

