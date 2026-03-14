Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165A728850D
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 08:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773475791; cv=none; b=XidJ6S1MFKgHWSwgINLcfqnFGmEIskpB+3Uk6UmfCn2M3CwEiN0lVlePeXe4Bqrwyu1QL3IO4Ap68iICHIZAo5xgDegCU1QR+EMQa4x8YbwwEay2mxiBm1WlcuzLNlGHkhT5gh6WJhJXUAIi1ydnYOHGHPTqmL0JWxwz9Y3rCiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773475791; c=relaxed/simple;
	bh=Qi1liB3/1EEqA+PyFSxv7Q8niNIJ2IjrvWqcGIQIK1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qopyjkS8q8nPx3hABaoKodYlhxBktJIbM/XpwKnw/290AVCcejX3uBfCW86DoOvNCNicvgF6xsVnou/frm0ZdFaP7gnCfoYsDZLH/N7pqWn2PjkgnazcbtFDwxYscAD8iA+ECaf6nw2Hhs1Zi9Ltx+UTAt9FWaFJW8khgpv7Vd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fM+UK+T8; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fM+UK+T8"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c648bc907ebso2002330a12.3
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 01:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773475789; x=1774080589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xu7XjT6nGlxUJnW6WxPujTa3lgtVgoP7cgfnRGuX1Lc=;
        b=fM+UK+T8kDUF6jRzi+BShzA9VnOeKrI/QrcZlhpBMLMtwaM7lyCgUogqAGyrOmYTV3
         Leg/GQSF7PujDgGjUsxOB/QfxCNFQPw4z3F9+B06IJiVaDMePAd46Ya1gvBiAacxRgA0
         hNhI4XexbVk8rpLdR2yqLgFZ0wq3pv2yGgjdXnF5WgmRS8irDpjgbq5ff/+uKe8flkFg
         JCH5AzjslUGhama8mXhPJWegVTNpO5TFacnrAyzuvSvIcvW/a5W45Yn9LOzenvqRGMVJ
         N7zBX0dl2umpn38JdbXz4E1Vn9KfD9gp2ssJxds0OrT4fd59Q7Ajlg7j73IGj2WQCycM
         2Q1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773475789; x=1774080589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xu7XjT6nGlxUJnW6WxPujTa3lgtVgoP7cgfnRGuX1Lc=;
        b=l68+KF1WmnpbQuUBx9DkZtRRX5X0rYHoB6pkrLn3RNYdI3K4Y6dhFeROEO511kzbgn
         y+lBQ/Osphxx1lmDiG5JNBL00KgwcukOSgIu+HLuI6NA8dRNjfXtThsJ7e8h+6XPN95f
         OeRhwzWGqCZAIOlulddBHMYiGA2nINiH8hq14rEhuEnKZ5sViEcr6+Eu3Kak2mO+gb5u
         3YPBiE89lHPMiJ9lEKyxpL8Drjc+tI4eAyoEhMQTNl9Jb2LP/M9A9jTrkLuOIMGbQHRL
         xpeP0cQ5PrwxXrsuBCm84XZzzRYWOiod97rIoJCzKo8w5igBZKnwUUgZDEwGlcOsbCFv
         uWyA==
X-Forwarded-Encrypted: i=1; AJvYcCWcj6peIjH/BTNd2crkVyr8uEd1U4JEEfVyoGKv8MKwC4+ndfhh0EEdck7EZBqWanAWjgJZzHQEvuYWH+Aa@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9iBL9chaybLjrfS4PcGUksYaS2qMVjdU0VFMMBIC39NI9w/pI
	sIjTeks3x5Yvb+n7pJ24dbeerRvr7n2VvyGku09wu72itYQCZmopkvt+
