Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8253E8C55
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 17:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312636; cv=none; b=cP3G7agvDNkgpzSZVCnhZONacjP+qMbOqQgAw5tlWaWxi4rkIq18AUUd+J6VSo4vYTrFcstVROYacahlv5J/lXLH425fA6GgtKITQmN4rJ56DyTSJpMfmpripL7Tfs0exzTtCen4vH08C5jEcK3cWSxmAdDC2JCJ/sZzTY8dIWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312636; c=relaxed/simple;
	bh=oeEhT2PnOWAkriBHaEhYvOs7u3DS/FBHnB1FhqlwXdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FlebN70/zDiJ2LqGYtXjwUTJdur4F30+pg1MjYQby6MJU0JUFS+B+Y76GXdAT9RyUtzlu+/eLwvOGfNzcDk5o/rpSJnhteJk04WQEnGuK0IJXPjAEimmRixbFyMQeOmHDxvzTfSqFQ7WAVc897mkt9dg/dyFRd9RO9ZdqJPDdok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4hXkwK4; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4hXkwK4"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82f1f6103afso4869853b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 10:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312635; x=1777917435; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1bD1qsKPZiCZ1Yl8aUwqSJacRgKc2Njxb9no+FbxL3g=;
        b=E4hXkwK4KwT30OQnVsgbsvQp5uA5tPuqk7sT/1u7SjMihqnvQUODDPhPkd7/5YLUnG
         otnqAPsmYjoiaJrUAtrrjmbedgUeBPqYG8myOhYkOIivQMvNCp3/sf3gb7xo/SBVb9t6
         9hVhnetGNB2Qfp1DmIjXaJ4hQii4vzlcBQcrtaHwWUaK090KKI+UICHdIHemVY+80HSA
         daFRvMrs6DZfRj0W6T+jAust54YN6Zrh3xUOjYDj4APu39udbMtzzh8kg5BzhHoqF89D
         bQsX+wHDytmBGQYlD80D75ZoYCloPueflQE88n7+kocQznTs9mJRiYBBVieLHDJWhDd9
         xsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312635; x=1777917435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bD1qsKPZiCZ1Yl8aUwqSJacRgKc2Njxb9no+FbxL3g=;
        b=stduNwugJP5p8wupwExMjs/pcG7QDHtqrahymIvBm/5DSiZB82ggypUAoG1MIeKcxW
         XnQ33oNAO/MLBH0NE7qoXw/jBuEhzWg2BAInQ8anzRSU/nje84KILaWDPNhWvzaCTkIx
         BVBtrkeT7H1QvU6zm+P1nOIngSslgCyiLcdq5PJnUVYAwGE8jsOYkhcQUCoS9XNQqGLx
         AKf2HxSL6h0E6EiKsEqyCr7PlosziB+ChVjzun0smbJhseXMUF/7W9nEXSqd6X5Tfm+f
         ExD3awEAf/3wHxk/sifOwqaUKVDDO1oHo5Y8qVLCdnMx0z2rQaBH+GQxmLloq3kfOICm
         uHPA==
X-Gm-Message-State: AOJu0YwK60A2+K88rnseP4r4/WCbKys3XPuEv18dXAH84gtpno1lka20
	zT27kNtoR3VxHxAe4tuUolh2vSk3iqxhoFopPc+cAdmc2zPiMAyBXUAH
X-Gm-Gg: AeBDietAfH3BPaitwJUPFJEMKBhBEUKtfvqrcdnHViTO0Pj4ktdJC5zBncwYZclhs5n
	iBKpqQUTf806nfmxiIwk8+Ehrg3zrM7PeWnZxl3nkI1NEdZfXnEEIR49TcXHAN5JWUHuN+ub3Ov
	/9l+jfXt38IBqJQodC2IMdPZyEIw5nrdD3Mp8bJuskspXLLRxNnk62aW2Lu8YM5u8TLuzQWTmA0
	0U8bILBIGFlwfkZ/u8L5sy8UvIaNMHjTiezOw50zfdGZnTE5waags07rwprjIRtcaHDt+H+jq7Y
	bpHeYQVxLq6kC5dePUPk2zpJ5uQTvEwUc15Jm/aoMxkCwM8foLlOxEhBoTpqL+yOSUb0oY0EAHb
	R3w6Y0IbKMnrwBxKWmYV/SS4D0GA0HcjDiD/Aryi3Zz0FlVV9caogZNPvNND0+Tgejekg0B8Ukf
	/laO3tmXETzTd9bgKmbh2PZ9pe3S6aIhBXTxCCIRDMq3sH1evG0bf6vAQN+f3oH+F6atx6J6cp0
	uOOG5+tsV/zaAglN8RShXFl5dZKk4ep
X-Received: by 2002:a05:6a00:94d2:b0:82a:6b97:34ae with SMTP id d2e1a72fcca58-834dc2669f9mr16435b3a.32.1777312634818;
        Mon, 27 Apr 2026 10:57:14 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.114.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae00c40sm102813b3a.1.2026.04.27.10.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:57:14 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: most: video: remove filename from the top-of-file comment
Date: Mon, 27 Apr 2026 23:26:35 +0530
Message-ID: <20260427175636.4605-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the filename reference from top-of-file comment,
to resolve checkpatch.pl warning. The filename can become
outdated if the file is renamed.

No functional change.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/most/video/video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 04351f8ccccf..0d7e9354785d 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * video.c - V4L2 component for Mostcore
+ * V4L2 component for Mostcore
  *
  * Copyright (C) 2015, Microchip Technology Germany II GmbH & Co. KG
  */
-- 
2.43.0

