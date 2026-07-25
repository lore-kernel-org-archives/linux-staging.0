Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700DA16F27F
	for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 08:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784969240; cv=none; b=AbR/2tt/Ln7O6YiOIXe/Q3G/UQjBH6RbFGpCnTi3r+8npOKacE3Zv/PTuGazaOLhWEOnQwrxKGVZWgAeIm4k6Tw+xtGpfK+SKrx/6ZXg89GZc23tnvRPwK7/ab8pvyvShBTDIxSTLsremS2rHaUC2Bef9j3/25nClPL8jGE1ihI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784969240; c=relaxed/simple;
	bh=87uE3+1MWKBH30S/pn6Z+e0Vh4c1f7Hn2MtsmKT9k/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BSmpzv7JA4zlJ7HIzs+YjFpho8myyJealEvHets9H+rFlIqwIDLoTsrkB1bqWtQcnkHUFEcYTbjecTZxqRPYxvPllSLU81vQYql6uPIkm5CbEWRdLeYWitVbZabXgHUW4gYwQetZFFCiBwbxXjoXU77SFNEB3XB77UWxaA6E9gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4y4ePyf; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4y4ePyf"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so867138a12.0
        for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 01:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784969238; x=1785574038; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KmO9DP/Mwr2vrVuJ6JkOJCszunxgIku+lVRBnkJid0k=;
        b=W4y4ePyfLJjhV7sMw/RV+WJi1TiE8k52gw1HVaZ3gLnbtEiBKJNPDxTNxXU+vcXRHd
         112iQkct51rAUWwp1G+ciJos6xFwBRWSO+eQJ0HK5NXkbZtJxs0XRhX4jYZtIEtEW84/
         5guaq5hY/L/0iM+xrKteduGeutZ0IINlDB9VHL79A6FNVxqmpN+etAnQ8Ynl5ZSSYpvb
         gwc5tISjHdaYBYKxNOPavOXrv9kc4y6lUCfIh+01uvWF5njekiaL9fdvU4Gq5+1t8GhY
         96WiYXxoQU8vmbpIVegZrMbxhx1FtXyzlkVUWbSOV2jNxnUoGYbCadWR48GCKVH5p8OJ
         6ryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784969238; x=1785574038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmO9DP/Mwr2vrVuJ6JkOJCszunxgIku+lVRBnkJid0k=;
        b=Fm5yxDQSkiFJCByL82o89yfxheTtH72ZMA6+nay2GyOeJsL0YhK8s3yR3WM1MeJ3WX
         975wAqR21SxaAqchm++GJ5Vk6VwAEjO+gyboyGTIdmTzZHgcnuHj0q9roWxaD8JFITlr
         qyZ6OFKJij04MLJInVu0XP9KfQeiyesihMptE6UGgdlwO+ffdAudf+fTwp1DSkmfcirp
         p84/vmbySAv9hQsATHEqzrezOBIiJW2fTdR3wVyaq3MwyLWBXeB6mi/Nn8mU7GOR8wdj
         IPZdfls9J68AKvckwgW1GwLgDRcPw6UcgkaH+OqQpU7P4qtNgwo8MDpo84JODNGnNMt1
         nbcg==
X-Forwarded-Encrypted: i=1; AHgh+RpNWlWcNmsCVXu7nKXpR7uT06zioDxr5o/Gh6t/2FG6Oe0EH7IDzA8WNC52J4YS8S0magRALBt6O19iF07z@lists.linux.dev
X-Gm-Message-State: AOJu0YxOgPVAwjFFGRqfPemi0yvasTLI8kK5N1P/n8tn8Nt/ZwspAVGf
	AbJu947X25M7GgbFC1tXn/uVCcDP/1TObTzGhQ/8fii4jTmIh66DPMwu
X-Gm-Gg: AR+sD13mvWqQJnGhCt+inXPzBTINLQumZdLb9FAWXltRBa2zaTkRNqzE4a0EkJcMszG
	VFEjnZrozzYZsAXVyZ6x9FS3x4Mt7oxgIZQuwdIkUSUsZH2mPPad+j4xUPRm1+tO740mt9xUGx8
	FQTWla//hu0fySsKbs0YB7Q+6zQgQjb1A3zgJ1nVinjkAYhE0DTvk+ivvy5p9hJ65THGY1ZAqS1
	mSS0ALCcCCG7bnG3kvZgSk6Yy5gXNCJQpKS9hav8ixIHMSHJu14FWlPgzSVRRLHT1GddLd0OaoL
	ZBwMoVfTOTvc2xFddu7OWbzVvs78x6H8mqH1hpoWUhtipji6wClvzGCcu8NyGKpyQoZS4PdI9nn
	bXEcX3y+/ByLRvzZLa/fFla4Jhgc1FfKzFlN8IY+Vfj2TwZiTk99LZ/9p79yY63tsucJ2RnqREf
	sJv+VPoUdD/dpD
