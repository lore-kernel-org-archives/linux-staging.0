Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202291C700E;
	Sat,  5 Apr 2025 11:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743851540; cv=none; b=lds+C1q2aD7Kw3kIP9T5bvh/3a2mbxtiYXInU32GusM9YSR7AhcjS3k2ozFdGLxHRTWZj3QJTtkXJ4p0Byfg2scQHO8Dn4FAfnrjz8tRySAEvpzM7OfuPjLYRkdjdjslfdqMsKE9RrrVvCoPUEsyZ0Wmtzfg/PwujYUxBxyXhSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743851540; c=relaxed/simple;
	bh=beAf4oeKfEtWFFLorLb9kscpUFlq1Zo7hXzlGWUFp8I=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=fiO/SW2LUPE4Px3fVMWGsLoYcq/qRMU4P78tUH5XrlhX8EvHkPp7QwvuT8/udt15dHBVqLOi+IseSYc1WPtk1RfZq+5DGqwUGEFRxgy6unPZueVXNmIfGaJZgOVU/oCSNqb6gitzV69svx6IvKWZ0evYJVPq3Zn2ekfA9GN5GHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqH5HyTF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqH5HyTF"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so27341235e9.2;
        Sat, 05 Apr 2025 04:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743851537; x=1744456337; darn=lists.linux.dev;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5iccBNqnE1r6LyZ+rk34ys2cg+4klAtt7ZPrU0BU45c=;
        b=SqH5HyTFCm0ebxTiSOdMYHsOGvI/Kc+Z0dqKCoHbfhBi2iTZ8dhuj14/3RuxK3/Vgi
         W5u36GPYm7QfBRvWfk9ieEVlhAQVuW8HspRunq90r75DYJ+t3vYOPssCNbw5k9cTj7/u
         UZP+wx4BbmQ8qqpKX14doIE9URA/Hg2F+mF9MYr/HHEtNz+HrmPI2u+Cl/RkRKpCEW5F
         TRvjr0MjmjZ06NF17YmnFsjydN2w8GzAuQb8mHofuu36MoHB0Wl3K14qr5fLs1mfv5Uz
         Eu8V4fEVW2AC2mG8Unl6XQtMGczQQM+Xk/raVDvhH3SnWwJ2ZCLRNsqDRwxk5dO0f/ag
         HUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743851537; x=1744456337;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5iccBNqnE1r6LyZ+rk34ys2cg+4klAtt7ZPrU0BU45c=;
        b=ois5LSorAVe3NvYwPtCVVkv6V2A+PV20QMVGfUsaGqFlYuh4OR70D6WJoJYlfNQjGW
         dYlUxagXnfRwe7VjbJGG/Wh5Z2pU+7AhxS0wXajMsD3nt+T3JRipmxc9ZbhO0XVsSftP
         rV0Q+iBVcS7hxdfK69aM2C5VPTse/j7vLjH1ys670JaKP1TQ/BtnpEWYGacbmxHJrACc
         4W//iEcok03Zq8BoDXXgP6/zGa+ljdvU9NCGCV911nUU5sISc+A2LJe4Isu/Zd+fXAN5
         brOnr7+QTMMu9iqoqf3S3EGL9L7za1u8A9QA5+8zVRWCJRguphgAasX9QmH9Zqz7Wg3u
         RuMg==
X-Forwarded-Encrypted: i=1; AJvYcCU8LEU3aNiN23X7DgrG49DKidO9vFFtRKNzcOqcwzwyrNCf3oY1TlYzCDsY6xtW1KMJ5ORnXSKK3nBvsJ7m@lists.linux.dev, AJvYcCVy4C+xF6o0Y/JO68dBl0cJmIPoeHcXnriYYTVsLFFSESh3HfVYvqaprHQVGB1AXJJ6nJffmlI1XI5y@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+z/reZWgC+HtU37qv5/i1LvGdzTtRDz2++8PgdeXRe1hS0zp1
	DAWZYDbOR/fkynnYnIBvYHa45KsXXUqiwCCfTMNJyGg751WQo7bi