X-Gm-Gg: ATEYQzyQDwVkUNNzS9Tn7P77HTYT8gokVebY9HBPhUMEz4bYku6B+Uke3wYlGrcm/Or
	K/0nSx5dM/7fz20WRheaRkEVaz/Xcxc1eioboYlilyIFfDS/vDEM5qx3YpRYTE33O6Bm9YP4XOe
	/VLFBRsWF5e2iiZXH1NtbSkULbir638urMc7i/L3gRKrkcV4ENohG9e59YY/QoW7HzQ2MALLyXC
	1YkT3sFZDMt5Ku92h5FGD2qC89PHua1Q2DvH5ZFvKFjmmBWuSmb6wBlT3gjvd8zwGz8pOklb3mB
	NUPX7vnirmE50YXNt+adbZc6DGDIxF2c8m500byo3qPcLNGJtRJggal4J40KT/Q+GGvM22ZJSTe
	+fUGDQGyU4Tf+nMpg1o23pv4RspSfgt5/QhejcrqHD+wSQNBlCWR9jSXAr2obrtY/OygYBL+OO0
	TM8nTvpzaCKsy3ohnNNbwLji2JUH36veBm
X-Received: by 2002:a05:6a21:7106:b0:398:7946:b70d with SMTP id adf61e73a8af0-398ecd617a1mr5324392637.51.1773475789383;
        Sat, 14 Mar 2026 01:09:49 -0700 (PDT)
Received: from fedora ([2409:40e5:1052:9a56:d0d2:2da5:541:7e3c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb9966d9sm3665378a12.11.2026.03.14.01.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 01:09:48 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH 1/3] staging: sm750fb: Rename enum sm750_pnltype values to snake_case
Date: Sat, 14 Mar 2026 13:39:30 +0530
Message-ID: <20260314080934.135457-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch renames the CamelCase enum values in sm750_pnltype to follow the Linux kernel coding style.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 drivers/staging/sm750fb/sm750.c    | 6 +++---
 drivers/staging/sm750fb/sm750.h    | 6 +++---
 drivers/staging/sm750fb/sm750_hw.c | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index dec1f6b88a7d..729c34372a1e 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -942,11 +942,11 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 		} else if (!strncmp(opt, "nocrt", strlen("nocrt"))) {
 			sm750_dev->nocrt = 1;
 		} else if (!strncmp(opt, "36bit", strlen("36bit"))) {
-			sm750_dev->pnltype = sm750_doubleTFT;
+			sm750_dev->pnltype = SM750_DOUBLE_TFT;
 		} else if (!strncmp(opt, "18bit", strlen("18bit"))) {
-			sm750_dev->pnltype = sm750_dualTFT;
+			sm750_dev->pnltype = SM750_DUAL_TFT;
 		} else if (!strncmp(opt, "24bit", strlen("24bit"))) {
-			sm750_dev->pnltype = sm750_24TFT;
+			sm750_dev->pnltype = SM750_24TFT;
 		} else if (!strncmp(opt, "nohwc0", strlen("nohwc0"))) {
 			g_hwcursor &= ~0x1;
 		} else if (!strncmp(opt, "nohwc1", strlen("nohwc1"))) {
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 67b9bfa23f41..49a79d0a8a2e 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -13,9 +13,9 @@
 #endif
 
 enum sm750_pnltype {
-	sm750_24TFT = 0,	/* 24bit tft */
-	sm750_dualTFT = 2,	/* dual 18 bit tft */
-	sm750_doubleTFT = 1,	/* 36 bit double pixel tft */
+	SM750_24TFT = 0,	/* 24bit tft */
+	SM750_DUAL_TFT = 2,	/* dual 18 bit tft */
+	SM750_DOUBLE_TFT = 1,	/* 36 bit double pixel tft */
 };
 
 /* vga channel is not concerned  */
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index a29faee91c78..0e594734a8b9 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -134,12 +134,12 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 		      ~(PANEL_DISPLAY_CTRL_DUAL_DISPLAY |
 			PANEL_DISPLAY_CTRL_DOUBLE_PIXEL);
 		switch (sm750_dev->pnltype) {
-		case sm750_24TFT:
+		case SM750_24TFT:
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

