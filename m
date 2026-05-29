Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877F93403E3
	for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 10:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049575; cv=none; b=biTSqeqTTPGu5cHXxoKuXFI5cTwvqrkO32/C2aIRR3V6ItCRTSqsoLerspwsJvwBJblf2iccWRo0KktQyr2AtG/sfNG09uOpxA6NRjo1yI7CIaeCBdMK9B/dEFaeJq8arAroY9/km9b895/iJ0mVZNjnZScEIBp7S9pXFeorOKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049575; c=relaxed/simple;
	bh=Y7y3a2pvNmvIJb7ykkCSj5mWTjUFfguuQeIZTegq5fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hGHLPNfaDk0cn0P9Fg32kHDzz9B0kRABRf9jsNg49nVcTwfjv+4sLjC2Bz5Zz2rVJj+V9CgDrEpyaHoyxlNPQXryLp14jfQ7Ii/hFwLQuo+FMbgvkeaR4MUMfitmkPoYcaaW1vp/paAp1/jOIVUiFZAUWAFzVdZp9uoMDZPTBCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Js7g773e; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Js7g773e"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf125989f2so9394245ad.3
        for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 03:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049574; x=1780654374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vY7/46Ar+NHzbdLbEhYTxHefdN//zGNwIrFOy4QahJ0=;
        b=Js7g773eYuJgoKvFJCBYAKYwf9qLn1sPVj53ynxJeXXcs9qhpA3HxStXYZVjPpYWAA
         hFXUhlhFerGMNRRkyiYumNQDjWYegLVa4F8kjRCuyrHufAZq4tIfqnLZ0V9LD6cxjQAf
         HLfyRfrigs6zmEPlS7inY1AiHYDdJFXmMfiKLGMs3fBg0/CgHQuI8SyMW/6wodL8xHNl
         HcKNzcoYK9xJ6wfWUyttvyRYPsTwUpwJ4zt4w2UCC1jVp6hvj2/UDjtIrThjqoTqNZ5T
         +BrvGbN4889eRLfaGw0YoNeieOPUtvJB0Dl9V+bdSShuPyazU90bgWy6WiRpyP3PxO4O
         8XKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049574; x=1780654374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vY7/46Ar+NHzbdLbEhYTxHefdN//zGNwIrFOy4QahJ0=;
        b=LATJ/Q6jkeakAtywyd8YeNLr/AWI99h8ulU28bxgaTtpqiD5v9EIcdQudhU6o7+TS5
         9LHrEKxaPmt7B917rKMjiuFQXy5HaSP3o9b6e3CHzGhf0hMFkJMyZ1pLngyjKfIie/Am
         aZENcyTZzS+jWldkXpgvq8AMEeIjZWEjwRtJdfLXVsHr8+ZCf9VB4SN6RVxKAtqDzMez
         2roL2HSIZ/ApJpEabWdeBas/XLKdydG8iZ6UvT0SKhPFXm847t7fKvoH6HeVj6L9jy9g
         Ht/X5U+tH5MOXOzQTTsNRYYDki0nGm9c3sLclLrCJrruUPfEB1FxlgDwEaVfgPMmL+lF
         xFNg==
X-Forwarded-Encrypted: i=1; AFNElJ9kjhAScNEwJHgiQMo+Mv/yzzu83dCocrIv2vB9N7l5lklKfjfHljbbLe5OBNY5EdN9vz9vjDsm9BurqPHA@lists.linux.dev
X-Gm-Message-State: AOJu0YwdHocf02UHSHHZBXheZKOz2i/Ohvh018FciQvS9KAqT66YPHWv
	SFpVJ9NyVn/NkkfGNXsKlH9WSU6bfnQfX+RYC3/URgoEuMI8MK/ruG/+
X-Gm-Gg: Acq92OEbB+WPjcdxlZ9Ma+55hr7KZLz+OrGUh97o4N4FLms1/ztWFuWNmLnuZELZ+MZ
	Tw0JrpY6oMRL/kX3p6BMd31EWqcvH7V2QtQVoNk0rM6gkeXc0fE9P27jHdjSRM6P3D3yyqaAiL2
	NW2T3zdNL/Ql8m9esTGyLDeIJS6QmjZb1+j0lJLxrkNNc1aOnE4F0WazHkNaEEoWFD/zjPtEnrs
	wTPM0O+b4WaUPC9zBSSiz4AOYDSot2e/tCObXy9uUx6DwoP/Ticdu6AI2mvxc/zfeZ8da/Q9CDF
	Ra28LWV6zwyOuX40fFP8FefazirCx1di57M0h7QSWOetOU9xyDioDdz+8Tt6BEJwsRaLObEC2vI
	IEtO2aYNYhNfDqKCWVodeb1dS5ouoGvzYo8M+WfqAIdebdTGY2jiyc2UfNa7MwCq3rgy2eatDi7
	lZz8MGXPC7+12sVdRi/cmdsyjfRYro6H/T