X-Gm-Gg: ASbGncvpp3G+JkBmiA2nS/4OVn7escsVoLzs9eKkIC/QHUH7060T/jUOl8bTJvoM0oG
	Sn8FwdCa49uEPTmi9F3CcPK8jS+C1VGwOEfsV08Pi5ZppGQBljlkI8ifcIV1Sy9lNeNlkg5Q8lQ
	7aLWBYUdiF7FL2rpGBQWQDtQKXwuQ/fPRJ2ellVXfSHHeCfvcHfVJlWAu0mYsZhGuoEsnYCzkTv
	F1EDRIOugseZHgdij0s4LGVAxrUULukHjH9BbFu873++kDW2af6KLHt/eU+gjYQb0JRKQMA98se
	vcpg5/Ewcb9zObnjrdKPp/pCzw==
X-Google-Smtp-Source: AGHT+IEtMcyakkZeJjIiCJrpzUn4tJaS8sptwAbU0PmhM2qBiNcOFq9ao2zLhSFxvDnUURc923TwCQ==
X-Received: by 2002:a05:6000:1a8d:b0:39c:1f10:d294 with SMTP id ffacd0b85a97d-39d0de28a44mr5091032f8f.26.1743851537275;
        Sat, 05 Apr 2025 04:12:17 -0700 (PDT)
Received: from parrot ([105.112.71.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6ae5sm6695903f8f.32.2025.04.05.04.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 04:12:16 -0700 (PDT)
Message-ID: <67f11010.df0a0220.85b20.1b74@mx.google.com>
X-Google-Original-Message-ID: <Z_EQDqVX-ZGol-rp@princerichard17a@gmail.com>
Date: Sat, 5 Apr 2025 12:12:14 +0100
From: Richard Akintola <princerichard17a@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: julia.lawall@inria.fr, princerichard17a@gmail.com
Subject: [PATCH 5/8] staging: sm750fb: change sii164EnableHotPlugDetection to
 snake_case
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change camelCase function name sii164EnableHotPlugDetection to sii164_enable_hot_plug_detection
and it's parameter enableHotPlug to enable_hot_plug
to conform to kernel code styles as reported by checkpatch.pl

CHECK: Avoid camelCase: <sii164EnableHotPlugDetection>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 8 ++++----
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index c12df1f9fb00..1ce44c50617a 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -21,7 +21,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.reset_chip = sii164_reset_chip,
 		.get_chip_string = sii164_get_chip_string,
 		.set_power = sii164_set_power,
-		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
+		.enable_hot_plug_detection = sii164_enable_hot_plug_detection,
 		.is_connected = sii164IsConnected,
 		.check_interrupt = sii164CheckInterrupt,
 		.clear_interrupt = sii164ClearInterrupt,
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index d0b80b86a4d7..c8db6ceee9af 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -329,12 +329,12 @@ void sii164SelectHotPlugDetectionMode(enum sii164_hot_plug_mode hotPlugMode)
 }
 
 /*
- *  sii164EnableHotPlugDetection
+ *  sii164_enable_hot_plug_detection
  *      This function enables the Hot Plug detection.
  *
- *  enableHotPlug   - Enable (=1) / disable (=0) Hot Plug detection
+ *  enable_hot_plug   - Enable (=1) / disable (=0) Hot Plug detection
  */
-void sii164EnableHotPlugDetection(unsigned char enableHotPlug)
+void sii164_enable_hot_plug_detection(unsigned char enable_hot_plug)
 {
 	unsigned char detectReg;
 
@@ -343,7 +343,7 @@ void sii164EnableHotPlugDetection(unsigned char enableHotPlug)
 	/* Depending on each DVI controller, need to enable the hot plug based
 	 * on each individual chip design.
 	 */
-	if (enableHotPlug != 0)
+	if (enable_hot_plug != 0)
 		sii164SelectHotPlugDetectionMode(SII164_HOTPLUG_USE_MDI);
 	else
 		sii164SelectHotPlugDetectionMode(SII164_HOTPLUG_DISABLE);
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index c15cd6a5d53b..9e289bf4a78e 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -34,7 +34,7 @@ unsigned short sii164_get_device_id(void);
 void sii164_reset_chip(void);
 char *sii164_get_chip_string(void);
 void sii164_set_power(unsigned char powerUp);
-void sii164EnableHotPlugDetection(unsigned char enableHotPlug);
+void sii164_enable_hot_plug_detection(unsigned char enable_hot_plug);
 unsigned char sii164IsConnected(void);
 unsigned char sii164CheckInterrupt(void);
 void sii164ClearInterrupt(void);
-- 
2.39.5

