Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1443A380E
	for <linux-staging@lists.linux.dev>; Tue,  7 Apr 2026 07:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775548108; cv=none; b=cRxrhLd51Bg2UYCYtRnQ2rDnSlzzgyk96Maa7SApaoN2QdEOAZ5j5jO+OzUdQ3vYQ1kxHDqi0YGS5VMP3ZhNLZtUlICJ401bJ6cwY79nhqHPz/QPnbC0XKvUrFuyD2XkqTnnoI2YV0lTrdhd5GJLnPIqxYY5I6dnHD8O+SaHbM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775548108; c=relaxed/simple;
	bh=eYS4q1hhfGfEjPTVo2MAMjtGc+4o9uMh3oyKyZQ0zf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y27VCChWtUZPpZwn/xgYQm9raHLDYKRFrLvZv+ik7DA0nVerAZarZdlbh68DH02/cYpYed+3XfjWL8s6r13X3bRUEd16X54yuB/aCAU0xOs9fNOYf0SCLv+Pm0rISNCrVourE8Kpy9vRnmc+jAZ696x97i2HqnxdO2DQ5NonnNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dj6T1NGs; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dj6T1NGs"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c76b9efc299so1890262a12.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Apr 2026 00:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775548106; x=1776152906; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIQhC6F608N9WuxvQ6whrebBgn5g/yKf1QU2tQg2AqA=;
        b=Dj6T1NGs4uy7CJLKT7ON7B2WotZpqEbgJFFRKt9uP7y9WchvYflKPa+C4LlRBDFwyR
         XrMigVh+VacrR60UZNZYCr3F9GRQmnxleGtNjXiy8eyor3HeICTwumH4kWKMt0A7EmGV
         0YZnrXmOEMxbNHANtsY0232w4h960iDYuyfBtmFTlnWO7/gXVsICm2J027z5o2vS8UhR
         i5mTZwazNewvnUrrgQ/ta5V8ZXQUDegLbauCweI8BCEdlCcYd3G5sA2oFSmugegICA6J
         p3HYNJV3cMgt/7Oc7qkPVZkH5+901/ou7FG/6x6nw1E98JtJddTcHxtcv8fIlwcGwly8
         fqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775548106; x=1776152906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yIQhC6F608N9WuxvQ6whrebBgn5g/yKf1QU2tQg2AqA=;
        b=mYw7UcxEtp31KGWJPrGgHd303z8ouDY5jZ0TJdFCtsvs/bT4r4fVO6TQwYfn7Ew7Z/
         sxKyEL7sjr1pUlxoQzg/4ecaOofetANfEW1jx2WmXDhFjOVSsFxGVGm8DQPet105yxv5
         5Ugzo7R/JTIxP0+lZvrR36YnToAzJTcRfdCL4B0WcBJQKo00YZFLk5tOSiH/KG91tDhZ
         D21iScQxJlcbSuf8V1Ibgr2io20KsWVSog3AROLRNNkt+r2Sv36x0wqNluMnmQHmn/EP
         0kerQD/F4vy5970nuqs2ZMZcR+cp1RmVjSl4l39gUWv4uBaVBOD6cDajR5MOy82EeqPs
         o2dw==
X-Forwarded-Encrypted: i=1; AJvYcCWwMgzrbXwAxdd9cNUnjhpzOVp/Z2Dh2a2YAcVyQkJr9Cpk8Ga7HiIA2p2nmSRh+FD9EIPASCslFW5zESSp@lists.linux.dev
X-Gm-Message-State: AOJu0YyARR6kdKrFuWsntIEtcuCRUS9A2XDkd7n539veEWXJR4QsWO8e
	kdIw1NyIh0PMHyVyhuCvnxKM5aLCjkF7dTkU95p3S07LTpix5VpF6zJ4
X-Gm-Gg: AeBDietuNJ6nhduAgdY2dVl4cw5WWQToSGSd4uHydwmhjiTJC3tPtXdylJ7Nb6HbQY/
	E63+g5gA0WEPTxS0dO7pRwvUG9X9xuPqlRJN0IZdHLGoUXwbIzieWYIDrc6FWz0KvroZF2C5jyd
	R5kvg/47WHnW49TS0iKFqypNhhlk07qLngHgmkkoxk6v8RFZ7awEkt8GjgeGrHwGYsmMtrMymp4
	DlKRtjnfzttAZFY857tWfb1lgAJWLs4A0UdQl9UC8pH358KsxRDX8ZudIJawDgAOX7HQ2aOISk9
	hLmlEGRFplqy6II0OFaubo5UaD4K2Cicp7pyKgq0rVaIv0b7uybTcigG7HRL7us3Vi/7KrPqTEo
	NTD944kDmpF7Eka5J4iJX60wORZSTwBlgFVz4bjx4D6t8EodBHju0hvYAkeYVlrB76mg4eHlIoB
	0KQ+DrVDNPVVIws+oMyUvwF4RqhP6vFJM6LQc=
X-Received: by 2002:a05:6a20:4f15:b0:39f:94cb:1cc with SMTP id adf61e73a8af0-39f94cb0749mr2018043637.46.1775548105951;
        Tue, 07 Apr 2026 00:48:25 -0700 (PDT)
Received: from fedora ([2409:40e5:1126:477b:379d:30fd:d3e2:3b3c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c9ba21sm22093716b3a.51.2026.04.07.00.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:48:25 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v3 1/3] staging: sm750fb: Rename sm750_pnltype enum values to upper case
Date: Tue,  7 Apr 2026 13:18:03 +0530
Message-ID: <20260407074805.14505-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407074805.14505-1-chakrabortyshubham66@gmail.com>
References: <20260407074805.14505-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the sm750_pnltype enum values from mixed/CamelCase style to
upper-case names to follow kernel naming conventions for constants.

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

