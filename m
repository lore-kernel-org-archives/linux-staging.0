Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8F134CE3;
	Mon, 16 Oct 2023 20:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7+OphGS"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9b6559cbd74so874408566b.1;
        Mon, 16 Oct 2023 13:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697487360; x=1698092160; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEIQSt+HSu8IkDDX+1A83mcRHtWsrGJKAPhDzVqNS5k=;
        b=c7+OphGSrX1BJ9PvDraT6GD8uBuvVINfIkFpZ2+D+qherv4RFWDKpilrTjHt83nmDc
         5w7jdzzkKBh0TKdeHV7dh+ZV4ShAyI3gU5IcklfmllUFkDLQKblxUr/gnACnZd+umvVN
         mIvnPWTc0QUubOzA9rWip2elKUhxTMDZnmv3Ji+jPFe7137IwyAY3KM6Msx6L4d7wFGP
         YB7tCySbT9qy7f+jbqVNnZxi3asY117ta9aDzej0iNgCMXH2l/JZTfeCoZx0fbb54U5E
         TtC/VqlZl0a8vwut4vxJPR3JtyXdTmaQDoX1npAoFQEXZMfQZmeR8W6Nt9antNGo897R
         aB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697487360; x=1698092160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEIQSt+HSu8IkDDX+1A83mcRHtWsrGJKAPhDzVqNS5k=;
        b=D3LxkXdrQHPIp8X/4ycFAgF2JjcOkwKPEDdA4mJZK7NstkSelVQSIk6fESI1z8ZT4l
         hl5AelqGFNJ7a1KFDGm/KBiXSJxxpbDxOa75jKTBQLClDYApsCqYJwWjmvMHiojmJ/yk
         HxM0qkqTS4gKKWLvHX9Pz1GSbGYh2a+rf5ut3hQCG8Rn0wC0UoQTBvJ+gXbQdYGdw9wL
         Sofwh79TI2asZcItotk+TRgum6YFVF0aK8Rxz/PveXviXvD85jhrYUiThjjJknGXLnwT
         BvnRyPoflubnKpV8nrxFhOdjJyD/N7xAF7uViIeD/QV1sOXMU3aAALHCkBIVcxu26x9J
         4hJA==
X-Gm-Message-State: AOJu0Yw2k/vmpFlFEyzqo9EXLiKAo/8qqcD6T8pg6HL/hSfEPcdp8qLJ
	ijjcxAc/SjXYkEQ0usNSCw==
X-Google-Smtp-Source: AGHT+IFtX4InKv8OX2bIicsndEN4KMHjDAWIR24sUWFPp9OaMbN6CEpflEsUHE7lj1XSGPR64XIQRA==
X-Received: by 2002:a17:907:1c22:b0:9b2:7367:a6a4 with SMTP id nc34-20020a1709071c2200b009b27367a6a4mr131027ejc.31.1697487360095;
        Mon, 16 Oct 2023 13:16:00 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine.localdomain ([105.163.1.143])
        by smtp.gmail.com with ESMTPSA id u26-20020a17090657da00b009b97521b58bsm4606055ejr.39.2023.10.16.13.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 13:15:59 -0700 (PDT)
From: Dorcas AnonoLitunya <anonolitunya@gmail.com>
To: 
Cc: anonolitunya@gmail.com,
	outreachy@lists.linux.dev,
	julia.lawall@inria.fr,
	dan.carpenter@linaro.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] Staging: sm750fb: Rename pModeParam
Date: Mon, 16 Oct 2023 23:14:09 +0300
Message-ID: <20231016201434.7880-3-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.42.0.345.gaab89be2eb
In-Reply-To: <20231016201434.7880-1-anonolitunya@gmail.com>
References: <20231016201434.7880-1-anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pModeParam to mode_param. This follows snakecase naming
convention and ensures a consistent naming style throughout the file.
Issue found by checkpatch.

Mutes the following checkpatch error:
CHECK: Avoid CamelCase: <pModeParam>

Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
---
 drivers/staging/sm750fb/ddk750_mode.c | 52 +++++++++++++--------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
