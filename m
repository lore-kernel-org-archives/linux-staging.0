Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7747832ED34
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 06:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778394567; cv=none; b=EuyJgQC0UBpXgzmCmmDNnEnFKPHfm+WqRYm9wECyweyK8zEbBGoyOHJu5cg5wz+FckcZK1vzdMP8wABqb36GMe4XIwiPQx2WDQSU8i6JDcPxJ4RMvLSLo+/urRTNx3H75Mj4H2voxwB+sUiQ8w8fOV/O4uYeisvkeGHdJpRrrKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778394567; c=relaxed/simple;
	bh=HJhEkVWAALNP2QQZoVtbE5slz3NSDeP1knFhe96Z2WA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OzxK47vUc95O8nI5WYgrpNmNj6nX1qKr40cqqKDkGlzw5nOSdnYRyZdRlGDaLBBkwQW66o15z79pkYTUmvjhxG3n6X8wqwDw1wBm2ms+aTSnN91WsTUSNzkhSMa2z6sPNNbJaM0ePuBM19CUaRwKDZCLEWhkxFOBM0RVis0ycnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rMMEFeU0; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rMMEFeU0"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c15849aa2cso4066398eec.0
        for <linux-staging@lists.linux.dev>; Sat, 09 May 2026 23:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778394565; x=1778999365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+1FHS+d+X3bxekCY38W+OApUiQhZkjW5Ws+7M6cHmE=;
        b=rMMEFeU08poBxnoAkXo7wf7ZOplzj5F5EwYiTCQ/uTu2Txs2jpDAF0y470ER309eDa
         aGfbUhCcsEPZA2RwJJpZKoU6gY+pL+IhUH6GbfLmQ8wQ/YkEo3oNVSnjs8oe6km3WDqm
         Ma/o51WiAZhRx2OOilZTXtUU2CflNPoD6gmimjsZVY6KscQdIvLIvDbXcNGVwuWrwcIm
         ylXbmPQd3dioA9l5RlGHPiGJhx1KLffFDhtOfYpUJIgngVqasrzfMN6cb2HPXvMwLao8
         uoD7BI7a7zEcFyg75Dk5I7yeKLxkeiiBIi6DRY2iCjLxOjGMUF72ULtrnd3CmPiNH+N9
         S0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778394565; x=1778999365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a+1FHS+d+X3bxekCY38W+OApUiQhZkjW5Ws+7M6cHmE=;
        b=GRiit0KXRoxxKJJcxVO111/gPgXZWxl0IqrclG9AMQ0NBSAqFbL66NSO/Govre2AJR
         6F1jGhzBo5ekvQ9itO8GTeC+mBYxwZInThcX6XH1NnxonKVh38eQS/fPJfjusBs4MGqp
         AZKNQMOdI6AYYD8Cdw/C0SH/sVstPXIZ8Sctnt/m6LF2zMC04VCu4GppD+2g2fUlR1CC
         gXwvPNXdBTf3Ucel+COa9Emd+9oddpRdglH8Psfk78VCUU3s0xOPySyeiaMh6TZm6ApU
         KXMK7Rq4Wich8CiCVkBuWZuBvUqsA2lzm1d0o7K+sotuzM+uJWcf8EhK3NdO8D3d4dwy
         UNwQ==
X-Gm-Message-State: AOJu0Yy9gkI0zzazaBmF2c919QO+1zZMHsOOksOZtApkXAtKM+yTFn46
	o8AStOvRoEk/x7TSQ5waG3K5GoibeDBdoVwk7Smh0RJ1vEbFv+buTEPxkGUNlg==
X-Gm-Gg: Acq92OEOg7NkBGGE64M8CJqk77MFUtGOPo/8fKoRf+hZFgZ929G3lf/cOaWU5xuNqZL
	R+e+C81G33sByBsRSEn/XYAnWkaOaTPcqodTkHk6QqY+GKttlbvUoM5sbzA3Qk9PhXmkh/ArVnl
	hFUpIzOZpmPuIZIAixaaK5JJ9XSqfrDLrq0h48sQbXvb4U1NtuCtKqiereTBGQcAulSR5eqSAoG
	TSrehMcaMGpL34ihG6TFNsPSyMym/GIvpneC90GubleCOZ2G4muJarKCkAZrRAtyXKmpPdLQWRc
	wiBKVVGZc4GxsXzdikzo8VShdlt1q8zRWaZqcjv+KHPNHf0X/XdcFUDx0AtZDqQFpd6G3r0qBNz
	dOHsBcGbe/Zb9sP/csabg2T7cckQRB7RhID7lbC6n/VOwuibnmHa5KGLg26PGGd48QpWwwm9S3A
	LF7eDpJ9kD2ikaHLAA+wVhezBiM9F7MqfJ
X-Received: by 2002:a05:7301:3f07:b0:2ed:e14:42e9 with SMTP id 5a478bee46e88-2f54b57793bmr9452112eec.34.1778394564642;
        Sat, 09 May 2026 23:29:24 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-2f8893441absm11666347eec.31.2026.05.09.23.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 23:29:24 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH 2/2] staging: sm750fb: change 2 CamelCase variables to snake_case
Date: Sat,  9 May 2026 23:29:08 -0700
Message-Id: <20260510062908.67848-3-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260510062908.67848-1-guojy.bj@gmail.com>
References: <20260510062908.67848-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames these variables inside struct init_status to adhere to
kernel coding style:
- powerMode -> power_mode
- resetMemory -> reset_memory

This fixes the following checkpatch.pl checks:
- CHECK: Avoid CamelCase: <powerMode>
- CHECK: Avoid CamelCase: <resetMemory>

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ++--
 drivers/staging/sm750fb/sm750.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index d8cb9fce268d..996a586a3727 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -859,9 +859,9 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 	sm750_dev->init_parm.chip_clk = 0;
 	sm750_dev->init_parm.mem_clk = 0;
 	sm750_dev->init_parm.master_clk = 0;
-	sm750_dev->init_parm.powerMode = 0;
+	sm750_dev->init_parm.power_mode = 0;
 	sm750_dev->init_parm.setAllEngOff = 0;
-	sm750_dev->init_parm.resetMemory = 1;
+	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
 	g_hwcursor = 3;
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 2c9038d38b3c..d2c522e67f26 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -39,13 +39,13 @@ enum sm750_path {
 };
 
 struct init_status {
-	ushort powerMode;
+	ushort power_mode;
 	/* below three clocks are in unit of MHZ*/
 	ushort chip_clk;
 	ushort mem_clk;
 	ushort master_clk;
 	ushort setAllEngOff;
-	ushort resetMemory;
+	ushort reset_memory;
 };
 
 struct lynx_accel {
-- 
2.34.1

