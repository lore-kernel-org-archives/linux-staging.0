Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134572595
	for <linux-staging@lists.linux.dev>; Thu,  2 May 2024 04:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714624484; cv=none; b=NeeFZiCnwOF+RbEtYsxGV58uXfkF0P61dXXE6xKr2ohjNYTOksk1yREIsel8vqCVmX2xpCDkeJqh6Vm2/++0IIYEeZKg/M3n4XQgl4uI03f0YnRrzIfhcDDizJScFsUcoQMUy4oiORb0x+r9Zn/ovl7sK+kNdoxH0W2uOv3e7ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714624484; c=relaxed/simple;
	bh=cQcFEdgdc6pC9GqB2gbSdsy2bAhuFyqluR262OhVmVg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RgTkkoeyO4E+/CIgqHApT2dIIfQa0twy+OPGX9SzC1tqwaH7Aa2Zhfl7XdT8gNVWt3pCRDbHDsyDYdPcXn/sx+3vzzaEYgisPTBYTPPJDiL+IOITMiRXiMlN81ZmvpcuOCl4+CVPfJkiSqMwKrFYvxuhTxpP1PmTRkvLmEp9DOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CuU4c3et; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CuU4c3et"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5acf5c1a2f5so4838792eaf.0
        for <linux-staging@lists.linux.dev>; Wed, 01 May 2024 21:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714624481; x=1715229281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bzbfs0wiOv7uq3FgsVma6gfgD2lkV5u/sFounqmBNIY=;
        b=CuU4c3etJNTdH3bvKnkeLzpag7DUj7H9tJz9AegAbvs2sMuxxmK4QUFHO9UPBbpWf/
         j5NJ/QybO8L0zfeodSx7JJjexusgsugOakxCOErI5TMmc3pT8tEuFQe80PXBwxOIix1B
         dGOhKiUm7QBXipX/tzSDpuG4cjgdLJM3nPutEovPuiUQlVL3kbqPx6Gqrznv2KcS7DFc
         SmfUTG6I5d61x6KmI39Z6amA9Z8oVmWuSdodexSBOq0QJSfhmcGvp50gkYZWaCjgfBxg
         YSXcbCUSLOvExqAZ7TL2HQ9g4UiS6IIR4tVUE0KdYvJ2q1z4a1zSPIDYJanhNZ6krFH6
         FMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714624481; x=1715229281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bzbfs0wiOv7uq3FgsVma6gfgD2lkV5u/sFounqmBNIY=;
        b=p0gwTLi+O0Wy9ZOngF0Z57feTrwaqq7cT2bqlEZkW2TJ5wbrD5dVGfnJPTZUq4/uMq
         g6CJVAT3yATaF+ClIYLbR1vGN72CCsI9rzns5GoKsWuPas/qo9mzO/PZJsrWjIgdRYRU
         Aqh1gkLIB5ikrdLhvkYSoMTtx1m8HPWadRmRKHjcm4kCkqKQoF4cwlKiZoahGbitVuSP
         RvZN2JyHQzuhp06qUIu8/NblBsN5WRmrox4gYqnpGE2/T1m+hC73Pz0WzLOzK8BOBqKi
         ByaPBWQ8zK0plJjiUqlr+h2rfxTW58DmB/vPdIFVng+qoAvKdcFtCAlzD0nlDJj4D1pz
         pXCw==
X-Forwarded-Encrypted: i=1; AJvYcCUHx4lHVF+t155Fl6K6NMblfrVZFzeRUEbv7ljVa1QTU5ymVtFJgj9bMnkmj0vP0gIH789hhTtaagV781qjYfJmtQIpXvbXaQWqS6e34A==
X-Gm-Message-State: AOJu0Yytti0mljv7EpJdNcT1h53rGVaa91+opXHn5mTdBsstlCkbiuvu
	/VvvPh5Kc959Y73DdQy5JUgXi0S0wLlNbc2TSmxb8oJ5FQhnA9Mg
X-Google-Smtp-Source: AGHT+IGeu/ACFu3SjAKNGVfjeMh927PMA1C6f2aJpIqq5+0IAzwlmCSEygLC+J2eN5WRx5QXO7/7Dg==
X-Received: by 2002:a05:6870:2151:b0:233:60e7:52bf with SMTP id g17-20020a056870215100b0023360e752bfmr4986671oae.50.1714624481027;
        Wed, 01 May 2024 21:34:41 -0700 (PDT)
Received: from ubuntukernelserver.. ([49.236.212.182])
        by smtp.gmail.com with ESMTPSA id s17-20020a056a00195100b006e64c9bc2b3sm251133pfk.11.2024.05.01.21.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 21:34:40 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hpa@redhat.com,
	gregkh@linuxfoundation.org
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: atomisp: Fix spelling mistake in csi_rx_public.h
Date: Thu,  2 May 2024 10:19:15 +0545
Message-Id: <20240502043415.88434-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported misspelled register in
csi_rx_public.h. This patch fixes the misspellings.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 .../atomisp/pci/hive_isp_css_include/host/csi_rx_public.h     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h
index 693154e8ec2f..7e37f0809034 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/csi_rx_public.h
@@ -94,7 +94,7 @@ hrt_data csi_rx_fe_ctrl_reg_load(
     const hrt_address reg);
 /**
  * @brief Store a value to the register.
- * Store a value to the registe of the csi rx fe.
+ * Store a value to the register of the csi rx fe.
  *
  * @param[in]	ID		The global unique ID for the ibuf-controller instance.
  * @param[in]	reg		The offset address of the register.
@@ -119,7 +119,7 @@ hrt_data csi_rx_be_ctrl_reg_load(
     const hrt_address reg);
 /**
  * @brief Store a value to the register.
- * Store a value to the registe of the csi rx be.
+ * Store a value to the register of the csi rx be.
  *
  * @param[in]	ID		The global unique ID for the ibuf-controller instance.
  * @param[in]	reg		The offset address of the register.
-- 
2.34.1

