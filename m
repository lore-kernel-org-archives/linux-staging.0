Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856582594A9
	for <linux-staging@lists.linux.dev>; Wed, 11 Dec 2024 19:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733944937; cv=none; b=u36epT9yqx7efK1K7Pj1LVWoHombozB7z1+/a277dO8A3VplbRkNA9qx/jP2BhHFUR4oFTC9xKZK4cG2u/xt6sXt+Ritia9hfGnOhZn91+6aq/u2N2EaymRE5re68qa2LdJQSpOOeYXkB78tcAUJc3meH4wonQfJybUwG1p+s5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733944937; c=relaxed/simple;
	bh=0guIPxZF8cwXbarQ750vhuWao8mMlmLhUUhPOsFxuVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jCgZkMyMntxvPtVSK1Ru/cgnzsqTqPagp2L9sqxIjzYhLGGEa2m6oESBcQqG+cuE892ztgwmGAROkA2Wx97Tb1WyvAxObaCmSZtpf+kMn8djj308el8X9ZjETTsMJ3qQ69ToEnFbic/Nnf+J0YivTc0YhSjPgM2K3aXKNbGYUkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LP25n2n7; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LP25n2n7"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-216634dd574so23686205ad.2
        for <linux-staging@lists.linux.dev>; Wed, 11 Dec 2024 11:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733944935; x=1734549735; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JJeFN1xbe3QjC5dAWvwZ8QPV4wpZMDCARpp+S2afYJ4=;
        b=LP25n2n7NQ5PrMD0RiyBsfVyk+zv2JgZUuxiEwg/bfRBP0AKAvb2aFetwizU4dc4KV
         ho2znQQIr6II0M2r18DXE+lUdKYl/Qv4Md5gMY3eiNdZH2YkLBr0s0i5burL5lwS5vFE
         z46P+3E+AhGyqcXGCvHvvXievQ97d+N88OkE6k4AcMgO891KScSJGleSR9EgXq3AXrVN
         ihb3MgpK1Bd8uPckBnE+e7fbUnaZolg5XQundqNasPzdVdbKx6HEKlXtWuMNZDTAXhN9
         UfhFevyiJaO5PDcGAhNL9q1O/L8ZSO7+eNJJYlH4ge2K5IwLYRd9LRMLeBLDRmOLesQF
         UtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733944935; x=1734549735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJeFN1xbe3QjC5dAWvwZ8QPV4wpZMDCARpp+S2afYJ4=;
        b=gJmFn/3EgjLfPWGn53P/cg0UkmzH2vTfgbbogujWFxQOVuAyS+HpcoOH1j6GAgEsFz
         CAxl197WPpxCojjP914vuxE9t+goWfu3QfbppEQmxMztJnKQqF/YN+bo6KIq2AugWgQt
         zezC3ZBJ2z6gsvzJBFV9s9C0WUmgZojbKGHcptOywI8VPiVh7ai1chzesaMPArhWFEat
         /LD0JshhWpYoaIM2z5bhxXaRWkfoD+PF778d/fCwg7dX0292huz0h9m6SDE8vVwgEr99
         6mN9ytuV0A/eqRVnlVgGtQXFZk6TfviSYrXgSGv6L9hz9dRDFVEEUnJ5ONWtb29+e/Ba
         jLng==
X-Forwarded-Encrypted: i=1; AJvYcCW3+C7ErwNV43V9YJKxM8Nr3KykGeRMhs5cWOar/GJXNAe3jEBOBR+ROwBGYKcm0A8Tg4YBO9FlU88XIp88@lists.linux.dev
X-Gm-Message-State: AOJu0YyUGQD1XBmuLuQjJSQyWo3PZqjCKgr8kq/xwigv2je5q7jXwiGX
	1/JP0Eh0XMzrbr09TywLNulJfD/UQrYQi4pBNFBXUtz9eeLlKeZS
X-Gm-Gg: ASbGncv+Ci/Y6ADRrOWfFc7kX22zHFfl6N5bFQfz/D29HYvRyORT07OvrDIHMtwBjfR
	PPis9kWnQ8SDZ0cMA18PMzFKzZnqR4M/CKdPqvfk1cclCEzHbTE69X6mVdJE58Hpsmf3XtM9Y8a
	528SFltkojh6wC3lQ2rVn4dSXIFeVfAGYQ+Eh/85/v7qDCom30Qv+Q8eOeqbMs7D58LZwAYYZ7E
	kym9WPJj8uJwycwiOaaOpr7KrS9hocuTwMx39kSgZX4Yv4CJnFEOLvPX77ZqUPgT0J1PA==
X-Google-Smtp-Source: AGHT+IE2qWHRpHyPBAV6Og8YQFnhhYxu4NQuDXnPZJ6JsI8ddClQFgl4aCNOIlwumuOq+B48WG/qOA==
X-Received: by 2002:a17:902:d506:b0:215:ae3d:1dd7 with SMTP id d9443c01a7336-217783b77d8mr73063535ad.19.1733944934713;
        Wed, 11 Dec 2024 11:22:14 -0800 (PST)
Received: from localhost.localdomain ([2402:e280:21c5:223:2c08:f85:3644:ef6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216500da1f8sm54936875ad.5.2024.12.11.11.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 11:22:14 -0800 (PST)
From: eisantosh95@gmail.com
To: 
Cc: eisantosh95@gmail.com,
	Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rohit Chavan <roheetchavan@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: gpib: Wrapped macro in parentheses to ensure the correct evaluation order
Date: Thu, 12 Dec 2024 00:52:04 +0530
Message-Id: <20241211192209.22493-1-eisantosh95@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Santosh Mahto <eisantosh95@gmail.com>

ERROR found by checkpatch.pl script

Signed-off-by: Santosh Mahto <eisantosh95@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index a2d562cbd65b..3aec39a6d6b5 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -44,10 +44,10 @@
 			pr_info("%s:%s - " frm, NAME, __func__, ## __VA_ARGS__); } \
 	while (0)
 
-#define LINVAL gpiod_get_value(DAV),		\
-		gpiod_get_value(NRFD),		\
-		gpiod_get_value(NDAC),		\
-		gpiod_get_value(SRQ)
+#define LINVAL (gpiod_get_value(DAV),       \
+		gpiod_get_value(NRFD),              \
+		gpiod_get_value(NDAC),              \
+		gpiod_get_value(SRQ))
 #define LINFMT "DAV: %d	 NRFD:%d  NDAC: %d SRQ: %d"
 
 #include "gpibP.h"
-- 
2.25.1

