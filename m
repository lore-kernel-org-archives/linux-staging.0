Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE9E345CA8
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 12:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515919; cv=none; b=dOVnlGKZdy4Ir5dfld/JJ6kqqBB1JlF9dyRTV51fmjn8swR5P3q3FQb52iV5scLf2080rgrlKNFw9Xz0MtwJiRajmQu/pF9kyU0aANktkU6vNxPdqalBjV6RZ1N106/0Ly009L7qUWH4Sa7t4YsZHjn3Renx2qw8C2K+/WFIkkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515919; c=relaxed/simple;
	bh=b9v22AUSCfTaKIsQ4VFtZPDmF2c1At2qTNXouGoPoho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rFYDkuLJpK6gC0WGy7dXMCfocSxb/TnAH01LQxfWSo3Wi+o0v8InpIdODBpsXtGCw8qPayq5O6HKSqqerVzGVIUauO2twzFUr7/TiDmwjiQ17+hdG2HV/xMlAE6FiAAPNHDAKECfVmgDx3O4j7PBIlMejdECN3OGqCi1bN5Po7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LErBIZZk; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LErBIZZk"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-435903c4040so3416150f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 04:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769515915; x=1770120715; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1wsJb+rtQg6iY1Y2LWY03K9kG/QiXgPzzCpfegIvLgs=;
        b=LErBIZZk4s+4KO1QGgbLH21RBadZHQD6hi/HwG736Y1krzo1Yz7A0b98ehhvzUtmVL
         +SskP2Hr45qphVimUECYZUEI8ujoPPpozfwF9VAgPcGUb8WWfRaYZtaF2fjXuWKAVlM7
         2QgEF8DXM4Qs5a3oKbIOyhHutrMvmqhXtcR7/FY+edZjjmPRbRFlFrLEPnZlZ2uH/O+/
         i7++IFCIgOJqIYLp4+Vy6rCoo73nxKCDIbLSi5Jn2zW56wu1xzy3azqh9Lb/G2oSAmiC
         3UmHmlH7Gw+QF/tQaz7EGVpu4UT/yy+HeW5M9EMXKlPH8rf3A4eY7j/j4wAMqqKaEBxk
         o+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769515915; x=1770120715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wsJb+rtQg6iY1Y2LWY03K9kG/QiXgPzzCpfegIvLgs=;
        b=wj7ndQR2D3o/MJpm53odb/8NLfCny6rlpZaR2rUfXsBxfHxYbycZoruLBKoZAgpFk0
         bLhnyTIQoYetCBKhC5Pd+FP+r/53Nlp1DtF+N4yMOUNtsy0NQJhHN4lPm8kAotdLQwRh
         DOINUXSm+dTemzYl5hbCJwDvhybbrG5oMPv5j5z3oY2lbbI6XUHo/4oSJi3y3zpBQFqJ
         kGxt+UNu+QnuCdbQe3fYz3830mhVIAuwglRMwRg09zmrZRxJZqCk9OSx0HAihgirpwGz
         1JueyF3KBBVoz4d8lEQkhIpIkBUTRWxfFirR9GGQC3XcHxjP+oHpelTvHqH3ysFR6Q/F
         szKw==
X-Forwarded-Encrypted: i=1; AJvYcCUAULet9HrxB2Cig75SkommEk1DrkgoaEV7eneemXxShh3PMmmwrKQSVs4141HUKepBi+h/p1gJJri3Bdn/@lists.linux.dev
X-Gm-Message-State: AOJu0YynCjzT8Tw2Xq8Iupo4cMV3E71Bga18i4unhNdf6rAspKHfok3l
	JxtY3r3KK94R8+UKuxFk36j6qZEHCXdaenVRLuT2jR/0UTJtHg4X79j7
