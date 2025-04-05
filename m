Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1EF2E62C1;
	Sat,  5 Apr 2025 10:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743850137; cv=none; b=o5/S1Q6oRlbRm0NZwfU3B1KtZsNy/DavNIBvaj6xjytF2x8LkcZF6ugpq/Mbnyhos0QXL1D9Z54ynEd0UE0YvTOl4+x6Aie+blKMCdw5ySCrhJsDsew+LeQN1I8bNuVXTXLI/1G+MNKS4kJP0uhPlvyAJesvjiOXJOhw/fhCV+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743850137; c=relaxed/simple;
	bh=+7dT3tL82Twj4medpCe66/0q0Wl1ZErhjrtaxQu867M=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=PuMwUBUtaPL6lNyE4SDB0mNhqhu7QSmua+N7moy9+pZXDyAIBssu6E3AVOvK5894NlFdYGDaXoW4CZMvbstjYpyOiSmVQNw4n7saeEZp0z60CqEAL1Ou/1tmcnUmmSkkabeoPaYuhMvkGo//W8zezwBVhq9MqQYWZzI8qOjsVfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnLIvFhF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnLIvFhF"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso30713395e9.3;
        Sat, 05 Apr 2025 03:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743850133; x=1744454933; darn=lists.linux.dev;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p4QDk5t1ncy92IlUqUOHalwkPhSsIRI8ajRfXHeyssg=;
        b=LnLIvFhFXAU2IDca1hGCZ5jCohvcWMT2vilz/fw6pbVT0/xcLC1tbUJ0BhNNnayu7W
         9q1tgwiXtEctffxLT1GOjZbLAekJfej+3IC0eM9P5KOP1EkzvPUng/zuVspXtYJntDQk
         XeHsUBG+8+YP1pH8+/fkCbOlO1qJ8C38GzfNEUrgDXh3VQeS5UazOJILUMEOOJUEk2Jr
         Pas9c9UwH7dSRD/qnx5l1uyb6x7bR4DVBAQ8r2R/LRwL4ePDWnFgozqOVPuCPKgK7cL9
         RCAvRuHt3RHmRwr7Nap/pnHSWqQfC7q2eVY1HsVSucrwFPVOLTuRi5OhNBY47eR1Xx3N
         Y7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743850133; x=1744454933;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p4QDk5t1ncy92IlUqUOHalwkPhSsIRI8ajRfXHeyssg=;
        b=EdITnyFjnl5J5blLmbxht+YNQUJ+ADJYtvDFJZOhaA0IefBGzpihyjYWRKPqbt5Nso
         ziS0dzwzvCoE+QZh5RA64KU5nCoLHwJ4q5GmjvqGe13naDsOOA1PbqxL24SROQddZZEb
         h99K2Cw5f9v7RJxumRRbFovm56SKBrR/ma5FmFHSI87baRh3lDzyoGiKaUeFjX7tA7H0
         q2Ltqo4jMRLEYwl4Gm5o/jckjbpO8u5+cFfwEXOy0XgzkYxaV1QrDOynYkBNNhFirvva
         +N6jz5mTKB+iZS2WUwSwM0R5giJtTGKNlv0heKEizccOUzIdGlhLuTZJlbUNKuAx4DyC
         83Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVQzWyMdBscOoZozz6ezfwAfMHTxMS31XEJmBYC9crdhAuWxUR2uUjl57UYzzFnnk7j9p70FUKYPpj5lAp+@lists.linux.dev, AJvYcCX1EXiPPuEo8WrEV5A8MPEHf4OQyAShND4t3r+NM5ioC6hrQ3cSME6ALScsbQGP5fxFJFaN9POvKDXu@lists.linux.dev
X-Gm-Message-State: AOJu0Yzj8Fi4UG0hJ2h5ty7f1WSta8+pUl3IAZ4dv4iLvtv2diLiiAMq
	Z9Y00D1sKydy4KcGlCR1rZVcNoyvcYP/JqRkzes3baRYcfMC1U9W4YRixx71Oh5Gug==
X-Gm-Gg: ASbGnctT6nVsNpMT8hhIgGPOLVSGqhMBUlZRd+Q7ShDbwWQ19hDNFPFQWWDn/A7zRk9
	WiQgYet4KftY6cxvg4t+89jwne3bhZ+kvtsqtomoOwfPljsjvXgrxeC4JN89qWQ2q0FQjcnnd0K
	SBMTQJmIsx/i4QWSEoa2suQSnCUkXs9Zg/FxfuGBc2UvD/fYIA1d+y62YKTYwzz40tvzrGMOb49
	wTt/sBpALTW4gZuAZZMCPW4/mWmthWo04keEb9csS1PF4GmsBR1g+ro1P0Nln/vbhuqUVc2OaEq
	Pprim7bqGg6U3Y6zfxr1wA46gA==
X-Google-Smtp-Source: AGHT+IHwf8Js/My2J8UMQBuLVCW//I/axSLebBS84eyKeVWEDa9vUAPCE1NZ4QHWUnhmQDRLWBVyJA==
X-Received: by 2002:a05:600c:34ca:b0:43d:49eb:9675 with SMTP id 5b1f17b1804b1-43ee0768b1cmr22034185e9.22.1743850133238;
        Sat, 05 Apr 2025 03:48:53 -0700 (PDT)
Received: from parrot ([105.112.71.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1662feesm72260565e9.12.2025.04.05.03.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 03:48:52 -0700 (PDT)
Message-ID: <67f10a94.050a0220.146fef.20e1@mx.google.com>
X-Google-Original-Message-ID: <Z_EKkvJFg8LV-JQA@princerichard17a@gmail.com>
Date: Sat, 5 Apr 2025 11:48:50 +0100
From: Richard Akintola <princerichard17a@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: julia.lawall@inria.fr, princerichard17a@gmail.com
Subject: [PATCH 4/8] staging: sm750fb: change sii164GetChipString to
 snake_case
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change camelCase function name sii164GetChipString to sii164_get_chip_string
to conform to kernel code styles as reported by checkpatch.pl

CHECK: Avoid camelCase: <sii164GetChipString>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 4 ++--
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index bb7538682b7d..c12df1f9fb00 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -19,7 +19,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.get_device_id = sii164_get_device_id,
 #ifdef SII164_FULL_FUNCTIONS
 		.reset_chip = sii164_reset_chip,
-		.get_chip_string = sii164GetChipString,
+		.get_chip_string = sii164_get_chip_string,
 		.set_power = sii164_set_power,
 		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
 		.is_connected = sii164IsConnected,
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index b96f9369fab4..d0b80b86a4d7 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -261,13 +261,13 @@ void sii164_reset_chip(void)
 }
 
 /*
- * sii164GetChipString
+ * sii164_get_chip_string
  *      This function returns a char string name of the current DVI Controller
  *      chip.
  *
  *      It's convenient for application need to display the chip name.
  */
-char *sii164GetChipString(void)
+char *sii164_get_chip_string(void)
 {
 	return gDviCtrlChipName;
 }
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index 45a90489c95c..c15cd6a5d53b 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -32,7 +32,7 @@ unsigned short sii164_get_device_id(void);
 
 #ifdef SII164_FULL_FUNCTIONS
 void sii164_reset_chip(void);
-char *sii164GetChipString(void);
+char *sii164_get_chip_string(void);
 void sii164_set_power(unsigned char powerUp);
 void sii164EnableHotPlugDetection(unsigned char enableHotPlug);
 unsigned char sii164IsConnected(void);
-- 
2.39.5

