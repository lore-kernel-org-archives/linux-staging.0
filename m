Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED383FBA7
	for <linux-staging@lists.linux.dev>; Sun, 19 Jan 2025 09:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737278575; cv=none; b=gnSBbJlEDOy/baTncNiV8gY/oDu5b0oPSvzvVZ/3l4xz/emAJcJsyoBqoyTiTES/4GnTpBOWBYk2mWsndjQM3g+0W0sy3kVljXkXCREb/WB6meANmrzCC3434rQ0cWCQo/f7RLRxNLLsTrmARTC9c70EJgP3GRGF5UMhoCtX3rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737278575; c=relaxed/simple;
	bh=nSYWcyAtSQfPH+FGo9o/LztpOsCzuB4T71VqMb2oGfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j+nfvuNJZFschbSh/f5QzTVwX2umwW1tQDqx6TqxdYK43mfYOX68fDYaADEFqnJkptlGEbUJkY+om1CaNVBmf5yrjDQfeb/c5JyUglL362tuZXBY4ea7hu32djAYR6m6YUAq4NgldF7CXCp03wyKnGGYZQMuZQViXGiuDCtz93A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQv52M0t; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQv52M0t"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2166f1e589cso86869175ad.3
        for <linux-staging@lists.linux.dev>; Sun, 19 Jan 2025 01:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737278573; x=1737883373; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GWLy1gZ1uQuaXKDXHow98CyZVJ3CHVYKAmaWJAE1HRk=;
        b=lQv52M0t61hQ4lpYmegfba5lbGhQFx+6+KVYKDdyVPUWeh7u6HF9H82/I4Mp58/qTV
         v2fZ1nroxujKJEXndTuvuci7cfyeaDxgj1bwBQiV2BgQ8ps+fkn+Ytx6FTom84P9zBD+
         qbj2wm4Er/Raj2RqEgKjenTSunWZDrvu8tJLMnux+QgyCOPQoELiXnkTtzlSJ3Yw6XAu
         niKuxqXqCkPihr19q0g3jT8PhSjPtvQklpnCjSwBdxQ+BXqXPNizMVbFhd7H1SNOA/XV
         epX1XWN0xUY0lX5xxbZbNsQMV17gJbGdZk6JqVQPEtTGB+KlnI9CgppJMplBu9G0Gs+g
         tfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737278573; x=1737883373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWLy1gZ1uQuaXKDXHow98CyZVJ3CHVYKAmaWJAE1HRk=;
        b=HpJTRx+LWAuewnP+ZTT5yabKqYAjob+z6R0+fW/9Mdfg0MKGBHgq2qIpSx7nOUy2xn
         sdwxD8bED9ZKLrQR2tP53wBB3tokaM3oochxnCWn8E1KtkRIifdNSj3FFT7awY25Vk9S
         CBLUS1kXkuRgr7zKFglIjaW1ZHP6oo0uO0nj8BsHc8v/J2zeisZcZVRZdG1oXnxjxhyC
         6D1cyNa916rDVYowJaqjgDWy8vUvcIhSixvRNnLBrmsaW9i5XE0W6e7pT76TDH5r/p6/
         CCMO7MG+d7WBTBfbAj6/FyvAwfuHDg1f50S1Y90xr261SjDi64Isbr12v6Ew3tBQHv71
         g+gw==
X-Gm-Message-State: AOJu0Ywf5CLOzMC7oDM43KPdz7LEduWt+PhnPKDunGhpjYYn+YGyycID
	PNDWNzslqamj7h6GlZiJcKrM8cslkyQCwrrmGWSGpBryWNh6U3nB
X-Gm-Gg: ASbGncvzEd/caCmN4qcViAruzfgDIWlN43IKyAPouYokkYZD/oMO23otV+jeuSuna92
	S3DV1UelizB/S1+EqIX/n6e72QBavYYADRCTrpJuwp2j6oR7/eaFpJi0qcDn27CDpKX6qDstOpb
	8IZbpozlPWlhBZh+RP2Wn9bhsvRMriNTVSLiId/fGRb9MkKc+3lc9k4x9dBye4/aAyvZHpA2czL
	q+i3EXGrfv4gUPgKCoIX+TKnIpVzsJUxXYk5Ctf2vYMgNDVmsqp1kARjzCwoLBVEscB3a1OMSA=
X-Google-Smtp-Source: AGHT+IHDOIrTtMvpyZrbmMZExPf0+/SdzGGT2lR5ZuKB19Yb9BMyBzgfhrmyzb2kJCNA8vSMdPLwSA==
X-Received: by 2002:a17:903:90d:b0:216:48dd:d15c with SMTP id d9443c01a7336-21c35607d0cmr126320545ad.27.1737278573081;
        Sun, 19 Jan 2025 01:22:53 -0800 (PST)
Received: from eleanor-wkdl.. ([140.116.96.205])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d4027a6sm41326065ad.209.2025.01.19.01.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 01:22:52 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	visitorckw@gmail.com,
	Yu-Chun Lin <eleanor15x@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] staging: gpib: Remove unnecessary .owner assignment
Date: Sun, 19 Jan 2025 17:22:47 +0800
Message-ID: <20250119092247.1873176-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver core automatically sets the '.owner' field, so there is no
need to assign 'THIS_MODULE' explicitly.

This change fixes the warning reported by the kernel test robot:

cocci warnings: (new ones prefixed by >>)
>> drivers/staging/gpib/eastwood/fluke_gpib.c:1145:3-8: No need to set .owner here. The core will do it.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501182304.q5PrJvhd-lkp@intel.com/
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
 drivers/staging/gpib/eastwood/fluke_gpib.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index 5e59d38beb35..c6ec8ff8b6bb 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -1143,7 +1143,6 @@ MODULE_DEVICE_TABLE(of, fluke_gpib_of_match);
 static struct platform_driver fluke_gpib_platform_driver = {
 	.driver = {
 		.name = "fluke_gpib",
-		.owner = THIS_MODULE,
 		.of_match_table = fluke_gpib_of_match,
 	},
 	.probe = &fluke_gpib_probe
-- 
2.43.0

