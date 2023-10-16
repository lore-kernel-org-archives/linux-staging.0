Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A89B34CE3;
	Mon, 16 Oct 2023 20:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWPbRzEk"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9ba081173a3so817504766b.1;
        Mon, 16 Oct 2023 13:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697487370; x=1698092170; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2er7JB8jIkXQe34e+6rn2A2O3NXCbB1tG8VCC+j1DPg=;
        b=nWPbRzEkFPd4QXOCBIL5T6ewrp7k7kQT/eMDAbUlZDsKs5BeRvQM4QbJrs2v6Oh9rV
         35azamlZstHWWg7zeCwKvojZcuMaRRq0T9jMtLEO07Kobwd4FcNqX19w5OBi19z0wdIF
         VV+qMkI/nNsXroqnVu8w7LEIBhvHNPJEAKh5ceipxSWhkGZOeLWK8PKP7JCo85Rj8wNs
         XCH9zteLLeDEw3o3VLc8YExRRRbKUFAyPHjku8IVRGVbvsY9SxZuyMlQ7Ecum2zOfyvS
         TPcofaMK/bQFYGtfQN0HDq+vO+bLq/l7q29nyD03hBsP2olcsqhLvsKSfz/lwMe/5Ibe
         zfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697487370; x=1698092170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2er7JB8jIkXQe34e+6rn2A2O3NXCbB1tG8VCC+j1DPg=;
        b=U19l74XLZQufK9jJXrxlP+bsOR+LzuoXoeTBM1JiFE+TPPUpo7xq2COsR/HoymEJtk
         FpAFv1BeSCyUr7raPdLg6wFuYhZo2qOZQDsiCC4cdSOfDURT/GucqNn2tNQQ5Fj5t+QM
         WX9lH6Jv6O2qcnJMypD1KeZs7o2s1/YK++cTLcXRSK5yYqlMiyOdvqZzehHR677+hn8P
         SmGwuzOv8rMY4yZIU3PBguDs0Rgs5Y1cUzQIfSw7nRYaPBj6E8UQBtJU3yweH/citv0A
         y+Cyq4wwEryPThhaOAO0c7n8bCfNaLutvOZ1V8dh+777EcsUG51SgisYLdYdgbbRbsc2
         HVlw==
X-Gm-Message-State: AOJu0YzUFWJ2x6XKRz0o1YFariA+4i6VMsDlBteEY+DL3MPCsl5kWmL6
	DStJN/PwZJhRmnGQgz9F1g==
X-Google-Smtp-Source: AGHT+IHWvvumzCca8IrLGKyo/ug4+NUAAWfsvFhVqwVrLIkbo4M6KjuUc+maFc1OrBWdSkCANVGyjg==
X-Received: by 2002:a17:906:ee8a:b0:9ad:c763:bc7a with SMTP id wt10-20020a170906ee8a00b009adc763bc7amr117253ejb.23.1697487370147;
        Mon, 16 Oct 2023 13:16:10 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine.localdomain ([105.163.1.143])
        by smtp.gmail.com with ESMTPSA id u26-20020a17090657da00b009b97521b58bsm4606055ejr.39.2023.10.16.13.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 13:16:09 -0700 (PDT)
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
Subject: [PATCH v2 3/5] Staging: sm750fb: Rename dispControl
Date: Mon, 16 Oct 2023 23:14:10 +0300
Message-ID: <20231016201434.7880-4-anonolitunya@gmail.com>
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

Rename variable dispControl to disp_control. This follows
snakecase naming convention and ensures a consistent naming style
throughout the file. Issue found by checkpatch.

Mutes the following checkpatch error:
CHECK: Avoid CamelCase: <dispControl>

Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
---
 drivers/staging/sm750fb/ddk750_mode.c | 32 +++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
index 431b273a347a..fc3db09de9ae 100644
--- a/drivers/staging/sm750fb/ddk750_mode.c
+++ b/drivers/staging/sm750fb/ddk750_mode.c
@@ -15,7 +15,7 @@
  */
 static unsigned long
 display_control_adjust_SM750LE(struct mode_parameter *mode_param,
-			       unsigned long dispControl)
+			       unsigned long disp_control)
 {
 	unsigned long x, y;
 
@@ -36,42 +36,42 @@ display_control_adjust_SM750LE(struct mode_parameter *mode_param,
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
-- 
2.42.0.345.gaab89be2eb

