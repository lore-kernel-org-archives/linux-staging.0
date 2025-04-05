Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2970619F495;
	Sat,  5 Apr 2025 11:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743852144; cv=none; b=ipbZoMTX8JU8jhmnjGszPel/PpDlUxj2gLoOAnt0Xd5vh8mL6y7Dh7XdB7k3Ts2FjlRKFJrxNajbakxSL4F1Gn8T66mEs0Dibzah5LcQDb2XH8144XCQbl2P2+kVb70DmWn089JvDcT1BHAmvvkwLzbQN+FhZIL0wWUBGJrlqtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743852144; c=relaxed/simple;
	bh=z46nsSq1v/0fvClzA4Zas3TDcqFixPfx6NddUMaqlWc=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=eKVruMhAD+qF0dGiAkgiMXhXUZUjzD1PxDalW2IvHPFy+hxWE09G8eZgoFioh5wZhsFqGeEQJm16b3DSd7AbbMOidP2fvR/00QQXiRH1K+uw1YZyghoYuFzz4soA93+Qa8Kw1Y1IOlj8eDhfIjClNN6H2vVNVtjcn+qfdKZml3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8dK2luY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8dK2luY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso17749985e9.0;
        Sat, 05 Apr 2025 04:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743852141; x=1744456941; darn=lists.linux.dev;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pxfh28JgrgsZ43718+Rog7hGuSrWMc3dc3Cy5VLEAE8=;
        b=a8dK2luYoLZj8kV1YFLjXQL+ymLlbeilVIX5GWB//mjaodTg3FLLayawwoV/Pf4iP+
         8+ONvxroEa1Ib33HLUBUq4vu2IdGuZvD5vDoOTJISShoAmVt13yivHi/KQEM+GAb/5QZ
         y18Q73/P2VP5LA9HPCjvG8XRHsLZnv4UMh6gC5+Bl/rGSmu3Yldj2NdBwT4G1tLCPTOR
         o+yTnjQ60u1IZy+opPYu+h96+eEedH8Eyt6FMjry0zNTPJxE15aYSPdMBw9lcl1GTFMF
         ZZPu/kB3TJEU7m11jLpV+pzFOpz6zLn568hFl2mkwjDN9nUx9wXFp5HlYnRmQz6dX8W8
         697g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743852141; x=1744456941;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pxfh28JgrgsZ43718+Rog7hGuSrWMc3dc3Cy5VLEAE8=;
        b=ST3fs22OUsaYw1hs5CPgEaPkBBNQVtocHJ1bDhStVtrjdX0v6EMENBzq+SvfAjFDID
         dCpBvUnn8FE1aEJjqWYGPSKWG9adr3QQ2fix16iZjLl17lz0UNS6WNlIbckfPr3+Ou7b
         eO7T0KfdFq+8G4yrnF9sVsGwMiFXaPbMfThonszzYXq/q2npfHf7AZ/uEnkjktJgfxVw
         ZkYBduxmYCzBNNcES7TMxWai/zWbskc5NZZ68M4PNfyKi6bQIQXRXoJ5ZiZEbjDtTqSC
         o3SkXJkgJRacuT2WMfE0/2hAv3mCq3488+N8ADDg7M/TzAv1n9E149FN5+c0JHgolHuc
         s0yA==
X-Forwarded-Encrypted: i=1; AJvYcCWxsse2m9nT8E/wzTHL1OBWHUmxPEi5EFfYvQt9yn2XzxtK8zAsLqU+z0mkkVWAETVPbgZMnVEOpLba4gfJ@lists.linux.dev, AJvYcCXeDZbc/FnvIJFXNHuHCUdOz2KrpGFcifzG9tW9t3YtIiFXfd9Kvxixr/TjQtFYiOdTknPWg9ic04YH@lists.linux.dev
X-Gm-Message-State: AOJu0YwzVOe9ZSOLwbg+ukz3N2wvvIH8Y3vIgK9JFnDA/XNK4fwzcf09
	pXvwIx+tLr9WHdNr0rG0buBL3rmLH9DHnaJdN0sg+MmdRhoFPQPq