X-Gm-Gg: AZuq6aID98nCD5Ykp19znI2ErqEcvjmyW8GGJNSLSZyLIRN+7xpYPQlzy/bGRuG+KZ2
	/jKCUR6BSMIDQiCWoBMoPvcw2fBb564KC7Yi6dKdERhSfWnwrtpHA5BcfkeJXJp982dpmRvlmey
	MeO0t45e9f4vyKMvtpWcwIE7okFUbf6TMTeKkwxPtOWnyVCVrU7rO7tv+xHW2a7/vUcRmec9ZuX
	8ONhCRKUhmGHwXHM9CxWiFk+l29AcM1eLe14RMeYM+Ok3rZ92sb9GpLS2K86K6uXlMqw1DTxAfD
	D2Hy5cLl1zQVePumrq2frzq5k3YEsc6TxDtHqysKwUBvPOQjmMyOegIP++uTyCmFHsiBWU36QWl
	lQnJq6VPkZFwj7RLdqFQ/8QNdYRyonPhy4zn0f2RWEscCiazSGfix6aWgnrb3r5bNl5Re69drmi
	dUg9mAfpyO5T5mqs4GiwM=
X-Received: by 2002:a05:6000:2088:b0:432:4c01:db00 with SMTP id ffacd0b85a97d-435dd06f676mr2285348f8f.27.1769515915207;
        Tue, 27 Jan 2026 04:11:55 -0800 (PST)
Received: from Madhu.broadband ([83.106.123.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02dd4sm37407236f8f.5.2026.01.27.04.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 04:11:54 -0800 (PST)
From: Madhumitha Sundar <madhuananda18@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Madhumitha Sundar <madhuananda18@gmail.com>
Subject: [PATCH] staging: sm750fb: rename initParm to init_parm
Date: Tue, 27 Jan 2026 12:11:48 +0000
Message-ID: <20260127121148.36632-1-madhuananda18@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style prefers snake_case over CamelCase for
variable names.

Rename the 'initParm' member to 'init_parm' to comply with this
standard.

Signed-off-by: Madhumitha Sundar <madhuananda18@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    | 12 ++++++------
 drivers/staging/sm750fb/sm750.h    |  2 +-
 drivers/staging/sm750fb/sm750_hw.c |  4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index fecd7457e..6f15131ee 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -918,12 +918,12 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 
 	swap = 0;
 
-	sm750_dev->initParm.chip_clk = 0;
-	sm750_dev->initParm.mem_clk = 0;
-	sm750_dev->initParm.master_clk = 0;
-	sm750_dev->initParm.powerMode = 0;
-	sm750_dev->initParm.setAllEngOff = 0;
-	sm750_dev->initParm.resetMemory = 1;
+	sm750_dev->init_parm.chip_clk = 0;
+	sm750_dev->init_parm.mem_clk = 0;
+	sm750_dev->init_parm.master_clk = 0;
+	sm750_dev->init_parm.powerMode = 0;
+	sm750_dev->init_parm.setAllEngOff = 0;
+	sm750_dev->init_parm.resetMemory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
 	g_hwcursor = 3;
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index fcb7d586e..67b9bfa23 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -102,7 +102,7 @@ struct sm750_dev {
 	/* locks*/
 	spinlock_t slock;
 
-	struct init_status initParm;
+	struct init_status init_parm;
 	enum sm750_pnltype pnltype;
 	enum sm750_dataflow dataflow;
 	int nocrt;
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index ce46f240c..a29faee91 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -93,7 +93,7 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 {
 	struct init_status *parm;
 
-	parm = &sm750_dev->initParm;
+	parm = &sm750_dev->init_parm;
 	if (parm->chip_clk == 0)
 		parm->chip_clk = (sm750_get_chip_type() == SM750LE) ?
 					       DEFAULT_SM750LE_CHIP_CLOCK :
@@ -104,7 +104,7 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	if (parm->master_clk == 0)
 		parm->master_clk = parm->chip_clk / 3;
 
-	ddk750_init_hw((struct initchip_param *)&sm750_dev->initParm);
+	ddk750_init_hw((struct initchip_param *)&sm750_dev->init_parm);
 	/* for sm718, open pci burst */
 	if (sm750_dev->devid == 0x718) {
 		poke32(SYSTEM_CTRL,
-- 
2.43.0

