Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB3919CD16;
	Sat,  5 Apr 2025 10:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743849287; cv=none; b=bTeeREMMoDug7+jGeaTKzMatHeOjVSeF7HbRcFqeckub6uTg9B6xKHLTlT5NXMXQBVvRweq8Gz8EK6z4XuMIG8wT/p5ac1Vn4Z8wucmenqOHMDjERTMfn3EAdvKzpXkjmmsopCA20Bg3ihEFa4d606I/zrA1n1xT/W7NxuK+gu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743849287; c=relaxed/simple;
	bh=vQj84IzAyMbsqXmdqTC73l509pCAn1/REbFySFYyqoE=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=BdxmOwENpyDIWY93EbQ2e9PxcXpQq4UY8EgXDC8B+ep1BvOK7CE0ZW2kFzlkYPDs6OYrkOkiTZg8x0dxHfT3YtchRZULWrsK5mmEvCf+mv/3q8XVcCRQTCUTefKa8BdLj5TJlapH9INgmDZ0T06j4JmEQB/dccRT+m4WZVvbdVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsqpZzO0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsqpZzO0"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso26281825e9.1;
        Sat, 05 Apr 2025 03:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743849283; x=1744454083; darn=lists.linux.dev;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zir1NDA8An9XMiM9quRa114yNTaeYbAjAw+vpjLNbb0=;
        b=QsqpZzO01L523iGB4dASAzW8bhBxV050X35v+MoqnliRfSfGgEGtT63gfhZdCwbjE4
         MGVVMgqKINaMrF3FQh3Kk4hwi2VxuBc0auRVYFWaDL1HQMIYtuRiBBwrPXLHU50TzU6S
         RY3E3UjrY6cB2Qoj+2gFGh4UbDu7C59Ikz2kX2WmCw88EDRE/tbMiSJ900PdYZjcZdLC
         91/KMrYydR9+nj3RzRWMMYhA4IhchTzrwi6bdOFFSoCmAIJP2mC5BExtlyf2+DZa9haM
         X+9NTk/EAn5K/x+7Rc6Y51gD2NJiwnK3hcu9sadXpeKk4cFDUtD+cJaNMspeS0UUw3/N
         d+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743849283; x=1744454083;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zir1NDA8An9XMiM9quRa114yNTaeYbAjAw+vpjLNbb0=;
        b=bybqDxUEzBkp3tjQfrAjUslUcaDG7BRA5/FwvtyMkBRSGQ2cT/C9LpIQeTNLDN4E1l
         i1ub0Z4GngvGO7C8Am5II4mpO0eMkXTN4JgZAHJZj+v9f8w7+y5YWkue3sNoMdz8jLI7
         vVU1vJPeFYXwLCkXfcoiisfxcdIcq7LyDObouDoScFLXHwJFV043RY00ofwfeRuL5YE5
         Om/t1FWZPPGSTEwR9BFfeG19e2UoJkihkpxgIHCHpitQdbmjrYwjFLVibVtm+k6LR+Jm
         h1iC1n0/UzL0FZy1cYKbd6jCN6418j0+Qwk1u04nVVZvVnKFc3aBhQOoQVwGzFgwjHQn
         qQeg==
X-Forwarded-Encrypted: i=1; AJvYcCUD2CA6Fp0uv1h3ZwleJa3/dqqP6PFbAxj0QuXvj7hB1GGVNnOLhL4msA6qC5bLUteHv2MlYInbJuQm@lists.linux.dev, AJvYcCUYo6sVtqVrwrj7vBgl94w+pRceqtFMg6sE0CKTb8ChydhFDoI7osV/wsvEwVqZlzK+U2Mz+lexhUt/lTWW@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5wyhPcnmyMt1RCFneXaN3iBI9y0KT8oRdhbFLiPaxuI1WoO1I
	Zdb4qt+D2ndPndUdW9/7gGSEKV4qGHy04EMDySh3ZQvGzh4JyaDP
