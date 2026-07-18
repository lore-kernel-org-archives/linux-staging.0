Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB603101B2
	for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 17:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784396540; cv=none; b=odpBS96/zE+azBYY/tR9vVI4RoqOSEDGMJ6fC5TXhFrT1WU29MbldFKFW8+3HT+YWI0ChcCQPOxCwbM0AELcqRghc+FrkZvWG6JXUu9nE2kCqm5u/nGek15QGS7cRk43odHEC0o7kpngxNdS6nstCC8LgkC+LaWzN0jTC47zgkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784396540; c=relaxed/simple;
	bh=LCYz6MDY0rnU7n09dwIagTCCM0Rp27A51IpunjvDziY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c2OQRsHV87Pr/UUrcekE7m6xvGdYgz3PKqWjqmYktqQuMVsFOy8Z1sclqIW4kx+5ZX3lhy+xQMmbYojQvfi3pKwdX2ztFfmKaoXAQI9Jj/QG4OH1///1nUHtZupsCc6T5TAW/BCWY9SMsxB101kW7xVy7mUlNJDFLT/7wWSmCTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZAp0fGQ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZAp0fGQ"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca80d708489so1829588a12.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 10:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784396539; x=1785001339; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lk0CxdbGAUsWkU3YuWaCA7JJ++iDFVSrzXmUd3kpHVI=;
        b=XZAp0fGQpc3lUvfp4SwFC6HdHN5TFxeqRUs4VXDupsNNbk7KiOpQXnXTaSOJ6ICGX3
         JoYQ0gv/RyrR5E2+Wcuhet2+7JxY4s26qyxjf0cXZRLZYGIyR16D2fRJwV/oBj3SUM8J
         Zo+Fmtkg7jQaMurRq0lO9p9zZEkbNFz0pI+j5Ei8TJQqm91Ch3hGeJG2ds1QICh0KVLF
         vsyQbGo4A6hgwHFsLYE3SZpzunwe4z+rQubETNIoPaP32Z2swqz/yxAFAVVRABH2Qi2C
         r5q9j1mR+Pk5ISf7FhtLhjXaJ/rRDm8s5czaJysoCXFbpS4F5yQokS9eHLD4gfzEIbqD
         CHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784396539; x=1785001339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lk0CxdbGAUsWkU3YuWaCA7JJ++iDFVSrzXmUd3kpHVI=;
        b=cmj0+Exk4XhS5k8wWAzQkddwlWez+LGMifqyV+hUJDz8ytiT489TupTIpNOsqmPAqy
         nfz2or7sLFzeNm3LRpVPusMLvvi+meJtjzPdg/nJ+n5+OJfF+KeFD4u9EIZxRagPj+HY
         iksbm/yv/MNMhRzIWddErq8/xlXs33xqx5cG1TSGabxJNQjVVlfhYvEcaRGWw3/ixAvh
         0GCazQAleHLtylflfbGsVkBFepP53tBkWq12D+XGD4KAlOUmnL+D+t32XbH8reNTzhCj
         fqlQpSa76A4DtGreRTnx+bZbmJANN//8qu2WJlgcv8sFVQgzQUdlch9+UNJQK7g1gEDL
         TGYg==
X-Forwarded-Encrypted: i=1; AHgh+RpsMGeSporSIn5U0l7EASZFhc2HSKqHPRnShC3DsCHfn24IqL+xB3cZuNYR8EMH7Ri7iJtMacclpB4b9eyu@lists.linux.dev
X-Gm-Message-State: AOJu0YxLfScmzkvmY4FC4RP3137ktovxlwv9Jj91lJ8YihZAAnLrUgts
	pOVG+nUgyOVxX32jBj/1cIL8CafndmUs3b8k0w4WDOcjhe0GQ0nuGTsY
X-Gm-Gg: AfdE7clGxXVjx6axIH7I+aow9Kxj4SsLw5oO5vZGIeX2o6RgFGVJu5y/zr9dTtXW0gj
	8KdPV4AtFPlgXtzeb05xsp4U9zjdPM4HcYFjv2SGrXLVUONY+Hp9ADgN5GMyA8kHq7aT7t9z7i6
	Tl3zU/mwbYu5LAeGoCrW7L3b9JLLTZ+nCDxWnV3Dqyl7tD+d6dBh80nyramybI4vWH7ZIgeLpQQ
	HlhNr/AxVda6uJtBbHncmCJkJlqE8u2izQV7nQ93Cjjh7CUPtsHBuCdDhyzkSL/bu+4yBTC/6Kp
	3bHMTxtSjHhnYdKGT5SrAO0CSaEY3KhqHurBxhaXs0O+nH5Io/96PfW2YsneSDmSfS/FSmrSgIV
	lcy6ndV+p/pzwN2ioSYH/0YSawWuGY47r5WRayFsgL8KrXj4BgGlH3MU80MiQl1QBHh5iUd6QaC
	0j7D+mo7+/H1Ry4sfd
X-Received: by 2002:a05:6a21:1519:b0:3b4:7459:85a0 with SMTP id adf61e73a8af0-3c38db2e247mr12043496637.18.1784396538821;
        Sat, 18 Jul 2026 10:42:18 -0700 (PDT)
Received: from UbuntuOS.. ([2409:40c1:10bf:f813:619a:ea70:804c:eb7c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe1014sm19449407eec.7.2026.07.18.10.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 10:42:17 -0700 (PDT)
From: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
To: gregkh@linuxfoundation.org,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Subject: [PATCH] staging: media: atomisp: use sizeof(*pointer) in vzalloc
Date: Sat, 18 Jul 2026 23:12:03 +0530
Message-Id: <20260718174203.21591-1-prajvalchaudhari733@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch style warnings by replacing explicit 'sizeof(struct ...)'
types with 'sizeof(*pointer)' inside vzalloc allocations. This aligns
the code with modern kernel coding style standards and ensures the
allocations automatically adapt if the pointer's structure type changes
in the future.

Signed-off-by: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 0ee52637ea30..ea49ebe2da5c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2873,7 +2873,7 @@ int atomisp_css_get_ctc_table(struct atomisp_sub_device *asd,
 		return -EINVAL;
 	}
 
-	tab = vzalloc(sizeof(struct ia_css_ctc_table));
+	tab = vzalloc(sizeof(*tab));
 	if (!tab)
 		return -ENOMEM;
 
@@ -2901,7 +2901,7 @@ int atomisp_css_get_gamma_table(struct atomisp_sub_device *asd,
 		return -EINVAL;
 	}
 
-	tab = vzalloc(sizeof(struct ia_css_gamma_table));
+	tab = vzalloc(sizeof(*tab));
 	if (!tab)
 		return -ENOMEM;
 
-- 
2.34.1