X-Received: by 2002:a17:903:144f:b0:2b2:4fe3:7b89 with SMTP id d9443c01a7336-2bf20bc18d3mr30292425ad.38.1780049573649;
        Fri, 29 May 2026 03:12:53 -0700 (PDT)
Received: from onish ([2404:7c80:75:55f3:d423:9757:6acf:6ef9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c2381bsm15222155ad.62.2026.05.29.03.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:12:53 -0700 (PDT)
From: Onish Sharma <neharora23587@gmail.com>
To: sudipm.mukherjee@gmail.com
Cc: teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Onish Sharma <neharora23587@gmail.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH v2] staging: sm750fb: remove unused variable
Date: Fri, 29 May 2026 15:42:42 +0530
Message-ID: <20260529101242.10189-1-neharora23587@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ahlXYIqzu4O5-u9J@stanley.mountain>
References: <ahlXYIqzu4O5-u9J@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the set_all_eng_off flag and its associated cleanup logic.
The variable is redundant as the hardware should be initialized to a
known state regardless of prior usage.

Suggested-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Onish Sharma <neharora23587@gmail.com>
---
 drivers/staging/sm750fb/ddk750_chip.c | 28 ---------------------------
 drivers/staging/sm750fb/ddk750_chip.h |  7 -------
 drivers/staging/sm750fb/sm750.c       |  1 -
 drivers/staging/sm750fb/sm750.h       |  1 -
 4 files changed, 37 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_chip.c b/drivers/staging/sm750fb/ddk750_chip.c
index 0bb56bbec43f..553654a77170 100644
--- a/drivers/staging/sm750fb/ddk750_chip.c
+++ b/drivers/staging/sm750fb/ddk750_chip.c
@@ -262,34 +262,6 @@ int ddk750_init_hw(struct initchip_param *p_init_param)
 		reg |= MISC_CTRL_LOCALMEM_RESET;
 		poke32(MISC_CTRL, reg);
 	}
-
-	if (p_init_param->set_all_eng_off == 1) {
-		sm750_enable_2d_engine(0);
-
-		/* Disable Overlay, if a former application left it on */
-		reg = peek32(VIDEO_DISPLAY_CTRL);
-		reg &= ~DISPLAY_CTRL_PLANE;
-		poke32(VIDEO_DISPLAY_CTRL, reg);
-
-		/* Disable video alpha, if a former application left it on */
-		reg = peek32(VIDEO_ALPHA_DISPLAY_CTRL);
-		reg &= ~DISPLAY_CTRL_PLANE;
-		poke32(VIDEO_ALPHA_DISPLAY_CTRL, reg);
-
-		/* Disable alpha plane, if a former application left it on */
-		reg = peek32(ALPHA_DISPLAY_CTRL);
-		reg &= ~DISPLAY_CTRL_PLANE;
-		poke32(ALPHA_DISPLAY_CTRL, reg);
-
-		/* Disable DMA Channel, if a former application left it on */
-		reg = peek32(DMA_ABORT_INTERRUPT);
-		reg |= DMA_ABORT_INTERRUPT_ABORT_1;
-		poke32(DMA_ABORT_INTERRUPT, reg);
-
-		/* Disable DMA Power, if a former application left it on */
-		sm750_enable_dma(0);
-	}
-
 	/* We can add more initialization as needed. */
 
 	return 0;
diff --git a/drivers/staging/sm750fb/ddk750_chip.h b/drivers/staging/sm750fb/ddk750_chip.h
index ee2e9d90f7dd..2a13debc179f 100644
--- a/drivers/staging/sm750fb/ddk750_chip.h
+++ b/drivers/staging/sm750fb/ddk750_chip.h
@@ -76,13 +76,6 @@ struct initchip_param {
 	 */
 	unsigned short master_clock;
 
-	/*
-	 * 0 = leave all engine state untouched.
-	 * 1 = make sure they are off: 2D, Overlay,
-	 * video alpha, alpha, hardware cursors
-	 */
-	unsigned short set_all_eng_off;
-
 	/*
 	 * 0 = Do not reset the memory controller
 	 * 1 = Reset the memory controller
diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index c2d2864f135b..127db29883d2 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -848,7 +848,6 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 	sm750_dev->init_parm.mem_clk = 0;
 	sm750_dev->init_parm.master_clk = 0;
 	sm750_dev->init_parm.power_mode = 0;
-	sm750_dev->init_parm.set_all_eng_off = 0;
 	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index c42800313c6a..7ab13da5d7cc 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -44,7 +44,6 @@ struct init_status {
 	ushort chip_clk;
 	ushort mem_clk;
 	ushort master_clk;
-	ushort set_all_eng_off;
 	ushort reset_memory;
 };
 
-- 
2.54.0