X-Gm-Gg: ASbGncuO+Y5XFwKplRdlHc6713S/ClO/v3ZCCoxj3F0VmChrvNf0u7nlP5dfu9hdPRy
	yWgQlGeq2cpibS5CYFf+IKwhfPc+EFmZCIbQnG0sEHZTWpk1ma7AgAHTPVj68CobW/an3vUrEx9
	FT4KAR7Mwv1E90rOZpyflPdet+CzXhba+XAGxIrELsGwfUDF6ZmocXnRr9nyRMgaDkKYE05/zl3
	uOz7QXuCTDRQBnC6C5BZAJumdU9Fp5gAJscGy7oqnkz4OM4g7sgF6cUfsmi0PxgI6XlezwUcnNm
	aY9X2Bgu0CU67e438ARxcc2/xw==
X-Google-Smtp-Source: AGHT+IFW+PCxU83RMGKoX5jqWZE3GsGc0tiWA4M86TTqRF8tPreBQsld3XTsJZwtSgX02+c9xwwgWg==
X-Received: by 2002:a05:600c:3b08:b0:43d:b85:1831 with SMTP id 5b1f17b1804b1-43ecf585cacmr61148015e9.0.1743849283522;
        Sat, 05 Apr 2025 03:34:43 -0700 (PDT)
Received: from parrot ([105.112.71.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bb7bfsm68117315e9.17.2025.04.05.03.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 03:34:43 -0700 (PDT)
Message-ID: <67f10743.050a0220.34c5be.0d2a@mx.google.com>
X-Google-Original-Message-ID: <Z_EHQCIv8tl1ff0x@princerichard17a@gmail.com>
Date: Sat, 5 Apr 2025 11:34:40 +0100
From: Richard Akintola <princerichard17a@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: julia.lawall@inria.fr, princerichard17a@gmail.com
Subject: [PATCH 3/8] staging: sm750fb: change sii164SetPower to snake_case
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change camelCase function name sii164SetPower to sii164_set_power
to conform to kernel code styles as reported by checkpatch.pl

CHECK: Avoid camelCase: <sii164SetPower>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 8 ++++----
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 6dee95e60a6e..bb7538682b7d 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -20,7 +20,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 #ifdef SII164_FULL_FUNCTIONS
 		.reset_chip = sii164_reset_chip,
 		.get_chip_string = sii164GetChipString,
-		.set_power = sii164SetPower,
+		.set_power = sii164_set_power,
 		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
 		.is_connected = sii164IsConnected,
 		.check_interrupt = sii164CheckInterrupt,
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 284c32f7e9b4..b96f9369fab4 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -256,8 +256,8 @@ long sii164_init_chip(unsigned char edge_select,
 void sii164_reset_chip(void)
 {
 	/* Power down */
-	sii164SetPower(0);
-	sii164SetPower(1);
+	sii164_set_power(0);
+	sii164_set_power(1);
 }
 
 /*
@@ -273,13 +273,13 @@ char *sii164GetChipString(void)
 }
 
 /*
- *  sii164SetPower
+ *  sii164_set_power
  *      This function sets the power configuration of the DVI Controller Chip.
  *
  *  Input:
  *      powerUp - Flag to set the power down or up
  */
-void sii164SetPower(unsigned char powerUp)
+void sii164_set_power(unsigned char powerUp)
 {
 	unsigned char config;
 
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index 7a71f94a1e9b..45a90489c95c 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -33,7 +33,7 @@ unsigned short sii164_get_device_id(void);
 #ifdef SII164_FULL_FUNCTIONS
 void sii164_reset_chip(void);
 char *sii164GetChipString(void);
-void sii164SetPower(unsigned char powerUp);
+void sii164_set_power(unsigned char powerUp);
 void sii164EnableHotPlugDetection(unsigned char enableHotPlug);
 unsigned char sii164IsConnected(void);
 unsigned char sii164CheckInterrupt(void);
-- 
2.39.5

