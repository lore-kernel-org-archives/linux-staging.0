Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9D83806D7
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 06:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770187289; cv=none; b=KauF/DtkR55DkJKLlgjwcE1QUbFS/X2WHKjQ8xeE+TKbZuhhKF5hdfXetHcDPLU2rAMEGBijXzUHAdvG+z+Hp8U0fhpzugd88+LJNY0YjT9zj0d8/mq1hKDzSx8BrkltrMOleMI2HNxmrKYB3fMMTY6yd7fDtoc3k+j/HomJbAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770187289; c=relaxed/simple;
	bh=c3Ki7YhXJGsrY1EHJdXQahN87wiUTEcPt2dcaioG84k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JBJciLWgvb7isaOL8deGdLUaUZFKcIqJwU8XGYuzyY8QJ+7j+JUupQze/nw4eZAajjcIilS5w5dK6bNnRCy8/qGhxJoN//KamDjl6RUMD3LTIf+/8xAL/KwcrppwVsM3CXst9pFMLEBudhXK7uGijng05dgA8c3CpYsqXsVs0HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRJ+m6Fq; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRJ+m6Fq"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-350fe1f8ea3so3155223a91.2
        for <linux-staging@lists.linux.dev>; Tue, 03 Feb 2026 22:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770187288; x=1770792088; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bA1AdF9WhHexthfe8YUVwhafTHXgnPEul4eYzpiPpqI=;
        b=cRJ+m6Fq7BIOZxN4bYp426j5c0YgVRls1I3m51Rk9+0EUIuATH898k0x638Mw01J3+
         Kws2rALeBqIfxVueQIgF0YfwxFVo4mauayhjhBT+JBeYvVGB+cZ//iDB7uWoL7w6Jloo
         E9xrkpVgvgYkp/MBZCxVzyxvU4JFf6TsjT/kSeXrSUqymIU5aPvQukD4mkeaTsQb5nTV
         yJ0Znm+ICTTLUJzUczU6Xwj06s/kzAKi7QHb9dWHoIw+QN0T3Ec49U2ab+K/5g+ymKbv
         nJ+fSQd2efBb2etMPKvSLMKhyDRN4FPNo1yWKESNFrzXjN0LD2ApRF8bDsL+rkIW+bNd
         xKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770187288; x=1770792088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bA1AdF9WhHexthfe8YUVwhafTHXgnPEul4eYzpiPpqI=;
        b=lI5NMpx9I5gxJuCJzO/gK8hOIHYD7nn1jxcH7I5Q0ZtY1X9UskXKupJNSkVlup+x6G
         uwMnfqWupEp/UsnPH/fRbtH4fHAW5l6GF+GegIDQfWuI1wGYpG3rI3TFGn/+HVuccrk4
         f8s0qEisyrZInrXEDHojOATWyOH7SorZXVcmwbj6wJvxIoZvaAPM6wJfnRVNGrkKTH7J
         qLtj5RQu8PiX6mxCdXUzd09l4MgpfZaUj5EOONeUWcnL8Qz2n0s++2LJBpIntX1WqoTP
         TwYLGekFUTH3mN2XlP+kU3XIQLy2MkC4m86Oas4LQsV8T3S5nXcUZ9TPSoehhJvOFFKb
         c9Qw==
X-Gm-Message-State: AOJu0YxJJl6BZB1qjOgz37MrWFEIL1S56EtFRAIoFE92jaJMVTXRkHnT
	zsd4cCYlzIIN37xcsPBH1jMuUzICeECLY5syzJvsIMNId2mBXRAsY6gm