X-Gm-Gg: ASbGncswYLDYRpc+6it0+FF7a0PUFJqS/gAwi0OtrODVTDEK27FyLkJ+ui3KfKP6ik4
	Uzft7id91v3/6yJ+IEqyDBF2Cu9YMzCMc5P1dHBrywdZ483MZUMD9qjMm8da853mvuEMxceimJW
	FJxA7VIISVoXw5HFXJlJ5V562xawiypvOnkPOcNyH75w708HXK1jtvyXy+u4NhmXPXzwQR7GDBe
	W2R6cUTIQS+/jqbcNH9MJEdqe5y5Fy43cpFJYEewFRWZ2li+4/eMtEC0/xzfsMth0YoecZ3DF/K
	Sxrcq2LvAHf/P9Vk+ViJDxGt7A==
X-Google-Smtp-Source: AGHT+IGKKIELTuQ1Fb17LlCqV3DbKkczWXrIUwTeorlfMOhrGCSQC/Kz+zOqIxH5LrBtL8WM/IStRA==
X-Received: by 2002:a05:600c:310b:b0:43d:36c:f24 with SMTP id 5b1f17b1804b1-43ed0bde9bcmr59177915e9.13.1743852141261;
        Sat, 05 Apr 2025 04:22:21 -0700 (PDT)
Received: from parrot ([105.112.71.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795db7sm75201415e9.25.2025.04.05.04.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 04:22:20 -0700 (PDT)
Message-ID: <67f1126c.050a0220.410e1.52e7@mx.google.com>
X-Google-Original-Message-ID: <Z_ESagGQ_89ThTdb@princerichard17a@gmail.com>
Date: Sat, 5 Apr 2025 12:22:18 +0100
From: Richard Akintola <princerichard17a@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: julia.lawall@inria.fr, princerichard17a@gmail.com
Subject: [PATCH 6/8] staging: sm750fb: change sii164IsConnected to snake_case
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change camelCase function name sii164IsConnected to sii164_is_connected
to conform to kernel code styles as reported by checkpatch.pl

CHECK: Avoid camelCase: <sii164IsConnected>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 4 ++--
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 1ce44c50617a..ac1aab77da28 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -22,7 +22,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.get_chip_string = sii164_get_chip_string,
 		.set_power = sii164_set_power,
 		.enable_hot_plug_detection = sii164_enable_hot_plug_detection,
-		.is_connected = sii164IsConnected,
+		.is_connected = sii164_is_connected,
 		.check_interrupt = sii164CheckInterrupt,
 		.clear_interrupt = sii164ClearInterrupt,
 #endif
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index c8db6ceee9af..6ce15b7816d9 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -350,14 +350,14 @@ void sii164_enable_hot_plug_detection(unsigned char enable_hot_plug)
 }
 
 /*
- *  sii164IsConnected
+ *  sii164_is_connected
  *      Check if the DVI Monitor is connected.
  *
  *  Output:
  *      0   - Not Connected
  *      1   - Connected
  */
-unsigned char sii164IsConnected(void)
+unsigned char sii164_is_connected(void)
 {
 	unsigned char hotPlugValue;
 
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index 9e289bf4a78e..90b7ae823a10 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -35,7 +35,7 @@ void sii164_reset_chip(void);
 char *sii164_get_chip_string(void);
 void sii164_set_power(unsigned char powerUp);
 void sii164_enable_hot_plug_detection(unsigned char enable_hot_plug);
-unsigned char sii164IsConnected(void);
+unsigned char sii164_is_connected(void);
 unsigned char sii164CheckInterrupt(void);
 void sii164ClearInterrupt(void);
 #endif
-- 
2.39.5