X-Received: by 2002:a05:6a21:4e01:b0:3b4:6af4:bdd5 with SMTP id adf61e73a8af0-3c67240d4c1mr3448262637.15.1784969237695;
        Sat, 25 Jul 2026 01:47:17 -0700 (PDT)
Received: from PC.. ([103.172.209.188])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d6ba579c3sm6232352c88.8.2026.07.25.01.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 01:47:17 -0700 (PDT)
From: Mohit Mishra <mishraloopmohit@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohit Mishra <mishraloopmohit@gmail.com>
Subject: [PATCH 1/2] staging: sm750fb: Remove dead VALIDATION_CHIP preprocessor blocks
Date: Sat, 25 Jul 2026 14:16:48 +0530
Message-ID: <20260725084649.106589-1-mishraloopmohit@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro VALIDATION_CHIP is not defined anywhere in the kernel source
tree. Hence, '#ifdef VALIDATION_CHIP' blocks are dead code, and '#ifndef
VALIDATION_CHIP' blocks are always active.

Remove the dead conditional blocks, keeping only the active paths, and
clean up the unused macro definitions.

This addresses the first task in the drivers/staging/sm750fb/TODO list:
"- refine the code and remove unused code".

Signed-off-by: Mohit Mishra <mishraloopmohit@gmail.com>
---
 drivers/staging/sm750fb/ddk750_chip.c  |  4 --
 drivers/staging/sm750fb/ddk750_power.c |  6 ---
 drivers/staging/sm750fb/ddk750_reg.h   | 60 ++++++--------------------
 3 files changed, 12 insertions(+), 58 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_chip.c b/drivers/staging/sm750fb/ddk750_chip.c
