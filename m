Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1063B19A0
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 08:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778745806; cv=none; b=SAumuA2XTdf7SEqem3yDddBL/Jg+GGJJFTxsejqF6xatCm3azA/SHapHhrqo6o1aaRKWPzMo+oD9lT7kGITBzmHJx6KFHkds9bv5tbDrNDwHjCV4erauYm8LFBpPSnjXgtPXY8dyOWqol5Fq8HawLgd9HlkM9BS/MjL8FVakbgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778745806; c=relaxed/simple;
	bh=r31U3mmNfI2l91+C7Oi83eBww+uDGQFp8X9UzhipXl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jCqxh0nASwFA7uqvuTWab4Jy5q00kWrR6HlBTw9GpTwRBswcxw+2THmiunnDxwulQ5dk/tzYMWVymBhpu87tS3jebAiZBVMhI2z4U8dOUSbC90C8GTf2z1ghJQB+vMps1wcJYFlA4GVLCYCWfFSIEzOdDTNksGKXdimXo0pzB5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUdEdeYU; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUdEdeYU"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b9fcf7c91bso76655925ad.0
        for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 01:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778745804; x=1779350604; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u7GNIvyzCgZi0OvfLvXfLsDC6btZO2C2Y4XrgU5NUV0=;
        b=BUdEdeYU9clbzjgRMiFUWLrjLRpl5cxT9xRbRfY9aGoaT9Q1Q3rpyhCiM+jWQAtZeQ
         ZjFxOWrY/A6WcJDIniAEIqxZSxYVG+cpuESzBkgR0yJz7S+q74wfV9zdGwyzJwY2OPJp
         wt7yWqGeOO6L0oZf4JIa1kawQpdqz/JhO0KOeMIFZInZltklKNmJCtmX3rLdes/LldxK
         tBbzeeehSJeXS80w1m1jgYaFWGDYf8yHkJpyuaIbpAFHRw0hC1QbEnfU5f+7SlOjqkSN
         910/irD0UzUhPZxxqMDJdkXKsCzthmkfmT+nl4i27A7nsPNbZe2JNPNkJZqkJAU8n48F
         PqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778745804; x=1779350604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7GNIvyzCgZi0OvfLvXfLsDC6btZO2C2Y4XrgU5NUV0=;
        b=m5b1W+0sizh2Y3ImDFH5eOmUwGpQtoxCAFYAf4Euy93rQ7vza+Yh8WWEtAqQzXlY2/
         /dY0sWNPicL467CknLRVPe9MhgVkKriyNqLpHRuAhM6f9633BPuvwwfQd/Wtzq5c6SGR
         WuVPegEOH/IPhedF33o6gLLsbZI1+b8v6h4WUVUJxtyqUilc7eNSURrXeDHefHoorJqU
         1SDNQlGxNrtenu0WKjgPwrVLN1tAKIvLQHFca9/VyQ6OSvEk7BiJuQ9ttzsq/njXW+T9
         rZdv9ODHXWA8LlsjdzlGsBFrWJDbrwiwNcq37KEseHh1eQhNzuDNl3Te3gKakkgLtNbi
         7m+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Pzs96kddkQpG95Zlxx2kd7S8XVfEdD094ENCr8oEubuKa+6H/emTGX9rXCs33qDPXaU46HDywvNaKHEGi@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3KY9TrtlzLMr2bzuckq8t9Jsmi1BpEQtOlw6vszK13uMsF0Wp
	eJqlpHhVh7natvBa+64BCLIxNUfygq0YvvopZSBhhJRjOnFc1nx51V2I
X-Gm-Gg: Acq92OGSkBtaxfrSS8akuPw+VdWcE6Z7A7ZW/WhWZm3leXwCxuVYQRuxHWbIZEn+36G
	jk/RbDgxmoXWJcHHqXTiyMbTabpGXmN5/5fdDisLBLelSjs2bztYwLcfpGY0kVNnN+6mdkP1bY3
	kBTsmtA/T+bpb29F2EO/YZAqv4ejcfYauDc6fYICkOXUYEErUBBrxCDGurDPX1jy5EtWFfiLjXz
	byRgeje7UURRqFXM5JTKkSAtqozs1IttMqKRIguvjiPMt7uXlPbqBi8t93HdBVGSYPcjoJh2KZJ
	mIOi8/Q0hpB/hmwbJ3KwbdA2YZyeAoQdcmkxcYTheFIkTgjLu2+ciJQYsaeqMwUSLdOV35eKcv1
	IZwfm99M4t3AoBk+9SA9Ujfv1QhbLNkk+EBLfs4Lfn5pe/6nghFm6bfXDGiUfgxXYcFJEINfa5j
	M//w3zCEO/3brKgdvbL5vRCMZYeK6OIfuC250IymiA6Dm9DK2+byK6SXSwKkYz/mnBy+1iLwE=
X-Received: by 2002:a17:902:fac3:b0:2ba:6ffa:bde0 with SMTP id d9443c01a7336-2bd30210e76mr47839485ad.19.1778745803654;
        Thu, 14 May 2026 01:03:23 -0700 (PDT)
Received: from localhost ([2404:7c00:52:8f0e:aae2:91ff:fe57:5e15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c16ac4asm15236865ad.33.2026.05.14.01.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 01:03:23 -0700 (PDT)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH] staging: sm750fb: add missing FBINFO_STATE_RUNNING checks in copyarea and imageblit
Date: Thu, 14 May 2026 13:48:18 +0545
Message-ID: <20260514080318.39332-1-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lynxfb_ops_fillrect() correctly checks info->state before accessing the hardware 2D accelerator, returning early if the framebuffer is not in FBINFO_STATE_RUNNING state. However, lynxfb_ops_copyarea() and lynxfb_ops_imageblit() omit this guard despite using the same hardware accelerator through identical code paths.

Without this check, the 2D engine could be accessed while the device is suspended (state set to FBINFO_STATE_SUSPENDED via fb_set_suspend()), potentially causing bus errors or system hangs.

Add the missing state checks to both functions, matching the existing pattern in lynxfb_ops_fillrect().

Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9f3e3d37e..025ac8fe3 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -204,6 +204,9 @@ static void lynxfb_ops_copyarea(struct fb_info *info,
 	struct sm750_dev *sm750_dev;
 	unsigned int base, pitch, bpp;
 
+	if (info->state != FBINFO_STATE_RUNNING)
+		return;
+
 	par = info->par;
 	sm750_dev = par->dev;
 
@@ -239,6 +242,9 @@ static void lynxfb_ops_imageblit(struct fb_info *info,
 	struct lynxfb_par *par;
 	struct sm750_dev *sm750_dev;
 
+	if (info->state != FBINFO_STATE_RUNNING)
+		return;
+
 	par = info->par;
 	sm750_dev = par->dev;
 	/*
-- 
2.54.0