X-Gm-Gg: AZuq6aJ39fr+neLNkiIoeK9i4bxUiulAl28LaItZWJshuKi5TinC2QyRKGHNtM/WWY6
	n5QZotOWH0utV59m0EcMjlNS4lrWFWClq9ps41gADt1bfmaGYxqDRXjgmaIwuNLt+6Y+2+Bv3q/
	PQx6/4+jiV/06YmDvguf170vjjoxCxZgredu7SDosaimTM7aUXP1nmfpqZ3slZA8i2OLsKWUa+4
	39uObPY4heIReDK8wuEhSl45Vt1YHIzTdrCOag5V/OwOpvHHMnnHts9LHeU05AdhPwFV8VfwuLY
	F9binViYTRH4s/5bjcOx5VG0PvXCPIzBaWk5cqbwSAmo4dEdzBetjVT1AqQyjhjiNrqNof7Sj+v
	sd1OR6v215mkiwdjIIwWEQhuUh2pd77hPPzWqflLayOP7USzufxJXJ7GfLinfwxtIMcms2zp7f/
	Kcc2j+vB/2BRL3
X-Received: by 2002:a17:90b:3d84:b0:34c:27ad:71e7 with SMTP id 98e67ed59e1d1-354871f826bmr1665256a91.35.1770187288369;
        Tue, 03 Feb 2026 22:41:28 -0800 (PST)
