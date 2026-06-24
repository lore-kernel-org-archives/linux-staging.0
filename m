Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0917329ACDD
	for <linux-staging@lists.linux.dev>; Wed, 24 Jun 2026 04:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782275157; cv=none; b=uL/BKm6v/Q86WQBnp09OmgR3VvGwrSAtKvTdELju9mm3joJbm/ALxdLYSu4KQaRNjXPahNRSq0Ds2HMfYuVVHNuR0uaBSD4x1P870KlCzwhVBc41cSA0L1CPnp3k+FYiAAoWugEJl9A2zMnuh5K47nnfZpZOr9Wgj2i8gvDVds4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782275157; c=relaxed/simple;
	bh=2Mf5YzI9FOUIILwcsDlxPx9GVkUDSpsOMBsA8x6mwQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V/2Zh4yHwFTXTqvvmk+E+SofJJrqx/JswOn2wYkAsys8qx2S7oRKhmPDCBsaPQAtH/vEmlUhl7wHV1oxZ8N5YZB0RXdsjtM7eX+e/H/tR1E6c962PKF3mUtt6HTEVsTtBx2vuUnSQzpEDMp3yfvd9jnWNxK28wI9zjeq/anbK3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chE9FXVB; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chE9FXVB"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c85a2c012e5so220618a12.1
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 21:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782275155; x=1782879955; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKeA8pkNSXwNkj1KAdbmazDlkEII0Ozzls/ozBP1lc0=;
        b=chE9FXVB2E765NRxlTReVnk6OTVhbJrJbPS3a2bU/Wd2p7UHModO3GQ9cmI1R545Ce
         eDYwouzjbdR5jhlsxdeRH2N9GKRt/V0BAOP+RmVA3n2LLWi4e5imFd+tBIZSsCtmuiwF
         0S9MMPDXas9Zbt9BaKqHr0cYyVsI47x/rWb6nXb4YjYWCj8IQxynz4WImgZV1t6rXKDx
         hLkaQmUEsm0dKyLOpvqx17hXTvdNmpszf4pGRyXXwD4fj622bPybtR4zFnqqdMx/HtEM
         /oIZy4kkIj99ZJfLrqIp8FgPOiRcHJsJPyjD0xYU2VyDyfEpdPPlk4Lp67tz2cIp8q4K
         QrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782275155; x=1782879955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wKeA8pkNSXwNkj1KAdbmazDlkEII0Ozzls/ozBP1lc0=;
        b=mXdy53rlcmisR/khhOHkcFq900miYLTDJtaLjx7ebZrvj1afXXzUwrFnbyrHPbVCnX
         OqD5K5JJqS350DZbTbDVA1Kpzal3pjoR2JVurVObCFp75WDH1PZv1toLXeqFTtq3HD3c
         y+MPBDnRA2vKrFaI17E+WuYHL9CIwTaJYPx3RIlKFALRum2nW/CHL1TLAEmXK61ZgrlH
         JB/Z5rIYL2jtj8DGm7BRv7H/ZC4muud9waJme0OKR+g49u9Lul5NdMXGSTQUuQl/zViC
         nq6T/7/gNRGr6tKXPL7pkex5Bxn2rOqdM+eFCEzVr0QdZufzgRcbUWwRYBjr65lhi7HC
         OOpg==
X-Forwarded-Encrypted: i=1; AFNElJ9KXS6szcBTjxSxCr3kiPE+5dYkqyBnJ8bJ8hW54/B45C+g19LCw4tRZmT5jN6IPdoiW3XGUkzEfhWqO0YZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwWuCj9tubrTiB7scZptYCIccpB9XbFePscanOLILkeVcz1CdAp
	TeIVP1sNuMwWxXE3V+GUfr0omaZe2F+X3mwtCH8Qw1VMWBARoPsYdIQX
X-Gm-Gg: AfdE7cmqXZLjKjilCnbsq6Z5XvU14K7npipFyxFj3pJ5nsc+gqj4n835dYq7DchXHiA
	7CAlH6HB9hjMOsM6P7ytfTI31Uae34o8iiujy0WvyctzItu3ho7yAf89gZe9x4NpXo3revGfMLq
	V/88Fz6Xh4NNwHhi9xLhXOiqltynCKE4VBfbuoMqE/VdG02v6/NNpAOyGwNNgvEL+9S2yOsaxZA
	kvryM5ZccjLNbQ+Nd+mbKWYJ3bvGFhxGP1ONSgVfMxJHuaMye6qzRwmLILpoeRH9zfX5dbTNbRj
	tauiABWd92IUFwo+BW97rz48ktbib9g39ppor8v1ycHm/HbV7xNyfuMBqF73vdlPiLF5h5qJ4Lf
	HIHOZHjW0iaMzr/hZr82iIjkj24qi90FQxFLZ3Q+/kLKlY9ot5QyIYUuVsQ/2lfpelMAWJ7TaGb
	EROMnMRlTIShn4tg9X0xLlll5O++/JMH2vt+u3mqUWNSE3uO4WlBIMJ2NOltSwNxloAiQG4zW0M
	XWTyf+hfTbl7ZHNfVHtXY7kje/qsieyn9a4fmt6SOWSLhkeiuUMf7w1kcW5qQISu/TY
