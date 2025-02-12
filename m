Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266A62066C5
	for <linux-staging@lists.linux.dev>; Wed, 12 Feb 2025 10:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739355165; cv=none; b=oZ+0gjmWqvSaKSN86yHAzoPH90UVpdDuQDYDEOfWUqrdcpwAE+ra3ErhYtHgBo0KYMo6brY59aZDvxgD6hecrJHweESWxbkM8mGWPqykutxL3I2x0rPJ2q4jEAtZREI0QVA9TaFdkKic8sBWA5AWZfGhv3J7DEssPWYCNq5XsWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739355165; c=relaxed/simple;
	bh=Ipdw+HzMVUc1a2SsAq+NMqJ+fJDERecKuobxFYR7C5g=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PGr7ZFq4Ho4lDryAht8XBcQIqqyVqpUGIH3SMAOg5Cdvw08+uaU9jgB0kSeM4WGwvdy08On9OYW12hKitoPZDFqtoEFNG1QjX8R2mwqhvcc5Xaw8OMV0acC1bZ/zXNYx/4k/bwBqOOvF4YT5z9hzqh1hupX18oEo3SG225Fl7r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kI0BLF6H; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kI0BLF6H"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4395817a7f2so4780855e9.1
        for <linux-staging@lists.linux.dev>; Wed, 12 Feb 2025 02:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739355161; x=1739959961; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mNNKBtbX7Tvug8Fw4Lq02BaT1unD/9lLJspUhFklJfQ=;
        b=kI0BLF6H5EzDA4955MaA0lwPuXzIXYYfwU4f87DNVq05YIQ3MtvR3VZyCdoolWLhqc
         ZEXwi7jPvEkrfBrB1gOML2g/I721bpBk5TNZ4vUlPKZmXdw774MywRibwKc91+sMPBnn
         4ywKFq+MTXmNwLeXrHzfuMjG0Nm0FFs3hU6i6RF3R11dCHyjSbxsY2zDDkHnfSs0qfut
         rTmNikj2Qg9TGIqVrSDOHjxV+vqEunF0DwpBL6/G0PiB+lxJkV6cOArWhgxTHh4rxKCB
         JI6jh4+J0zicXtdEfkXQuly34Vv2DE8cEpzPgZTtJQWTQaR+XzbREvUQYAGxGpBTggFA
         3gxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739355161; x=1739959961;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mNNKBtbX7Tvug8Fw4Lq02BaT1unD/9lLJspUhFklJfQ=;
        b=TZSScUeF/Ge7za/asm/zlGSsevPi4yLK2TZCR+ZAOWKcMe0Ubmh7ETyN75PrEGtni6
         NfBCG3vP4wzQdzua3fQUljy8Xi5VORvbWMY4SctzLFiBCgxNIzjvJidQz48WFbmaFOXj
         bm2TTLHu003AMih89zjcVX480+uM0YZv+yeVfj1Yolaa/lM9bi8O9OhN7syKwzLmGiDk
         ZQtOdgN2fiCWiYBroylinjc6988XEduRTXujaGCpOJDDF/fJME5Fzf0Hdeo3I7ygI3cP
         BtlVqRYkk7Z5iOsTw90ND6TOVPzh20mhitjxdtrM8+V0p5zbLKHDNRMW4GbaZrpIDVde
         YMIA==
X-Forwarded-Encrypted: i=1; AJvYcCWPOOhxWoCifxJrfEx/jc2Hgr8o0pyeUg7btYhGQVmCQbk+osUyCiS6OaMqPZFOov2s457uJSiAbLjTSylc@lists.linux.dev
X-Gm-Message-State: AOJu0YxWWDDQt+MPDcWWFZO0hanSuYnFuvYmoQp5IA+f6jkVCLAc6y/3
	DE1sqNQ5Qnku+8inHMUdAZdwMh91CspZkW0zmvsCJFg1X1d9A3ID
X-Gm-Gg: ASbGncvQAngoel73J+59ChEA5dOaxhEPKsc4SwS6J16Ba0a/8cG6pC3kCYL0x9t7KsL
	YEMXm3EigOVt3HLDV5eo6xxnN+dEroaL57Z9eTh2CsrWcfdoGVxEvfntM46wNxkMWOPiESohUba
	W902aQzbrU1iBIMyC8pU4yPAXgQsy9S8qu4X8C+znuocZTAPco/tJT2bDAhg7+AvPKvQNjD76PH
	NQ+WcRYczG/1I/4TuITaBU6h9cb89fIM3wWje6cjMB4IWPuvKzSOazO0hwP2h+zh/802t855wDX
	WRP58TErRDgCX9/tBB9aAOZYfRuFnOsZKA6ptxvm1NDR/TdmNR0WoGD43M/0bLOBBZkI5lO3sEW
	fKciSHOlb
X-Google-Smtp-Source: AGHT+IHhRK8nxFM1MkvP02b1tIRnIroxS4UXE3wB4NUmuptZfBzKer8oXq6j4K8FtetcxrRrEyBHDQ==
X-Received: by 2002:a05:600c:5487:b0:439:3dc0:29b6 with SMTP id 5b1f17b1804b1-4395815fcc5mr23241965e9.2.1739355161186;
        Wed, 12 Feb 2025 02:12:41 -0800 (PST)
Received: from michael-devbox (ec2-52-59-234-77.eu-central-1.compute.amazonaws.com. [52.59.234.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b83a3sm14845085e9.33.2025.02.12.02.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 02:12:40 -0800 (PST)
Date: Wed, 12 Feb 2025 10:12:40 +0000
From: Michael Anckaert <michael.anckaert@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"open list:STAGING - SILICON MOTION SM750 FRAME BUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: sm750fb: fix checkpatch warning architecture
 specific defines should be avoided
Message-ID: <Z6x0GEM5sxcruYlS@michael-devbox>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace architecture-specific defines with CONFIG_X86 checks to improve
portability and adhere to kernel coding standards.

Fixes checkpatch warning:
- CHECK: architecture specific defines should be avoided.

Changes made:
- Using CONFIG_X86 instead of i386 and x86.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Michael Anckaert <michael.anckaert@gmail.com>
---
Changes in v2:
 - Moved the '} else {' into the ifdef to avoid the possibly empty
else branch

 drivers/staging/sm750fb/ddk750_chip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_chip.c b/drivers/staging/sm750fb/ddk750_chip.c
index 02860d3ec365..025dae3756aa 100644
--- a/drivers/staging/sm750fb/ddk750_chip.c
+++ b/drivers/staging/sm750fb/ddk750_chip.c
@@ -228,8 +228,8 @@ int ddk750_init_hw(struct initchip_param *p_init_param)
 		reg = peek32(VGA_CONFIGURATION);
 		reg |= (VGA_CONFIGURATION_PLL | VGA_CONFIGURATION_MODE);
 		poke32(VGA_CONFIGURATION, reg);
+#ifdef CONFIG_X86
 	} else {
-#if defined(__i386__) || defined(__x86_64__)
 		/* set graphic mode via IO method */
 		outb_p(0x88, 0x3d4);
 		outb_p(0x06, 0x3d5);
-- 
2.39.5