Received: from mint.. ([2401:4900:53f5:9794:567c:c0b1:37aa:12a9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35485edfaa0sm1434650a91.13.2026.02.03.22.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 22:41:27 -0800 (PST)
From: dhyaan19022009-hue <dhyan19022009@gmail.com>
X-Google-Original-From: dhyaan19022009-hue <dhyaan19022009@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dhyaan19022009-hue <dhyaan19022009@gmail.com>
Subject: [PATCH] staging: sm750fb: fix naming styles and const declarations
Date: Wed,  4 Feb 2026 12:11:12 +0530
Message-ID: <20260204064113.21801-1-dhyaan19022009@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: dhyaan19022009-hue <dhyaan19022009@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    | 26 +++++++++++++-------------
 drivers/staging/sm750fb/sm750.h    | 14 +++++++-------
 drivers/staging/sm750fb/sm750_hw.c | 22 +++++++++++-----------
 3 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9bf3c0a37..13d513bff 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
@@ -740,7 +740,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		"kernel HELPERS prepared vesa_modes",
 	};
 
-	static const char *fixId[2] = {
+	static const char * const fix_id[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
@@ -764,7 +764,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	 * must be set after crtc member initialized
 	 */
 	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
-	crtc->cursor.mmio = sm750_dev->pvReg +
+	crtc->cursor.mmio = sm750_dev->pv_reg +
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	pr_info("crtc->cursor.mmio = %p\n", crtc->cursor.mmio);
@@ -862,7 +862,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	fix->ywrapstep = crtc->ywrapstep;
 	fix->accel = FB_ACCEL_SMI;
 
-	strscpy(fix->id, fixId[index], sizeof(fix->id));
+	strscpy(fix->id, fix_id[index], sizeof(fix->id));
 
 	fix->smem_start = crtc->o_screen + sm750_dev->vidmem_start;
 	pr_info("fix->smem_start = %lx\n", fix->smem_start);
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
+	sm750_dev->init_parm.power_mode = 0;
+	sm750_dev->init_parm.set_all_eng_off = 0;
+	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
 	g_hwcursor = 3;
@@ -942,9 +942,9 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 		} else if (!strncmp(opt, "nocrt", strlen("nocrt"))) {
 			sm750_dev->nocrt = 1;
 		} else if (!strncmp(opt, "36bit", strlen("36bit"))) {
-			sm750_dev->pnltype = sm750_doubleTFT;
+			sm750_dev->pnltype = sm750_double_tft;
 		} else if (!strncmp(opt, "18bit", strlen("18bit"))) {
-			sm750_dev->pnltype = sm750_dualTFT;
+			sm750_dev->pnltype = sm750_dual_tft;
 		} else if (!strncmp(opt, "24bit", strlen("24bit"))) {
 			sm750_dev->pnltype = sm750_24TFT;
 		} else if (!strncmp(opt, "nohwc0", strlen("nohwc0"))) {
@@ -1121,7 +1121,7 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
 	sm750fb_framebuffer_release(sm750_dev);
 	arch_phys_wc_del(sm750_dev->mtrr.vram);
 
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->pv_reg);
 	iounmap(sm750_dev->pv_mem);
 	kfree(g_settings);
 }
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 2dc57bbe7..19dbb9120 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -14,8 +14,8 @@
 
 enum sm750_pnltype {
 	sm750_24TFT = 0,	/* 24bit tft */
-	sm750_dualTFT = 2,	/* dual 18 bit tft */
-	sm750_doubleTFT = 1,	/* 36 bit double pixel tft */
+	sm750_dual_tft = 2,	/* dual 18 bit tft */
+	sm750_double_tft = 1,	/* 36 bit double pixel tft */
 };
 
 /* vga channel is not concerned  */
@@ -39,13 +39,13 @@ enum sm750_path {
 };
 
 struct init_status {
-	ushort powerMode;
+	ushort power_mode;
 	/* below three clocks are in unit of MHZ*/
 	ushort chip_clk;
 	ushort mem_clk;
 	ushort master_clk;
-	ushort setAllEngOff;
-	ushort resetMemory;
+	ushort set_all_eng_off;
+	ushort reset_memory;
 };
 
 struct lynx_accel {
@@ -97,12 +97,12 @@ struct sm750_dev {
 	unsigned long vidreg_start;
 	__u32 vidmem_size;
 	__u32 vidreg_size;
-	void __iomem *pvReg;
+	void __iomem *pv_reg;
 	unsigned char __iomem *pv_mem;
 	/* locks*/
 	spinlock_t slock;
 
-	struct init_status initParm;
+	struct init_status init_parm;
 	enum sm750_pnltype pnltype;
 	enum sm750_dataflow dataflow;
 	int nocrt;
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index de1331c56..9e69f3387 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -49,19 +49,19 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	}
 
 	/* now map mmio and vidmem */
-	sm750_dev->pvReg =
+	sm750_dev->pv_reg =
 		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
-	if (!sm750_dev->pvReg) {
+	if (!sm750_dev->pv_reg) {
 		pr_err("mmio failed\n");
 		ret = -EFAULT;
 		goto exit;
 	}
-	pr_info("mmio virtual addr = %p\n", sm750_dev->pvReg);
+	pr_info("mmio virtual addr = %p\n", sm750_dev->pv_reg);
 
-	sm750_dev->accel.dpr_base = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
-	sm750_dev->accel.dp_port_base = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
+	sm750_dev->accel.dpr_base = sm750_dev->pv_reg + DE_BASE_ADDR_TYPE1;
+	sm750_dev->accel.dp_port_base = sm750_dev->pv_reg + DE_PORT_ADDR_TYPE1;
 
-	mmio750 = sm750_dev->pvReg;
+	mmio750 = sm750_dev->pv_reg;
 	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
 
 	sm750_dev->vidmem_start = pci_resource_start(pdev, 0);
@@ -79,7 +79,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	sm750_dev->pv_mem =
 		ioremap_wc(sm750_dev->vidmem_start, sm750_dev->vidmem_size);
 	if (!sm750_dev->pv_mem) {
-		iounmap(sm750_dev->pvReg);
+		iounmap(sm750_dev->pv_reg);
 		pr_err("Map video memory failed\n");
 		ret = -EFAULT;
 		goto exit;
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
@@ -136,10 +136,10 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 		switch (sm750_dev->pnltype) {
 		case sm750_24TFT:
 			break;
-		case sm750_doubleTFT:
+		case sm750_double_tft:
 			val |= PANEL_DISPLAY_CTRL_DOUBLE_PIXEL;
 			break;
-		case sm750_dualTFT:
+		case sm750_dual_tft:
 			val |= PANEL_DISPLAY_CTRL_DUAL_DISPLAY;
 			break;
 		}
-- 
2.43.0

