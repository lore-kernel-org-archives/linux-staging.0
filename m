Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F564A59
	for <linux-staging@lists.linux.dev>; Sat, 21 Dec 2024 02:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734748153; cv=none; b=NLQkghlRL9UWQY6WEY3ntVExtD2widYpksSo33AWyRzIlXFtFFe3c8gyk5xDPFalTPDe/8XaUs0ptWzVi55GDZ86+5pwdQ9pZKu6wMpXCEmY8ipAHMBmQ1achK/6lNGoHCP58tuT6+hu5x/ZPQfBWLZVfoqLwY81CN8skbnrh6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734748153; c=relaxed/simple;
	bh=jW2s7RJUHRghP1fOQgih6ZZaQll5CX3zRM/GLImoz+8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=deAZYrFQLOrM7BoFpKyA07njdt5rTY18jpTio2aE31NR8oZ8nVYNiciiYDeaxQAlttFgNMosFyYzvPDwUgFOYItcmgqXWbNdGtLqbuvKRR+AXmzPiZbor2ZQFX4GP/XPnQ8CcK7fLiWmrMxQM4eqtCBKvIXUAlCkCBk/5Lj1VEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcwkgNG+; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcwkgNG+"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7fd44f1e5faso306165a12.2
        for <linux-staging@lists.linux.dev>; Fri, 20 Dec 2024 18:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734748151; x=1735352951; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ytwnypYKm5KIEZXfVxN9e7QinVFawxspxP9AVMExicM=;
        b=GcwkgNG+mWOOOy/jzCAm2s2nqqFmb+273nk7RK2KhWU3u7Ab98HySssNTBhtRUBfpj
         TlP+8KhPHEHMb+S9Gbm0YpDf4oogW8joCqpfNhvYlMQNN3l+9onWd5EwR5XYFnlQAL8+
         Vy5n+DoNvde9BPnBDTdTGxMXr3YuTKOnidvJ6IS8PZbKtuKligjGDDJN7XKS7LbTi5+a
         HPgOh1vn5yJLzmIE0ekACRAALVxI5CMWZTEsSylmhySrJbujquVwcbO1PacraePtUezQ
         yu3sB5CCafusA5/4j1y+Kl/sbJrkufv7RoAS//jqJ8Il6ezP33iBKhOkmzTuKzdG8duH
         n1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734748151; x=1735352951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytwnypYKm5KIEZXfVxN9e7QinVFawxspxP9AVMExicM=;
        b=OR2pruFWB4vU5FpfOc72ONiL0UCcjkcR4+MxctI9mqTOOKBUV20kB6munzV7kWy5EF
         Win4LY1QTR+0211Ttq4SPRolZOjlDRwazfp2DPeCHKXUdyVuJtzLgsgHIWtRHy5cXGTW
         fGI3q8te9Sig2pSTq95bFbNqjGm2wKekhiabRA2hA3zZnsiKGKHnrM/H1V22SGE20KK6
         V0B8/++fP+JuZpGyaFjCvaFhHX8qS/b/ZDLxHtCA53GCstsSkgyKto7kLBlgdDOM+RRw
         lydRQUi5Rs2E9zq0aJbu7D3V0ifyIDjhl3CgN1zjwMJLkxMFrZqaPy0F3e0cBgSb4PZA
         lBdA==
X-Forwarded-Encrypted: i=1; AJvYcCU/wl37SL/7ipAG1bX/TwjHvcLUfYRb3cDO2XMeneYk7+VHVccfE70uF3TMOYCvCzmlcUQ4O+LLaDXFeaGu@lists.linux.dev
X-Gm-Message-State: AOJu0YxUR8GjvhmesrsyBn7BGYWnvXLpcW88Aa8CZJN37yDH6LkvWuKl
	hmu59d7pB1u9bvFVZzhOpuYyTUtwzt/CBN0TZTYhPHuQthb5wyoa
X-Gm-Gg: ASbGncvhN1Uxe6yqTcti7GO87J8Vkfv6R/S19YZPKKg8Lc/IfuppPBGCIJvoaSX7XMk
	KPRwRgyPAwoKlwxpD0imiJ8o0C+aWJZEzuHv8txe+6MBLYRrJ6qiGQb3Wrlv+s83AZkBgj8wml+
	dpW8j1yZEwPcWkzeAZdB2ZMDT6hh4siJcQhIdP7QVotRRUVSDu5pfOd9k/oV32PJ+xRH53XvGKM
	GuLhj7RxHHvKgmSmXMnsAXBPXQCd2JYBBkWopVF6Jfcph7itS1by6Q=
X-Google-Smtp-Source: AGHT+IHxClqSmhHbj4Zsql9nnKv0TR8qBSevFg6l22q7gs1dSV5+EnRJ1bRom8zMkxaLVW3QLTfZLw==
X-Received: by 2002:a05:6a20:c70a:b0:1cf:4c3a:162a with SMTP id adf61e73a8af0-1e5e047fae3mr3334363637.5.1734748151356;
        Fri, 20 Dec 2024 18:29:11 -0800 (PST)
Received: from ice.. ([171.76.86.134])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad830adasm3786302b3a.44.2024.12.20.18.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 18:29:10 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	niharchaithanya@gmail.com,
	roheetchavan@gmail.com,
	arnd@arndb.de,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org
Subject: [PATCH] staging: gpib: cb7210: Add error handling
Date: Sat, 21 Dec 2024 07:56:33 +0530
Message-Id: <20241221022632.20931-1-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The if condition in cb7210_init_module() would always fail as
the value of err is constantly 0.
Add error handling to cb_pcmcia_init_module() where it returns
appropriate error code if pcmcia_register_driver() fails.

This issue was reported by Coverity Scan.
Report:

CID 1635894: (#1 of 1): 'Constant' variable guards dead code (DEADCODE)
dead_error_line: Execution cannot reach this statement: return -1;.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/cb7210/cb7210.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 63df7f3eb3f3..b2f6ad70ccaf 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -1353,7 +1353,11 @@ static struct pcmcia_driver cb_gpib_cs_driver = {
 
 int cb_pcmcia_init_module(void)
 {
-	pcmcia_register_driver(&cb_gpib_cs_driver);
+	int ret;
+
+	ret = pcmcia_register_driver(&cb_gpib_cs_driver);
+	if (ret < 0)
+		return ret;
 	return 0;
 }
 
@@ -1528,9 +1532,10 @@ static int __init cb7210_init_module(void)
 	gpib_register_driver(&cb_pcmcia_unaccel_interface, THIS_MODULE);
 	err += cb_pcmcia_init_module();
 #endif
-	if (err)
+	if (err) {
+		pr_err("cb7210: registering PCMCIA driver with the bus core failed\n");
 		return -1;
-
+	}
 	return 0;
 }
 
-- 
2.34.1

