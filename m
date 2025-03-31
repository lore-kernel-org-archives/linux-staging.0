Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BCC2E630;
	Mon, 31 Mar 2025 04:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743395923; cv=none; b=DsWFxFulq6/pyoFMfu3Y2uXbFojWj0d5tbQNOQuiSMigPeMMCdShpcy0Y7yJ0R2ol5xGoCrfcRit0ZdWLyuo7b7aYYtBF7dVFOd0p2vSytHv1/kEjWc+DalK3x0jApbd9ZbSSeZY8bI7nhu58P9ogwxb352vZKP29ovMlrhhrnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743395923; c=relaxed/simple;
	bh=TtjY9Wzkw60oyefIgqV6BsR5lP3P31nmpIUBDv1LY0s=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=BVR4D2/ikdymZ/FHCJnvcsi8/JNCqnSXIbItJDoQif//oo81juSHFLfyOR+MBSqbA6DwLHWCSRDGuJBZFOne+lAm6uwndpHU92Gc9Yrpw0X4Rug3gPBEGIQoPr8l7FM+/PP+549dh7EJkRMpNKbdU3aRPagsN9GhA444O+I2UOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUR7OPFp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUR7OPFp"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso40703365e9.1;
        Sun, 30 Mar 2025 21:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743395920; x=1744000720; darn=lists.linux.dev;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v+aXTy1NLfcdVoSzh3r1E4KeMRGPMrOizren/t4vs+g=;
        b=AUR7OPFpglcTLM/MwIjhZ7uo4GnUW+0KTDh6CYTA2lJd2pD1kIAVykPgHSQ5O2HyWA
         keW+16XGwn0YdedAetGjKWIIKd0mUns0VyCDyWpbMZs3f1r47y5PWsMiGdJvV2aI+3n3
         hIVXRUrnkbsAx9zz1o/4Xy8REW1yB9QeD3SDOmT1gPxIDgxI1ONTSdgD8yeoHLGJwS6V
         mcfU7PNADCAk+mfVq7efGhJPSc9juSco805CiDZYdDd93mz8KqFfBzfbp/KRPgeMLZ/I
         Kz5n4mrJRFrafzpBq0ZD+cHL0OANM7k229FjDD+ZDl3Io1vhU6bMJUcbu8kXEu3R7Jhr
         jDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743395920; x=1744000720;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v+aXTy1NLfcdVoSzh3r1E4KeMRGPMrOizren/t4vs+g=;
        b=mLIo+3NjP4VRYEV7RrRycgkedOTQGZh0NkIjQxOIlO337QGOMEx24XAEro0LybqLXk
         JXpL60oRFxgUsVg8SxedQ8HZlbno5c66/3+Z5c+bpDGWaTGBuoTtL30nBtIsT8LC6LX4
         ASRP7WpypbWEBQZ2xscSa3VQ9NroMbQhWX6HwZpHA3rFTGRP8bxYdaxgrHGfBqNx/p6I
         rcJS5Tce217R67JX1gV6SdNc6hHUq1Op68V5iNSKGkWh/k0Pj2z6bpFFJZ8v4qAAuWDn
         EzNv51OEP4Apeu/ZGTYeeOitVSftRYlIVpu5591fB1Nqpj6PesA56vr6fy6Ou5pQBfEa
         YkCg==
X-Forwarded-Encrypted: i=1; AJvYcCUi4EoJ5cMqNjqNVGqoZbtwF6oVYR9/SvpixlH4yh0r1kQaSLbaO9HqkzQoQt+BW1yT+OWco/Q33dwwwBK3@lists.linux.dev, AJvYcCVdDm0q2+oDhmEJnQ44CQHR1gEbY44LDfE7KbsdvmUIvHQ3S6kop+Kbq+et19aI717ENTkh/vCjpKrQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyH0GrByHDooy+mMA12s6yDEoF+BPMvr0wDCWk4csGQG6wMs8h8
	br7TTnnDmrZF8CXUqaOy50B6yfKb2j0nwPowE6Zh28isolLyqgQC
