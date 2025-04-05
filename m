Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404BB1C84B1;
	Sat,  5 Apr 2025 10:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743848511; cv=none; b=J6NzvFU11Hx77eni3GLGJvH3Cok1s1JAHUmduf6x5Qn1NH/cOhgXHh7aR3Z3dMIgJ6KZ8xTeF7Za7crd2dpkSb/BodRWK0X0ckua9Kkx47Z3nteSItY39lBEmLjcJFjgaLvUwGTlEPkPpr1mA2Xaj6899Ozj+GwexrGbiS/K7j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743848511; c=relaxed/simple;
	bh=gcvZnMhtR0XkyTMXHmFjgItkzTjcKo4d+SyWoFfroaA=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=ONGr3Mhj/+nTZLkR8DTg1od5AIXUon/FcXFGFIm0wTVtTQT8Gx1Ko8hnyB6G6SyqMChAhOB9NEPGtG4UiloeQ6QSL7+jHZPEmCnm+pz/5xdZRj4FU6RRTuytmb3GHr/YMluebdwPqEB5+t528tv4q/UbJ+AmoCFnUx383sk98Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuWerXPZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuWerXPZ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso14494245e9.0;
        Sat, 05 Apr 2025 03:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743848507; x=1744453307; darn=lists.linux.dev;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NZIIlDBSj3POSZxjDzaSA5f1J19DQOtsWmRISrShn7M=;
        b=GuWerXPZ854UKgLa45xlbeL0QNF7zziGK/go6GUMuS67PKPvE15n7QLrxHonkzScsa
         W0F0y7AEmlWHG2+YX2yMYhX/d7bXCQ+AVRKeMDTsmNFJveyov+R3t/eWC+fRd2F7RL6P
         y0LBCziBvxGzvTdODQoyGYs+S9O1Pt90Fd8wFoaVvwEzva7G2375pDzSNOLY5/E053Ma
         VWjBoHUDiey7yyba1sgWAtgT4SOFg+//eavdQCHvDmXwnMgAF6DcqKDP5FEE/COtXxOQ
         Fkt0+xbGk62yuGd1L7xQnlM3YujG8XO3L7KBcpNPTjTPYJHj1IXvucwFgs0oGqQzmwYI
         n1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743848507; x=1744453307;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZIIlDBSj3POSZxjDzaSA5f1J19DQOtsWmRISrShn7M=;
        b=CwlsmH1TirohebubdO+E/huKG/DtDIvxGMXCmzJc7TTVKOsQGOS4f7rREGp6fbFfzr
         V3/HxKNHJ9PkEIX59Rkn/qVK9nA3bKiB8LPtTjtcMDJUzg+0H7xqR0WSgrM0GGO0wBKR
         9VKeP6qMNYwgbTkG+FoUO+WdIa3KtPhHFTco2L1KXnXjZV5p8gevat9YKEYyP5i8TwdD
         t0iduQOWR1FvQJ3bHa/hAJVHDCJJeQVL1A3QEYUj/z2SrJWHMz6TB8r5H2tj2MJwxwn4
         T75ykUyalC8aENnG4vDxmkBv7TtN0DFw71N8jltVFaeRhIYHeE7mlyawpiJczTOzs3KO
         Qypw==
X-Forwarded-Encrypted: i=1; AJvYcCWHsBb8PoWttUP1ore2GHtfP60HaXCPYg9gZ4P9pFTWv/smTTxGtY+ULcwdfpJedMrUwOldtEuY0C0w@lists.linux.dev, AJvYcCX8RtQvjy0o3zvbyMjaEXjzTJV0bbKTiF0dcQmI7DtlqtO7wqwIbj3OlbRVinmn9TLYG9cCRnTnq3nAQFQP@lists.linux.dev
X-Gm-Message-State: AOJu0Yzrz+pGl5nLJwvWGcFxkhR3AAu9C4CjfVXCJzyVGQqR1BESh3a6
	yj5+soEVHdemOi4ehSts1xVbOGhwNl4KiFsrC2YgVGKEzcb8J7BC
X-Gm-Gg: ASbGnctF5k7mZ9ncAR6kndnrgb49MZf9viuhN79WZ8XjV8OfUjlkDcvnVU421dYOWWY
	vOf5NI1PzFVXGsXJDIbimKpEh5XlstWhYG1s6Xu/5dJ+nOcF3s2YTWZpyRLovrvDpFZVCxMrzih
	lw99Pp8l59IOenIA20mXmecBenjJcXWUGZG5xLmaCiwT1uVVA4r9FKxgi130wlzd+Yl7cH7UpEp
	TsO6BLXXTiX/6ErhtulZXtlIf32lXRXKmQ7HnuQkZt6N5nS8Hz6BQtFKzZABC1aMV1qLNf7IJwx
	kzj3YyqtJBTZ50XFQcS2GrFFLMcZ/U+Nn8vGhdGnWr17bQ==
X-Google-Smtp-Source: AGHT+IFX2FgU3KYdXbaa36WOLfwPuuMmwTH6yElauBd+O8zkOzKMJ0wadJJuG0+BEJMaktWStARE/g==
X-Received: by 2002:a05:600c:b89:b0:43d:7413:cb3e with SMTP id 5b1f17b1804b1-43ecf81bb90mr53955755e9.1.1743848507281;
        Sat, 05 Apr 2025 03:21:47 -0700 (PDT)
Received: from parrot ([105.112.71.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1698081sm71621805e9.17.2025.04.05.03.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 03:21:46 -0700 (PDT)
Message-ID: <67f1043a.050a0220.2c342a.1767@mx.google.com>
X-Google-Original-Message-ID: <Z_EEK9K_bR-W1n2i@princerichard17a@gmail.com>
Date: Sat, 5 Apr 2025 11:21:31 +0100
From: Richard Akintola <princerichard17a@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: julia.lawall@inria.fr, princerichard17a@gmail.com
Subject: [PATCH 2/8] staging: sm750fb: change sii164ResetChip to snake_case
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change camelCase function name sii164ResetChip to sii164_reset_chip
to conform to kernel code styles as reported by checkpatch.pl

CHECK: Avoid camelCase: <sii164ResetChip>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 4 ++--
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 3fb14eff2de1..6dee95e60a6e 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -18,7 +18,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.get_vendor_id = sii164_get_vendor_id,
 		.get_device_id = sii164_get_device_id,
 #ifdef SII164_FULL_FUNCTIONS
-		.reset_chip = sii164ResetChip,
+		.reset_chip = sii164_reset_chip,
 		.get_chip_string = sii164GetChipString,
 		.set_power = sii164SetPower,
 		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 223c181dc649..284c32f7e9b4 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -250,10 +250,10 @@ long sii164_init_chip(unsigned char edge_select,
 #ifdef SII164_FULL_FUNCTIONS
 
 /*
- *  sii164ResetChip
+ *  sii164_reset_chip
  *      This function resets the DVI Controller Chip.
  */
-void sii164ResetChip(void)
+void sii164_reset_chip(void)
 {
 	/* Power down */
 	sii164SetPower(0);
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index a76091f6622b..7a71f94a1e9b 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -31,7 +31,7 @@ unsigned short sii164_get_vendor_id(void);
 unsigned short sii164_get_device_id(void);
 
 #ifdef SII164_FULL_FUNCTIONS
-void sii164ResetChip(void);
+void sii164_reset_chip(void);
 char *sii164GetChipString(void);
 void sii164SetPower(unsigned char powerUp);
 void sii164EnableHotPlugDetection(unsigned char enableHotPlug);
-- 
2.39.5

