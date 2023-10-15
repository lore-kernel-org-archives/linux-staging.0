Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F26F9CD;
	Sun, 15 Oct 2023 20:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iC2pI7QS"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-991c786369cso612078766b.1;
        Sun, 15 Oct 2023 13:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697400919; x=1698005719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7fHtR18EgBCEQREVmue4LTAycmdBOG4IGNb7hGTz+I=;
        b=iC2pI7QSzUJ0WszMO9QbPN01eoRbKTl4PUA2IsTVSzCjP3TmhggFdLc3vnAudpq+0Q
         yGVL1G/X5l/3B11w/VvtPMLKXNE4GGFnAUqVN5KGikg/YwbLjqtq/XV5rCFozSSlL4jJ
         sLJSuwoUx/6vMm5Ohb/TFyBQMlP8CfDPqOj2TBbO//7BCof+PsmxeYAProNPrrGWr8M3
         3bQBzVzZ3hXwpRXxS0Au0oRehyaLjmpIwJd+gFxEtlSF2vJJMLRVP34XrrHCMcZSa8eR
         NpP8ox6uZfQ9aysfTTP/o4fQEwAD4/sUHb/xgvVevehHZngU8oGv0PjtY0eSQBkWje7A
         oxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697400919; x=1698005719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7fHtR18EgBCEQREVmue4LTAycmdBOG4IGNb7hGTz+I=;
        b=jT20TthXRRlPh4A+1KOLQA6llUaCUJOwKQhDvebtxoxTScHqM3t4UydPelm5NFdCWH
         YXVLBY4XmgnrcvpSy1FhICS663tKuK0JKkIkrgOI53gPXBacgxoL+DiOMVUUPOU3XWoz
         KqV61F6FyrRj83gJZPv2P30lLGSn3Ol6jn8H4Pvd4XNmYBJkrItpRw+gGIdlBDkRLdEV
         wFwlP3DU/1MNdZooolNmSXU4ZAv+RUJ+SUlcTfWnCeTK8N+xTwa++BVh5+UqzvvQ5as0
         ropQU/j+gAecHwvzJpDe30HMy/SFjbHVWAk++Hf+DBYy6aDPpvFPS5r55uZXEiFSVLEX
         ufSA==
X-Gm-Message-State: AOJu0YwUcmBnArE0dXRnpI5e9ohecAuN9/A7s7p67Vmvn4/X4PXRIOdL
	NuIcuTbgmiMz7hwjimSCbQ==
X-Google-Smtp-Source: AGHT+IFcUmakawG4mi5/cnj+QCu8NJpy46yrrOtg/488uT9MrdczN+fnaVgKvaEaH9uw+uTcrwKvww==
X-Received: by 2002:a17:907:31c2:b0:9be:2b53:ac4d with SMTP id xf2-20020a17090731c200b009be2b53ac4dmr4493560ejb.74.1697400918792;
        Sun, 15 Oct 2023 13:15:18 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine.localdomain ([105.163.157.6])
        by smtp.gmail.com with ESMTPSA id m10-20020a170906234a00b009ae587ce133sm2721766eja.188.2023.10.15.13.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 13:15:18 -0700 (PDT)
From: Dorcas AnonoLitunya <anonolitunya@gmail.com>
To: 
Cc: anonolitunya@gmail.com,
	outreachy@lists.linux.dev,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] Staging: sm750fb: Rename displayControl
Date: Sun, 15 Oct 2023 23:12:36 +0300
Message-ID: <596de9b4cf3483d872b1ba25e1b02194aec34bac.1697400022.git.anonolitunya@gmail.com>
X-Mailer: git-send-email 2.42.0.345.gaab89be2eb
In-Reply-To: <cover.1697400022.git.anonolitunya@gmail.com>
References: <cover.1697400022.git.anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable displayControl to display_control. This follows
snakecase naming convention and ensures consistent naming style
throughout the file.Issue by checkpatch.

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