X-Received: by 2002:a05:6a20:a111:b0:3b3:1ee3:2794 with SMTP id adf61e73a8af0-3bc51818e1bmr20766782637.5.1782275150486;
        Tue, 23 Jun 2026 21:25:50 -0700 (PDT)
Received: from kapoor.mahindrauniversity.edu.in ([122.184.65.229])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc3743bbbsm10889998a12.14.2026.06.23.21.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 21:25:49 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2] staging: sm750fb: fix remaining CamelCase issues
Date: Wed, 24 Jun 2026 09:55:43 +0530
Message-ID: <20260624042543.38925-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260621045340.65872-1-kapoorarnav43@gmail.com>
References: <20260621045340.65872-1-kapoorarnav43@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the remaining CamelCase variables and constants
to follow kernel coding style.

Rename:

* powerMode -> power_mode
* setAllEngOff -> set_all_eng_off
* resetMemory -> reset_memory
* sm750_doubleTFT -> SM750_DOUBLE_TFT
* sm750_dualTFT -> SM750_DUAL_TFT

Fix build errors by renaming the corresponding
declarations and enum values as well.

Reported-by: kernel test robot [lkp@intel.com](mailto:lkp@intel.com)
Closes: https://lore.kernel.org/oe-kbuild-all/202606240916.wIIrdOzC-lkp@intel.com/
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    | 10 +++++-----
 drivers/staging/sm750fb/sm750.h    | 10 +++++-----
 drivers/staging/sm750fb/sm750_hw.c |  4 ++--
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9f3e3d37e..858eda551 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -859,9 +859,9 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 	sm750_dev->init_parm.chip_clk = 0;
 	sm750_dev->init_parm.mem_clk = 0;
 	sm750_dev->init_parm.master_clk = 0;
-	sm750_dev->init_parm.powerMode = 0;
-	sm750_dev->init_parm.setAllEngOff = 0;
-	sm750_dev->init_parm.resetMemory = 1;
+	sm750_dev->init_parm.power_mode = 0;
+	sm750_dev->init_parm.set_all_eng_off = 0;
+	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
 	g_hwcursor = 3;
@@ -880,9 +880,9 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 		} else if (!strncmp(opt, "nocrt", strlen("nocrt"))) {
 			sm750_dev->nocrt = 1;
 		} else if (!strncmp(opt, "36bit", strlen("36bit"))) {
-			sm750_dev->pnltype = sm750_doubleTFT;
+			sm750_dev->pnltype = SM750_DOUBLE_TFT;
 		} else if (!strncmp(opt, "18bit", strlen("18bit"))) {
-			sm750_dev->pnltype = sm750_dualTFT;
+			sm750_dev->pnltype = SM750_DUAL_TFT;
 		} else if (!strncmp(opt, "24bit", strlen("24bit"))) {
 			sm750_dev->pnltype = sm750_24TFT;
 		} else if (!strncmp(opt, "nohwc0", strlen("nohwc0"))) {
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 67b9bfa23..9da154f1a 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -14,8 +14,8 @@
 
 enum sm750_pnltype {
 	sm750_24TFT = 0,	/* 24bit tft */
-	sm750_dualTFT = 2,	/* dual 18 bit tft */
-	sm750_doubleTFT = 1,	/* 36 bit double pixel tft */
+	SM750_DUAL_TFT = 2,	/* dual 18 bit tft */
+	SM750_DOUBLE_TFT = 1,	/* 36 bit double pixel tft */
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
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index a2798d428..59fb3a207 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -130,10 +130,10 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 		switch (sm750_dev->pnltype) {
 		case sm750_24TFT:
 			break;
-		case sm750_doubleTFT:
+		case SM750_DOUBLE_TFT:
 			val |= PANEL_DISPLAY_CTRL_DOUBLE_PIXEL;
 			break;
-		case sm750_dualTFT:
+		case SM750_DUAL_TFT:
 			val |= PANEL_DISPLAY_CTRL_DUAL_DISPLAY;
 			break;
 		}
-- 
2.53.0

