Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B57530E84D
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 17:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855315; cv=none; b=fzG+rmS6/cm4jL/1ONkUz21gyiSzIVlUnOpcqtn+KDKaW8K3sZODh3hBeFyQU85uTnm3Ih93H7s+pPq1sEUsPjHlOXZW3jXEa3IqTGq9pBNSV/cqVMFWddHho/HoVKtksNjQtHYJ4IA9wydaq3r3o4xCkpA0srRnPX5u+GwmDlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855315; c=relaxed/simple;
	bh=rR07kCb2PuO0EImE0YyhNwV6UOCHJ3Di8C3LXOSRM04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lfSwg4VHzohofPq18Hy+6rSJ8E+lGEX3D/QrIQ4CX2YUSyOV9v570tEt2ve6aNSiGLEgKPBODRrSJE4kOH7AhPlWwf3wed07tNqFcpwCSOFmKFuW5uuGke0JtHQKUEXBah0mPB8tEIH6td7by7OMXkvTS+fij9h0NOO+HAc/ZwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3BRaDcL; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3BRaDcL"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so100440a91.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 10:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773855312; x=1774460112; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5kGIt5RghCPjudSHSFgmLJ/qLunO5CFRngRci7V01I=;
        b=J3BRaDcLw0P3W6YZT4OKUyUtrK/u3Twq6RUdhA67Xm5DVjZC8HC+HFnHFFykFuBtDh
         ipqsQplRi/tjHR672oM1DBODd8ZNnZ+pFO4oeHfRje+3ZpWyhPU1P4XiVRKgscZoauPm
         +iM4N8Ui1ASiXtBGysE0mnc2rTdy1g+vcQqB0bRYMlMvcwDxpQSaADQjzljiWyf3l4fi
         m8VtC34C5mUgzww+yDcRn2PkJce6Vv3ElWwMQJ1wf7cm5rs2K++Qr3pIyOpssinJttOJ
         HyebWN5t9O4LjIpNpsP7phK1ummZecBmkvJXCOJLUTUuz0TefRsB+u/G7L7ZOlt+sB3m
         VlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773855312; x=1774460112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c5kGIt5RghCPjudSHSFgmLJ/qLunO5CFRngRci7V01I=;
        b=aLbDsHcpcCKDxVwx/hrVGLlDZ3Wb5MpNys37Oj5sP+M3KJ7pyE4ERtGQX8p9b9nAy+
         L+c11fhtwgifKsfPeb1hASEE5gotdScn5d3Ri6IVstJ97kTQIMFU61LuVFDNQ7pxgQ7Y
         h1TI+FVOkjYzxOsRPlRWvcZ9bLT+ZsZtaAeQas398FS4vz5ZKzSmsBJ7uIvPlnrcKMsR
         eQhQMmTaHOtoq5wkCJsB8nfF2Lz6HlbuMpcg7OglkgCprOEgJGkm6DPB0dW558eA/pNM
         mRtBcfQIkPYbS7z03fVEsFG9mjF/PiS01joHqpPJDAtkDQ8S8cFythCiVE/upBDV3XcI
         sTgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxdnYImw4hc3x75/s9t/JD/bc73pf0dFaGZBItksSaL7AZ3XpeWr+Sxjei4juNyquj5qT9PfpXhkQM+ffS@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7ewNPY5jQfF5vgxVTE2qJUEWhT6oCGIUrIZScI370MO1sT1Hg
	VF02nMv42YdQVwifbjrBBeEdjibDI/WEMnnnkJYNwHH2xdtNSAGj7mgF
X-Gm-Gg: ATEYQzwNtC0YReApouJV+POGBPgvYBxjPQs3HlPMw3ERw+ud/tN9oOXA0IOrpQVEbMZ
	QvOogXiCAWZ7Gvp8EJKI7m38uBooPd7OVIOQTbW90ctyfq4UJ0gbc9Xi0j4GHUFNst1hXeOLWRt
	k6X40TNctNi9nprwWhdqaqVoi0aco3dFkQKiRZYFOowXjVjY8ZVuY9m9xBPkHPTSSSpyG6RJDr0
	tHcmbECklxpsyESVJ4jgtzraokJtWTBXM4vJsZz78+LY6kOKsB6nT/UCqLatw8BpXL46SHWxeZH
	EYA2lz7TE0m7v2DNS5cDwGAs5Rz1NjDPMgMGqHuaWR+bI0ojZyp45EoaepDOXRmQ6/V5BYnOlvS
	rNssuNIxJRuuo/wjZKmOFvUX5Em61JvZoj+YnZ+Q1YMAQyOoh6xmevAEU2kuribSFPmPOVONIAy
	3XrSgHbu88DjbBoXku7BOxEvaazqiA0oPg8W44olGSi/iHjA==
X-Received: by 2002:a17:90a:d604:b0:35a:24f3:2c88 with SMTP id 98e67ed59e1d1-35bb9e579c5mr3945996a91.8.1773855312376;
        Wed, 18 Mar 2026 10:35:12 -0700 (PDT)
Received: from fedora ([2409:40e5:1052:9a56:3b6f:933a:89fd:e530])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ff704bsm247103a91.2.2026.03.18.10.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:35:11 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: gregkh@linuxfoundation.org,
	sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v2 1/3] staging: sm750fb: Rename enum sm750_pnltype values to snake_case
Date: Wed, 18 Mar 2026 23:04:38 +0530
Message-ID: <20260318173440.9457-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318173440.9457-1-chakrabortyshubham66@gmail.com>
References: <20260318173440.9457-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch renames the CamelCase enum values in sm750_pnltype to
follow the Linux kernel coding style.

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

