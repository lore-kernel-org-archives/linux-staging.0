Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5996D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:36:15 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id v8so8816231plz.10
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nbXo1IxGweA//u4mbIa93kKWNX3fgy1vKyjQx5w3BBQ=;
        b=ZqoVq74+Pip01x1DlbjW34pRjJf5G0G3dBYHsQYrLNNSnfKiaKZFYf2fW2WICQQGhZ
         hjVQPHrOh0R1P9UGm7qzvfc9etyl2d0JnIrVAZyC+XNqDxXB9QbV2S/ZIlhnkPgnZRFh
         CcIQvyxwZP+mjT0SII7AcWRdhBACReIK03ZXkDidXuJpd6IXnuWkCaOR+uFQfPPvd6bm
         9OhNHhhZPzdliWu+8A80Z6wQtg0MbKtgLx4UBL8nbH/rkH95AQYpR2mDRCQkBMtA3/IJ
         TFSyHASWkcNPlEgEWA/c24GXMn/y0mnyyLbzi+9TCXBlP+5F1HRSpubbq7+17VECgPlP
         6Aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nbXo1IxGweA//u4mbIa93kKWNX3fgy1vKyjQx5w3BBQ=;
        b=VI71TFwZHy22vsm2mUH52j+JH1FJkAkLCyzhH5uHQojxhRYXbD/b/C9Qk8ASBrEAcW
         wIsCCCCRprcdvVriPIv+Oy7vIINNlfuStc7SWOzFdi5S+x0vHGmJRhRBydw4ur/QReqS
         2Z33MgIeyOxC4nJZP03Do5wAjNHyVedFhpGshM/kBda3JZLldsUJv+iUK7MQcExpDnme
         11zPT8IOOICV+/wB1NCm0v3oMjbzhOByQVV1MCYX3IMWEbIU3BcZi9X46nzHWyum+Bjz
         S1DSkE3thpM3BMlpgMJUlQEHw1BR8FpfA/gDN+MegozR3kexB9T9XjgMXGytf/qZHtbr
         4nCw==
X-Gm-Message-State: AOAM532rSRVRKDe3ztHoIvC/m4BsfmM9BTDB4E2sOO7WqvyBy+0IkxDF
	Z1HL0uMoTq3kYFdh9CaQwfA=
X-Google-Smtp-Source: ABdhPJwfW5mvaupNug1y63+8B7XCnyNIMU83jfAc56VjkaKr9Vl8Pxzv5szf1jX/yYIXeWNtnlNnpg==
X-Received: by 2002:a17:90a:c211:: with SMTP id e17mr1894147pjt.52.1617777375051;
        Tue, 06 Apr 2021 23:36:15 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id k15sm21048620pfi.0.2021.04.06.23.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:36:14 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:36:12 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/49] staging: sm750fb: Update
 displayControlAdjust_SM750LE to snake case
Message-ID: <36f24931c96cb315c32a06f5ae374f652dee96e4.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl checks for the function
displayControlAdjust_SM750LE, including its name, parameters, and body.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/ddk750_mode.c | 40 +++++++++++++--------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
index e00a6cb31947..2fae81b47f46 100644
--- a/drivers/staging/sm750fb/ddk750_mode.c
+++ b/drivers/staging/sm750fb/ddk750_mode.c
@@ -14,13 +14,13 @@
  * in bit 29:27 of Display Control register.
  */
 static unsigned long
-displayControlAdjust_SM750LE(struct mode_parameter *pModeParam,
-			     unsigned long dispControl)
+display_control_adjust_sm750le(struct mode_parameter *mode_param,
+			     unsigned long disp_control)
 {
 	unsigned long x, y;
 
-	x = pModeParam->horizontal_display_end;
-	y = pModeParam->vertical_display_end;
+	x = mode_param->horizontal_display_end;
+	y = mode_param->vertical_display_end;
 
 	/*
 	 * SM750LE has to set up the top-left and bottom-right
@@ -36,42 +36,42 @@ displayControlAdjust_SM750LE(struct mode_parameter *pModeParam,
 	       ((x - 1) & CRT_AUTO_CENTERING_BR_RIGHT_MASK));
 
 	/*
-	 * Assume common fields in dispControl have been properly set before
+	 * Assume common fields in disp_control have been properly set before
 	 * calling this function.
-	 * This function only sets the extra fields in dispControl.
+	 * This function only sets the extra fields in disp_control.
 	 */
 
 	/* Clear bit 29:27 of display control register */
-	dispControl &= ~CRT_DISPLAY_CTRL_CLK_MASK;
+	disp_control &= ~CRT_DISPLAY_CTRL_CLK_MASK;
 
 	/* Set bit 29:27 of display control register for the right clock */
 	/* Note that SM750LE only need to supported 7 resolutions. */
 	if (x == 800 && y == 600)
-		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL41;
+		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL41;
 	else if (x == 1024 && y == 768)
-		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL65;
+		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL65;
 	else if (x == 1152 && y == 864)
-		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL80;
+		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL80;
 	else if (x == 1280 && y == 768)
-		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL80;
+		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL80;
 	else if (x == 1280 && y == 720)
-		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL74;
+		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL74;
 	else if (x == 1280 && y == 960)
-		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL108;
+		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL108;
 	else if (x == 1280 && y == 1024)
-		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL108;
+		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL108;
 	else /* default to VGA clock */
-		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL25;
+		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL25;
 
 	/* Set bit 25:24 of display controller */
-	dispControl |= (CRT_DISPLAY_CTRL_CRTSELECT | CRT_DISPLAY_CTRL_RGBBIT);
+	disp_control |= (CRT_DISPLAY_CTRL_CRTSELECT | CRT_DISPLAY_CTRL_RGBBIT);
 
 	/* Set bit 14 of display controller */
-	dispControl |= DISPLAY_CTRL_CLOCK_PHASE;
+	disp_control |= DISPLAY_CTRL_CLOCK_PHASE;
 
-	poke32(CRT_DISPLAY_CTRL, dispControl);
+	poke32(CRT_DISPLAY_CTRL, disp_control);
 
-	return dispControl;
+	return disp_control;
 }
 
 /* only timing related registers will be  programed */
@@ -125,7 +125,7 @@ static int programModeRegisters(struct mode_parameter *pModeParam,
 			tmp |= DISPLAY_CTRL_HSYNC_PHASE;
 
 		if (sm750_get_chip_type() == SM750LE) {
-			displayControlAdjust_SM750LE(pModeParam, tmp);
+			display_control_adjust_sm750le(pModeParam, tmp);
 		} else {
 			reg = peek32(CRT_DISPLAY_CTRL) &
 				~(DISPLAY_CTRL_VSYNC_PHASE |
-- 
2.30.2