index 8708995f676c..431b273a347a 100644
--- a/drivers/staging/sm750fb/ddk750_mode.c
+++ b/drivers/staging/sm750fb/ddk750_mode.c
@@ -14,13 +14,13 @@
  * in bit 29:27 of Display Control register.
  */
 static unsigned long
-display_control_adjust_SM750LE(struct mode_parameter *pModeParam,
+display_control_adjust_SM750LE(struct mode_parameter *mode_param,
 			       unsigned long dispControl)
 {
 	unsigned long x, y;
 
-	x = pModeParam->horizontal_display_end;
-	y = pModeParam->vertical_display_end;
+	x = mode_param->horizontal_display_end;
+	y = mode_param->vertical_display_end;
 
 	/*
 	 * SM750LE has to set up the top-left and bottom-right
@@ -75,7 +75,7 @@ display_control_adjust_SM750LE(struct mode_parameter *pModeParam,
 }
 
 /* only timing related registers will be  programed */
-static int programModeRegisters(struct mode_parameter *pModeParam,
+static int programModeRegisters(struct mode_parameter *mode_param,
 				struct pll_value *pll)
 {
 	int ret = 0;
@@ -86,46 +86,46 @@ static int programModeRegisters(struct mode_parameter *pModeParam,
 		/* programe secondary pixel clock */
 		poke32(CRT_PLL_CTRL, sm750_format_pll_reg(pll));
 
-		tmp = ((pModeParam->horizontal_total - 1) <<
+		tmp = ((mode_param->horizontal_total - 1) <<
 		       CRT_HORIZONTAL_TOTAL_TOTAL_SHIFT) &
 		     CRT_HORIZONTAL_TOTAL_TOTAL_MASK;
-		tmp |= (pModeParam->horizontal_display_end - 1) &
+		tmp |= (mode_param->horizontal_display_end - 1) &
 		      CRT_HORIZONTAL_TOTAL_DISPLAY_END_MASK;
 
 		poke32(CRT_HORIZONTAL_TOTAL, tmp);
 
-		tmp = (pModeParam->horizontal_sync_width <<
+		tmp = (mode_param->horizontal_sync_width <<
 		       CRT_HORIZONTAL_SYNC_WIDTH_SHIFT) &
 		     CRT_HORIZONTAL_SYNC_WIDTH_MASK;
-		tmp |= (pModeParam->horizontal_sync_start - 1) &
+		tmp |= (mode_param->horizontal_sync_start - 1) &
 		      CRT_HORIZONTAL_SYNC_START_MASK;
 
 		poke32(CRT_HORIZONTAL_SYNC, tmp);
 
-		tmp = ((pModeParam->vertical_total - 1) <<
+		tmp = ((mode_param->vertical_total - 1) <<
 		       CRT_VERTICAL_TOTAL_TOTAL_SHIFT) &
 		     CRT_VERTICAL_TOTAL_TOTAL_MASK;
-		tmp |= (pModeParam->vertical_display_end - 1) &
+		tmp |= (mode_param->vertical_display_end - 1) &
 		      CRT_VERTICAL_TOTAL_DISPLAY_END_MASK;
 
 		poke32(CRT_VERTICAL_TOTAL, tmp);
 
-		tmp = ((pModeParam->vertical_sync_height <<
+		tmp = ((mode_param->vertical_sync_height <<
 		       CRT_VERTICAL_SYNC_HEIGHT_SHIFT)) &
 		     CRT_VERTICAL_SYNC_HEIGHT_MASK;
-		tmp |= (pModeParam->vertical_sync_start - 1) &
+		tmp |= (mode_param->vertical_sync_start - 1) &
 		      CRT_VERTICAL_SYNC_START_MASK;
 
 		poke32(CRT_VERTICAL_SYNC, tmp);
 
 		tmp = DISPLAY_CTRL_TIMING | DISPLAY_CTRL_PLANE;
-		if (pModeParam->vertical_sync_polarity)
+		if (mode_param->vertical_sync_polarity)
 			tmp |= DISPLAY_CTRL_VSYNC_PHASE;
-		if (pModeParam->horizontal_sync_polarity)
+		if (mode_param->horizontal_sync_polarity)
 			tmp |= DISPLAY_CTRL_HSYNC_PHASE;
 
 		if (sm750_get_chip_type() == SM750LE) {
-			display_control_adjust_SM750LE(pModeParam, tmp);
+			display_control_adjust_SM750LE(mode_param, tmp);
 		} else {
 			reg = peek32(CRT_DISPLAY_CTRL) &
 				~(DISPLAY_CTRL_VSYNC_PHASE |
@@ -140,40 +140,40 @@ static int programModeRegisters(struct mode_parameter *pModeParam,
 
 		poke32(PANEL_PLL_CTRL, sm750_format_pll_reg(pll));
 
-		reg = ((pModeParam->horizontal_total - 1) <<
+		reg = ((mode_param->horizontal_total - 1) <<
 			PANEL_HORIZONTAL_TOTAL_TOTAL_SHIFT) &
 			PANEL_HORIZONTAL_TOTAL_TOTAL_MASK;
-		reg |= ((pModeParam->horizontal_display_end - 1) &
+		reg |= ((mode_param->horizontal_display_end - 1) &
 			PANEL_HORIZONTAL_TOTAL_DISPLAY_END_MASK);
 		poke32(PANEL_HORIZONTAL_TOTAL, reg);
 
 		poke32(PANEL_HORIZONTAL_SYNC,
-		       ((pModeParam->horizontal_sync_width <<
+		       ((mode_param->horizontal_sync_width <<
 			 PANEL_HORIZONTAL_SYNC_WIDTH_SHIFT) &
 			PANEL_HORIZONTAL_SYNC_WIDTH_MASK) |
-		       ((pModeParam->horizontal_sync_start - 1) &
+		       ((mode_param->horizontal_sync_start - 1) &
 			PANEL_HORIZONTAL_SYNC_START_MASK));
 
 		poke32(PANEL_VERTICAL_TOTAL,
-		       (((pModeParam->vertical_total - 1) <<
+		       (((mode_param->vertical_total - 1) <<
 			 PANEL_VERTICAL_TOTAL_TOTAL_SHIFT) &
 			PANEL_VERTICAL_TOTAL_TOTAL_MASK) |
-		       ((pModeParam->vertical_display_end - 1) &
+		       ((mode_param->vertical_display_end - 1) &
 			PANEL_VERTICAL_TOTAL_DISPLAY_END_MASK));
 
 		poke32(PANEL_VERTICAL_SYNC,
-		       ((pModeParam->vertical_sync_height <<
+		       ((mode_param->vertical_sync_height <<
 			 PANEL_VERTICAL_SYNC_HEIGHT_SHIFT) &
 			PANEL_VERTICAL_SYNC_HEIGHT_MASK) |
-		       ((pModeParam->vertical_sync_start - 1) &
+		       ((mode_param->vertical_sync_start - 1) &
 			PANEL_VERTICAL_SYNC_START_MASK));
 
 		tmp = DISPLAY_CTRL_TIMING | DISPLAY_CTRL_PLANE;
-		if (pModeParam->vertical_sync_polarity)
+		if (mode_param->vertical_sync_polarity)
 			tmp |= DISPLAY_CTRL_VSYNC_PHASE;
-		if (pModeParam->horizontal_sync_polarity)
+		if (mode_param->horizontal_sync_polarity)
 			tmp |= DISPLAY_CTRL_HSYNC_PHASE;
-		if (pModeParam->clock_phase_polarity)
+		if (mode_param->clock_phase_polarity)
 			tmp |= DISPLAY_CTRL_CLOCK_PHASE;
 
 		reserved = PANEL_DISPLAY_CTRL_RESERVED_MASK |
-- 
2.42.0.345.gaab89be2eb