index aa78d0bc1d87..1b3d1467ddf0 100644
--- a/drivers/staging/sm750fb/ddk750_chip.c
+++ b/drivers/staging/sm750fb/ddk750_chip.c
@@ -360,9 +360,7 @@ unsigned int sm750_calc_pll_value(unsigned int request_orig,
 
 unsigned int sm750_format_pll_reg(struct pll_value *p_PLL)
 {
-#ifndef VALIDATION_CHIP
 	unsigned int POD = p_PLL->POD;
-#endif
 	unsigned int OD = p_PLL->OD;
 	unsigned int M = p_PLL->M;
 	unsigned int N = p_PLL->N;
@@ -374,9 +372,7 @@ unsigned int sm750_format_pll_reg(struct pll_value *p_PLL)
 	 * applied to any PLL in the calling function.
 	 */
 	return PLL_CTRL_POWER |
-#ifndef VALIDATION_CHIP
 		((POD << PLL_CTRL_POD_SHIFT) & PLL_CTRL_POD_MASK) |
-#endif
 		((OD << PLL_CTRL_OD_SHIFT) & PLL_CTRL_OD_MASK) |
 		((N << PLL_CTRL_N_SHIFT) & PLL_CTRL_N_MASK) |
 		((M << PLL_CTRL_M_SHIFT) & PLL_CTRL_M_MASK);
diff --git a/drivers/staging/sm750fb/ddk750_power.c b/drivers/staging/sm750fb/ddk750_power.c
index eaba3bc2e01a..d617f554f58d 100644
--- a/drivers/staging/sm750fb/ddk750_power.c
+++ b/drivers/staging/sm750fb/ddk750_power.c
@@ -58,14 +58,8 @@ void sm750_set_power_mode(unsigned int mode)
 	/* Set up other fields in Power Control Register */
 	if (mode == POWER_MODE_CTRL_MODE_SLEEP) {
 		ctrl &= ~POWER_MODE_CTRL_OSC_INPUT;
-#ifdef VALIDATION_CHIP
-		ctrl &= ~POWER_MODE_CTRL_336CLK;
-#endif
 	} else {
 		ctrl |= POWER_MODE_CTRL_OSC_INPUT;
-#ifdef VALIDATION_CHIP
-		ctrl |= POWER_MODE_CTRL_336CLK;
-#endif
 	}
 
 	/* Program new power mode. */
diff --git a/drivers/staging/sm750fb/ddk750_reg.h b/drivers/staging/sm750fb/ddk750_reg.h
index fe412ead72e5..e49fd369b2ac 100644
--- a/drivers/staging/sm750fb/ddk750_reg.h
+++ b/drivers/staging/sm750fb/ddk750_reg.h
@@ -294,29 +294,15 @@
 
 #define CURRENT_GATE                                  0x000040
 #define CURRENT_GATE_MCLK_MASK                        (0x3 << 14)
-#ifdef VALIDATION_CHIP
-    #define CURRENT_GATE_MCLK_112MHZ                  (0x0 << 14)
-    #define CURRENT_GATE_MCLK_84MHZ                   (0x1 << 14)
-    #define CURRENT_GATE_MCLK_56MHZ                   (0x2 << 14)
-    #define CURRENT_GATE_MCLK_42MHZ                   (0x3 << 14)
-#else
-    #define CURRENT_GATE_MCLK_DIV_3                   (0x0 << 14)
-    #define CURRENT_GATE_MCLK_DIV_4                   (0x1 << 14)
-    #define CURRENT_GATE_MCLK_DIV_6                   (0x2 << 14)
-    #define CURRENT_GATE_MCLK_DIV_8                   (0x3 << 14)
-#endif
+#define CURRENT_GATE_MCLK_DIV_3                       (0x0 << 14)
+#define CURRENT_GATE_MCLK_DIV_4                       (0x1 << 14)
+#define CURRENT_GATE_MCLK_DIV_6                       (0x2 << 14)
+#define CURRENT_GATE_MCLK_DIV_8                       (0x3 << 14)
 #define CURRENT_GATE_M2XCLK_MASK                      (0x3 << 12)
-#ifdef VALIDATION_CHIP
-    #define CURRENT_GATE_M2XCLK_336MHZ                (0x0 << 12)
-    #define CURRENT_GATE_M2XCLK_168MHZ                (0x1 << 12)
-    #define CURRENT_GATE_M2XCLK_112MHZ                (0x2 << 12)
-    #define CURRENT_GATE_M2XCLK_84MHZ                 (0x3 << 12)
-#else
-    #define CURRENT_GATE_M2XCLK_DIV_1                 (0x0 << 12)
-    #define CURRENT_GATE_M2XCLK_DIV_2                 (0x1 << 12)
-    #define CURRENT_GATE_M2XCLK_DIV_3                 (0x2 << 12)
-    #define CURRENT_GATE_M2XCLK_DIV_4                 (0x3 << 12)
-#endif
+#define CURRENT_GATE_M2XCLK_DIV_1                     (0x0 << 12)
+#define CURRENT_GATE_M2XCLK_DIV_2                     (0x1 << 12)
+#define CURRENT_GATE_M2XCLK_DIV_3                     (0x2 << 12)
+#define CURRENT_GATE_M2XCLK_DIV_4                     (0x3 << 12)
 #define CURRENT_GATE_VGA                              BIT(10)
 #define CURRENT_GATE_PWM                              BIT(9)
 #define CURRENT_GATE_I2C                              BIT(8)
@@ -376,9 +362,6 @@
 #define MODE1_GATE_DMA                                BIT(0)
 
 #define POWER_MODE_CTRL                               0x00004C
-#ifdef VALIDATION_CHIP
-    #define POWER_MODE_CTRL_336CLK                    BIT(4)
-#endif
 #define POWER_MODE_CTRL_OSC_INPUT                     BIT(3)
 #define POWER_MODE_CTRL_ACPI                          BIT(2)
 #define POWER_MODE_CTRL_MODE_MASK                     (0x3 << 0)
@@ -400,15 +383,10 @@
 #define PLL_CTRL_BYPASS                               BIT(18)
 #define PLL_CTRL_POWER                                BIT(17)
 #define PLL_CTRL_INPUT                                BIT(16)
-#ifdef VALIDATION_CHIP
-    #define PLL_CTRL_OD_SHIFT                         14
-    #define PLL_CTRL_OD_MASK                          (0x3 << 14)
-#else
-    #define PLL_CTRL_POD_SHIFT                        14
-    #define PLL_CTRL_POD_MASK                         (0x3 << 14)
-    #define PLL_CTRL_OD_SHIFT                         12
-    #define PLL_CTRL_OD_MASK                          (0x3 << 12)
-#endif
+#define PLL_CTRL_POD_SHIFT                        14
+#define PLL_CTRL_POD_MASK                         (0x3 << 14)
+#define PLL_CTRL_OD_SHIFT                         12
+#define PLL_CTRL_OD_MASK                          (0x3 << 12)
 #define PLL_CTRL_N_SHIFT                              8
 #define PLL_CTRL_N_MASK                               (0xf << 8)
 #define PLL_CTRL_M_SHIFT                              0
@@ -422,8 +400,6 @@
 
 #define SCRATCH_DATA                                  0x00006c
 
-#ifndef VALIDATION_CHIP
-
 #define MXCLK_PLL_CTRL                                0x000070
 
 #define VGA_CONFIGURATION                             0x000088
@@ -431,8 +407,6 @@
 #define VGA_CONFIGURATION_PLL                         BIT(2)
 #define VGA_CONFIGURATION_MODE                        BIT(1)
 
-#endif
-
 #define GPIO_DATA                                       0x010000
 #define GPIO_DATA_31                                    BIT(31)
 #define GPIO_DATA_30                                    BIT(30)
@@ -1020,9 +994,7 @@
 #define CRT_DISPLAY_CTRL_CRTSELECT                    BIT(25)
 #define CRT_DISPLAY_CTRL_RGBBIT                       BIT(24)
 
-#ifndef VALIDATION_CHIP
     #define CRT_DISPLAY_CTRL_CENTERING                BIT(24)
-#endif
 #define CRT_DISPLAY_CTRL_LOCK_TIMING                  BIT(23)
 #define CRT_DISPLAY_CTRL_EXPANSION                    BIT(22)
 #define CRT_DISPLAY_CTRL_VERTICAL_MODE                BIT(21)
@@ -1121,22 +1093,17 @@
 
 /* This vertical expansion below start at 0x080240 ~ 0x080264 */
 #define CRT_VERTICAL_EXPANSION                        0x080240
-#ifndef VALIDATION_CHIP
     #define CRT_VERTICAL_CENTERING_VALUE_MASK         (0xff << 24)
-#endif
 #define CRT_VERTICAL_EXPANSION_COMPARE_VALUE_MASK     (0xff << 16)
 #define CRT_VERTICAL_EXPANSION_LINE_BUFFER_MASK       (0xf << 12)
 #define CRT_VERTICAL_EXPANSION_SCALE_FACTOR_MASK      0xfff
 
 /* This horizontal expansion below start at 0x080268 ~ 0x08027C */
 #define CRT_HORIZONTAL_EXPANSION                      0x080268
-#ifndef VALIDATION_CHIP
     #define CRT_HORIZONTAL_CENTERING_VALUE_MASK       (0xff << 24)
-#endif
 #define CRT_HORIZONTAL_EXPANSION_COMPARE_VALUE_MASK   (0xff << 16)
 #define CRT_HORIZONTAL_EXPANSION_SCALE_FACTOR_MASK    0xfff
 
-#ifndef VALIDATION_CHIP
     /* Auto Centering */
     #define CRT_AUTO_CENTERING_TL                     0x080280
     #define CRT_AUTO_CENTERING_TL_TOP_MASK            (0x7ff << 16)
@@ -1146,7 +1113,6 @@
     #define CRT_AUTO_CENTERING_BR_BOTTOM_MASK         (0x7ff << 16)
     #define CRT_AUTO_CENTERING_BR_BOTTOM_SHIFT        16
     #define CRT_AUTO_CENTERING_BR_RIGHT_MASK          0x7ff
-#endif
 
 /* sm750le new register to control panel output */
 #define DISPLAY_CONTROL_750LE			      0x80288
@@ -1326,9 +1292,7 @@
 #define ZV0_CAPTURE_BUF1_ADDRESS_ADDRESS_MASK           0x3ffffff
 
 #define ZV0_CAPTURE_BUF_OFFSET                          0x090014
-#ifndef VALIDATION_CHIP
     #define ZV0_CAPTURE_BUF_OFFSET_YCLIP_ODD_FIELD      (0x3ff << 16)
-#endif
 #define ZV0_CAPTURE_BUF_OFFSET_OFFSET_MASK              0xffff
 
 #define ZV0_CAPTURE_FIFO_CTRL                           0x090018
-- 
2.43.0