X-Gm-Gg: ASbGncuNQKtoV/23SbAjsgA9UDcotWYn26iB1FuMpV2c9kXgARYaG6OONeSL3wJsIv8
	lsmDL4NH7lpzFDVyEFvYJT55oHGTU5k1zvzglz0E1E+EJNzeU+5KgxhgQLRtsoZ3LjDdmfE2IRo
	CcuT++TlBs/8rQEbaXhZ8VXnkThty01ORwo3yLUGWfQGC9eJSsTgX1yxq+CJH7dSNunIZLa0zRx
	XwmID5eWzH0z/a6/KtR7PkVqm+dmdIjWFK/iQRlPz38aXqvmbr/0PfCFW0BYu8UjblSb7Udc3uG
	5dicKllxbTC5w1LJY6L/7GImBXtbwT69USUPXN7txe+ycA==
X-Google-Smtp-Source: AGHT+IEW8oi7KoyElo34NgNIBd83oZY1zutO8TKygkw+BTaZnofnBPjZ4iGfPTgKHb23i3nSxmztvQ==
X-Received: by 2002:a05:600c:3d0d:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-43db61e0584mr70709495e9.2.1743395919970;
        Sun, 30 Mar 2025 21:38:39 -0700 (PDT)
Received: from parrot ([197.211.59.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82dede98sm152633395e9.6.2025.03.30.21.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 21:38:39 -0700 (PDT)
Message-ID: <67ea1c4f.050a0220.29e327.3bb6@mx.google.com>
X-Google-Original-Message-ID: <Z-ocTGZOZATD1Nbo@princerichard17a@gmail.com>
Date: Mon, 31 Mar 2025 05:38:36 +0100
From: Richard Akintola <princerichard17a@gmail.com>
To: sudip.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: julia.lawall@inria.fr, princerichard17a@gmail.com
Subject: [PATCH] staging: sm750fb: fix function name to kernel code style
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change camelCase function name sii164GetDeviceID to sii164_get_device_id
as reported by checkpatch.pl:

CHECK: Avoid camelCase: <sii164GetDeviceID>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 6 +++---
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 8b81e8642f9e..3fb14eff2de1 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -16,7 +16,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 	{
 		.init = sii164_init_chip,
 		.get_vendor_id = sii164_get_vendor_id,
-		.get_device_id = sii164GetDeviceID,
+		.get_device_id = sii164_get_device_id,
 #ifdef SII164_FULL_FUNCTIONS
 		.reset_chip = sii164ResetChip,
 		.get_chip_string = sii164GetChipString,
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 2532b60245ac..bdf270f38884 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -48,13 +48,13 @@ unsigned short sii164_get_vendor_id(void)
 }
 
 /*
- *  sii164GetDeviceID
+ *  sii164_get_gevice_id
  *      This function gets the device ID of the DVI controller chip.
  *
  *  Output:
  *      Device ID
  */
-unsigned short sii164GetDeviceID(void)
+unsigned short sii164_get_device_id(void)
 {
 	unsigned short deviceID;
 
@@ -141,7 +141,7 @@ long sii164_init_chip(unsigned char edge_select,
 
 	/* Check if SII164 Chip exists */
 	if ((sii164_get_vendor_id() == SII164_VENDOR_ID) &&
-	    (sii164GetDeviceID() == SII164_DEVICE_ID)) {
+	    (sii164_get_device_id() == SII164_DEVICE_ID)) {
 		/*
 		 *  Initialize SII164 controller chip.
 		 */
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index 71a7c1cb42c4..a76091f6622b 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -28,7 +28,7 @@ long sii164_init_chip(unsigned char edgeSelect,
 		      unsigned char pllFilterValue);
 
 unsigned short sii164_get_vendor_id(void);
-unsigned short sii164GetDeviceID(void);
+unsigned short sii164_get_device_id(void);
 
 #ifdef SII164_FULL_FUNCTIONS
 void sii164ResetChip(void);
-- 
2.39.5

